# 翻译表,备份翻译过的非富文本的资料
drop table if exists trans_words_center;
create table trans_words_center  (
  id int not null auto_increment,                    # 用户ID
  keyword varchar(768),                              # 关键词
  trankeyword varchar(768),                          # 翻译关键词
  uptime timestamp default current_timestamp,        # 更新时间
  tranlan varchar(32),                               # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko
  primary key (id),
  index keyword (keyword),
  index tranlan (tranlan)
) engine=MyISAM default charset=utf8;

# 翻译纠错
drop table if exists trans_words_replace;
create table trans_words_replace  (
  id int not null auto_increment,                    # ID
  cid int not null,                                  # 公司id
  keyword varchar(768),                              # 关键词
  trankeyword varchar(768),                          # 翻译关键词
  uptime timestamp default current_timestamp,        # 更新时间
  tranlan varchar(32),                               # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko
  primary key (id),
  index keyword (keyword),
  index tranlan (tranlan)
) engine=MyISAM default charset=utf8;

# 用户角色信息表
drop table if exists ops_role;
create table ops_role  (
  roleid int not null auto_increment,                # 角色ID
  parentroleid int not null default 0,               # 上级角色id
  name varchar(128) not null default '',             # 角色名称
  roledesc text not null default '',                 # 角色描述
  cids text not null default '',                     # 角色权限cid，逗号隔开, "all"为admin权限
  uptime timestamp default current_timestamp,        # 更新时间
  status tinyint not null default 0,                 # 角色状态 0有效，1删除

  primary key (roleid),
  index parentroleid (parentroleid),
  index uptime (uptime)
) engine=MyISAM default charset=utf8;

drop table if exists questions;
create table questions  (
  id int not null auto_increment,                    # 问题ID
  parentid int not null default 0,                   # 问题父id，0表示此为问题，其他表示记录为答案，parentid为问题id
  uid int not null default 0,                        # 所属的销售id
  questioninfo text not null default '',             # 问题内容备注
  status tinyint not null default 0,                 # 问题状态 0有效，1删除
  sort int not null default 0,                       # 排序
  addtime timestamp default current_timestamp,       # 添加时间
  primary key (id),
  index addtime (addtime),
  index parentid (parentid)
) engine=MyISAM default charset=utf8;

drop table if exists ip_vhost;
create table ip_vhost (
  ip varchar(15) not null default '',               # 来源IP
  vhost varchar(20) not null default '',            # 公司服务器名称
  primary key (ip)
) engine=MyISAM default charset=utf8;

# 运营监控系统
drop table if exists company_monitor;
create table company_monitor (
  cid int not null,                                  # 公司id
  indexcenter text not null default '',              # 中部产品错误
  foot text not null default '',                     # 页脚错误
  uptime timestamp default current_timestamp,        # 监控时间
  primary key (cid),
  index uptime (uptime)
) engine=MyISAM default charset=utf8;

# 翻译队列表
drop table if exists tran_queue;
create table tran_queue (
  id int not null auto_increment,                    # 队列ID
  cid int not null default 0,                        # 公司id
  trantable varchar(100) NOT NULL default '',        # 需翻译表名
  tranid int not null default 0,                     # 需翻译id，表的唯一id
  trancolumn varchar(100) not null default '',       # 翻译字段名，空为翻译整个表
  tranlang varchar(1024) not null default '',        # 翻译语言，数字，逗号隔开 1,2,3,4
  status tinyint not null default 0,                 # 翻译状态，0,新添加，1翻译成功，2翻译失败
  level tinyint not null default 0,                  # 优先级，越高越优先，普通修改0-9,新增 10-19
  addtime timestamp default current_timestamp,       # 添加时间
  uptime datetime default '2009-01-01 00:00:00',     # 修改时间
  primary key (id),
  index level (level),
  index tranid (tranid),
  index status (status)
) engine=MyISAM default charset=utf8;

-- phpMyAdmin SQL Dump
-- version 3.2.2.1deb1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2010 年 10 月 26 日 10:46
-- 服务器版本: 5.1.37
-- PHP 版本: 5.2.10-2ubuntu6.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `trade`
--

-- --------------------------------------------------------

--
-- 表的结构 `ops_admins` 管理员的表
--

CREATE TABLE IF NOT EXISTS `ops_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleid` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_ip` varchar(20) NOT NULL,
  `login_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员的表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_companys_info`  运营使用的客户资料信息
--

CREATE TABLE IF NOT EXISTS `ops_companys_info` (
  `cid` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(500) NOT NULL,
  `msn` varchar(500) NOT NULL,
  `qq` varchar(100) NOT NULL,
  `status` tinyint not null default 0,                                # 客户状态 0,未上线；1,已上线; 2，挂起; 3,已下线; 4,其他
  `servstarttime` timestamp NOT NULL default '2009-01-01 00:00:00',   # 服务开始时间
  `servendtime` timestamp NOT NULL default '2009-01-01 00:00:00',     # 服务结束时间
  `paytime` timestamp NOT NULL default '2009-01-01 00:00:00',         # 到款时间
  `uid` int(11) NOT NULL default 0,                                   # 制作人员,跟ops_admin关联

  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运营使用的客户资料信息';

-- --------------------------------------------------------

--
-- 表的结构 `ops_inquiry_keyword`  贸易通询盘自动匹配的关键词"
--

CREATE TABLE IF NOT EXISTS `ops_inquiry_keyword` (
  `cid` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='贸易通询盘自动匹配的关键词';

-- --------------------------------------------------------

--
-- 表的结构 `ops_keyword_base`  扩展词表
--

CREATE TABLE IF NOT EXISTS `ops_keyword_base` (
  `keyword` varchar(100) NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展词表';

-- --------------------------------------------------------

--
-- 表的结构 `ops_keyword_pos_item`  google 关键词排名获取明细表
--

CREATE TABLE IF NOT EXISTS `ops_keyword_pos_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '任务的批次',
  `cid` int(11) NOT NULL,
  `pos` int(11) DEFAULT NULL,
  `keyword` varchar(200) NOT NULL,
  `link_url` varchar(200) DEFAULT NULL,
  `link_text` varchar(200) DEFAULT NULL,
  `old_keyword` varchar(200) NOT NULL,
  `fetch_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='google 关键词排名获取明细表' AUTO_INCREMENT=3046 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_keyword_pos_task`  生成关键词排名查询的任务
--

CREATE TABLE IF NOT EXISTS `ops_keyword_pos_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `company_count` int(11) NOT NULL,
  `keyword_count` int(11) NOT NULL,
  `is_stop` int(11) NOT NULL DEFAULT '0' COMMENT '0正常1暂停任务',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='生成关键词排名查询的任务' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_log`  运营的业务/操作日志
--

CREATE TABLE IF NOT EXISTS `ops_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `notes` varchar(2000) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运营的业务/操作日志' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_search_ad`  贸易通客户在himfr 等站点的搜索结果页面 推广的广告
--

CREATE TABLE IF NOT EXISTS `ops_search_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `keyword` varchar(500) NOT NULL,
  `pid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1 categories ; 2 keywords',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='贸易通客户在himfr 等站点的搜索结果页面 推广的广告' AUTO_INCREMENT=34 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_service_log`   服务日志
--

CREATE TABLE IF NOT EXISTS `ops_service_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `notes` varchar(2000) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='服务日志' AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_tpls`  网站模板列表
--

CREATE TABLE IF NOT EXISTS `ops_tpls` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='网站模板列表';

-- --------------------------------------------------------

--
-- 表的结构 `ops_web_traffic`  网站流量统计报表
--

CREATE TABLE IF NOT EXISTS `ops_web_traffic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datestr` date NOT NULL,
  `cid` int(11) NOT NULL,
  `uv` int(11) NOT NULL COMMENT '总uv',
  `f_uv` int(11) NOT NULL COMMENT '国外uv',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datestr` (`datestr`,`cid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站流量统计报表' AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- 表的结构 `ops_web_email`  客户email管理表
--

CREATE TABLE IF NOT EXISTS ops_web_email (
  id int(11) NOT NULL AUTO_INCREMENT,                # 自增id
  cid int(11) NOT NULL,                              # 用户公司id
  email varchar(128),                                # 用户email
  name varchar(128),                                 # email名称
  create_time timestamp default current_timestamp,   # 新建时间
  update_time timestamp NULL DEFAULT NULL,           # 修改时间
  PRIMARY KEY (id),
  index cid (cid),
  index email (email)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='客户email管理表';
