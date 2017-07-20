drop table if exists tb_zone;

/*==============================================================*/
/* Table: tb_zone                                               */
/*==============================================================*/
create table tb_zone
(
   zoneId               int not null auto_increment,
   zoneName             varchar(100) not null,
   isDef                int not null default 0 comment '1代表是，0代表不是',
   primary key (zoneId)
);


INSERT INTO tb_zone (zoneId, zoneName, isDef) VALUES ('1', '综合交流区', '1');
INSERT INTO tb_zone (zoneId, zoneName, isDef) VALUES ('2', 'BUG反馈区', '0');
INSERT INTO tb_zone (zoneId, zoneName, isDef) VALUES ('3', '新闻公告区', '0');
INSERT INTO tb_zone (zoneId, zoneName, isDef) VALUES ('4', '活动专区', '0');

