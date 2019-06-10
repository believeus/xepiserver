package com.epidial.controller.admin;

import com.epidial.bean.Address;
import com.epidial.bean.Task;
import com.epidial.dao.epi.AddressDao;
import com.epidial.dao.epi.TaskDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class TaskController {
    @Resource
    private TaskDao taskDao;
    @Resource
    private AddressDao addressDao;
    @RequestMapping("/admin/task/view")
    public ModelAndView list(int idx,int size){
        ModelAndView modelView=new ModelAndView();
        List<Task> taskbox = taskDao.findAll(idx, size);
        modelView.addObject("taskbox",taskbox);
        modelView.setViewName("/WEB-INF/back/task-list.jsp");
        return  modelView;
    }
    @RequestMapping("/admin/task/edit")
    public ModelAndView edit(int id){
        ModelAndView modelView=new ModelAndView();
        Address address = addressDao.find("id", id).get(0);
        modelView.addObject("address",address);
        modelView.setViewName("/WEB-INF/back/task-edit.jsp");
        return  modelView;
    }

    @ResponseBody
    @RequestMapping("/admin/task/update")
    public String update(String id,String status){
        Task task = taskDao.findById(id);
        task.setDelivery(status);
        taskDao.update(task);
        return "success";
    }
}
