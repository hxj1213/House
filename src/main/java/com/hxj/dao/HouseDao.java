package com.hxj.dao;

import com.hxj.entity.House;
import com.hxj.page.PageBean;
import com.hxj.page.PageUtils;
import org.hibernate.SessionFactory;

import java.io.Serializable;

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

    public void getByPage(PageBean<House> housePageBean){
        String columns = " id, houseEstate, address, rentType, room, hall, toilet, houseArea, floor, allfloor, houseType, direction, decorate, configure, price, payType, houseTitle, houseDetail, housepic, userId, linkman, linkphone, intoTime ";
        String basesql = " select "+columns+" from t_house order by id desc ";
        System.out.println("basesql:"+basesql);
        PageUtils.getByPage(sessionFactory.getCurrentSession(),basesql,housePageBean,House.class);
    }


}
