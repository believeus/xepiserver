package com.epidial.init;

import com.epidial.bean.Admin;
import com.epidial.dao.Info.AdminDao;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
 /**项目第一次启动创建管理员**/
@Component
public class ServerStartUpListener implements CommandLineRunner {
	@Resource
 	private AdminDao adminDao;
	@Override
	public void run(String... args) throws Exception {
		Admin admin = adminDao.findByName("admin");
		if (admin==null){
			admin=new Admin("admin","admin!@#");
			adminDao.save(admin);
		}
	}
}