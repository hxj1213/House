package com.hxj.dao;

import com.hxj.entity.User;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import javax.sql.DataSource;

/**
 * Created by hxj on 17-8-2.
 */
public class UserDaoTest extends TestCase {

    private UserDao userDao = new UserDao();

    @Test
    public void testDriver() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
    }

    @Test
    public void testSpring()throws Exception{
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring_test.xml");
        DataSource dataSource = (DataSource) ac.getBean("dataSource");
        System.out.println(dataSource);
    }

    @Test
    public void testSave() throws Exception {
        User user = new User("zhangsan","123456","13700192210");
        userDao.save(user);
    }

    @Test
    public void testlogin() throws Exception {
        User user = new User("zhangsan","123456","");
        userDao.login(user);
    }
}