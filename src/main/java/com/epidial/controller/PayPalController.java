package com.epidial.controller;

import com.epidial.bean.User;
import com.epidial.dao.Info.AddressDao;
import com.epidial.dao.Info.UserDao;
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
import java.util.Map;

@Controller
@CrossOrigin
@RequestMapping
public class PayPalController {


	@Resource
	private UserDao userDao;

	@Resource
	private AddressDao addressDao;
	//沙箱测试
	/*public  final String clienId = "AT61CAlskHNaaTSd05_OHGo1MGHdRrUhuVLNiWXda_hZx2iHdCkrqLJSkrHRX-bsYxCwQpR2zPq5F7LI";
	public  final String secret = "EA0jDUxg0JYDPTVnz1pajlTBMdMo-kvjSqwRZ2mxwSIW5wES7I0LztJ8iQQMQC6-CS8b_9xCzKJy0Trx";
	public final APIContext apiContext = new APIContext(clienId, secret, "sandbox");*/


	public  final String clienId = "AZrj5hDXIJWEa5MBrCDqSy5cBE877968Swrqw4p59PTi7JrsZlcYCrTTbE9s2T8iPRHPIkHDDP7SJ8Md";
	public  final String secret = "EEWmiwODSJPMUtSYBGedZUXOZ7h0c58CAGeuX0RJ2xq9kKlJXOpNcibbK40FvlhR1TW_ABvZpq3YluWC";
	public final APIContext apiContext = new APIContext(clienId, secret, "live");
	//负责发起支付请求,会跳转到paypal的支付页面
	@RequestMapping("/user/paypal/payment")
	public String payment(HttpSession session ,HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin","https://localhost:8080");
		response.setHeader("Access-Control-Allow-Credentials", "true");
		response.setHeader("Access-Control-Allow-Methods", "POST, PUT, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "5000");
		response.setHeader("Access-Control-Allow-Headers", "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With,Authorization,Token");

		Map<String , Object> data = (Map<String,Object>)session.getAttribute("Order");

		String total = data.get("Total_price").toString();

		System.out.println(total);
		//测试数据
		//String total = "5";
		try {

			Amount amount = new Amount();
			amount.setCurrency("USD");//汇率
			amount.setTotal(total);//金额
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
			// //当用户在paypal页面上点击支付的时候,这个请求会被调用
			redirectUrls.setReturnUrl("https://app.beijingepidial.com/user/paypal/paysuccess.jhtml");
			//redirectUrls.setReturnUrl("http://localhost:8080/user/paypal/paysuccess.jhtml");
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
		response.setHeader("Access-Control-Allow-Origin", "*");
		try {
			User user=(User)session.getAttribute("sessionuser");
			 Payment payment = new Payment(); 
			 payment.setId(paymentId); 
			 PaymentExecution paymentExecute = new PaymentExecution(); 
			 paymentExecute.setPayerId(payerId); 
			 Payment execute = payment.execute(apiContext, paymentExecute);

			 //TODO 修改订单状态
			/*if ((orderService.UpdateOrder("success")).equals("error")) {
				System.out.println("修改订单成功！");
			}*/


			user.setPay((byte)1);//1:代表已付款 0代表未付款
			userDao.update(user);
			return  "redirect:https://app.beijingepidial.com/user/transaction/Success.jhtml";
			//return  "redirect:http://localhost:8080/user/transaction/success.jhtml";
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
