package com.epidial.controller.admin;

import com.epidial.bean.Wares;
import com.epidial.dao.epi.WaresDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class GoodsController {
    @Resource
    private WaresDao waresDao;
    @RequestMapping("/admin/goods/view")
    public ModelAndView view(){
        ModelAndView modelView=new ModelAndView();
        modelView.setViewName("");
        modelView.addObject("","");
        return  modelView;
    }

    @ResponseBody
    @RequestMapping("/admin/goods/list")
    public List<Wares> list(){
        return waresDao.findAll();
    }
}
