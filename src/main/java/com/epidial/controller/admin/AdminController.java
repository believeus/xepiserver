package com.epidial.controller.admin;

import com.epidial.bean.Admin;
import com.epidial.dao.epi.AdminDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Resource
    private AdminDao adminDao;

    @RequestMapping("/admin/view")
    public String view() {
        return "/WEB-INF/back/login.jsp";
    }

    @RequestMapping("/admin/login")
    public String login(HttpServletRequest request) {
        String uname = request.getParameter("username");
        String pwd = request.getParameter("password");
        //此种判断字符串不为空的执行速度最快
        if ((uname != null &&uname.length()!= 0)&&(pwd!=null&&pwd.length()!=0)) {
            Admin admin = adminDao.findByNameAndPasswd(uname, pwd);
            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                return "redirect:/admin/manager.jhtml";
            }
        }
        return "redirect:/admin/view.jhtml";
    }

    @RequestMapping("/admin/manager")
    public String manager(){
        return  "/WEB-INF/back/index.jsp";
    }
}
