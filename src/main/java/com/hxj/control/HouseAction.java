package com.hxj.control;

import com.hxj.dao.HouseDao;
import com.hxj.entity.House;
import com.hxj.page.HouseCondition;
import com.hxj.page.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.Properties;

/**
 * Created by hxj on 17-8-3.
 */
public class HouseAction implements ModelDriven<House>{

    private HouseDao houseDao;
    public void setHouseDao(HouseDao houseDao) {
        this.houseDao = houseDao;
    }

    private House house = new House();
    public House getModel() {
        return house;
    }

    private Object responseJson;
    public void setResponseJson(Object responseJson) {
        this.responseJson = responseJson;
    }
    public Object getResponseJson() {
        return responseJson;
    }

    private int pageNow = 1;
    public void setPageNow(int pageNow) {
        this.pageNow = pageNow;
    }

    private Integer minprice;
    private Integer maxprice;
    public void setMinprice(Integer minprice) {
        this.minprice = minprice;
    }
    public void setMaxprice(Integer maxprice) {
        this.maxprice = maxprice;
    }

    public String save(){
        System.out.println("-------HouseAction-------save-------");
        System.out.println("house:"+house);
        houseDao.save(house);
        setResponseJson("success");
        return "success";
    }

    public String update(){
        houseDao.update(house);
        return "success";
    }

    public String delete(){
        houseDao.delete(house.getId());
        return "success";
    }

    public String list(){

        System.out.println("minprice:"+minprice);
        System.out.println("maxprice:"+maxprice);
        System.out.println("room:"+house.getRoom());
        System.out.println("rentType:"+house.getRentType());

        HouseCondition condition = new HouseCondition();
        condition.setRentType(house.getRentType());
        condition.setRoom(house.getRoom());
        condition.setMinprice(minprice);
        condition.setMaxprice(maxprice);
        System.out.println("condition:"+condition);


        System.out.println("pageNow:"+pageNow);
        PageBean<Map<String,Object>> housePageBean = new PageBean<Map<String,Object>>();
        housePageBean.setPageNow(pageNow);
        housePageBean.setConditions(condition);
        houseDao.getByPage(housePageBean);

        ActionContext.getContext().getContextMap().put("pb",housePageBean);

        return "success";
    }

    public String getById(){
        System.out.println("---------HouseAction-------getById----------"+house.getId());
        House resultHouse = houseDao.getById(house.getId());

        ActionContext.getContext().getContextMap().put("house",resultHouse);

        Properties pro = new Properties();

        try {
            pro.load(new InputStreamReader(this.getClass().getResourceAsStream("/configure.properties"),"UTF-8"));
            ActionContext.getContext().getContextMap().put("configure",pro);
            System.out.println(pro);
            pro = new Properties();
            pro.load(new InputStreamReader(this.getClass().getResourceAsStream("/decorate.properties"),"UTF-8"));
            ActionContext.getContext().getContextMap().put("decorate",pro);
            pro = new Properties();
            pro.load(new InputStreamReader(this.getClass().getResourceAsStream("/direction.properties"),"UTF-8"));
            ActionContext.getContext().getContextMap().put("direction",pro);
            pro = new Properties();
            pro.load(new InputStreamReader(this.getClass().getResourceAsStream("/houseType.properties"),"UTF-8"));
            ActionContext.getContext().getContextMap().put("houseType",pro);
            pro = new Properties();
            pro.load(new InputStreamReader(this.getClass().getResourceAsStream("/payType.properties"),"UTF-8"));
            ActionContext.getContext().getContextMap().put("payType",pro);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "success";
    }

}
