package com.hxj.control;

import com.hxj.dao.UserDao;
import com.hxj.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

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

    private Object responseJson;
    public Object getResponseJson() {
        return responseJson;
    }

    public String save(){
        System.out.println("-------UserAction-------save--------");
        String result = userDao.save(user);
        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("flag",result);
        responseJson=jsonMap;
        ActionContext.getContext().getSession().remove("loginName");
        ActionContext.getContext().getSession().remove("loginId");
        return "success";
    }

    public String login(){
        System.out.println("-------UserAction-------login--------");
        Integer result = userDao.login(user);
        if(result==null){
            Map<String,Object> jsonMap = new HashMap<String,Object>();
            jsonMap.put("flag","fail");
            responseJson=jsonMap;
            return "success";
        }
        user.setId(result);
        System.out.println("user:"+user);
        ActionContext.getContext().getSession().put("loginName",user.getUsername());
        ActionContext.getContext().getSession().put("loginId",user.getId());
        String username = (String)ActionContext.getContext().getSession().get("loginName");
        System.out.println("username:"+username);
        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("flag","success");
        jsonMap.put("loginName",user.getUsername());
        responseJson=jsonMap;
        return "success";
    }

    public String logout(){
        System.out.println("-------UserAction-------logout--------");
        ActionContext.getContext().getSession().remove("loginName");
        ActionContext.getContext().getSession().remove("loginId");
        responseJson="success";
        return "success";
    }

    public String checklogin(){
        String username = (String)ActionContext.getContext().getSession().get("loginName");
        Integer loginId = (Integer)ActionContext.getContext().getSession().get("loginId");
        System.out.println("username:"+username);
        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("loginName",username);
        jsonMap.put("loginId",loginId);
        responseJson = jsonMap;
        return "success";
    }

}
