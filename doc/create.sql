# 国内库

# 公司简单信息表
drop table if exists to_companys;
create table to_companys  (
  cid int not null auto_increment,                   # 公司id
  domain varchar(1024) default '',                   # 公司域名
  logopath varchar(256) default '',                  # 公司logo图片地址
  color tinyint default 0,                           # 展示肤色
  tel varchar(32) not null default '',               # 工作时间电话
  teloff varchar(32) not null default '',            # 非工作时间电话
  teltype tinyint not null default 0,                # 电话状态 0，7*24；1，工作时间
  worktime varchar(20) not null default '',          # 工作时间 9-18
  fax varchar(20) not null default '',               # 传真
  email varchar(1024) not null default '',           # 电子邮件，多个,号隔开 第一个为默认显示的email
  contperson varchar(500) not null default '',       # 联系人
  msn varchar(256) not null default '',              # 各页面显示的msn联系方式
  skype varchar(256) not null default '',            # 各页面显示的skype联系方式
  yahoo varchar(256) not null default '',            # 各页面显示的yahoo联系方式
  marketcode varchar(100) not null default '',       #
  busitypecode varchar(100) not null default '',     #
  employeenumber varchar(500) not null default '',   # 员工人数
  annualsales varchar(50) not null default '',       # 销售额
  yearestablished varchar(50) not null default '',   # 公司建立时间
  exportper varchar(250) not null default '',        # 出口比例
  tradeword varchar(64) not null default '',         # 交易词
  tradeurl text not null default '',                 # 交易url
  staticcode text not null default '',               # 网站统计代码
  addtime datetime default '2009-01-01 00:00:00',    # 增加时间
  onlinetime datetime default '2009-01-01 00:00:00', # 上线时间
  uptime timestamp default current_timestamp,        # 更新时间
  status tinyint not null default 0,                 # 公司状态 0有效，1下线，2删除
  ip varchar(15) not null default '',                # 公司对应ip
  statichtml tinyint not null default 0,             # 是否自动静态化 0自动，1锁定
  level tinyint not null default 2,                  # 公司等级 0 A级，1 B级，2 C级

  primary key (cid),
  KEY addtime (addtime),
  KEY uptime (uptime)
) engine=MyISAM default charset=utf8;

# 公司简单信息翻译表
drop table if exists to_company_description;
create table to_company_description (
  cid int not null default 0,                        # 公司id
  name varchar(256) default '',                      # 公司名称
  keyword varchar(256) default '',                   # 公司关键词 ,号隔开？
  slogan varchar(1024) default '',                   # 公司标语
  addr varchar(256) not null default '',             # 公司地址
  factoryaddr varchar(256) not null default '',      # 工厂地址
  brands varchar(256) not null default '',           # 品牌名称
  remark text not null default '',                   # 公司简介 introduction
  plineinfo text not null default '',                # 生产线基本简介
  oeminfo text not null default '',                  # OEM简介
  rdinfo text not null default '',                   # R&D简介
  servinfo text not null default '',                 # 公司服务简介
  historyinfo text not null default '',              # 公司历史简介
  teaminfo text not null default '',                 # 公司团队简介
  qcinfo text not null default '',                   # 质量管理简介
  servicepolicy text not null default '',            # 服务政策
  buyerprotect text not null default '',             # 买家保护政策
  userprivacypolicy text not null default '',        # 用户隐私条款
  userterms text not null default '',                # 用户使用条款
  uptime timestamp default current_timestamp,        # 更新时间
  autocompanycontact tinyint not null default 0,     # 是否自动翻译 0是，1手工
  autocompanyadd tinyint not null default 0,         # 是否自动翻译 0是，1手工
  autoproductline tinyint not null default 0,        # 是否自动翻译 0是，1手工
  autooem tinyint not null default 0,                # 是否自动翻译 0是，1手工
  autord tinyint not null default 0,                 # 是否自动翻译 0是，1手工
  autoservice tinyint not null default 0,            # 是否自动翻译 0是，1手工
  autohistory tinyint not null default 0,            # 是否自动翻译 0是，1手工
  autoteam tinyint not null default 0,               # 是否自动翻译 0是，1手工
  autoqc tinyint not null default 0,                 # 是否自动翻译 0是，1手工
  language_id tinyint not null default 0,            # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko

  UNIQUE cid_tranlan (cid, language_id)
) engine=MyISAM default charset=utf8;

# 公司其他规格翻译表
drop table if exists to_company_detail_description;
create table to_company_detail_description
(
  cdid int not null default 0,                        # 公司规格id
  cid int not null default 0,                         # 公司id
  name varchar(100) not null default '',              # 规格名称
  value varchar(100) not null default '',             # 规格值
  uptime timestamp default current_timestamp,         # 更新时间
  autotran tinyint not null default 0,                # 是否自动翻译 0是，1手工
  language_id tinyint not null default 0,             # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko

  UNIQUE cdid_tranlan (cdid, language_id)
) engine=MyISAM default charset=utf8;

# 首页Banner图片信息表
DROP TABLE IF EXISTS to_banner_image;
CREATE TABLE to_banner_image (
  banner_image_id int(11) NOT NULL AUTO_INCREMENT,
  banner_id int(11) NOT NULL default 0,
  cid int not null default 0,                             # 公司ID
  link varchar(255) COLLATE utf8_bin NOT NULL default '', # banner点击链接
  image varchar(255) COLLATE utf8_bin NOT NULL default '',# banner图片
  sort int(3) NOT NULL DEFAULT '0',                        # 排序
  PRIMARY KEY (banner_image_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 首页Banner图片标题语言表
DROP TABLE IF EXISTS to_banner_image_description;
CREATE TABLE to_banner_image_description (
  banner_image_id int(11) NOT NULL default 0,
  language_id int(11) NOT NULL default 0,
  banner_id int(11) NOT NULL default 0,
  cid int not null default 0,                             # 公司ID
  title varchar(64) COLLATE utf8_bin NOT NULL default '', # banner图片标题
  autotran tinyint not null default 0,                    # 是否自动翻译 0是，1手工
  PRIMARY KEY (banner_image_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 分类表
DROP TABLE IF EXISTS to_category;
CREATE TABLE to_category (
  category_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                    # 公司ID
  image varchar(255) COLLATE utf8_bin DEFAULT NULL default '',   # 分类图片
  parent_id int(11) NOT NULL DEFAULT '0',                        # 父分类ID
  top int(1) NOT NULL default 0,                                 # 是否在top menu上显示
  sort_order int(3) NOT NULL DEFAULT '0',                        # 排序
  status int(1) NOT NULL default 0,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (category_id),
  KEY cid (cid),
  KEY parent_id (parent_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 分类名称语言表
DROP TABLE IF EXISTS to_category_description;
CREATE TABLE to_category_description (
  category_id int(11) NOT NULL default 0,
  cid int not null default 0,                                              # 公司ID
  language_id int(11) NOT NULL default 0,                                  # 语言ID
  name varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',                  # 分类名称
  description text COLLATE utf8_bin NOT NULL default '',                   # 分类说明
  keyword text COLLATE utf8_bin NOT NULL default '',                       # 分类关键词，逗号隔开
  meta_description varchar(255) COLLATE utf8_bin NOT NULL default '',      # 分类meta说明
  meta_keyword varchar(255) COLLATE utf8_bin NOT NULL default '',          # 分类meta关键词
  uptime timestamp default current_timestamp,                              # 更新时间
  autotran tinyint not null default 0,                                     # 是否自动翻译 0是，1手工
  PRIMARY KEY (category_id,language_id),
  KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 优惠券表
DROP TABLE IF EXISTS to_coupon;
CREATE TABLE to_coupon (
  coupon_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                     # 公司ID
  name varchar(128) COLLATE utf8_bin NOT NULL default '',         # 优惠券名称
  code varchar(10) COLLATE utf8_bin NOT NULL default '',          # 优惠券代码
  type char(1) COLLATE utf8_bin NOT NULL default '',              # 优惠券类型
  discount decimal(15,4) NOT NULL default 0,                      # 折扣数
  logged int(1) NOT NULL default 0,                               # 是否登录用户使用
  shipping int(1) NOT NULL default 0,                             # 是否免费送货
  total decimal(15,4) NOT NULL default 0,                         # 达到的总额才能使用
  date_start date NOT NULL DEFAULT '0000-00-00',                  # 起始时间
  date_end date NOT NULL DEFAULT '0000-00-00',                    # 终止时间
  uses_total int(11) NOT NULL default 0,                          # 使用总额
  uses_customer varchar(11) COLLATE utf8_bin NOT NULL default '', # 使用用户数
  status int(1) NOT NULL default 0,                               # 是否有效
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (coupon_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 优惠券使用记录表
DROP TABLE IF EXISTS to_coupon_history;
CREATE TABLE to_coupon_history (
  coupon_history_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                    # 公司ID
  coupon_id int(11) NOT NULL default 0,                          # 优惠券ID
  order_id int(11) NOT NULL default 0,                           # 订单ID
  customer_id int(11) NOT NULL default 0,                        # 客户ID
  amount decimal(15,4) NOT NULL default 0,                       # 金额
  date_added datetime NOT NULL default '0000-00-00 00:00:00',    # 时间
  PRIMARY KEY (coupon_history_id),
  KEY cid (cid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 使用优惠券的产品表
DROP TABLE IF EXISTS to_coupon_product;
CREATE TABLE to_coupon_product (
  coupon_product_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                       # 公司ID
  coupon_id int(11) NOT NULL default 0,             # 优惠券ID
  product_id int(11) NOT NULL default 0,            # 产品ID
  PRIMARY KEY (coupon_product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 货币表
DROP TABLE IF EXISTS to_currency;
CREATE TABLE to_currency (
  currency_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                      # 公司ID
  title varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',          # 货币名称
  code varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',            # 货币代码
  symbol_left varchar(12) COLLATE utf8_bin NOT NULL default '',    # 货币左符号
  symbol_right varchar(12) COLLATE utf8_bin NOT NULL default '',   # 货币右符号
  decimal_place char(1) COLLATE utf8_bin NOT NULL default '',      # 小数位数
  value float(15,8) NOT NULL default 0,                            # 汇率
  isdefault int(1) NOT NULL default 0,                             # 默认货币，1为默认
  status int(1) NOT NULL default 0,
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (currency_id,cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 语言表
DROP TABLE IF EXISTS to_language;
CREATE TABLE to_language (
  language_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  name varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',      # 语言名称
  code varchar(5) COLLATE utf8_bin NOT NULL default '',       # 代码
  locale varchar(255) COLLATE utf8_bin NOT NULL default '',   # locale字符串
  image varchar(64) COLLATE utf8_bin NOT NULL default '',     # 语言图片
  directory varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '', # 语言目录
  filename varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',  # 主要语言文件名
  sort_order int(3) NOT NULL DEFAULT '0',                     # 排序
  status int(1) NOT NULL default 0,                           # 是否有效
  PRIMARY KEY (language_id),
  KEY name (name),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品表
DROP TABLE IF EXISTS to_product;
CREATE TABLE to_product (
  product_id int(11) NOT NULL AUTO_INCREMENT,                 # 产品id
  cid int not null default 0,                                 # 公司ID
  model varchar(64) COLLATE utf8_bin NOT NULL default '',     # 产品唯一标识
  sku varchar(64) COLLATE utf8_bin NOT NULL default '',       # sku唯一号
  upc varchar(12) COLLATE utf8_bin NOT NULL default '',       # upc
  location varchar(128) COLLATE utf8_bin NOT NULL default '', # 地点
  quantity int(4) NOT NULL DEFAULT '0',                       # 数量
  stock_status_id int(11) NOT NULL default 0,                 # 库存状态ID
  image varchar(255) COLLATE utf8_bin DEFAULT NULL default '',# 产品主图
  shipping int(1) NOT NULL DEFAULT '1',                       # 是否送货
  price decimal(15,4) NOT NULL DEFAULT '0.0000',              # 价格
  listprice decimal(15,4) NOT NULL DEFAULT '0.0000',          # 市场价格
  points int(8) NOT NULL DEFAULT '0',                         # 需要购买此产品的积分
  date_available date NOT NULL default '0000-00-00 00:00:00', # 到期日期
  weight decimal(5,2) NOT NULL DEFAULT '0.00',                # 重量值
  weight_class_id int(11) NOT NULL DEFAULT '0',               # 重量类ID
  length decimal(5,2) NOT NULL DEFAULT '0.00',                # 长
  width decimal(5,2) NOT NULL DEFAULT '0.00',                 # 宽
  height decimal(5,2) NOT NULL DEFAULT '0.00',                # 高
  length_class_id int(11) NOT NULL DEFAULT '0',               # 长度类ID
  subtract int(1) NOT NULL DEFAULT '1',                       # 是否减库存
  minimum int(11) NOT NULL DEFAULT '1',                       # 最小订购量
  sort_order int(11) NOT NULL DEFAULT '0',                    # 排序
  status int(1) NOT NULL DEFAULT '0',                         # 状态
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  viewed int(5) NOT NULL DEFAULT '0',                         # 评论数

  # 新增字段
  gid int(11) not null default 0 ,                            # 产品分组
  unit_type varchar(20) not null default 'piece',             # 产品计量单位
  sell_type ENUM('piece','lots') default "piece",             # 销售方式 计件还是打包
  sell_lots_num int(11) not null default 1,                   # 打包销售 每包多少件
  wholesale_price   decimal(15,4) not null default 0.0        # 批发价
  wholesale_num   int(11) not null default 0                  # 批发价最小起订量
  wholesale_support  int(1) not null default 0,               # 是否支持批发价 1 支持 0 不支持 
  sell_param text NULL                                        # 销售选项 可以选择样式 颜色等选项 json格式

  # ######

  PRIMARY KEY (product_id),
  KEY cid (cid),
  KEY date_modified (date_modified)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品重要信息历史表
DROP TABLE IF EXISTS to_product_history;
CREATE TABLE to_product_history (
  product_history_id int(11) NOT NULL AUTO_INCREMENT,                 # 产品历史ID
  cid int not null default 0,                                         # 公司ID
  product_id int not null default 0,                                  # 产品ID
  addtime timestamp default current_timestamp,                        # 记录添加时间
  columns varchar(256) COLLATE utf8_bin NOT NULL default '',          # 修改字段名称，逗号隔开（目前记录名称，价格，产品描述）
  description text COLLATE utf8_bin NOT NULL default '',              # 修改后的详细信息
  columnvalue text COLLATE utf8_bin NOT NULL default '',              # 修改后的其他值(json)
  PRIMARY KEY (product_history_id),
  KEY product_id (product_id),
  KEY addtime (addtime),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品价格表
DROP TABLE IF EXISTS to_product_price;
CREATE TABLE to_product_price (
  product_price_id int(11) NOT NULL AUTO_INCREMENT,                   # 产品价格ID
  cid int not null default 0,                                         # 公司ID
  product_id int not null default 0,                                  # 产品ID
  start_num int not null default 0,                                   # 起始采购量
  end_num int not null default 0,                                     # 截止采购量
  price decimal(15,4) NOT NULL DEFAULT '0.0000',                      # 价格
  discount_price decimal(15,4) NOT NULL DEFAULT '0.0000',             # 折扣价格
  PRIMARY KEY (product_price_id),
  KEY product_id (product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品英文语言表 单独拿出来，方便全文检索
DROP TABLE IF EXISTS to_product_en_description;
CREATE TABLE to_product_en_description (
  product_id int(11) NOT NULL AUTO_INCREMENT,                         # 产品ID
  cid int not null default 0,                                         # 公司ID
  name varchar(255) COLLATE utf8_bin NOT NULL default '',             # 产品名称
  description text COLLATE utf8_bin NOT NULL default '',              # 产品说明
  unit varchar(64) COLLATE utf8_bin NOT NULL default '',              # 产品单位
  meta_description varchar(255) COLLATE utf8_bin NOT NULL default '', # 产品meta说明
  meta_keyword varchar(255) COLLATE utf8_bin NOT NULL default '',     # 产品meta关键词
  uptime timestamp default current_timestamp,                         # 更新时间
  autotran tinyint not null default 0,                                # 是否自动翻译 0是，1手工
  PRIMARY KEY (product_id),
  FULLTEXT (name, meta_description,meta_keyword),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品语言表
DROP TABLE IF EXISTS to_product_description;
CREATE TABLE to_product_description (
  product_id int(11) NOT NULL AUTO_INCREMENT,                         # 产品ID
  cid int not null default 0,                                         # 公司ID
  language_id int(11) NOT NULL default 0,                             # 语言ID
  name varchar(255) COLLATE utf8_bin NOT NULL default '',             # 产品名称
  description text COLLATE utf8_bin NOT NULL default '',              # 产品说明
  unit varchar(64) COLLATE utf8_bin NOT NULL default '',              # 产品单位
  meta_description varchar(255) COLLATE utf8_bin NOT NULL default '', # 产品meta说明
  meta_keyword varchar(255) COLLATE utf8_bin NOT NULL default '',     # 产品meta关键词
  uptime timestamp default current_timestamp,                         # 更新时间
  autotran tinyint not null default 0,                                # 是否自动翻译 0是，1手工
  PRIMARY KEY (product_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品属性表
drop table if exists to_product_detail_description;
create table to_product_detail_description
(
  pdid int not null default 0,                        # 产品属性id
  product_id int not null default 0,                  # 产品id
  name varchar(100) not null default '',              # 属性名称
  value varchar(100) not null default '',             # 属性值
  uptime timestamp default current_timestamp,         # 更新时间
  autotran tinyint not null default 0,                # 是否自动翻译 0是，1手工
  language_id tinyint not null default 0,             # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko

  UNIQUE pdid_tranlan (pdid, language_id)
) engine=MyISAM default charset=utf8;

# 产品折扣表
DROP TABLE IF EXISTS to_product_discount;
CREATE TABLE to_product_discount (
  product_discount_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                             # 公司ID
  product_id int(11) NOT NULL default 0,                  # 产品ID
  customer_group_id int(11) NOT NULL default 0,           # 客户组
  quantity int(4) NOT NULL DEFAULT '0',                   # 数量
  priority int(5) NOT NULL DEFAULT '1',                   # 优先级
  price decimal(15,4) NOT NULL DEFAULT '0.0000',          # 价格
  date_start date NOT NULL DEFAULT '0000-00-00',          # 起始时间
  date_end date NOT NULL DEFAULT '0000-00-00',            # 终止时间
  PRIMARY KEY (product_discount_id),
  KEY product_id (product_id),
  KEY customer_group_id (customer_group_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 组合促销表
drop table if exists to_combination_discount;
create table to_combination_discount
(
  combination_discount_id int(11) NOT NULL AUTO_INCREMENT, # 组合促销ID
  cid int not null default 0,                              # 公司ID
  name varchar(100) not null default '',                   # 促销名称
  addtime timestamp default current_timestamp,             # 添加时间
  uptime date NOT NULL DEFAULT '0000-00-00',               # 更新时间
  status tinyint not null default 0,                       # 促销状态 0,正常，1停止

  PRIMARY KEY (combination_discount_id),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 组合促销项表
DROP TABLE IF EXISTS to_combination_discount_product;
CREATE TABLE to_combination_discount_product (
  combination_discount_id int not null default 0,          # 促销ID
  product_id int(11) NOT NULL default 0,                   # 捆绑产品ID
  combination_product_id int(11) NOT NULL default 0,       # 促销产品ID
  cid int not null default 0,                              # 公司ID
  price decimal(15,4) NOT NULL DEFAULT '0.0000',           # 价格
  quantity int(4) NOT NULL DEFAULT '0',                    # 数量
  date_start date NOT NULL DEFAULT '0000-00-00',           # 起始时间
  date_end date NOT NULL DEFAULT '0000-00-00',             # 终止时间
  status tinyint not null default 0,                       # 促销状态 0,正常，1停止

  UNIQUE combination_discount_product_id (combination_discount_id,product_id,combination_product_id),
  KEY date_start (date_start),
  KEY date_end (date_end),
  KEY price (price),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品图片表
DROP TABLE IF EXISTS to_product_image;
CREATE TABLE to_product_image (
  product_image_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                  # 公司ID
  product_id int(11) NOT NULL default 0,                       # 产品ID
  image varchar(255) COLLATE utf8_bin DEFAULT NULL default '', # 图片路经
  PRIMARY KEY (product_image_id),
  KEY product_id (product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 选项表
DROP TABLE IF EXISTS to_option;
CREATE TABLE to_option (
  option_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                            # 公司ID
  type varchar(32) COLLATE utf8_bin NOT NULL default '', # 选项类型。比如radio,checkbox,select等
  sort_order int(3) NOT NULL default 0,                  # 排序
  PRIMARY KEY (option_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 选项语言表
DROP TABLE IF EXISTS to_option_description;
CREATE TABLE to_option_description (
  option_id int(11) NOT NULL default 0,                   # 选项ID
  cid int not null default 0,                             # 公司ID
  language_id int(11) NOT NULL default 0,                 # 语言ID
  name varchar(128) COLLATE utf8_bin NOT NULL default '', # 选项名称
  autotran tinyint not null default 0,                    # 是否自动翻译 0是，1手工
  PRIMARY KEY (option_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 选项值表
DROP TABLE IF EXISTS to_option_value;
CREATE TABLE to_option_value (
  option_value_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                     # 公司ID
  category_id int(11) NOT NULL default 0,         # 分类ID
  option_id int(11) NOT NULL default 0,           # 选项ID
  sort_order int(3) NOT NULL default 0,           # 排序
  PRIMARY KEY (option_value_id),
  KEY option_id (option_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 选项值语言表
DROP TABLE IF EXISTS to_option_value_description;
CREATE TABLE to_option_value_description (
  option_value_id int(11) NOT NULL default 0,
  cid int not null default 0,                               # 公司ID
  language_id int(11) NOT NULL default 0,                   # 语言ID
  option_id int(11) NOT NULL default 0,                     # 选项ID
  name varchar(128) COLLATE utf8_bin NOT NULL default '',   # 选项值，比如代表颜色的红色，白色等
  autotran tinyint not null default 0,                      # 是否自动翻译 0是，1手工
  PRIMARY KEY (option_value_id,language_id),
  KEY option_id (option_id),
  KEY cid (cid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品选项表
DROP TABLE IF EXISTS to_product_option;
CREATE TABLE to_product_option (
  product_option_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                             # 公司ID
  product_id int(11) NOT NULL default 0,                  # 产品ID
  option_id int(11) NOT NULL default 0,                   # 选项ID
  option_value text COLLATE utf8_bin NOT NULL default '', # 选项值(对于选项是单个值的情况)
  required int(1) NOT NULL default 0,                     # 是否必须的
  PRIMARY KEY (product_option_id),
  KEY option_id (option_id),
  KEY product_id (product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品选项值表
DROP TABLE IF EXISTS to_product_option_value;
CREATE TABLE to_product_option_value (
  product_option_value_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                    # 公司ID
  product_option_id int(11) NOT NULL default 0,                  # 产品选项ID
  product_id int(11) NOT NULL default 0,                         # 产品ID
  option_id int(11) NOT NULL default 0,                          # 选项ID
  option_value_id int(11) NOT NULL default 0,                    # 选项值ID
  quantity int(3) NOT NULL default 0,                            # 数量
  subtract int(1) NOT NULL default 0,                            # 是否减库存
  price decimal(15,4) NOT NULL default 0,                        # 价格 单独价格表
  price_prefix varchar(1) COLLATE utf8_bin NOT NULL default '',  # option价格处理，+加价,-减价
  points int(8) NOT NULL default 0,                              # 积分
  points_prefix varchar(1) COLLATE utf8_bin NOT NULL default '', # option积分处理，+加,-减
  weight decimal(15,8) NOT NULL default 0,                       # 重量
  weight_prefix varchar(1) COLLATE utf8_bin NOT NULL default '', # option重量处理，+加,-减
  PRIMARY KEY (product_option_value_id),
  KEY cid (cid),
  KEY product_id (product_id),
  KEY product_option_id (product_option_id),
  KEY option_id (option_id),
  KEY option_value_id (option_value_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品分类
DROP TABLE IF EXISTS to_product_to_category;
CREATE TABLE to_product_to_category (
  product_id int(11) NOT NULL default 0,
  category_id int(11) NOT NULL default 0,
  PRIMARY KEY (product_id,category_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单表
DROP TABLE IF EXISTS to_s_order;
CREATE TABLE to_s_order (
  order_id int not null default 0,
  cid int not null default 0,                                             # 公司ID
  customer_id int(11) NOT NULL DEFAULT '0',                               # 客户ID
  order_status_id int(11) NOT NULL DEFAULT '0',                           # 订单状态 （卖家可操作订单状态：缺货取消、确认订单、已发货、退款）
  commission decimal(15,4) NOT NULL default 0,                            # 佣金
  confirm_date datetime NOT NULL default '0000-00-00 00:00:00',           # 确认日期
  ship_date datetime NOT NULL default '0000-00-00 00:00:00',              # 发货时间
  close_date datetime NOT NULL default '0000-00-00 00:00:00',             # 订单结束日期
  refund_date datetime NOT NULL default '0000-00-00 00:00:00',            # 退款时间
  transportno varchar(500) not null default '',                           # 运单号
  comment text COLLATE utf8_bin NOT NULL default '',                      # 卖家备注
  
  PRIMARY KEY (order_id),
  KEY cid (cid),
  KEY customer_id (customer_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货操作
DROP TABLE IF EXISTS to_return_action;
CREATE TABLE to_return_action (
  return_action_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT '0',
  cid int not null default 0,                               # 公司ID
  name varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',    # 退货操作名称
  PRIMARY KEY (return_action_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货原因
DROP TABLE IF EXISTS to_return_reason;
CREATE TABLE to_return_reason (
  return_reason_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT '0',
  cid int not null default 0,                               # 公司ID
  name varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',   # 退货原因名称
  PRIMARY KEY (return_reason_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货状态
DROP TABLE IF EXISTS to_return_status;
CREATE TABLE to_return_status (
  return_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT '0',
  cid int not null default 0,                               # 公司ID
  name varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',    # 退货状态名称
  PRIMARY KEY (return_status_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 系统配置信息表
DROP TABLE IF EXISTS to_setting;
CREATE TABLE to_setting (
  setting_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                             # 公司ID
  groups varchar(32) COLLATE utf8_bin NOT NULL default '',# 配置信息分组(可以是模块),比如account,bestseller等
  skey varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',  # key
  value text COLLATE utf8_bin NOT NULL default '',        # value
  PRIMARY KEY (setting_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 后台用户
DROP TABLE IF EXISTS to_user;
CREATE TABLE to_user (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  user_group_id int(11) NOT NULL default 0,
  cid int not null default 0,                                 # 公司ID
  username varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',  # 用户登录名
  password varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',  # 用户密码
  firstname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  lastname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  email varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',     # 用户email
  code varchar(32) COLLATE utf8_bin NOT NULL default '',      # ?
  ip varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',        # ?
  status int(1) NOT NULL default 0,
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (user_id),
  KEY user_group_id (user_group_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 用户登录日志表
DROP TABLE IF EXISTS to_user_loginlog;
CREATE TABLE to_user_loginlog (
  user_login_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(11) NOT NULL default 0,                          # 买家ID
  ip varchar(15) COLLATE utf8_bin NOT NULL default '',         # 登录ip
  login_date datetime NOT NULL default '0000-00-00 00:00:00',  # 登录时间
  logout_date datetime NOT NULL default '0000-00-00 00:00:00', # 退出时间
  cid int not null default 0,                                  # 公司ID
  PRIMARY KEY (user_login_id),
  KEY user_id (user_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 后台用户组
DROP TABLE IF EXISTS to_user_group;
CREATE TABLE to_user_group (
  user_group_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                             # 公司ID
  name varchar(64) COLLATE utf8_bin NOT NULL default '',  # 用户组名
  permission text COLLATE utf8_bin NOT NULL default '',   # 用户权限,php序列化数组
  PRIMARY KEY (user_group_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 长度类
DROP TABLE IF EXISTS to_length_class;
CREATE TABLE to_length_class (
  length_class_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  value decimal(15,8) NOT NULL default 0,                    # 默认长度值
  PRIMARY KEY (length_class_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 长度语言说明
DROP TABLE IF EXISTS to_length_class_description;
CREATE TABLE to_length_class_description (
  length_class_id int(11) NOT NULL AUTO_INCREMENT,            # 长度ID
  cid int not null default 0,                                 # 公司ID
  language_id int(11) NOT NULL default 0,                     # 语言ID
  title varchar(32) COLLATE utf8_bin NOT NULL default '',     # 长度标题
  unit varchar(4) COLLATE utf8_bin NOT NULL default '',       # 长度单位
  autotran tinyint not null default 0,                        # 是否自动翻译 0是，1手工
  PRIMARY KEY (length_class_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 单位表
DROP TABLE IF EXISTS to_unit_class_description;
CREATE TABLE to_unit_class_description (
  unit_class_id int(11) NOT NULL AUTO_INCREMENT,              # 单位ID
  cid int not null default 0,                                 # 公司ID
  language_id int(11) NOT NULL default 0,                     # 语言ID
  title varchar(32) COLLATE utf8_bin NOT NULL default '',     # 单位标题
  unit varchar(4) COLLATE utf8_bin NOT NULL default '',       # 单位
  autotran tinyint not null default 0,                        # 是否自动翻译 0是，1手工
  PRIMARY KEY (unit_class_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 重量类
DROP TABLE IF EXISTS to_weight_class;
CREATE TABLE to_weight_class (
  weight_class_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  value decimal(15,8) NOT NULL DEFAULT '0.00000000',          # 默认重量值
  PRIMARY KEY (weight_class_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 重量语言说明
DROP TABLE IF EXISTS to_weight_class_description;
CREATE TABLE to_weight_class_description (
  weight_class_id int(11) NOT NULL AUTO_INCREMENT,            # 重量ID
  cid int not null default 0,                                 # 公司ID
  language_id int(11) NOT NULL default 0,                     # 语言ID
  title varchar(32) COLLATE utf8_bin NOT NULL default '',     # 重量标题
  unit varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '',       # 重量单位
  autotran tinyint not null default 0,                        # 是否自动翻译 0是，1手工
  PRIMARY KEY (weight_class_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单状态表
DROP TABLE IF EXISTS to_order_status;
CREATE TABLE to_order_status (
  order_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL default 0,
  cid int not null default 0,                                 # 公司ID
  name varchar(32) COLLATE utf8_bin NOT NULL default '',      # 订单状态名称
  PRIMARY KEY (order_status_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 库存状况表
DROP TABLE IF EXISTS to_stock_status;
CREATE TABLE to_stock_status (
  stock_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL default 0,
  cid int not null default 0,                                 # 公司ID
  name varchar(32) COLLATE utf8_bin NOT NULL default '',      # 库存状态名称
  PRIMARY KEY (stock_status_id,language_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 国家表 关联出一个国家 cid 关联表？
DROP TABLE IF EXISTS to_country;
CREATE TABLE to_country (
  country_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  countrycode int not null default 0,                         # 国家code
  name varchar(128) COLLATE utf8_bin NOT NULL default '',     # 国家名称
  iso_code_2 varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '', # 国家2字母编号
  iso_code_3 varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '', # 国家3字母编号
  address_format text COLLATE utf8_bin NOT NULL default '',   # 国家地址格式
  postcode_required int(1) NOT NULL default 0,                # 是否必须要邮编
  status int(1) NOT NULL DEFAULT '1',                         # 是否有效
  PRIMARY KEY (country_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 公司、生产、OEM、R&D图片信息表
drop table if exists to_pictures;
create table to_pictures  (
  picid int not null auto_increment,                 # 图片id
  cid int not null default 0,                        # 公司id
  picpath varchar(256) not null default '',          # 图片地址
  isused tinyint not null default 1,                 # 0未使用，1已经使用
  addtime timestamp default current_timestamp,       # 增加时间
  primary key (picid),
  KEY addtime (addtime),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 公司、生产、OEM、R&D图片信息翻译表
drop table if exists to_picture_description;
create table to_picture_description  (
  picid int not null default 0,                      # 图片id
  cid int not null default 0,                        # 公司id
  title varchar(128) not null default '',            # 图片标题
  picturedesc varchar(512) not null default '',      # 图片详情
  uptime timestamp default current_timestamp,        # 增加时间
  autotran tinyint not null default 0,               # 是否自动翻译 0是，1手工
  language_id tinyint not null default 0,            # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko
  UNIQUE picid_tranlan (picid, language_id),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 图片关系表
drop table if exists to_picture_associate;
create table to_picture_associate  (
  picid int not null default 0,                      # 图片id
  sid int not null default 0,                        # 需关联业务id type为0 1 2 3时，此id为公司id，4为产品id，5为证书id
  sort tinyint not null default 0,                   # 图片排序
  type tinyint not null default 0,                   # 图片类型 0公司，1生产线，2 OEM，3 R&D，4产品，5，QC证书图片，6,新闻
  primary key (picid,sid,type)
) engine=MyISAM default charset=utf8;

# QC证书管理表
drop table if exists to_qc_certificates;
create table to_qc_certificates  (
  qid int not null auto_increment,                   # 证书id
  cid int not null default 0,                        # 公司id
  addtime timestamp default current_timestamp,       # 增加时间
  standard varchar(128) not null default '',         # 证书类型
  number varchar(128) not null default '',           # 证书号码
  issuedate varchar(128) not null default '',        # 发证日期
  expiredate varchar(128) not null default '',       # 失效日期
  scope varchar(128) not null default '',            # 证书范围
  issuedby varchar(256) not null default '',         # 发证机关
  sort tinyint not null default 0,                   # 证书排序
  primary key (qid),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 分支机构联系信息表
drop table if exists to_contacts;
create table to_contacts  (
  ctid int not null auto_increment,                  # 用户ID
  cid int not null default 0,                        # 公司id
  tel varchar(1024) not null default '',             # 工作电话
  fax varchar(1024) not null default '',             # 传真
  email varchar(1024) not null default '',           # 电子邮件，多个,号隔开 第一个为默认显示的email
  contperson varchar(500) not null default '',       # 联系人
  status tinyint not null default 0,                 # 分支状态 0有效，1删除
  sort tinyint not null default 0,                   # 分支排序
  primary key (ctid),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 分支机构联系信息翻译表
drop table if exists to_contact_description;
create table to_contact_description  (
  contactid int not null default 0,                  # 机构id
  cid int not null default 0,                        # 公司ID
  name varchar(256) not null default '',             # 分支名称
  addr varchar(256) not null default '',             # 分支地址
  uptime timestamp default current_timestamp,        # 更新时间
  language_id tinyint not null default 0,            # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko
  UNIQUE contactid_tranlan (contactid, language_id),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 分支机构联系信息表
drop table if exists to_contact_persons;
create table to_contact_persons  (
  cpid int not null auto_increment,                  # 联系人ID
  cid int not null default 0,                        # 公司id
  contactid int not null default 0,                  # 机构id
  contperson varchar(500) not null default '',       # 联系人
  job varchar(500) not null default '',              # 联系人
  tel varchar(1024) not null default '',             # 工作电话
  email varchar(1024) not null default '',           # 电子邮件，多个,号隔开 第一个为默认显示的email
  msn varchar(1024) not null default '',             # 各页面显示的msn联系方式
  skype varchar(1024) not null default '',           # 各页面显示的skype联系方式
  yahoo varchar(1024) not null default '',           # 各页面显示的yahoo联系方式
  gender tinyint(1) not null default 0,              # 性别 0 ，女性； 1，男性
  uptime timestamp not null default current_timestamp, # 添加时间
  status tinyint not null default 0,                 # 分支状态 0有效，1删除
  sort tinyint not null default 0,                   # 分支排序
  primary key (cpid),
  KEY cid (cid),
  KEY contactid (contactid)
) engine=MyISAM default charset=utf8;

# 赠言表
drop table if exists to_leavewords;
create table to_leavewords
(
  lid int not null auto_increment,                    # 赠言ID
  cid int not null default 0,                         # 公司ID
  addtime timestamp not null default current_timestamp, # 添加时间
  sort tinyint not null default 0,                    # 赠言排序
  status tinyint(1) not null default 0,               # 删除标志 0正常，1删除

  primary key (lid),
  KEY cid (cid)
) engine=MyISAM default charset=utf8;

# 赠言翻译表
drop table if exists to_leaveword_description;
create table to_leaveword_description
(
  lid int not null default 0,                         # 赠言ID
  cid int not null default 0,                         # 公司ID
  name varchar(100) not null default '',              # 客户姓名
  content varchar(1024) not null default '',          # 赠言内容
  uptime timestamp not null default current_timestamp, # 添加时间
  language_id tinyint not null default 0,             # 翻译语言 0,fr 1,de 2,it 3,ru 4,es 5,pt 6,nl 7,el 8,ja 9,ko

  UNIQUE lid_tranlan (lid, language_id),
  Key cid (cid)
) engine=MyISAM default charset=utf8;

# 买家保护
DROP TABLE IF EXISTS to_customer_protect;
CREATE TABLE to_customer_protect (
  customer_protect_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                   # 公司ID
  order_id int(11) NOT NULL default 0,                          # 订单ID
  customer_id int(11) NOT NULL default 0,                       # 客户ID
  text text COLLATE utf8_bin NOT NULL default '',               # 保护原因
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (customer_protect_id),
  KEY order_id (order_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户组表
DROP TABLE IF EXISTS to_customer_group;
CREATE TABLE to_customer_group (
  customer_group_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  name varchar(32) COLLATE utf8_bin NOT NULL default '',      # 客户组名称
  PRIMARY KEY (customer_group_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# ip和host列表，方便管理
drop table if exists to_ip_vhost;
create table to_ip_vhost (
  ip varchar(15) not null default '',               # 来源IP
  vhost varchar(20) not null default '',            # 公司服务器名称
  primary key (ip)
) engine=MyISAM default charset=utf8;

# best selling
DROP TABLE IF EXISTS to_bestselling_description;
CREATE TABLE to_bestselling_description (
  product_id int(11) NOT NULL default 0,                         # 产品ID
  cid int not null default 0,                                    # 公司ID
  language_id int(11) NOT NULL default 0,                        # 语言ID
  secondname varchar(255) COLLATE utf8_bin NOT NULL default '',  # 产品副标题
  autotran tinyint not null default 0,                           # 是否自动翻译 0是，1手工
  type tinyint not null default 0,                               # cms类型 0,bestselling 1,bestmargin
  sort tinyint not null default 0,                               # 排序
  PRIMARY KEY (product_id,language_id,type),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 首页分类推荐
DROP TABLE IF EXISTS to_index_category_description;
CREATE TABLE to_index_category_description (
  indexcategory_id int(11) NOT NULL AUTO_INCREMENT,              # 自增ID
  product_id int(11) NOT NULL default 0,                         # 产品ID或分类id
  parent_id int(11) NOT NULL default 0,                          # 父级分类ID
  cid int not null default 0,                                    # 公司ID
  language_id int(11) NOT NULL default 0,                        # 语言ID
  secondname varchar(255) COLLATE utf8_bin NOT NULL default '',  # 产品副标题
  autotran tinyint not null default 0,                           # 是否自动翻译 0是，1手工
  PRIMARY KEY (indexcategory_id),
  KEY cid (cid),
  KEY parent_id (parent_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#表的结构 sessions
drop table if exists sessions;
create table sessions
(
  id char(32) primary key,
  expire integer,
  data text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

# 翻译域名
drop table if exists tran_domain;
create table tran_domain (
  id int not null auto_increment,                    # 记录ID
  cid int not null default 0,                        # 公司id
  domain varchar(1024),                              # 公司域名
  status tinyint not null default 0,                 # 域名状态，0,ok，1封停，2其他原因停止
  times int not null default 0,                      # 封停次数
  addtime timestamp default current_timestamp,       # 添加时间
  uptime datetime default '2009-01-01 00:00:00',     # 修改时间
  primary key (id),
  index times (times),
  index cid (cid)
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

# 国外库

# 客户地址信息
DROP TABLE IF EXISTS to_address;
CREATE TABLE to_address (
  address_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                  # 公司ID
  customer_id int(11) NOT NULL default 0,
  firstname varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  lastname varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  gender varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',    # 称谓 mr ms mrs miss
  company varchar(512) COLLATE utf8_bin NOT NULL default '',
  address_1 varchar(512) COLLATE utf8_bin NOT NULL default '',
  address_2 varchar(512) COLLATE utf8_bin NOT NULL default '',
  city varchar(128) COLLATE utf8_bin NOT NULL default '',
  province varchar(128) COLLATE utf8_bin NOT NULL default '',
  postcode varchar(10) COLLATE utf8_bin NOT NULL default '',
  telephone varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '', # 电话
  status int(1) NOT NULL default 0,                           # 客户状态
  country_id int(11) NOT NULL DEFAULT '0',
  zone_id int(11) NOT NULL DEFAULT '0',
  type int(1) NOT NULL default 0,                             # 地址类型 0,客户地址 1,billing地址
  PRIMARY KEY (address_id),
  KEY customer_id (customer_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户表
DROP TABLE IF EXISTS to_customer;
CREATE TABLE to_customer (
  customer_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                 # 公司ID
  firstname varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',# firstname
  lastname varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '', # lastname
  gender varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',    # 称谓 mr ms mrs miss
  email varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',    # email(作为登录帐号)
  edmemail varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '', # email(作为联系邮箱)
  companyname varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',# 公司名称
  telephone varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '', # 电话
  fax varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',       # fax
  country_id int(11) NOT NULL DEFAULT '0',                    # 国家ID
  password varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',  # 客户密码
  cart text COLLATE utf8_bin not null default '',             # 购物车内容
  wishlist text COLLATE utf8_bin not null default '',         # 收藏列表
  newsletter int(1) NOT NULL DEFAULT '0',                     # 是否通讯
  address_id int(11) NOT NULL DEFAULT '0',                    # 客户地址ID
  customer_group_id int(11) NOT NULL default 0,               # 客户组ID
  ip varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '0',       # 客户上次登录IP
  status int(1) NOT NULL default 0,                           # 客户状态
  approved int(1) NOT NULL default 0,                         # 是否同意过
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (customer_id),
  KEY customer_group_id (customer_group_id),
  KEY address_id (address_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户登录日志表
DROP TABLE IF EXISTS to_customer_loginlog;
CREATE TABLE to_customer_loginlog (
  customer_login_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL default 0,                      # 买家ID
  ip varchar(15) COLLATE utf8_bin NOT NULL default '',         # 登录ip
  login_date datetime NOT NULL default '0000-00-00 00:00:00',  # 登录时间
  logout_date datetime NOT NULL default '0000-00-00 00:00:00', # 退出时间
  cid int not null default 0,                                  # 公司ID
  PRIMARY KEY (customer_login_id),
  KEY customer_id (customer_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户IP表
DROP TABLE IF EXISTS to_customer_ip;
CREATE TABLE to_customer_ip (
  customer_ip_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL default 0,
  ip varchar(15) COLLATE utf8_bin NOT NULL default '',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  cid int not null default 0,                           # 公司ID
  PRIMARY KEY (customer_ip_id),
  KEY ip (ip),
  KEY customer_id (customer_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户奖励表
DROP TABLE IF EXISTS to_customer_reward;
CREATE TABLE to_customer_reward (
  customer_reward_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL DEFAULT '0',
  cid int not null default 0,                           # 公司ID
  order_id int(11) NOT NULL DEFAULT '0',
  description text COLLATE utf8_bin NOT NULL default '',
  points int(8) NOT NULL DEFAULT '0',
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (customer_reward_id),
  KEY customer_id (customer_id),
  KEY cid (cid),
  KEY order_id (order_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 客户交易表
DROP TABLE IF EXISTS to_customer_transaction;
CREATE TABLE to_customer_transaction (
  customer_transaction_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL default 0,
  cid int not null default 0,                           # 公司ID
  order_id int(11) NOT NULL default 0,
  description text COLLATE utf8_bin NOT NULL default '',
  amount decimal(15,4) NOT NULL default 0,
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (customer_transaction_id),
  KEY customer_id (customer_id),
  KEY cid (cid),
  KEY order_id (order_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


# 订单表
DROP TABLE IF EXISTS to_b_order;
CREATE TABLE to_b_order (
  order_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                             # 公司ID
  customer_id int(11) NOT NULL DEFAULT '0',                               # 客户ID
  customer_group_id int(11) NOT NULL DEFAULT '0',                         # 客户所在组ID
  firstname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',             # 客户名称
  lastname varchar(32) COLLATE utf8_bin NOT NULL default '',              # 客户名称
  email varchar(96) COLLATE utf8_bin NOT NULL default '',                 # 客户email
  telephone varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',             # 客户电话
  fax varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',                   # 客户传真
  shipping_firstname varchar(32) COLLATE utf8_bin NOT NULL default '',    # 收货人名称
  shipping_lastname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',     # 收货人名称
  shipping_company varchar(32) COLLATE utf8_bin NOT NULL default '',      # 收货人公司
  shipping_address_1 varchar(128) COLLATE utf8_bin NOT NULL default '',   # 收货人地址1
  shipping_address_2 varchar(128) COLLATE utf8_bin NOT NULL default '',   # 收货人地址2
  shipping_city varchar(128) COLLATE utf8_bin NOT NULL default '',        # 收货人城市
  shipping_postcode varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',     # 收货人邮编
  shipping_country varchar(128) COLLATE utf8_bin NOT NULL default '',     # 收货人国家
  shipping_country_id int(11) NOT NULL default 0,                         # 收货人国家编码
  shipping_zone varchar(128) COLLATE utf8_bin NOT NULL default '',        # 收货人地区 (不需要？)
  shipping_zone_id int(11) NOT NULL default 0,                            # 收货人地区ID （不需要？）
  shipping_address_format text COLLATE utf8_bin NOT NULL default '',      # 收货人地址组合
  shipping_method varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',      # 物流类型
  payment_firstname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',     # 付款人姓名
  payment_lastname varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',      # 付款人姓名
  payment_company varchar(32) COLLATE utf8_bin NOT NULL default '',       # 付款人公司
  payment_address_1 varchar(128) COLLATE utf8_bin NOT NULL default '',    # 付款人地址1
  payment_address_2 varchar(128) COLLATE utf8_bin NOT NULL default '',    # 付款人地址2
  payment_city varchar(128) COLLATE utf8_bin NOT NULL default '',         # 付款人城市
  payment_postcode varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',      # 付款人邮编
  payment_country varchar(128) COLLATE utf8_bin NOT NULL default '',      # 付款人国家
  payment_country_id int(11) NOT NULL default 0,                          # 付款人国家ID
  payment_zone varchar(128) COLLATE utf8_bin NOT NULL default '',         # 付款人地区 （不需要？）
  payment_zone_id int(11) NOT NULL default 0,                             # 付款人地区ID （不需要？）
  payment_address_format text COLLATE utf8_bin NOT NULL default '',       # 付款人地址组合
  payment_method varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',       # 付款方式
  comment text COLLATE utf8_bin NOT NULL default '',                      # 买家备注
  total decimal(15,4) NOT NULL DEFAULT '0.0000',                          # 总金额
  reward int(8) NOT NULL default 0,                                       # 返还金额
  order_status_id int(11) NOT NULL DEFAULT '0',                           # 订单状态 （买家可操作订单状态：成单、已付款、取消、确认到货和超时到货、退货）
  commission decimal(15,4) NOT NULL default 0,
  currency_id int(11) NOT NULL default 0,                                 # 货币ID
  currency_code varchar(3) COLLATE utf8_bin NOT NULL default '',          # 货币code
  currency_value decimal(15,8) NOT NULL default 0,                        # 货币值
  submit_date datetime NOT NULL default '0000-00-00 00:00:00',            # 提交时间
  pay_date datetime NOT NULL default '0000-00-00 00:00:00',               # 支付时间
  receive_date datetime NOT NULL default '0000-00-00 00:00:00',           # 到货时间
  date_modified datetime NOT NULL default '0000-00-00 00:00:00',          # 修改时间
  ip varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',                    # 客户IP
  sync_flag int(1) NOT NULL DEFAULT '0',                                  # 同步状态 （0,未同步到国内 1,已同步到国内）
  PRIMARY KEY (order_id),
  KEY customer_id (customer_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单历史表
DROP TABLE IF EXISTS to_order_history;
CREATE TABLE to_order_history (
  order_history_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL default 0,
  order_status_id int(5) NOT NULL default 0,
  cid int not null default 0,                                    # 公司ID
  notify int(1) NOT NULL DEFAULT '0',
  comment text COLLATE utf8_bin NOT NULL default '',
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (order_history_id),
  KEY order_id (order_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单项表
DROP TABLE IF EXISTS to_order_option;
CREATE TABLE to_order_option (
  order_option_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL default 0,
  order_product_id int(11) NOT NULL default 0,
  product_option_id int(11) NOT NULL default 0,
  product_option_value_id int(11) NOT NULL DEFAULT '0',
  name varchar(255) COLLATE utf8_bin NOT NULL default '',
  value text COLLATE utf8_bin NOT NULL default '',
  type varchar(32) COLLATE utf8_bin NOT NULL default '',
  PRIMARY KEY (order_option_id),
  KEY order_id (order_id),
  KEY order_product_id (order_product_id),
  KEY product_option_id (product_option_id),
  KEY product_option_value_id (product_option_value_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单产品表
DROP TABLE IF EXISTS to_order_product;
CREATE TABLE to_order_product (
  order_product_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL default 0,
  product_id int(11) NOT NULL default 0,
  cid int not null default 0,                           # 公司ID
  optionkey varchar(1024) COLLATE utf8_bin NOT NULL default '',
  name varchar(255) COLLATE utf8_bin NOT NULL default '',
  model varchar(24) COLLATE utf8_bin NOT NULL default '',
  quantity int(4) NOT NULL default 0,
  price decimal(15,4) NOT NULL DEFAULT '0.0000',        # 单价
  tax decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (order_product_id),
  KEY order_id (order_id),
  KEY product_id (product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 订单总表
DROP TABLE IF EXISTS to_order_total;
CREATE TABLE to_order_total (
  order_total_id int(10) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL default 0,
  cid int not null default 0,                              # 公司ID
  code varchar(32) COLLATE utf8_bin NOT NULL default '',
  title varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  text varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  value decimal(15,4) NOT NULL DEFAULT '0.0000',
  sort_order int(3) NOT NULL default 0,
  PRIMARY KEY (order_total_id),
  KEY order_id (order_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 产品评论
DROP TABLE IF EXISTS to_review;
CREATE TABLE to_review (
  review_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                   # 公司ID
  product_id int(11) NOT NULL default 0,                        # 产品ID 按type类型 0,为零 1,产品id 2,订单id 3,退货id
  customer_id int(11) NOT NULL default 0,                       # 客户ID
  parent_review_id int(11) NOT NULL default 0,                  # 父提问id
  author varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',      # 作者
  topic varchar(1024) COLLATE utf8_bin NOT NULL DEFAULT '',     # 标题
  text text COLLATE utf8_bin NOT NULL default '',               # 评论正文
  rating int(1) NOT NULL default 0,                             # 评价
  status int(1) NOT NULL DEFAULT '0',                           # 评论状态
  isread int(1) NOT NULL DEFAULT '0',                           # 0，未读 1,已读
  sisread int(1) NOT NULL DEFAULT '0',                          # 0，卖家未读 1,卖家已读
  type int(1) NOT NULL DEFAULT '0',                             # 评论类型 0,系统通知 1,产品评论 2,订单提问 3,退货提问
  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (review_id),
  KEY product_id (product_id),
  KEY cid (cid),
  KEY customer_id (customer_id),
  KEY parent_review_id (parent_review_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 支付记录表
DROP TABLE IF EXISTS to_payment_info;
CREATE TABLE to_payment_info (
  payment_id int(11) NOT NULL AUTO_INCREMENT,
  cid int not null default 0,                                   # 公司ID
  customer_id int(11) NOT NULL default 0,                       # 客户ID
  order_id int(11) NOT NULL default 0,                          # 订单ID
  paytype tinyint not null default 0,                           # 支付类型
  payment_num int(11) NOT NULL default 0,                       # 支付编码
  status int(1) NOT NULL DEFAULT '0',                           # 支付状态
  papal_transaction_code varchar(100) comment '交易号',
  papal_txn_type       varchar(100) comment 'express_checkout
            ',
  papal_transaction_date datetime comment '交易日期',
  papal_parent_txn_id  varchar(100) comment '退款，撤销情况下 原订单的txn_id
            ',
  papal_custom         varchar(255) comment 'buyer_id',
  papal_mc_gross       numeric(10,2) comment '交易之前客户支付的全部金额金额',
  papal_mc_fee         numeric(10,2) comment '交易费',
  papal_mc_currency    varchar(10) comment '币种 US
            ',
  papal_shipping       numeric(10,2) default 0 comment '运费',
  papal_payment_fee    numeric(10,2) comment '（美元特有）如果是美元交易，和mc_gross值相同',
  papal_payment_gross  numeric(10,2) comment '（美元特有）如果是美元交易，和mc_gross值相同',
  papal_payment_status varchar(20) comment 'canceled-reversal：取消撤销撤销的资金返回您
            completed：完成
            Denied：拒绝付款
            Failed：付款失败只有付款来源于客户银行帐户时才发生
            Pending：款项待付
            Refunded：退还付款
            Reversed：撤销资金从帐户扣除返回给买家
            Processed：付款已被接受
            ',
  papal_pending_reason varchar(20) comment 'addressaddress：款项待付，原因是客户未提供已确认的送货地址，而您的收款习惯设定设为允许手动接受或拒绝每笔此类付款。若要更改习惯设定，请前往您的用户信息中的习惯设定部分。
            authorization：您在SetExpressCheckoutRequest上设置了<PaymentAction>Authorization</PaymentAction>，而尚未获取资金。
            echeckecheck：款项待付，原因是其通过电子支票付款，而电子支票尚未结清。
            intl：款项待付，原因是您持有非美国账户，且没有提现机制。您必须在账户信息中手动接受或拒绝该笔付款。(企业帐户)
            multi-cuurency：您在发送的货币中没有余额，并且未将收款习惯设定设为自动兑换和接受付款。您必须手动接受或拒绝该笔付款。(企业帐户)
            unilateral：款项待付，原因是付款的接收电子邮件地址尚未注册或确认。（买家）
            Upgrade：款项待付，原因是其通过信用卡付款，因此您必须将账户升级为企业账户或高级账户状态，方可接收资金。upgrade也可能表示您已达到账户的月交易限额。(企业帐户)
            verify：款项待付，原因是您尚未经过认证。您必须先认证您的账户，才能接受该笔付款。(企业帐户)
            Other：款项待付，原因非以上所列各项。若要了解更多信息，请与贝宝客户服务联系。
            ',
  papal_item_number    varchar(10),
  papal_item_name      varchar(50),
  papal_quantity       numeric(10,2),
  papal_tax            numeric(10,2) comment '税',
  papal_verify_sign    varchar(100) comment 'AR7d6CCBc6pmZcBWVhpYGPIxWhP7A9RPHtIxD8wShRrmhXf5.ZI4CdDp',
  papal_receiver_id    varchar(100),
  papal_payer_id       varchar(100),
  papal_receiver_email varchar(100),
  papal_payer_email    varchar(100),
  papal_payer_status   char(10) comment '是否 verify',
  papal_payer_first_name varchar(50),
  papal_payer_last_name varchar(50),
  papal_payer_residence_country varchar(100),
  papal_protection_eligibility varchar(20) comment 'Eligible',
  papal_payment_type   char(10) comment 'instant,echeck',
  papal_reason_code    varchar(20) comment '只有在payment_status=Reversed或Refunded时，才会设置此变量。
            chargeback：由于客户提出扣款索偿，因此撤销这笔交易。
            guarantee：由于客户触发退款担保，因此撤销这笔交易。
            buyer-complaint：由于客户就交易提出投诉，因此撤销这笔交易。
            refund：由于您向客户退款，因此撤销这笔交易。
            other：由于上述原因以外的其他原因，撤销这笔交易。
            ',

  date_added datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  date_modified datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (payment_id),
  KEY cid (cid),
  KEY customer_id (customer_id),
  KEY order_id (order_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货表
DROP TABLE IF EXISTS to_return;
CREATE TABLE to_return (
  return_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL default 0,
  cid int not null default 0,                           # 公司ID
  date_ordered date NOT NULL default '0000-00-00 00:00:00',
  customer_id int(11) NOT NULL default 0,
  firstname varchar(32) COLLATE utf8_bin NOT NULL default '',
  lastname varchar(32) COLLATE utf8_bin NOT NULL default '',
  email varchar(96) COLLATE utf8_bin NOT NULL default '',
  telephone varchar(32) COLLATE utf8_bin NOT NULL default '',
  return_status_id int(11) NOT NULL default 0,
  comment text COLLATE utf8_bin default '',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  date_modified datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (return_id),
  KEY order_id (order_id),
  KEY cid (cid),
  KEY customer_id (customer_id)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货历史
DROP TABLE IF EXISTS to_return_history;
CREATE TABLE to_return_history (
  return_history_id int(11) NOT NULL AUTO_INCREMENT,
  return_id int(11) NOT NULL default 0,
  cid int not null default 0,                           # 公司ID
  return_status_id int(11) NOT NULL default 0,
  notify int(1) NOT NULL default 0,
  comment text COLLATE utf8_bin NOT NULL default '',
  date_added datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY (return_history_id),
  KEY return_id (return_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

# 退货产品
DROP TABLE IF EXISTS to_return_product;
CREATE TABLE to_return_product (
  return_product_id int(11) NOT NULL AUTO_INCREMENT,
  return_id int(11) NOT NULL default 0,
  product_id int(11) NOT NULL default 0,
  cid int not null default 0,                           # 公司ID
  name varchar(255) COLLATE utf8_bin NOT NULL default '',
  model varchar(64) COLLATE utf8_bin NOT NULL default '',
  quantity int(4) NOT NULL default 0,
  return_reason_id int(11) NOT NULL default 0,
  opened int(1) NOT NULL default 0,
  comment text COLLATE utf8_bin NOT NULL default '',
  return_action_id int(11) NOT NULL default 0,
  description text COLLATE utf8_bin NOT NULL default '', # 产品说明
  description_o text COLLATE utf8_bin NOT NULL default '', # 产品其他说明 json 保存
  PRIMARY KEY (return_product_id),
  KEY return_id (return_id),
  KEY product_id (product_id),
  KEY cid (cid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

#表的结构 sessions
drop table if exists sessions;
create table sessions
(
  id char(32) primary key,
  expire integer,
  data text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


# 初始化数据
# 国家
INSERT INTO `to_country` (`cid`,`countrycode`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1,1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(1,2, 'Albania', 'AL', 'ALB', '', 0, 1),
(1,3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(1,4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(1,5, 'Andorra', 'AD', 'AND', '', 0, 1),
(1,6, 'Angola', 'AO', 'AGO', '', 0, 1),
(1,7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(1,8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(1,9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(1,10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(1,11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(1,12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(1,13, 'Australia', 'AU', 'AUS', '', 0, 1),
(1,14, 'Austria', 'AT', 'AUT', '', 0, 1),
(1,15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(1,16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(1,17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(1,18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(1,19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(1,20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(1,21, 'Belgium', 'BE', 'BEL', '', 0, 1),
(1,22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(1,23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(1,24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(1,25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(1,26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(1,27, 'Bosnia and Herzegowina', 'BA', 'BIH', '', 0, 1),
(1,28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(1,29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(1,30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(1,31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(1,32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(1,33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(1,34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(1,35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(1,36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(1,37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(1,38, 'Canada', 'CA', 'CAN', '', 0, 1),
(1,39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(1,40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(1,41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(1,42, 'Chad', 'TD', 'TCD', '', 0, 1),
(1,43, 'Chile', 'CL', 'CHL', '', 0, 1),
(1,44, 'China', 'CN', 'CHN', '', 0, 1),
(1,45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(1,46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(1,47, 'Colombia', 'CO', 'COL', '', 0, 1),
(1,48, 'Comoros', 'KM', 'COM', '', 0, 1),
(1,49, 'Congo', 'CG', 'COG', '', 0, 1),
(1,50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(1,51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(1,52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(1,53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(1,54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(1,55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(1,56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(1,57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(1,58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(1,59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(1,60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(1,61, 'East Timor', 'TP', 'TMP', '', 0, 1),
(1,62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(1,63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(1,64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(1,65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(1,66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(1,67, 'Estonia', 'EE', 'EST', '', 0, 1),
(1,68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(1,69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(1,70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(1,71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(1,72, 'Finland', 'FI', 'FIN', '', 0, 1),
(1,73, 'France', 'FR', 'FRA', '', 0, 1),
(1,74, 'France, Metropolitan', 'FX', 'FXX', '', 0, 1),
(1,75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(1,76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(1,77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(1,78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(1,79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(1,80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(1,81, 'Germany', 'DE', 'DEU', '', 0, 1),
(1,82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(1,83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(1,84, 'Greece', 'GR', 'GRC', '', 0, 1),
(1,85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(1,86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(1,87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(1,88, 'Guam', 'GU', 'GUM', '', 0, 1),
(1,89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(1,90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(1,91, 'Guinea-bissau', 'GW', 'GNB', '', 0, 1),
(1,92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(1,93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(1,94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(1,95, 'Honduras', 'HN', 'HND', '', 0, 1),
(1,96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(1,97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(1,98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(1,99, 'India', 'IN', 'IND', '', 0, 1),
(1,100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(1,101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(1,102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(1,103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(1,104, 'Israel', 'IL', 'ISR', '', 0, 1),
(1,105, 'Italy', 'IT', 'ITA', '', 0, 1),
(1,106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(1,107, 'Japan', 'JP', 'JPN', '', 0, 1),
(1,108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(1,109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(1,110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(1,111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(1,112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(1,113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(1,114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(1,115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(1,116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(1,117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(1,118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(1,119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(1,120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(1,121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(1,122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(1,123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(1,124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(1,125, 'Macau', 'MO', 'MAC', '', 0, 1),
(1,126, 'Macedonia', 'MK', 'MKD', '', 0, 1),
(1,127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(1,128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(1,129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(1,130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(1,131, 'Mali', 'ML', 'MLI', '', 0, 1),
(1,132, 'Malta', 'MT', 'MLT', '', 0, 1),
(1,133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(1,134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(1,135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(1,136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(1,137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(1,138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(1,139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(1,140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(1,141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(1,142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(1,143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(1,144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(1,145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(1,146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(1,147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(1,148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(1,149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(1,150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(1,151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(1,152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(1,153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(1,154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(1,155, 'Niger', 'NE', 'NER', '', 0, 1),
(1,156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(1,157, 'Niue', 'NU', 'NIU', '', 0, 1),
(1,158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(1,159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(1,160, 'Norway', 'NO', 'NOR', '', 0, 1),
(1,161, 'Oman', 'OM', 'OMN', '', 0, 1),
(1,162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(1,163, 'Palau', 'PW', 'PLW', '', 0, 1),
(1,164, 'Panama', 'PA', 'PAN', '', 0, 1),
(1,165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(1,166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(1,167, 'Peru', 'PE', 'PER', '', 0, 1),
(1,168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(1,169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(1,170, 'Poland', 'PL', 'POL', '', 0, 1),
(1,171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(1,172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(1,173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(1,174, 'Reunion', 'RE', 'REU', '', 0, 1),
(1,175, 'Romania', 'RO', 'ROM', '', 0, 1),
(1,176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(1,177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(1,178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(1,179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(1,180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(1,181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(1,182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(1,183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(1,184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(1,185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(1,186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(1,187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(1,188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(1,189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(1,190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(1,191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(1,192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(1,193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(1,194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(1,195, 'Spain', 'ES', 'ESP', '', 0, 1),
(1,196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(1,197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(1,198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(1,199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(1,200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(1,201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(1,202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(1,203, 'Sweden', 'SE', 'SWE', '', 0, 1),
(1,204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(1,205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(1,206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(1,207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(1,208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(1,209, 'Thailand', 'TH', 'THA', '', 0, 1),
(1,210, 'Togo', 'TG', 'TGO', '', 0, 1),
(1,211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(1,212, 'Tonga', 'TO', 'TON', '', 0, 1),
(1,213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(1,214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(1,215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(1,216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(1,217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(1,218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(1,219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(1,220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(1,221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(1,222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(1,223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(1,224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(1,225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(1,226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(1,227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(1,228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(1,229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(1,230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(1,231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(1,232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(1,233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(1,234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(1,235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(1,236, 'Yugoslavia', 'YU', 'YUG', '', 0, 1),
(1,237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(1,238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(1,239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1);

# 货币表
INSERT INTO `to_currency` (`cid`,`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1,1, 'Pound Sterling', 'GBP', '£', '', '2', 0.60740000, 1, '2011-05-30 23:37:53'),
(1,2, 'US Dollar', 'USD', '$', '', '2', 1.00000000, 1, '2011-05-30 23:37:53'),
(1,3, 'Euro', 'EUR', '', '€', '2', 0.70039999, 1, '2011-05-30 23:37:53');

# 长度类
INSERT INTO `to_length_class` (`cid`,`length_class_id`, `value`) VALUES
(1,1, '1.00000000'),
(1,2, '10.00000000'),
(1,3, '0.39370000');

# 长度描述
INSERT INTO `to_length_class_description` (`cid`,`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1,1, 1, 'Centimeter', 'cm'),
(1,2, 1, 'Millimeter', 'mm'),
(1,3, 1, 'Inch', 'in');

# 订单状态表
INSERT INTO `to_order_status` (`cid`,`order_status_id`, `language_id`, `name`) VALUES
(1,1, 1, 'Pending for Checkout'),
(1,2, 1, 'Paid & Pending for Confirm'),
(1,3, 1, 'Confirmed & Goods Shipping'),
(1,4, 1, 'Shipped & On The Road'),
(1,5, 1, 'Deliveried & Order Closed'),
(1,6, 1, 'Buyer Canceled'),
(1,7, 1, 'Seller Canceled'),
(1,8, 1, 'Refunded'),
(1,9, 1, 'Canceled & Order Closed');
# ? 扣佣金时间

# 重量类
INSERT INTO `to_weight_class` (`cid`,`weight_class_id`, `value`) VALUES
(1,1, '1.00000000'),
(1,2, '1000.00000000'),
(1,5, '2.20460000'),
(1,6, '35.27400000');

# 重量描述
INSERT INTO `to_weight_class_description` (`cid`,`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1,1, 1, 'Kilogram', 'kg'),
(1,2, 1, 'Gram', 'g'),
(1,5, 1, 'Pound ', 'lb'),
(1,6, 1, 'Ounce', 'oz');


