package com.Filter;
import com.Bean.User;
import com.Utils.SplitUrl;
import org.springframework.core.annotation.Order;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Firewall{
//@WebFilter(urlPatterns = "*.jhtml", filterName = "authFilter")
//public class Firewall implements Filter {
//
//
//        public void init(FilterConfig config) throws ServletException {
//
//	}
//	public void doFilter(ServletRequest request, ServletResponse response,
//			FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse resp = (HttpServletResponse) response;
//		//访问第一个页面是没有refered的！从跳转页开始就有refered
//		String refer = req.getHeader("Referer");
//		// 设置防火墙，不能从 浏览器直接输入我们其他页面地址
//		// 只能完成从主页一个入口进入后内部跳转
//		String uri = req.getRequestURI();
//		System.out.println(uri);
//		// 判断是否是输入的主页地址
//		// http://localhost:8080/add.jhtml
//		if (refer == null) {
//			// 是首页
//			if (uri.equals("/") || uri.equals("/paypal/paysuccess.jhtml") || uri.equals("/cart/index.jhtml")) {
//				chain.doFilter(request, response);// 放行filter
//			} else {
//				resp.sendRedirect("/");// 打回主页 重定向找谁？！！web.xml
//			}
//		} else {
//			if(!req.getRequestURI().equals("")){
//				if ((SplitUrl.SplitUrl(uri)).equals("App")){
//					chain.doFilter(request, response);// 放行filter
//				}
//				User user=(User)req.getSession().getAttribute("userInfo");
//				if(user==null){
//					resp.sendRedirect("/login"); //用户为null直接跳转到登陆页面
//					return;
//				}else{
//					chain.doFilter(request, response);
//				}
//			}else {
//				chain.doFilter(request, response);
//			}
//		}
//	}
//	public void destroy() {
//
//	}
}