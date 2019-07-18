package com.epidial.controller.admin;

import com.epidial.bean.*;
import com.epidial.dao.epi.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Random;

@Controller
public class TaskController {
    @Resource
    private TaskDao taskDao;
    @Resource
    private AddressDao addressDao;
    @Resource
    private UserDao userDao;
    @Resource
    private WaresDao waresDao;
    @Resource
    private UdataDao udataDao;
    @Resource
    private DnakitDao dnakitDao;

    @RequestMapping("/admin/task/view")
    public ModelAndView list(int idx, int size) {
        ModelAndView modelView = new ModelAndView();
        List<Task> taskbox = taskDao.findAll(idx, size);
        modelView.addObject("taskbox", taskbox);
        modelView.setViewName("/WEB-INF/back/task-list.jsp");
        return modelView;
    }

    @RequestMapping("/admin/task/edit")
    public ModelAndView edit(String id) {
        ModelAndView modelView = new ModelAndView();
        List<Address> addresses = addressDao.find("id", id);
        if (addresses != null && addresses.size() != 0) {
            Address address = addresses.get(0);
            modelView.addObject("address", address);
        }
        modelView.setViewName("/WEB-INF/back/task-edit.jsp");
        return modelView;
    }

    @ResponseBody
    @RequestMapping("/admin/task/update")
    public String update(String id, String status) {
        Task task = taskDao.findById(id);
        task.setDelivery(status);
        taskDao.update(task);
        return "success";
    }

    @RequestMapping("/admin/task/addview")
    public String addView() {
        String view = "/WEB-INF/back/task-add.jsp";
        return view;
    }

    @ResponseBody
    @RequestMapping("/admin/task/del")
    public String del(int id) {
        taskDao.delete("id", id);
        return "success";
    }

    @ResponseBody
    @RequestMapping("/admin/task/save")
    public String save(String mail, String item, String count) {
        User user = userDao.findUser("mail", mail);
        if (user == null) {
            return "email is null";
        }
        if(dnakitDao.paging(0, Integer.parseInt(count)).size()<Integer.parseInt(count)){
            return "Insufficient stock";
        }
        long time = System.currentTimeMillis();
        Wares wares = waresDao.find("id", item).get(0);
        Task task = new Task();
        task.setGid(wares.getId());
        task.setImgpath(wares.getImgpath());
        task.setOrderno("HKG:" + time);
        task.setPay(1);//未付款
        task.setName(wares.getName());
        task.setTotal( wares.getPrice() * user.getDiscount());//设置产品总价
        task.setUid(user.getId());
        task.setType(wares.getType());
        task.setValid(0);//0：订单有效
        task.setCreateTime(time);//订单创建时间
        task.setPayTime(time);
        task.setEmail(user.getMail());
        task.setDelivery("Unfilled");
        //手动绑定一个地址
        Address address = new Address();
        address.setCity("city?");
        address.setCountry("contry?");
        address.setPostalcode("postalcode?");
        address.setPhone("phone?");
        address.setRecipient("recipient?");
        String uuid = "system:" + new Random().nextInt(100000);
        address.setUuid(uuid);
        address.setValid(0);
        addressDao.save(address);
        int addrid = addressDao.find("uuid", uuid).get(0).getId();
        task.setAddrid(addrid);
        taskDao.save(task);
        if (wares.getType() == 0) {
            for (int i = 0; i < Integer.parseInt(count); i++) {
                Dnakit dnakit = dnakitDao.paging(0, 1).get(0);
                Udata data = new Udata(user.getId(),user.getNickname(),user.getMail());
                data.setBarcode(dnakit.getBarcode());
                dnakitDao.delete(dnakit.getId());
                udataDao.save(data);
            }
        }
        return "success";
    }


    @ResponseBody
    @RequestMapping("/admin/task/updateAddress")
    public String updateAddress(Address address){
        addressDao.updateAddress(address);
        return "true";
    }

}
