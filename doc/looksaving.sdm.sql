


CREATE TABLE IF NOT EXISTS page_areas (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL COMMENT '区域的名称,必须唯一 home-index:ddl',
  title varchar(100) NOT NULL COMMENT '前台展示的名字',
  type enum('cate','global','page') NOT NULL COMMENT '区域类型,固定的全局广告,页面级别的广告,分类关联的广告',
  notes varchar(500) NOT NULL COMMENT '备注,业务需求,可以记录一些要求',
  uptime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id),
  UNIQUE KEY name (name)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告区域的集合' AUTO_INCREMENT=5 ;

--
-- 示例数据
--

INSERT INTO page_areas (id, name, type, notes, uptime) VALUES
(1, '全局Banner广告', 'global', '', '2013-01-21 06:18:52'),
(2, '首页顶部Banner广告', 'page', '', '2013-01-21 06:19:38'),
(3, ' 首页幻灯广告', 'page', '', '2013-01-21 06:19:55'),
(4, '产品页顶部Banner广告', 'page', '', '2013-01-21 06:21:34');

# 页面广告配置
create table if not exists page_items(
  id int not null auto_increment,                        # id
  link varchar(255) not null default '',                 # 点击链接 或者产品链接
  title varchar(255) not null default '',                # 展示文本 或者产品名称 或者关键词
  picpath varchar(255) not null default '',              # 展示图片 或者产品图片
  catecode varchar(10) not null default '',             # 分类ID
  pid  int not null default 0,                          # 产品id
  cid  int not null default 0,                          # cid
  area_id int not null default 0,                        # 关联的页面ID
  sort int not null default '0',                         # 排序
  PRIMARY KEY (id),
  index type_sort(type, sort)
) ENGINE=InnoDB default CHARSET=utf8;


#分类页 区域的配置信息
create table if not exists page_area_cates(
  area_id  int
  catecode  varchar(20)
  config text
) ENGINE=InnoDB default CHARSET=utf8;

# 专题页模板
create table if not exists subject_tpls (
  id int not null auto_increment,             # 专题页模板ID
  name varchar(32) not null default '',       # 专题页模板名称
  addtime timestamp not null default current_timestamp,    # 添加时间
);

# 专题页列表
create table if not exists subject_lists (
  id int not null auto_increment,                   # 专题页id
  name varchar(32) not null default '',             # 专题页名称
  seo_title varchar(32) not null default '',        # 专题页名称
  seo_keyword varchar(32) not null default '',      # 专题页名称
  seo_descption varchar(32) not null default '',    # 专题页名称
  urlname varchar(100) not null default '',         # 专题页在url中的名称
  tpl_id int not null default 0,                    # 专题页模板ID
  data text      null     ,                          #专题页数据 json 格式存储
  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime timestamp  null ,                           # 添加时间
) ENGINE=InnoDB default CHARSET=utf8;


