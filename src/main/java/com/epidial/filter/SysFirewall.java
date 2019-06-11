package com.epidial.filter;

import com.epidial.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter(filterName = "sysFirwall", urlPatterns = {"/user/*"})
public class SysFirewall implements Filter {
    private List<String> nologinCannotAccessUrl = Arrays.asList(new String[]{
            "/user/bioreport/index.jhtml", "/user/lifestyle/index.jhtml", "/mycenter/index.jhtml",
            "/user/pain/index.jhtml", "/user/mood/index.jhtml",
            "/user/sleep/index.jhtml", "/user/sleep/index.jhtml",
            "/user/diet/index.jhtml", "/user/cart/index.jhtml",
            "/user/transaction/postCar.jhtml", "/user/transaction/checkCart.jhtml",
            "/user/transaction/updatdCart.jhtml", "/user/transaction/deleteCart.jhtml",
            "/user/transaction/loadOrder.jhtml", "/user/transaction/check.jhtml",
            "/user/transaction/success.jhtml", "/user/cart/index.jhtml",
            "/user/cart/check.jhtml", "/user/cart/order.jhtml", "/user/cart/sumprice.jhtml",
            "/user/cart/watchagain.jhtml", "/user/cart/del.jhtml",
            "/user/paypal/payment.jhtml", "/user/paypal/paysuccess.jhtml",
            "/user/paypal/cancelUrl.jhtml", "/user/report/iage.jhtml",
            "/user/report/getData.jhtml", "/user/transaction/delAddr.jhtml", "/user/mycenter/index.jhtml",
            "/user/taskrecord/index.jhtml"});

    private List<String> nologinCanAccessUrl = Arrays.asList(new String[]{"/user/logout.jhtml", "/user/loginview.jhtml"});
    private String loginurl = "/user/loginview.jhtml";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    // 设置防火墙，不能从浏览器直接输入其他页面地址只能完成从主页一个入口进入后内部跳转
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("sessionuser");
        //访问第一个页面是没有refered的！从跳转页开始就有refered
        String refer = req.getHeader("Referer");//获取前一个链接地址
        String uri = req.getRequestURI();//获取当前链接地址
        //当用户登录,直接跳转到下级页面
        if (user != null) {
            chain.doFilter(request, response);
            return;
        }
        if (nologinCanAccessUrl.contains(uri) || user == null || refer == null) {
            //直接访问/login.jhtml页面
            if (refer == null && uri.equals("/user/loginview.jhtml")) {
                session.setAttribute("refurl", "/index.jhtml");
                //从其他页面跳转到登陆页面
            } else if (refer != null && uri.equals("/user/loginview.jhtml")) {
                if (session.getAttribute("refurl") == null)
                    session.setAttribute("refurl", refer);
            }
            if (!nologinCannotAccessUrl.contains(uri)) {
                chain.doFilter(request, response);// 放行到下个页面
            } else {
                session.setAttribute("refurl", uri);
                resp.sendRedirect(loginurl);
            }
            return;
        }

        return;
    }


    public void destroy() {

    }
}