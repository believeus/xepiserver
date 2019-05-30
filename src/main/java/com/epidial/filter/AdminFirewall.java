package com.epidial.filter;

import com.epidial.bean.Admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebFilter(filterName = "adminfirewall",urlPatterns = {"/admin/*"})
public class AdminFirewall implements Filter {
    private List<String> accessurl = Arrays.asList(new String[]{"/admin/view.jhtml", "/admin/login.jhtml"});
    private String indexurl = "/admin/view.jhtml";
    private String loginurl="";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    // 设置防火墙，不能从浏览器直接输入其他页面地址只能完成从主页一个入口进入后内部跳转
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        //访问第一个页面是没有refered的！从跳转页开始就有refered
        String refer = req.getHeader("Referer");
        String uri = req.getRequestURI();
        System.out.println(uri);
        //当用户没有登录,直接跳转到登陆页面
        if (admin == null) {
            if (accessurl.contains(uri)) {
                chain.doFilter(request, response);// 放行到下个页面
            } else {
                resp.sendRedirect(indexurl);
            }
        } else if (refer == null) {
            // 首页链接直接放行
            if (accessurl.contains(uri)) {
                chain.doFilter(request, response);// 放行filter
            } else {
                resp.sendRedirect(indexurl);// 打回主页 重定向又被filter拦截
            }
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {

    }
}