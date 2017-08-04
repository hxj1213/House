package com.hxj.page;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import java.math.BigInteger;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created by hxj on 17-7-24.
 */
public class PageUtils {

    public static  <T> void getByPage(Session session, String basesql, PageBean<T> pb, Class clazz){
        String total_sql = "select count(*) from ("+basesql+") tb ";
        System.out.println("total_sql:"+total_sql);

        Object rows = session.createSQLQuery(total_sql).uniqueResult();
        System.out.println("rows:"+rows);
        BigInteger totalRows = (BigInteger) rows;
        System.out.println("totalRows=="+totalRows);
        pb.setTotalRows(totalRows.intValue());

        if(pb.getPageNow()>pb.getTotalPages()){
            pb.setPageNow(pb.getTotalPages());
        }

        if(pb.getPageNow()<1){
            pb.setPageNow(1);
        }

        int startIndex = (pb.getPageNow()-1)*pb.getPageCount();
        String data_sql = "select * from ("+basesql+") tb limit ?,?";
        System.out.println("data_sql:"+data_sql);
        SQLQuery query = session.createSQLQuery(data_sql);
        query.setParameter(0,startIndex);
        query.setParameter(1,pb.getPageCount());
        List<T> datas = query.list();
        System.out.println("datas:"+datas);
        pb.setDatas(datas);
    }

    public static void getByPage(Session session,PageBean<Map<String,Object>> pb,String basesql){
        String total_sql = "select count(*) from ("+basesql+") tb ";
        System.out.println("total_sql:"+total_sql);

        SQLQuery query = session.createSQLQuery(total_sql);
        Integer totalRows = query.getFirstResult();
        System.out.println("totalRows=="+totalRows);
        pb.setTotalRows(totalRows.intValue());

        if(pb.getPageNow()>pb.getTotalPages()){
            pb.setPageNow(pb.getTotalPages());
        }

        if(pb.getPageNow()<1){
            pb.setPageNow(1);
        }

        int startIndex = (pb.getPageNow()-1)*pb.getPageCount();
        String data_sql = "select * from ("+basesql+" order by id desc ) tb limit ?,?";
        System.out.println("data_sql:"+data_sql);

        query = session.createSQLQuery(data_sql);
        query.setParameter(0,startIndex);
        query.setParameter(1,pb.getPageCount());
        List<Map<String,Object>> datas = query.list();
        System.out.println("datas:"+datas);
        pb.setDatas(datas);
    }

}
