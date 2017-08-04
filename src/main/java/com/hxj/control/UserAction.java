package com.hxj.control;

import com.hxj.dao.UserDao;
import com.hxj.entity.User;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by hxj on 17-8-2.
 */
public class UserAction implements ModelDriven<User>{

    private User user = new User();
    public User getModel() {
        return user;
    }
    private UserDao userDao;
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public String save(){
        System.out.println("-------UserAction-------save--------");
        userDao.save(user);
        return "success";
    }

    public String login(){
        System.out.println("-------UserAction-------login--------");
        Integer result = userDao.login(user);
        if(result==null){
            return "login";
        }
        return "success";
    }

}
