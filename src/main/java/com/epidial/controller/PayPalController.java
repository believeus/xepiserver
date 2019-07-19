package com.epidial.controller;

import com.epidial.bean.Dnakit;
import com.epidial.bean.Task;
import com.epidial.bean.User;
import com.epidial.dao.epi.*;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
public class PayPalController {
    @Resource
    private UserDao userDao;
    @Resource
    private AddressDao addressDao;
    @Resource
    private TaskDao taskDao;
    @Resource
    private UdataDao udataDao;
    @Resource
    private DnakitDao dnakitDao;
    //沙箱测试
    private final String clienId = "AT61CAlskHNaaTSd05_OHGo1MGHdRrUhuVLNiWXda_hZx2iHdCkrqLJSkrHRX-bsYxCwQpR2zPq5F7LI";
    private final String secret = "EA0jDUxg0JYDPTVnz1pajlTBMdMo-kvjSqwRZ2mxwSIW5wES7I0LztJ8iQQMQC6-CS8b_9xCzKJy0Trx";
    private final APIContext apiContext = new APIContext(clienId, secret, "sandbox");


    // public  final String clienId = "AZrj5hDXIJWEa5MBrCDqSy5cBE877968Swrqw4p59PTi7JrsZlcYCrTTbE9s2T8iPRHPIkHDDP7SJ8Md";
//    public  final String secret = "EEWmiwODSJPMUtSYBGedZUXOZ7h0c58CAGeuX0RJ2xq9kKlJXOpNcibbK40FvlhR1TW_ABvZpq3YluWC";
//    public final APIContext apiContext = new APIContext(clienId, secret, "live");

    //负责发起支付请求,会跳转到paypal的支付页面
    @RequestMapping("/user/paypal/payment")
    public synchronized String payment(HttpSession session, String mobile) {
        User user = (User) session.getAttribute("sessionuser");
        int unPayDNAKitCount = taskDao.findUnPayDNAKitCount(user.getId());
        if (dnakitDao.paging(0, unPayDNAKitCount).size() < unPayDNAKitCount) {
            return "redirect:/user/cart/stockmsg.jhtml";
        }
        //将其他地址状态归置
        addressDao.update("valid", 0, "uuid", user.getUuid());
        String total = String.format("%.2f", Float.parseFloat(taskDao.unpaidAmount(user.getId())));
        if (total.equals("0.00")) {
            endTask(user, mobile);
        } else {
            try {
                Amount amount = new Amount();
                amount.setCurrency("USD");//汇率
                amount.setTotal(total);//总金额
                Transaction transaction = new Transaction();
                transaction.setAmount(amount);
                List<Transaction> transactions = new ArrayList<Transaction>();
                transactions.add(transaction);
                Payer payer = new Payer();
                payer.setPaymentMethod("paypal");
                Payment payment = new Payment();
                payment.setIntent("sale");
                payment.setPayer(payer);
                payment.setTransactions(transactions);
                RedirectUrls redirectUrls = new RedirectUrls();
                redirectUrls.setCancelUrl("https://app.beijingepidial.com/index.jhtml");
                // 当用户在paypal页面上点击支付的时候,这个请求会被调用
                String url = "http://localhost:8080/user/paypal/paysuccess.jhtml?mobile=" + (mobile.equals("true") ? "true" : "false");
                // String url = "https://app.beijingepidial.com/user/paypal/paysuccess.jhtml?mobile=" + (mobile.equals("true") ? "true" : "false");
                redirectUrls.setReturnUrl(url);

                payment.setRedirectUrls(redirectUrls);
                Payment createdPayment = payment.create(apiContext);
                Iterator<Links> links = createdPayment.getLinks().iterator();
                while (links.hasNext()) {
                    Links link = links.next();
                    if (link.getRel().equalsIgnoreCase("approval_url")) {
                        // Redirect the customer to link.getHref()
                        return "redirect:" + link.getHref(); // 重定向到付款页面
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "";
    }

    //当用户在paypal页面上点击支付的时候,这个请求会被调用
    //参数paymentId和PayerID必填,在这个方法逻辑中负责转账支付
    @RequestMapping(value = "/user/paypal/paysuccess", method = RequestMethod.GET)
    public String paysuccess(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, HttpSession session, String mobile) {
        try {
            User user = (User) session.getAttribute("sessionuser");
            synchronized (Object.class) {
                endTask(user, mobile);
                Payment payment = new Payment();
                payment.setId(paymentId);
                PaymentExecution paymentExecute = new PaymentExecution();
                paymentExecute.setPayerId(payerId);
                payment.execute(apiContext, paymentExecute);
                return "redirect:/user/transaction/success.jhtml?mobile=" + (mobile.equals("true") ? "true" : "false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    private void endTask(User user, String mobile) {
        List<Task> unPayNoDnkKit = taskDao.findUnPayNoDnkKit(user.getId());
        for (Task task : unPayNoDnkKit) {
            task.setPay(1);//购买成功
            task.setPayTime(System.currentTimeMillis());
            taskDao.update(task);
        }
        List<Task> unpPayDNAKit = taskDao.findUnPayDNAKit(user.getId());
        for (Task task : unpPayDNAKit) {
            Dnakit dnakit = dnakitDao.paging(0, 1).get(0);
            dnakitDao.delete(dnakit.getId());
            task.setPay(1);
            task.setPayTime(System.currentTimeMillis());
            task.setBarcode(dnakit.getBarcode());
            taskDao.update(task);
        }
    }

    @ResponseBody
    @RequestMapping(value = "/user/paypal/cancelUrl")
    public String cancelUrl() {
        return "cancel";
    }
}
