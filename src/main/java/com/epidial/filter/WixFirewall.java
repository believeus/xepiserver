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

@WebFilter(filterName = "wixfirewall",urlPatterns = {"/wix/*"})
public class WixFirewall implements Filter {
    private List<String> nologinCanAccessUrl = Arrays.asList(new String[]{"/wix/wixlogin/index.jhtml",
                                                                "/wix/wixregister/index.jhtml","/wix/wixconsent/index.jhtml"});
    private List<String> nologinCannotAccessUrl=Arrays.asList(new String[]{"/wix/wixaging/index.jhtml"
                                                                    ,"/wix/wixcart/index.jhtml","/wix/wixcheck/index.jhtml",
                                                                    "/wix/wixorder/index.jhtml","/wix/wixsame/index.jhtml"});
    private String loginurl="/wix/wixlogin/index.jhtml";
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
        String uri = req.getRequestURI();
        if (user!=null){
            chain.doFilter(request, response);// 放行到下个页面
            return;
        }
        if (nologinCanAccessUrl.contains(uri)) {
            chain.doFilter(request, response);
            return;
        }
        if (nologinCannotAccessUrl.contains(uri)) {
            if (user != null) {
                chain.doFilter(request, response);
            } else {
                resp.sendRedirect(loginurl);
            }
            return;
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {

    }
}