# ------ 线下库 --------
# 公司线下表增加是否抓取标识
alter table companys_uncheck add isfetch tinyint not null default '0' AFTER ischeckreason,
														 add fromurl varchar(512) not null default '' AFTER isfetch;
# ops_companys_info：不做更改

# 产品线下表：加数据来源url
alter table products_uncheck add fromurl varchar(512) not null default '' AFTER sell_param;


# ------ 国外库 --------
# 店铺收藏
create table if not exists store_lists (
  id int not null auto_increment,
  bid int not null default 0,
  cid int not null default 0,
  addtime timestamp not null default '0000-00-00 00:00:00',
  PRIMARY KEY (id),
  INDEX bid(bid)
)ENGINE=InnoDB default CHARSET=utf8;

# 产品收藏: 加收藏来源
alter table wishlists add domain varchar(256) not null default '',
					  add addtime TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' AFTER domain;

# 登录用户浏览历史
# 多条记录

create table if not exists viewed_histroys (
  bid int not null default 0,
  view_cid int not null default 0,
  pid  int not null default 0,
 -- pids text not null default '',
  uptime timestamp not null default '0000-00-00 00:00:00',
  PRIMARY KEY (bid,view_cid,pid)
)ENGINE=InnoDB default CHARSET=utf8;

# 产品评论: 加发布来源
alter table product_feedbacks add domain varchar(256) not null default '';

# ------ 线上库 ------
# 产品线上表：加数据来源url
alter table products add fromurl varchar(512) not null default '' AFTER sell_param;

#公司线上表：增加是否抓取标识
alter table companys add isfetch tinyint not null default '0' AFTER ischeckreason,
										 add fromurl varchar(512) not null default '' AFTER isfetch;

# 分类表
alter table categorys add isshow TINYINT not null default '0' AFTER ischild,
					  add picpath int not null default '0' AFTER isshow ;


# 专题页模板
create table if not exists subject_tpls (
  id int not null auto_increment,         		# 专题页模板ID
  name varchar(32) not null default '',         # 专题页模板名称
  addtime timestamp not null default CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB default CHARSET=utf8;;

# 专题页列表
create table if not exists subject_lists (
  id int not null auto_increment,              # 专题页id
  name varchar(32) not null default '',        # 专题页名称
  tpl_id int not null default 0,              # 专题页模板ID
  urlname varchar(100) not null default '',    # 专题页在url中的名称
  addtime timestamp not null default CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB default CHARSET=utf8;


# 页面数据配置
create table if not exists page_settings(
	name varchar(128),
	value text not null default '',
    uptime timestamp not null default CURRENT_TIMESTAMP,
  	PRIMARY KEY (name)
) ENGINE=InnoDB default CHARSET=utf8;;
