package com.epidial.controller;

import com.epidial.bean.Task;
import com.epidial.bean.Udata;
import com.epidial.bean.User;
import com.epidial.dao.epi.AddressDao;
import com.epidial.dao.epi.TaskDao;
import com.epidial.dao.epi.UdataDao;
import com.epidial.dao.epi.UserDao;
import com.paypal.api.payments.*;
import com.paypal.base.rest.APIContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@CrossOrigin
@RequestMapping
public class PayPalController {
	@Resource
	private UserDao userDao;
	@Resource
	private AddressDao addressDao;
	@Resource
	private TaskDao taskDao;
	@Resource
	private UdataDao udataDao;
	//沙箱测试
	public  final String clienId = "AT61CAlskHNaaTSd05_OHGo1MGHdRrUhuVLNiWXda_hZx2iHdCkrqLJSkrHRX-bsYxCwQpR2zPq5F7LI";
	public  final String secret = "EA0jDUxg0JYDPTVnz1pajlTBMdMo-kvjSqwRZ2mxwSIW5wES7I0LztJ8iQQMQC6-CS8b_9xCzKJy0Trx";
	public final APIContext apiContext = new APIContext(clienId, secret, "sandbox");


	/*public  final String clienId = "AZrj5hDXIJWEa5MBrCDqSy5cBE877968Swrqw4p59PTi7JrsZlcYCrTTbE9s2T8iPRHPIkHDDP7SJ8Md";
	public  final String secret = "EEWmiwODSJPMUtSYBGedZUXOZ7h0c58CAGeuX0RJ2xq9kKlJXOpNcibbK40FvlhR1TW_ABvZpq3YluWC";
	public final APIContext apiContext = new APIContext(clienId, secret, "live");*/
	//负责发起支付请求,会跳转到paypal的支付页面
	@RequestMapping("/user/paypal/payment")
	public String payment(HttpSession session ,HttpServletResponse response) {
		User user = (User) session.getAttribute("sessionuser");
		//将其他地址状态归置
		addressDao.update("valid",0,"uuid",user.getUuid());
		String sumprice = taskDao.sumprice(user.getId());
		System.out.println(sumprice);
		//测试数据
		//String total = "5";
		try {

			Amount amount = new Amount();
			amount.setCurrency("USD");//汇率
			amount.setTotal(sumprice);//总金额
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
			//redirectUrls.setCancelUrl("https://app.beijingepidial.com/index.jhtml");
			redirectUrls.setCancelUrl("http://localhost:8080/index.jhtml");
			// //当用户在paypal页面上点击支付的时候,这个请求会被调用
			//redirectUrls.setReturnUrl("https://app.beijingepidial.com/user/paypal/paysuccess.jhtml");
			redirectUrls.setReturnUrl("http://localhost:8080/user/paypal/paysuccess.jhtml");
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
			// For debug purposes only:
			 System.out.println(createdPayment.toString());
		} catch (Exception e) {
			e.printStackTrace();
			// System.err.println(e.getDetails());
		}
		return "";
	}
	//当用户在paypal页面上点击支付的时候,这个请求会被调用
	//参数paymentId和PayerID必填,在这个方法逻辑中负责转账支付
	@RequestMapping(value = "/user/paypal/paysuccess",method = RequestMethod.GET)
	public String paysuccess(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,HttpSession session,HttpServletResponse response) {
		try {
			User user=(User)session.getAttribute("sessionuser");
			 Payment payment = new Payment(); 
			 payment.setId(paymentId); 
			 PaymentExecution paymentExecute = new PaymentExecution(); 
			 paymentExecute.setPayerId(payerId); 
			 Payment execute = payment.execute(apiContext, paymentExecute);
			List<Task> unPayGoods = taskDao.findUnPayGoods(user.getId());
			for (Task task:unPayGoods){
				//购买成功
				task.setPay(1);
				task.setPayTime(System.currentTimeMillis());
				taskDao.update(task);
			}
			//生物学年龄
			List<Task> taskbox = taskDao.findPayDNAKit(user.getId());
			for (Task task :taskbox) {
				for (int i=0;i<task.getCount();i++){
					Udata data=new Udata();
					data.setBiological(0);
					data.setNaturally(0);
					data.setStatus("pending");
					data.setUsername(user.getNickname());
					data.setUid(user.getId());
					data.setBarcode("");
					data.setCreateTime(System.currentTimeMillis());
					udataDao.save(data);
				}
			}
			//return  "redirect:https://app.beijingepidial.com/user/transaction/success.jhtml";
			return  "redirect:http://localhost:8080/user/transaction/success.jhtml";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping(value = "/user/paypal/cancelUrl")
	public String cancelUrl() {
		return "cancel";
	}
}
