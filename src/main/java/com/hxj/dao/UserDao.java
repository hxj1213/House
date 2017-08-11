package com.hxj.dao;

import com.hxj.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 * Created by hxj on 17-8-2.
 */
public class UserDao {

    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public String save(User user){
        System.out.println("------UserDao------save--------");
        Session session = sessionFactory.getCurrentSession();
        String login_sql = "select id from User where username=:username";
        Integer resultUserId =  (Integer) session.createQuery(login_sql).setParameter("username",user.getUsername()).uniqueResult();
        if(resultUserId!=null){
            return "repeat";
        }
        sessionFactory.getCurrentSession().save(user);
        return "success";
    }

    public Integer login(User user){
        System.out.println("------UserDao------login-------");
        Session session = sessionFactory.getCurrentSession();
        String login_sql = "select id from User where username=:username and password=:password";
        //User resultUser = (User)
        Integer resultUserId =  (Integer) session.createQuery(login_sql).setParameter("username",user.getUsername())
                .setParameter("password",user.getPassword()).uniqueResult();
        System.out.println("-----"+resultUserId+"------");
        return resultUserId;
    }

}
