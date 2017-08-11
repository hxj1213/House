package com.hxj.dao;

import com.hxj.entity.House;
import com.hxj.page.PageBean;
import com.hxj.page.PageUtils;
import org.hibernate.SessionFactory;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by hxj on 17-8-3.
 */
public class HouseDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void save(House house){
        sessionFactory.getCurrentSession().save(house);
    }

    public void update(House house){
        sessionFactory.getCurrentSession().update(house);
    }

    public void delete(Serializable id){
       Object house = sessionFactory.getCurrentSession().get(House.class,id);
       if(house!=null){
           sessionFactory.getCurrentSession().delete(house);
       }
    }

    public House getById(Serializable id){
       return (House) sessionFactory.getCurrentSession().get(House.class,id);
    }

    public void getByPage(PageBean<Map<String,Object>> housePageBean){
        String columns = " id, houseEstate,address,room, hall, toilet, houseArea, price, houseTitle, housepic";

        String basesql = " select "+columns+" from t_house where 1=1 ";

        if(housePageBean.getConditions()!=null){
            basesql+=housePageBean.getConditions();
        }

        System.out.println("basesql:"+basesql);
        PageUtils.getByPage(sessionFactory.getCurrentSession(),housePageBean,basesql);
    }


}
