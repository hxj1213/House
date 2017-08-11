package com.hxj.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Created by hxj on 17-8-3.
 */
public class House {
    private int id;
    private String houseEstate; //小区名称
    private String address;
    private Integer rentType;
    private Integer room;
    private Integer hall;
    private Integer toilet;
    private BigDecimal houseArea;
    private String floor;
    private String allfloor;
    private Integer houseType;//房屋类型
    private Integer direction;//朝向
    private Integer decorate;//装修
    private String configure;
    private Integer price;
    private Integer payType;//支付方式
    private String houseTitle;
    private String houseDetail;
    private String housepic;
    private Integer userId;
    private String linkman;
    private String linkphone;
    private Timestamp intoTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHouseEstate() {
        return houseEstate;
    }

    public void setHouseEstate(String houseEstate) {
        this.houseEstate = houseEstate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getRentType() {
        return rentType;
    }

    public void setRentType(Integer rentType) {
        this.rentType = rentType;
    }

    public Integer getRoom() {
        return room;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getHall() {
        return hall;
    }

    public void setHall(Integer hall) {
        this.hall = hall;
    }

    public Integer getToilet() {
        return toilet;
    }

    public void setToilet(Integer toilet) {
        this.toilet = toilet;
    }

    public BigDecimal getHouseArea() {
        return houseArea;
    }

    public void setHouseArea(BigDecimal houseArea) {
        this.houseArea = houseArea;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public String getAllfloor() {
        return allfloor;
    }

    public void setAllfloor(String allfloor) {
        this.allfloor = allfloor;
    }

    public Integer getHouseType() {
        return houseType;
    }

    public void setHouseType(Integer houseType) {
        this.houseType = houseType;
    }

    public Integer getDirection() {
        return direction;
    }

    public void setDirection(Integer direction) {
        this.direction = direction;
    }

    public Integer getDecorate() {
        return decorate;
    }

    public void setDecorate(Integer decorate) {
        this.decorate = decorate;
    }

    public String getConfigure() {
        return configure;
    }

    public void setConfigure(String configure) {
        this.configure = configure;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getHouseTitle() {
        return houseTitle;
    }

    public void setHouseTitle(String houseTitle) {
        this.houseTitle = houseTitle;
    }

    public String getHouseDetail() {
        return houseDetail;
    }

    public void setHouseDetail(String houseDetail) {
        this.houseDetail = houseDetail;
    }

    public String getHousepic() {
        return housepic;
    }

    public void setHousepic(String housepic) {
        this.housepic = housepic;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public String getLinkphone() {
        return linkphone;
    }

    public void setLinkphone(String linkphone) {
        this.linkphone = linkphone;
    }

    public Timestamp getIntoTime() {
        return intoTime;
    }

    public void setIntoTime(Timestamp intoTime) {
        this.intoTime = intoTime;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", houseEstate='" + houseEstate + '\'' +
                ", address='" + address + '\'' +
                ", rentType=" + rentType +
                ", room=" + room +
                ", hall=" + hall +
                ", toilet=" + toilet +
                ", houseArea=" + houseArea +
                ", floor='" + floor + '\'' +
                ", allfloor='" + allfloor + '\'' +
                ", houseType='" + houseType + '\'' +
                ", direction=" + direction +
                ", decorate=" + decorate +
                ", configure='" + configure + '\'' +
                ", price=" + price +
                ", payType=" + payType +
                ", houseTitle='" + houseTitle + '\'' +
                ", houseDetail='" + houseDetail + '\'' +
                ", housepic='" + housepic + '\'' +
                ", userId=" + userId +
                ", linkman='" + linkman + '\'' +
                ", linkphone='" + linkphone + '\'' +
                ", intoTime=" + intoTime +
                '}';
    }
}
