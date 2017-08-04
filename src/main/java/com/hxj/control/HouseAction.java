package com.hxj.control;

import com.hxj.dao.HouseDao;
import com.hxj.entity.House;
import com.hxj.page.PageBean;
import com.opensymphony.xwork2.ModelDriven;

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

    public String save(){
        houseDao.save(house);
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
        System.out.println("pageNow:"+pageNow);
        PageBean<House> housePageBean = new PageBean<House>();
        housePageBean.setPageNow(pageNow);
        houseDao.getByPage(housePageBean);
        return "success";
    }

    public String getById(){
        House resultHouse = houseDao.getById(house.getId());
        setResponseJson(resultHouse);
        return "success";
    }

}
