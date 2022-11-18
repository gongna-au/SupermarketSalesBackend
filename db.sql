drop database if exists `SupermarketSalesBackend`;

create database `SupermarketSalesBackend`;

use  `SupermarketSalesBackend`;

-- 普通用户信息表(user)
create table `tbl_user_common`(
   `id`        int not null AUTO_INCREMENT comment "id" ,       
   `phone`     varchar(20) UNIQUE comment "账户",
   `password`  varchar(30) not null comment "密码",
   `name`      varchar(20) not null comment "昵称",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- 会员信息表(user)
create table `tbl_member`(
   `id`        int not null AUTO_INCREMENT comment "id" ,       
   `phone`     varchar(20) UNIQUE comment "账户",
   `password`  varchar(30) not null comment "密码",
   `name`      varchar(20) not null comment "昵称",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- 员工信息表(staff)
create table `tbl_staff`(
   `id`        int not null AUTO_INCREMENT comment "id" ,       
   `phone`     varchar(20) UNIQUE comment "账户",
   `password`  varchar(30) not null comment "密码",
   `name`      varchar(20) not null comment "昵称",
   `permissionlevel` int   not null comment "权限等级",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- 系统管理员信息表(administrator)
create table `tbl_administrator`(
   `id`        int not null AUTO_INCREMENT comment "id" ,       
   `phone`     varchar(20) UNIQUE comment "账户",
   `password`  varchar(30) not null comment "密码",
   `name`      varchar(20) not null comment "昵称",
   `permissionlevel` int   not null comment "权限等级",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;



-- 商品入库表(tbl_commodity_record)
create table `tbl_commodity_record`(
   `id` int not null AUTO_INCREMENT comment "id" ,      
   `barcode` varchar(20) not null comment "商品条形码",
   `name`    varchar(30) not null comment "商品名称",
   `unit`    varchar(10) not null comment "商品单位",
   `supplier`varchar(10)     null comment "商品供应商",
   `brand`   varchar(10)     null comment "商品品牌",
   `specification` varchar(10)  null comment "商品规格",
   `purchaseprice` DECIMAL(10.3) not null  DEFAULT 0  comment "商品进价",
   `retailprice`   DECIMAL(10.3) not null  DEFAULT 0  comment "商品零售价",
   `num`           int           not null  DEFAULT 0  comment "商品总量",
   `time`          DATETIME      not null  DEFAULT now() COMMENT "入库时间",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- 仓库表(tbl_storehouse)
create table `tbl_storehouse`(
   `id` int not null AUTO_INCREMENT comment "id" ,       
   `barcode` varchar(20) UNIQUE   comment "商品条形码",
   `name`    varchar(30) not null comment "商品名称",
   `unit`    varchar(10) not null comment "商品单位",
   `supplier`varchar(10)     null comment "商品供应商",
   `brand`   varchar(10)     null comment "商品品牌",
   `specification` varchar(10)  null comment "商品规格",
   `purchaseprice` DECIMAL(10.3) not null  DEFAULT 0  comment "商品进价",
   `retailprice`   DECIMAL(10.3) not null  DEFAULT 0  comment "商品零售价",
   `num`           int           not null  DEFAULT 0  comment "商品总量",
   `time`          DATETIME      not null  DEFAULT now() COMMENT "入库时间",

-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- 商品已售出表(commodity_sale)
create table `tbl_commodity_sale`(
   `id`           int         not null AUTO_INCREMENT comment "id" ,       
   `barcode`       varchar(20)   not null comment "商品条形码",
   `name`          varchar(30)   not null comment "商品名称",
   `purchaseprice` DECIMAL(10.3) not null comment "商品进价",
   `retailprice`   DECIMAL(10.3) not null comment "商品零售价",
   `time`          DATETIME      not null DEFAULT now() COMMENT "售出时间",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- 利润表(profit)
create table `tbl_profit`(
   `id`           int not null AUTO_INCREMENT comment "id" ,  
   `barcode`      varchar(20) not null comment "商品条形码",
   `name`         varchar(30) not null comment "商品名称",
   `num`          int        not null DEFAULT 0  comment "商品售出总量",
   `salepricenum` DECIMAL(10.3)   NOT NULL  COMMENT "售出一共获得的钱",
   `profitnum`    DECIMAL(10.3)   NOT NULL  COMMENT "售出得到的总利润",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- 销售对应的订单表(tbl_order)
create table `tbl_order`(
   `id`        int not null AUTO_INCREMENT comment "id" ,
   `phone`     varchar(20)  not null comment "用户账户",
   `sid`       int not null comment "收银员id",
   `ordercode` varchar(30)  not null comment "订单号id",
   `barcode`   varchar(20)  not null comment "商品条形码",
   `saleprice` DECIMAL(10.3)   NOT NULL  COMMENT "售出的商品的单价",
   `discount`  DECIMAL(10.3)   NOT NULL  COMMENT "售出的商品折扣",
   `payprice`  DECIMAL(10.3)   NOT NULL  COMMENT "用户实际的付款金额",
   `time`      DATETIME        not null  DEFAULT now() COMMENT "付款时间",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


-- 退货订单表(tbl_goods_return)
create table `tbl_order_return`(
   `id`           int not null   AUTO_INCREMENT comment "id" ,
   `phone`        varchar(20)  not null comment "用户账户",
   `sid`          int not null   comment "收银员id",
   `ordercode`    varchar(30)    not null comment "订单号id",
   `barcode`      varchar(20)    not null comment "商品条形码",
   `saleprice`    DECIMAL(10.3)  NOT NULL  COMMENT "售出的商品的单价",
   `discount`     DECIMAL(10.3)  NOT NULL  COMMENT "售出的商品折扣",
   `payprice`     DECIMAL(10.3)  NOT NULL  COMMENT "用户实际的付款金额",
   `returnprice`  DECIMAL(10.3)  NOT NULL  COMMENT "用户实际的退款金额",
   `time`         DATETIME       not null  DEFAULT now() COMMENT "退款时间",
-- 添加约束
primary key (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;

-- 普通用户信息插入
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769210', '123456', "Xi");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769211', '123456', "Li");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769212', '123456', "Wang");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769213', '123456', "Zhou");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769214', '123456', "Gong");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769215', '123456', "Zhang");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769216', '123456', "Qiu");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769217', '123456', "Huang");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769218', '123456', "Wu");
INSERT INTO `tbl_user_common` (phone ,password ,name ) VALUES ('15102769219', '123456', "Gao");
select * from `tbl_user_common`;
-- 会员信息插入
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769210', '123456', "Xi");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769211', '123456', "Li");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769212', '123456', "Wang");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769213', '123456', "Zhou");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769214', '123456', "Gong");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769215', '123456', "Zhang");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769216', '123456', "Qiu");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769217', '123456', "Huang");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769218', '123456', "Wu");
INSERT INTO `tbl_member` (phone ,password ,name ) VALUES ('15102769219', '123456', "Gao");
select * from `tbl_member`;

-- 员工信息插入
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769210', '123456', "Gao",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769211', '123456', "Li",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769212', '123456', "Liu",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769213', '123456', "Zhao",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769214', '123456', "Wei",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769215', '123456', "Liang",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769216', '123456', "Zhang",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769217', '123456', "Zhou",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769218', '123456', "Huang",1);
INSERT INTO `tbl_staff` (phone ,password ,name ,permissionlevel) VALUES ('15102769219', '123456', "Wu",1);
select * from `tbl_staff`;

-- 系统管理员信息插入
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769210', '123456', "root1",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769211', '123456', "root2",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769212', '123456', "root3",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769213', '123456', "root4",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769214', '123456', "root5",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769215', '123456', "root6",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769216', '123456', "root7",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769217', '123456', "root8",1);
INSERT INTO `tbl_administrator` (phone ,password ,name ,permissionlevel) VALUES ('15102769218', '123456', "root9",1);

select * from `tbl_administrator`;
-- 入仓信息插入
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657670', '安慕希', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657671', '巧乐兹', "箱","伊利集团","伊利","",30,70,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657672', '冰工厂', "箱","伊利集团","伊利","",37,65,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657673', '优酸乳', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657674', '金领冠婴幼儿配方奶粉', "罐","伊利集团","伊利","",39,100,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657675', '畅轻', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657676', '0蔗糖', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657677', '宫酪', "箱","伊利集团","伊利","",38,60,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657678', '大果粒', "箱","伊利集团","伊利","",39,64,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657679', 'joy day', "箱","伊利集团","伊利","",39,61,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657661', '褐色炭烧', "箱","伊利集团","伊利","",39,78,100);
INSERT INTO `tbl_commodity_record` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657662', 'QQ星儿童成长酸奶', "箱","伊利集团","伊利","",40,80,100);

select * from `tbl_commodity_record`;
-- 仓库信息插入
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657670', '安慕希', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657671', '巧乐兹', "箱","伊利集团","伊利","",30,70,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657672', '冰工厂', "箱","伊利集团","伊利","",37,65,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657673', '优酸乳', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657674', '金领冠婴幼儿配方奶粉', "罐","伊利集团","伊利","",39,100,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657675', '畅轻', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657676', '0蔗糖', "箱","伊利集团","伊利","",39,60,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657677', '宫酪', "箱","伊利集团","伊利","",38,60,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657678', '大果粒', "箱","伊利集团","伊利","",39,64,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657679', 'joy day', "箱","伊利集团","伊利","",39,61,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657661', '褐色炭烧', "箱","伊利集团","伊利","",39,78,100);
INSERT INTO `tbl_storehouse` (barcode ,name, unit, supplier, brand, specification,  purchaseprice, retailprice, num  ) VALUES ('353564657662', 'QQ星儿童成长酸奶', "箱","伊利集团","伊利","",40,80,100);




select * from tbl_storehouse;

-- 订单信息表
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'111','353564657671', 60,0,100);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'222','353564657672', 70,0,100);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'333','353564657673', 65,0,100);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'444','353564657674', 60,0,100);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'555','353564657675', 100,0,200);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'666','353564657676', 60,0,100);
INSERT INTO `tbl_order` (phone ,sid, ordercode, barcode, saleprice, discount, payprice) VALUES ("15102769210",1,'777','353564657677', 60,0,100);
select * from tbl_order where (time >= "2022-11-18 20:00:00" And time <= "2022-11-19 20:10:00" );

-- 退货订单表
INSERT INTO `tbl_order_return` (phone ,sid, ordercode, barcode, saleprice, discount, payprice, returnprice) VALUES ("15102769210",1,'777','353564657677', 60,0,100,100);






















