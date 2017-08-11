package com.hxj.page;

/**
 * Created by hxj on 17-8-8.
 */
public class HouseCondition implements Condition{

    private Integer rentType;
    private Integer minprice;
    private Integer maxprice;
    private Integer room;

    public void setRentType(Integer rentType) {
        this.rentType = rentType;
    }

    public void setMinprice(Integer minprice) {
        this.minprice = minprice;
    }

    public void setMaxprice(Integer maxprice) {
        this.maxprice = maxprice;
    }

    public void setRoom(Integer room) {
        this.room = room;
    }

    public Integer getRentType() {
        return rentType;
    }

    public Integer getMinprice() {
        return minprice;
    }

    public Integer getMaxprice() {
        return maxprice;
    }

    public Integer getRoom() {
        return room;
    }

    private String getRentTypeCondition(){
        return rentType==null?"":" and rentType="+rentType;
    }

    private String getMinPriceCondition(){
        return minprice==null?"":" and price>="+minprice;
    }

    private String getMaxPriceCondition(){
        return maxprice==null?"":" and price<"+maxprice;
    }

    private String getRoomCondition(){
        if ("6".equals(room)){
            return " and room>5";
        }
        return room==null?"":" and room="+room;
    }

    @Override
    public String toString() {
        return getRentTypeCondition()+getMinPriceCondition()+getMaxPriceCondition()+getRoomCondition();
    }
}
