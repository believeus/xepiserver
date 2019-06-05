package com.epidial.controller.admin;

import com.epidial.bean.User;
import com.epidial.dao.Info.UserDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UManagerController {

    @Resource
    private UserDao userDao;

    @RequestMapping("/admin/user/view")
    public ModelAndView view(int idx,int size){
        List<User> users = userDao.pagingUser(idx,size);
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("/WEB-INF/back/member-list.jsp");
        modelView.addObject("users",users);
        return modelView;
    }

    @RequestMapping("/admin/user/edit")
    public  ModelAndView edit(String mail){
        User user = userDao.findUser("mail",mail);
        ModelAndView modelView=new ModelAndView();
        modelView.addObject("user",user);
        modelView.setViewName("/WEB-INF/back/member-edit.jsp");
        return  modelView;
    }
    @RequestMapping("/admin/user/update")
    @ResponseBody
    public String updata(User user){
        userDao.update(user);
        return "success";
    }
}
