DROP DATABASE IF EXISTS house;
CREATE DATABASE house;

USE house;

DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user
(
  id int auto_increment primary key,
  username varchar(20) null,
  password varchar(20) null,
  phone char(11) null
);

DROP TABLE IF EXISTS t_house;
CREATE TABLE t_house(
  id int auto_increment primary key,
  houseEstate VARCHAR(50) NOT NULL, -- 小区名称
  address VARCHAR(255) NOT NULL, -- 地址
  rentType INT NOT NULL DEFAULT 0, -- 出租方式(整租0 合租1)
  room INT, -- 室
  hall INT, -- 厅
  toilet INT, -- 卫
  houseArea DECIMAL(6,2), -- 房屋面积
  floor CHAR(3), -- 第几层
  allfloor CHAR(3), -- 共几层
  houseType VARCHAR(10),-- 住宅类型
  direction INT, -- 朝向
  decorate INT, -- 装修情况
  configure VARCHAR(50), -- 房屋配置(电视,空调,.....)
  price DECIMAL(5), -- 出租金额
  payType INT, -- 支付方式(押一付三0 押一付一1 押一付六2 押一付十二3)
  houseTitle VARCHAR(50), -- 房屋描述标题
  houseDetail TEXT, -- 房屋详细描述
  housepic VARCHAR(255), -- 房屋图片
  userId INT, -- 发布人
  linkman VARCHAR(20), -- 联系人
  linkphone CHAR(11), -- 联系电话
  intoTime DATETIME -- 入住时间

);

