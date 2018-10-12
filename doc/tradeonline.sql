###############################################################
# 贸易通在线交易数据库设计tradeonline_online(国内线上库)
##############################################################

# 汇率表
create table if not exists currencys (
  curdate  date  not null,                          # 更新时间
  currency decimal(10,4) not null,                  # 美元/人民币 汇率 中间价

  PRIMARY KEY (curdate)
) ENGINE=InnoDB default CHARSET=utf8;

# 分类
create table if not exists categorys (
  cateid int not null,                                    # 分类ID
  catecode char(8) not null,                              # 分类编码
  ename varchar(256) not null,                            # 分类英文名称(需要翻译)
  cname varchar(256) not null,                            # 分类中文名称
  level tinyint not null,                                 # 分类级别
  parentid int not null,                                  # 父类ID
  tran_ename text,
                  # 英文名称翻译列表. 0(fr),1(de),2(it),3(ru),4(es),5(pt),6(nl),7(el),8(ja),9(ko),12(ar)
  isshow TINYINT not null default '0',                    # 是否展示
  picpath int not null default '0',                       # 图片ID

  PRIMARY KEY (cateid),
  UNIQUE KEY catecode (catecode),
  KEY parentid (parentid)
) ENGINE=InnoDB default CHARSET=utf8 COMMENT='分类';


# 分类特性表
create table if not exists category_features (
  catefid int not null auto_increment,                     # 分类特性ID
  catecode char(8) not null,                               # 分类编码
  cname varchar(128) not null,                             # 分类特性中文名
  ename varchar(128) not null,                             # 分类特性英文名(需要翻译)
  valuelist text not null,                                 # 分类特性取值列表(需要翻译)，里面包含cname,ename
  tran_ename text,                                         # 英文名称翻译列表. 0(fr),1(de),2(it),3(ru),4(es),5(pt),6(nl),7(el),8(ja),9(ko),12(ar)
  tran_valuelist text,                                     # 取值里面对应ename的翻译列表
  sort tinyint not null default 0,                         # 展示顺序
  type tinyint not null,                                   # 类型：0文本text、1下拉select、2多选checkbox、3标签label、4color、5country
  issku tinyint not null default 0,                        # 是否SKU特性 0(否) 1(是)
  isrequired tinyint not null default 0,                   # 是否必填 0(否) 1(是)

  PRIMARY KEY (catefid),
  KEY catecode (catecode)
) ENGINE=InnoDB default CHARSET=utf8 COMMENT='分类特性表';


# 分类特性值表
create table if not exists category_values (
  catevid int not null auto_increment,                     # 分类特性值ID
  catecode char(8) not null DEFAULT 0,                     # 分类编码
  catefid int not null DEFAULT 0,                          # 分类特性ID

  value varchar(64) not null,                              # 值内容
  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime datetime not null default '1970-01-01 00:00:00',  # 更新时间

  PRIMARY KEY catevid (catevid),
  KEY catefid (catefid)
) ENGINE=InnoDB default CHARSET=utf8 COMMENT='分类特性值表';


# 国家地理分区表 :
create table if not exists geo_zones (
  geoid int not null auto_increment,                      # 地理分区ID
  cname varchar(128) not null default '',                 # 地理中文分区名称
  ename varchar(128) not null default '',                 # 地理分区英文名称
  paypalename varchar(10),                                # paypal地理信息缩写

  PRIMARY KEY (geoid)
) ENGINE=InnoDB default CHARSET=utf8;

# 国家表
create table if not exists countrys (
  country_code int not null default 0,                     # 国家代码
  ename varchar(128) not null default '',                  # 国家名称英文
  cname varchar(128) not null default '',                  # 国家名称中文
  iso_code_2 varchar(2) not null default '',               # 国家2字母编号
  iso_code_3 varchar(3) not null default '',               # 国家3字母编号
  address_format text not null default '',                 # 国家地址格式
  postcode_required tinyint not null default 0,            # 是否必须要邮编
  status tinyint not null default '0',                     # 是否有效
  geoid int not null default 0,                            # 国家地理分区ID

  PRIMARY KEY (country_code),
  INDEX geoid(geoid)
) ENGINE=InnoDB default CHARSET=utf8;

# 全局消息/系统消息
create table if not exists messages (
  id int not null auto_increment,
  title varchar(1024) default '',                      # 主题
  body text default '',                                # 内容
  remark text default '',                              # 备注： 只展示被运营人员
  sort int not null default 0,                         #优先级排序
  type tinyint not null default 0,                     #类型： 0(卖家公告) 1(买家公告)
  status tinyint not null default 0,                   #是否展示： 0(否) 1(是)
  pubtime timestamp not null default '0000-00-00 00:00:00', # 发布日期：默认当天
  addtime timestamp not null default CURRENT_TIMESTAMP,     # 插入时间
  uptime timestamp not null default '0000-00-00 00:00:00',  # 更新时间
  PRIMARY KEY (id)
) ENGINE=InnoDB default CHARSET=utf8;

# Looksaving卖家后台Banner图片: 序号大的排前面
create table if not exists ops_banners (
  id int not null auto_increment,
  link varchar(255) not null default '',                 # banner点击链接
  picpath varchar(255) not null default '',              # banner图片
  type tinyint not null default 0,                       # banner位置 0(中部) 1(右侧) 2(页面中心)
  sort int not null default '0',                         # 排序
  PRIMARY KEY (id)
) ENGINE=InnoDB default CHARSET=utf8;


# 公司简单信息表
create table if not exists companys (
  cid int not null,                                  # 公司id
  name varchar(256) not null default '',             # 公司名称
  domain varchar(200) not null default '',           # 公司域名
  isescrow tinyint not null default 0,               # 是否担保客户 0 (不担保) 1(担保)
  province varchar(100) not null,					 # 省份
  city varchar(100) not null,						 # 城市
  lang varchar(200) not null default '',             # 公司翻译语言，号隔开
  keyword varchar(256) not null default '',          # 公司关键词，号隔开
  logopath varchar(256) not null default '',         # 公司logo图片地址
  tplid tinyint default '0',                         # 使用模板
  tplpath varchar(256) default '',                   # 使用模板路径
  slogan varchar(1024) not null default '',          # 公司标语
  addtime timestamp default '1970-01-01 00:00:00',    # 增加时间
  onlinetime timestamp default '1970-01-01 00:00:00', # 上线时间
  uptime timestamp default current_timestamp,        # 更新时间
  status tinyint not null default 0,                 # 公司状态 0有效，1下线，2删除
  ip varchar(15) not null default '',                # 公司对应ip
  vhost varchar(20) not null default '',             # 公司服务器名称
  facebook varchar(255) not null,                    # facebook url
  twitter varchar(255) not null,                     # twitter url
  linkedin varchar(255) not null,                    # linkedin url
  youtube varchar(255) not null,                     # youtube url
  googleplus varchar(255) not null,                  # googleplus url
  wordpress varchar(255) not null,                   # wordpress url
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因
  isfetch tinyint not null default '0',				 # 是否抓取 0(非抓取) 1(抓取)
  fromurl varchar(512) not null default '',          # 抓取来源url

  primary key (cid),
  KEY addtime (addtime),
  KEY uptime (uptime),
  UNIQUE KEY domain (domain)
) engine=InnoDB default charset=utf8;

# 公司详细信息表：包含联系信息、基本信息、质量、生产线、OEM、R&D、服务、历史、团队
create table if not exists company_infos (
  cid int not null,                                  # 公司id
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
  addr varchar(256) not null default '',             # 公司地址
  factoryaddr varchar(256) not null default '',      # 工厂地址
  marketname varchar(300) not null default '',       # 主要市场
  marketcode varchar(100) not null default '',       #
  busitypename varchar(300) not null default '',     # 企业类型
  busitypecode varchar(100) not null default '',     # 企业类型代码
  brands varchar(256) not null default '',           # 品牌名称
  employeenumber varchar(500) not null default '',   # 员工人数
  annualsales varchar(50) not null default '',       # 销售额
  yearestablished varchar(50) not null default '',   # 公司建立时间
  exportper varchar(250) not null default '',        # 出口比例
  remark text not null default '',                   # 公司简介 introduction
  plineinfo text not null default '',                # 生产线基本简介
  oeminfo text not null default '',                  # OEM简介
  rdinfo text not null default '',                   # R&D简介
  servinfo text not null default '',                 # 公司服务简介
  historyinfo text not null default '',              # 公司历史简介
  teaminfo text not null default '',                 # 公司团队简介
  qcinfo text not null default '',                   # 质量管理简介
  videocode text not null default '',                # 公司视频嵌入代码
  staticcode text not null default '',               # 网站统计代码
  addtime timestamp default '1970-01-01 00:00:00',    # 增加时间
  uptime timestamp default current_timestamp,        # 更新时间
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因

  primary key (cid),
  index addtime (addtime),
  index uptime (uptime)
) engine=InnoDB default charset=utf8;

# 公司简单信息翻译表
create table if not exists company_trans (
  cid int not null,                                  # 公司id
  slogan varchar(1024),                              # 公司标语
  addr varchar(256) not null default '',             # 公司地址
  factoryaddr varchar(256) not null default '',      # 工厂地址
  marketname varchar(300) not null default '',       # 主要市场
  busitypename varchar(300) not null default '',     # 企业类型
  brands varchar(256) not null default '',           # 品牌名称
  remark text not null default '',                   # 公司简介 introduction
  plineinfo text not null default '',                # 生产线基本简介
  oeminfo text not null default '',                  # OEM简介
  rdinfo text not null default '',                   # R&D简介
  servinfo text not null default '',                 # 公司服务简介
  historyinfo text not null default '',              # 公司历史简介
  teaminfo text not null default '',                 # 公司团队简介
  qcinfo text not null default '',                   # 质量管理简介
  uptime timestamp default current_timestamp,        # 更新时间
  autocompanycontact tinyint not null default 0,     # 是否自动翻译. 0(是),1(手工)
  autocompanyadd tinyint not null default 0,         # 是否自动翻译. 0(是),1(手工)
  autoproductline tinyint not null default 0,        # 是否自动翻译. 0(是),1(手工)
  autooem tinyint not null default 0,                # 是否自动翻译. 0(是),1(手工)
  autord tinyint not null default 0,                 # 是否自动翻译. 0(是),1(手工)
  autoservice tinyint not null default 0,            # 是否自动翻译. 0(是),1(手工)
  autohistory tinyint not null default 0,            # 是否自动翻译. 0(是),1(手工)
  autoteam tinyint not null default 0,               # 是否自动翻译. 0(是),1(手工)
  autoqc tinyint not null default 0,                 # 是否自动翻译. 0(是),1(手工)
  tranlan tinyint not null default 0,                # 翻译语言. 0(fr),1(de),2(it),3(ru),4(es),5(pt),6(nl),7(el),8(ja),9(ko),12(ar)

  UNIQUE cid_tranlan (cid, tranlan)
) engine=InnoDB default charset=utf8;

# 公司Paypal账户信息
create table if not exists paypal_accounts (
  cid int not null,                                       # 公司ID
  email varchar(256) not null,                            # 邮箱
  apiusername varchar(256) not null,                      # API账号
  apipassword varchar(256) not null,                      # API密码 des 存储
  apisignature varchar(256) not null,                     # API签名
  idtoken varchar(256) not null,                          # Paypal提供的Identity TOKEN
  pubcert varchar(512) not null,                          # 公有证书路径
  pricert varchar(512) not null,                          # 私有证书路径
  paypalcert varchar(256) not null,                       # Paypal提供的公有证书
  addtime timestamp not null default CURRENT_TIMESTAMP,
  uptime datetime not null,

  PRIMARY KEY (cid)
) ENGINE=InnoDB default CHARSET=utf8;

# 公司PAYPAL快捷支付配置信息
CREATE TABLE IF NOT EXISTS paypal_config_nvp (
  cid int(11) NOT NULL,
  API_USERNAME varchar(1024) default NULL,
  API_PASSWORD varchar(1024) default NULL,
  API_SIGNATURE varchar(1024) default NULL,
  API_ENDPOINT varchar(1024) default NULL,
  SUBJECT varchar(1024) default NULL,
  USE_PROXY varchar(1024) default NULL,
  PROXY_HOST varchar(1024) default NULL,
  PROXY_PORT varchar(1024) default NULL,
  PAYPAL_URL varchar(1024) default NULL,
  VERSION varchar(1024) default NULL,
  ACK_SUCCESS varchar(1024) default NULL,
  ACK_SUCCESS_WITH_WARNING varchar(1024) default NULL,
  addtime timestamp NOT NULL default '0000-00-00 00:00:00',
  uptime timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# 公司PAYPAL标准支付配置信息
CREATE TABLE IF NOT EXISTS paypal_config_wps (
  cid int(11) NOT NULL,
  DEFAULT_DEV_CENTRAL varchar(1024) default NULL,
  DEFAULT_ENV varchar(1024) default NULL,
  DEFAULT_EMAIL_ADDRESS varchar(1024) default NULL,
  DEFAULT_IDENTITY_TOKEN varchar(1024) default NULL,
  DEFAULT_EWP_CERT_PATH varchar(1024) default NULL,
  DEFAULT_EWP_PRIVATE_KEY_PATH varchar(1024) default NULL,
  DEFAULT_EWP_PRIVATE_KEY_PWD varchar(1024) default NULL,
  DEFAULT_CERT_ID varchar(1024) default NULL,
  PAYPAL_CERT_PATH varchar(1024) default NULL,
  BUTTON_IMAGE varchar(500) NOT NULL,
  addtime timestamp NOT NULL default '0000-00-00 00:00:00',
  uptime timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


# QC证书管理表
create table if not exists certificates (
  qid int not null,                                  # 证书id
  cid int not null default 0,                        # 公司id
  addtime timestamp default current_timestamp,       # 增加时间
  standard varchar(128) not null default '',         # 证书类型
  number varchar(128) not null default '',           # 证书号码
  issuedate varchar(128) not null default '',        # 发证日期
  expiredate varchar(128) not null default '',       # 失效日期
  scope varchar(128) not null default '',            # 证书范围
  issuedby varchar(256) not null default '',         # 发证机关
  sort tinyint not null default 0,                   # 证书排序
  status tinyint not null default 0,                 # 状态. 0(有效),1(删除)
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因

  primary key (qid),
  KEY cid (cid)
) engine=InnoDB default charset=utf8;

# 公司退货地址
create table if not exists return_shipping_address (
  cid int not null default 0,                        # 公司id
  name varchar(128) not null default '',             # 收件人
  address varchar(512) not null default '',          # 收件人地址
  city varchar(100) not null default '',             # 城市
  state varchar(100) not null default '',            # 省份
  country varchar(3) not null default '',            # 国家或地区二位代码
  tel varchar(128) not null default '',              # 电话
  fax varchar(128) not null default '',              # 传真
  mobile varchar(128) not null default '',           # 手机
  zipcode varchar(10) not null default '',           # 邮编
  uptime timestamp not null default current_timestamp, # 添加时间
  primary key (cid)
) engine=InnoDB default CHARSET=utf8;

# 公司联系信息表
create table if not exists contact_persons (
  cpid int not null auto_increment,                  # 联系人ID
  cid int not null default 0,                        # 公司id
  contperson varchar(500) not null default '',       # 联系人
  job varchar(500) not null default '',              # 职位
  tel varchar(1024) not null default '',             # 工作电话
  email varchar(1024) not null default '',           # 电子邮件，多个,号隔开 第一个为默认显示的email
  msn varchar(1024) not null default '',             # 各页面显示的msn联系方式
  skype varchar(1024) not null default '',           # 各页面显示的skype联系方式
  yahoo varchar(1024) not null default '',           # 各页面显示的yahoo联系方式
  aim varchar(1024) not null default '',             # 各页面显示的aim联系方式
  icq varchar(1024) not null default '',             # 各页面显示的icq联系方式
  gender tinyint not null default 0,                 # 性别 0 ，女性； 1，男性
  uptime timestamp not null default current_timestamp, # 添加时间
  status tinyint not null default 0,                 # 状态 1 默认 0(普通)
  sort tinyint not null default 0,                   # 排序
  primary key (cpid),
  KEY cid (cid)
) engine=InnoDB default CHARSET=utf8;


# 公司商务条款
create table if not exists company_terms (
  ctid int not null auto_increment,                   # 条款ID
  cid int not null default 0,                         # 公司ID
  name varchar(128) not null,                         # 条款名称
  htmltext text not null,                             # 条款内容
  type tinyint not null,                              # 条款类型 0(通用条款) 1( 订单条款) 2 (其它条款)
  sort tinyint not null default 0,                    # 排序
  uptime timestamp not null,

  PRIMARY KEY (ctid),
  index cid (cid)
) ENGINE=InnoDB default CHARSET=utf8;

# 服务模板
create table if not exists service_templates (
  stid int not null auto_increment,                  # 服务模板ID
  cid int not null default 0,                        # 公司ID: 0(新手模板)
  name varchar(32) not null default '',              # 服务模板名称
  unwanted tinyint not null default 1,               # 货不对路买家要求退货： 0(不接受), 1(接受)
  unwanted_paid tinyint not null default 0,          # 退货运费: 0(买家承担) 1(卖家承担)
  freereason tinyint not null default 1,             # 无理由退货: 0(不接受) 1(接受)
  freereason_paid tinyint not null default 0,        # 退货运费: 0(买家承担) 1(卖家承担)
  isdefault tinyint not default 0,                   # 是否默认
  PRIMARY KEY (stid),
  index cid (cid)
) ENGINE=InnoDB default CHARSET=utf8;

# 运输方式 , 物流
create table if not exists shipping_methods (
  id int not null auto_increment,                   	# 运输方式ID
  shpid varchar(20) not null default '',                # 运输方式编码
  name varchar(128) not null default '',                # 运输方式名称
  firstweight numeric(10,4) not null default 0,         # 首重
  addedweight numeric(10,4) not null default 0,         # 续重
  shpdays int not null default 0,                       # 承诺运达天数
  lengthltd int not null default 0,                     # 单边长度限制
  volumeltd int not null default 0,                     # 体积限制
  weightltd numeric(10,4) not null default 0,           # 重量限制
  wgtunit tinyint default 0,                            # 重量单位 0(G), 1(KG)
  volunit tinyint default 0,                            # 长宽高计量单位 0(cm), 1(dm), 2(m)
  fueltax numeric(10,4),                                # 燃油税率
  volscale numeric(10,4),                               # 体积重量系数
  regfee numeric(10,4),                                 # 挂号费
  additional numeric(10,4),                             # 其它附加费
  grouptype tinyint not null default 0,                 # 物流分组: 0(商业express), 1(邮政Post Service), 2(专线Special Line)
  custshpcost tinyint not null default 0,               # 是否支持自定义运费 0(否) 1(是)
  custshptime tinyint not null default 0,               # 是否支持自定义运达天数 0(否) 1(是)
  status tinyint not null default 0,                    # 现在是否支持可用 0(否) , 1(是)
  primary key (id),
  index shpid (shpid)
) engine=InnoDB default charset=utf8;


# 运费模板
create table if not exists freight_templates (
  ftid int not null auto_increment,                      # 运费模板ID
  cid int not null,                                      # 公司id: 0(公共模板)
  name varchar(100) not null,                            # 名字
  type tinyint not null,                                 # 运费计算方式 0(按重量) 4(按件)
  uptime timestamp default current_timestamp,            # 更新时间
  primary key (ftid),
  index cid_status( cid, status ),
  index cid_type(cid, type)
) engine=InnoDB default charset=utf8;

# 运费模板项
create table if not exists freight_template_items (
  fiid int not null auto_increment,                      # 运费模板项目ID
  ftid int not null default 0,                           # 运费模板ID
  shpid varchar(20) not null default '',                 # 物流公司编码
  type tinyint not null default 1,                       # 运费设置4选1  1标准 2免运费 3自定义 4按件计费
  discount int not null default 0,                       # 标准运费基础上的折扣率 - 百分制
  custshptime tinyint not null default 0,                # 是否自定义运达天数 0(否) 1(是)
  deliverytime int not null default 0,                   # 承诺运达天数
  firstprice decimal(10, 3) not null default '0.000',    # 首件运费 如果模板是 计件的有效
  addedprice decimal(10, 3) not null default '0.000',    # 每增加1件，增加的运费
  shippingsettings text not null default '',             # 自定义运费设置json
  deliverysettings text not null default '',             # 自定义运达时间设置json
  uptime timestamp default current_timestamp,            # 更新时间
  status tinyint not null default 0,                     # 状态： 0(未选中) 1(选中)
  primary key (fiid),
  index ftid_shpid (ftid, shpid)
) engine=InnoDB default charset=utf8;

# 首页Banner信息表
create table if not exists banners (
  banid int not null auto_increment,
  cid int not null default 0,                            # 公司ID
  title varchar(100) not null default '',                # banner图片标题
  link varchar(255) not null default '',                 # banner点击链接
  picpath varchar(255) not null default '',              # banner图片
  #picid int not null default 0,                          # banner图片ID
  type tinyint not null default 0,                       # banner位置 0(左侧) 1(右侧)
  sort int not null default '0',                         # 排序

  PRIMARY KEY (banid)
) ENGINE=InnoDB default CHARSET=utf8;

# 产品分组
create table if not exists product_groups (
  gid int not null,                                     # 分组id，自增
  cid int not null,                                     # 公司id
  name varchar(100) not null,                           # 分类名称
  urlname varchar(100) not null default '',             # 分类在url中的名称
  sort smallint not null default 0,                     # 分类排序
  level tinyint not null default 0,                     # 0(一级分类),1(二级分类)
  status tinyint not null default 0,                    # 分类状态. 0(正常),1(删除)
  addtime timestamp default '1970-01-01 00:00:00',       # 增加时间
  uptime timestamp not null default current_timestamp,  # 最后修改时间
  productcount int not null default 0,                  # 当前分类拥有产品数量
  ischeck tinyint not null default 0,                   # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',       # 审核不通过原因过

  PRIMARY KEY (gid),
  UNIQUE index cid (cid, urlname)
) engine=InnoDB default charset=utf8;

# 产品分组翻译表
create table if not exists product_group_trans (
  gid int not null,                                     # 分组id
  name varchar(100) not null,                            # 分类名称
  uptime timestamp default current_timestamp,            # 更新时间
  autotran tinyint not null default 0,                   # 是否自动翻译. 0(是),1(手工)
  tranlan tinyint not null default 0,                    # 翻译语言. 0(fr),1(de),2(it),3(ru),4(es),5(pt),6(nl),7(el),8(ja),9(ko),12(ar)

  index uptime (uptime),
  UNIQUE gid_tranlan (gid, tranlan)
) engine=InnoDB default charset=utf8;

# 产品表
create table if not exists products (
  pid int not null,                                        # 产品id
  cid int not null default 0,                              # 公司ID
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  catecode varchar(10) not null default '',                # 产品分类ID
  gid int not null default 0,                              # 产品分组ID
  picid int default null default 0,                        # 产品主图
  unit_type smallint not null default 0,                   # 产品计量单位: 0(piece) 1(), ...
  sell_type tinyint not null default 0,                    # 销售方式: 0(按计量单位卖) 1(按包卖)
  sell_lots_num int not null default 1,                    # 打包销售 每包多少件

  wholesale_support tinyint not null default 0,            # 是否支持批发价 1 支持 0 不支持

  # 以下废弃！
  # price decimal(15,2) not null default '0.00',             # 价格 (单位:美元)
  # wholesale_num int not null default 0,                    # 批发价最小起订量
  # wholesale_off int not null default '0',                  # 批发减免率

  minimum_ordered_quantity int not null default 0,         # 最小起订量

  freeshipping_support tinyint(1) not null default 0,      # 是否支持免运费 计算运费时需要根据实际判断 0(不支持) 1(支持)
  deliverytime int not null default 10,                    # 发货时间

  # 以下废弃！
  # innercode varchar(20) default '',                        # 产品内部编码

  status int not null default '0',                         # 产品状态. 0(有效),1(删除)
  isonline tinyint not null default '0',                   # 产品上架下架状态: 0(上架), 1(下架)
  stid int not null default 0,                             # 服务模板ID
  date_available date not null default '1970-01-01 00:00:00', # 到期日期 有效期 过期自动下架
  validdays int not null default 0,                        # 有效期
  ischeck tinyint not null default 0,                      # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',          # 审核不通过原因
  addtime timestamp not null default CURRENT_TIMESTAMP,
  uptime timestamp not null default '0000-00-00 00:00:00',
  sell_param text null,                                    # 销售选项 可以选择样式 颜色等选项 json格式
  fromurl varchar(512) not null default ''，                # 抓取来源url

  PRIMARY KEY (pid),
  index cid (cid),
  index catecode (catecode),
  index cid_gid (cid, gid),
  index cid_innercode (cid, innercode),
  index date_status_isonline(date_available, status, isonline),
  index cid_status_isonline_uptime(cid, status, isonline, uptime),
  index uptime (uptime)
) ENGINE=InnoDB default CHARSET=utf8;


# 产品信息翻译表,表现为各种语言独立表
create table if not exists product_trans_fr (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_de (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_it (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_ru (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_es (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_pt (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_nl (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_el (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_ja (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_ko (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_ar (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;


create table if not exists product_trans_hi (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_tr (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;

create table if not exists product_trans_id (
  pid int not null,                                        # 产品id
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  uptime timestamp not null default current_timestamp,     # 添加时间
  autotran tinyint not null default 0,                     # 是否自动翻译. 0(是),1(手工)

  PRIMARY KEY pid (pid),
  index uptime (uptime)
) engine=InnoDB default charset=utf8 ROW_FORMAT=COMPRESSED;



# 产品包装
create table if not exists product_packages (
  pid int not null default 0,                              # 产品ID
  ftid int not null default 0,                             # 运费模板ID: (公共模板)
  weight decimal(10,2) not null,                           # 重量: 单位KG
  length smallint not null,                                # 包装后长度
  width smallint not null,                                 # 包装后宽度
  height smallint not null,                                # 包装后高度
  customized tinyint not null default 0,                   # 是否自定义包装重量 0(否), 1(是)
  firstnum int not null default 0,                         # 自定义重量时，基础重量包含的物品数
  addnum int not null default 0,                           # 自定义重量时，物品项增加数
  addweight decimal(10,2) not null,                        # 自定义重量时，重量增加数, 单位KG

  primary key (pid)
) engine=InnoDB default charset=utf8;

#修改单位 小数点
alter table product_packages
change `length` `length` decimal(10,2) not null,
change `width` `width` decimal(10,2) not null,
change `height` `height` decimal(10,2) not null;


# 产品销售特性表：不必翻译【废弃】
create table if not exists product_skudetails(
  id int not null auto_increment,                     # ID
  pid int not null default 0,                         # 产品ID
  name varchar(100) not null default '',              # 特性名称
  value varchar(512) not null,                        # 特性值
  type tinyint not null default 0,                    # 类型标志. 1(text), 4(color)
  sort tinyint not null default 0,                    # 排序
  primary key (id)
) engine=InnoDB default charset=utf8;

# 产品规格表: 是否将自定义规格分开，以减少翻译量
create table if not exists product_details (
  pdid int not null auto_increment,                   # ID
  pid int not null default 0,                         # 产品ID
  name varchar(100) not null default '',              # 规格名称
  value text not null,                        # 规格值
  type tinyint not null default 0,                    # 类型标志.  0.标准  1.自定义  2.知识库

  primary key (pdid),
  index pid (pid),
  index type (type)
) engine=InnoDB default charset=utf8;

# 产品属性表,表现为各种语言独立表
create table if not exists product_detail_trans_fr (
  pdid int not null default 0,                        # 产品属性id
  name varchar(100) not null default '',              # 属性名称
  value varchar(100) not null default '',             # 属性值
  uptime timestamp default current_timestamp,         # 更新时间
  autotran tinyint not null default 0,                # 是否自动翻译 0是，1手工

  primary key (pdid)
) engine=InnoDB default charset=utf8;


# 公司图片中心分组
create table if not exists picture_bank_groups (                                             #主键
  picgid int not null auto_increment,                # 图片分组id
  cid int not null default 0,                        # 公司id
  name varchar(256) not null default '',             # 公司图片分组名称
  addtime timestamp default current_timestamp,       # 增加时间
  primary key (picgid),
  KEY addtime (addtime),
  KEY cid (cid)
) engine=InnoDB default charset=utf8;


# 公司图片分组关联表
create table if not exists picture_bank_associates (
  picid int not null default 0,                      # 图片id
  cid int not null default 0,                        # 公司id
  picgid int not null default 0,                     # 图片分组id
  num smallint not null default 0,                   # 使用次数. 0(未使用)
  addtime timestamp default current_timestamp,       # 增加时间
  name varchar(100) default '',                      #图片逻辑名称(可修改)
  primary key (picgid),
  KEY addtime (addtime),
  KEY cid (cid)
) engine=InnoDB default charset=utf8;


# 公司、生产、OEM、R&D图片信息表
create table if not exists pictures (
  picid int not null auto_increment,                    # 图片id
  cid int not null default 0,                        # 公司id
  num smallint not null default 1,                   # 使用次数. 0(未使用)
  picpath varchar(256) not null default '',          # 图片地址
  addtime timestamp default current_timestamp,       # 增加时间

  primary key (picid),
  KEY addtime (addtime),
  KEY cid (cid)
) engine=InnoDB default charset=utf8;

# 图片关系表
create table if not exists picture_associates (
  picid int not null,                                # 图片id
  sid int not null,                                  # 需关联业务id type为 0 1 2 3, 7, 8 时，此id为公司id，4为产品id，5为证书id
  sort tinyint not null default 0,                   # 图片排序
  type tinyint not null default 0,                   # 图片类型, 0(公司)，1(生产线)，2(OEM)，3(R&D)，4(产品)，5(QC证书图片)，6(新闻)， 7(工厂图片), 8 (客户服务)

  primary key (picid,sid,type),
  index type (type),
  index sid (sid)
) engine=InnoDB default charset=utf8;

# 推荐产品栏目设置
create table if not exists company_columns (
  ccid int not null auto_increment,                        # 推荐栏目id
  cid int not null,                                        # 公司id
  type tinyint not null default 0,                         # 类型 0(NewArrival), 1(Bestseller), 2(wholesale), 3(other)
  name varchar(32) not null default '',                    # 栏目名称(需要翻译)
  automated tinyint not null default 0,                    # 是否自动 0(是自动 ), 1(手工)
  prodnum smallint not null default 0,                     # 当前产品数
  sort tinyint not null default 0,                         # 排序
  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime timestamp not null default '0000-00-00 00:00:00',  # 更新时间
  items text not null  default '',                         # 栏目产品明细
  primary key (ccid)

) engine=InnoDB default charset=utf8;

# 产品分组翻译表
create table if not exists company_column_trans (
  ccid int not null,                                     # 分组id
  name varchar(100) not null,                            # 分类名称
  uptime timestamp default current_timestamp,            # 更新时间
  autotran tinyint not null default 0,                   # 是否自动翻译. 0(是),1(手工)
  tranlan tinyint not null default 0,                    # 翻译语言. 0(fr),1(de),2(it),3(ru),4(es),5(pt),6(nl),7(el),8(ja),9(ko),12(ar)

  index uptime (uptime),
  UNIQUE ccid_tranlan (ccid, tranlan)
) engine=InnoDB default charset=utf8;

# 计量单位 unit_types
create table if not exists unit_types (
  id int not null auto_increment,                      # 计量单位id，自增
  cname varchar(100) not null,                             # 中文名称
  ename varchar(100) not null,                             # 英文名称
  sort smallint not null default 0,                        # 分类排序

  PRIMARY KEY (id)
) engine=InnoDB default charset=utf8;

# 卖家处理订单表,参考买家订单表
CREATE TABLE IF NOT EXISTS seller_orders (
  oid int(11) NOT NULL,									                  # 订单ID
  cid int(11) NOT NULL default '0',						            # 公司ID
  bid int(11) NOT NULL default '0',						            # 买家ID
  order_code char(25) NOT NULL,							              # 订单编号

  # 收货信息
  shipping_firstname varchar(128) NOT NULL default '',	  # 收货人名称-名
  shipping_lastname varchar(128) NOT NULL default '',	    # 收货人名称-姓
  shipping_address_1 varchar(512) NOT NULL default '',	  # 收货人地址1
  shipping_address_2 varchar(512) NOT NULL default '',	  # 收货人地址2
  shipping_country varchar(128) NOT NULL default '',	    # 收货人国家
  shipping_country_code varchar(3) NOT NULL default '0',  # 收货人国家ISO编码
  shipping_state varchar(128) NOT NULL default '',		    # 收货人州
  shipping_city varchar(128) NOT NULL default '',		      # 收货人城市
  shipping_postcode varchar(10) NOT NULL default '',	    # 收货人邮编
  shipping_telephone varchar(64) NOT NULL default '',	    # 收货人电话
  shipping_fax varchar(64) NOT NULL default '',			      # 收货人传真
  shipping_mobile varchar(64) NOT NULL default '',		    # 收货人手机
  shipping_address_format text NOT NULL,				          # 收货人地址组合

  # 付款信息
  payment_email varchar(128) NOT NULL default '',		      # 付款人email
  payment_firstname varchar(128) NOT NULL default '',	    # 付款人姓名
  payment_lastname varchar(128) NOT NULL default '',	    # 付款人姓名
  payment_company varchar(32) NOT NULL default '',		    # 付款人公司
  payment_address_1 varchar(512) NOT NULL default '',	    # 付款人地址1
  payment_address_2 varchar(512) NOT NULL default '',	    # 付款人地址2
  payment_country varchar(128) NOT NULL default '',		    # 付款人国家
  payment_country_code varchar(3) NOT NULL default '0',	  # 付款人国家编码
  payment_state varchar(128) NOT NULL default '',		      # 付款人州
  payment_city varchar(128) NOT NULL default '',		      # 付款人城市
  payment_postcode varchar(10) NOT NULL default '',		    # 付款人邮编
  payment_address_format text NOT NULL,					          # 付款人地址组合
  payment_method varchar(128) NOT NULL default '',		    # 付款方式
  payment_id int NOT NULL default '0',					          # 付款成功的ID
  payment_total DECIMAL( 15, 2 ) NULL ,                   # 支付总额
  payment_receiver_email VARCHAR( 200 ) NULL,             # 支付卖家账号

  comment text NOT NULL,								                  # 买家备注
  total decimal(15,2) NOT NULL,							              # 订单当前总金额
  product_total decimal(15,2) NOT NULL default '0.00',	  # 订单产品总金额
  change_price decimal(15,2) NOT NULL default '0.00', 	  # 调整价格
  shipfee decimal(15,2) NOT NULL default '0.00',		      # 订单总运费
  itemnum int(11) NOT NULL default '0',					          # 订单明细数量
  oldtotal decimal(15,2) NOT NULL default '0.00',		      # 订单调整前的总金额
  add_deliver int(11) NOT NULL default '0',				        # 延长发货时间
  max_deliver_days int(11) NOT NULL default '0',		      # 最大的产品的发货时间 单位day
  commission_rate decimal(15,2) NOT NULL default '0.00',  # 佣金
  status int(11) NOT NULL default '0',					          # 订单状态 （买家可操作订单状态：成单、已付款、取消、确认到货和超时到货、退货）
  odid int(11) NOT NULL default '0',					            # 纠纷ID
  iscancel tinyint(4) NOT NULL default '0',				        # 是否取消 0 (未取消) 1(申请取消) 2(同意取消)
  isfrozen tinyint(4) NOT NULL default '0',				        # 是否冻结 0(未冻结) 1(冻结)
  frozen_reason text NOT NULL,							              # 冻结原因
  close_reason text NOT NULL,							                # 关闭原因
  change_price_reason text NOT NULL,								      # 关闭原因
  cancel_reason int(11) default NULL,					            # 订单取消原因
  addtime timestamp NULL default NULL,					          # 提交时间
  uptime timestamp NULL default NULL,					            # 更新时间
  paytime timestamp NULL default NULL,					          # 支付时间
  rectime timestamp NULL default NULL,					          # 到货时间
  ip varchar(15) NOT NULL default '',					            # 买家提交IP
  sync_flag int(11) NOT NULL default '0',				          # 同步标识
  newdeliver int(11) NOT NULL default '0',				        # 延长后的天数
  confirm_time timestamp NOT NULL default '0000-00-00 00:00:00',	# 确认日期
  ship_time timestamp NOT NULL default '0000-00-00 00:00:00',	    # 发货时间
  close_time timestamp NOT NULL default '0000-00-00 00:00:00',	  # 订单结束日期
  refund_time timestamp NOT NULL default '0000-00-00 00:00:00',	  # 退款时间
  seller_new_msg int(11) NOT NULL,						            # 卖家新留言的数量
  buyer_new_msg int(11) NOT NULL,						              # 买家新留言的数量
  part_ship_time timestamp NOT NULL default '0000-00-00 00:00:00',# 发货时间
  add_recday int(11) NOT NULL default '0',				        # 延长收货时间
  refundtotal decimal(15,2) NOT NULL default '0.00',	    # 退款金额
  refund_reason int(11) NOT NULL default '0',			        # 退款原因: 1 取消订单 2 纠纷
  refund_status int(11) NOT NULL default '0',			        # 退款状态 0 不必退款 1 准备退款 2 退款失败 3 退款成功
  refund_msg varchar(500) NOT NULL default '',			      # 退款的返回消息
  deposit decimal(15,2) NOT NULL default '0.00',		      # 当时扣除的保证金

  PRIMARY KEY  (oid),
  UNIQUE KEY order_code (order_code),
  KEY bid (bid),
  KEY cid (cid)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

# 卖家订单操作同步日志
CREATE TABLE IF NOT EXISTS seller_order_sync_logs (
  id int(11) NOT NULL auto_increment,
  oid int(11) NOT NULL,									# 订单ID
  status int(11) NOT NULL,								# 订单当前状态
  old_status int(11) NOT NULL,							# 订单历史状态
  content text NOT NULL,
  addtime timestamp NOT NULL default CURRENT_TIMESTAMP,	# 添加时间
  sync_flag int(11) NOT NULL default '0',				# 同步标识 0(未) 1(已)

  PRIMARY KEY  (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

# 订单价格调整
CREATE TABLE IF NOT EXISTS order_price_changes (
  id int(11) NOT NULL auto_increment,
  oid int(11) NOT NULL default '0',						# 订单ID
  bid int(11) NOT NULL default '0',						# 买家ID
  uid int(11) NOT NULL default '0',						# 操作人员
  oldtotal decimal(15,2) NOT NULL default '0.00',		# 调整前订单总金额
  newtotal decimal(15,2) NOT NULL default '0.00',		# 调整后订单总金额
  reason text,											# 原因
  addtime timestamp NOT NULL default CURRENT_TIMESTAMP,	# 添加时间

  PRIMARY KEY  (id),
  KEY oid (oid),
  KEY bid (bid)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

# 订单跟踪信息:
create table if not exists order_tracks (
  id int not null auto_increment,
  oid int not null default 0,                          # 订单ID
  shpid varchar(20) not null default '',                # 运输方式编码
  trackno varchar(60) not null default '',                 # 跟踪号
  remark varchar(1024) not null default '',                # 备注
  addtime timestamp default current_timestamp,             # 增加时间

  primary key (id)
) ENGINE=InnoDB default CHARSET=utf8;


# 专题页模板
create table if not exists subject_tpls (
  id int not null auto_increment,         		# 专题页模板ID
  name varchar(32) not null default '',         # 专题页模板名称
  tpl varchar(100) not null default '',         #专题页展示模板
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

###############################################################
# 贸易通在线交易数据库设计 tradeonline_downline(国内线下库)
##############################################################

# 公司简单信息表
create table if not exists companys_uncheck (
  cid int not null auto_increment,                   # 公司id
  name varchar(256) not null default '',             # 公司名称
  domain varchar(200) not null default '',           # 公司域名
  isescrow tinyint not null default 0,               # 是否担保客户 0 (不担保) 1(担保)
  province varchar(100) not null,				     # 省份
  city varchar(100) not null,					     # 城市
  lang varchar(200) not null default '',             # 公司翻译语言，号隔开
  keyword varchar(256) not null default '',          # 公司关键词，号隔开
  logopath varchar(256) not null default '',         # 公司logo图片地址
  tplid tinyint default 0,                           # 使用模板
  tplpath varchar(256) default '',                   # 使用模板路径
  slogan varchar(1024) not null default '',          # 公司标语
  addtime timestamp default '0000-00-00 00:00:00',    # 增加时间
  onlinetime timestamp default '0000-00-00 00:00:00', # 上线时间
  uptime timestamp default current_timestamp,        # 更新时间
  status tinyint not null default 0,                 # 公司状态 0有效，1下线，2删除
  ip varchar(15) not null default '',                # 公司对应ip
  vhost varchar(20) not null default '',             # 公司服务器名称
  facebook varchar(255) not null,                    # facebook url
  twitter varchar(255) not null,                     # twitter url
  linkedin varchar(255) not null,                    # linkedin url
  youtube varchar(255) not null,                     # youtube url
  googleplus varchar(255) not null,                  # googleplus url
  wordpress varchar(255) not null,                  # wordpress url
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因
  isfetch tinyint not null default '0',				 # 是否抓取
  fromurl varchar(512) not null default '',          # 抓取来源url

  primary key (cid),
  KEY addtime (addtime),
  KEY uptime (uptime),
  UNIQUE KEY domain (domain)
) engine=InnoDB default charset=utf8;

# 公司详细信息表：包含联系信息、基本信息、质量、生产线、OEM、R&D、服务、历史、团队
create table if not exists company_infos_uncheck (
  cid int not null,                                  # 公司id
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
  addr varchar(256) not null default '',             # 公司地址
  factoryaddr varchar(256) not null default '',      # 工厂地址
  marketname varchar(300) not null default '',       # 主要市场
  marketcode varchar(100) not null default '',       #
  busitypename varchar(300) not null default '',     # 企业类型
  busitypecode varchar(100) not null default '',     # 企业类型代码
  brands varchar(256) not null default '',           # 品牌名称
  employeenumber varchar(500) not null default '',   # 员工人数
  annualsales varchar(50) not null default '',       # 销售额
  yearestablished varchar(50) not null default '',   # 公司建立时间
  exportper varchar(250) not null default '',        # 出口比例
  remark text not null default '',                   # 公司简介 introduction
  plineinfo text not null default '',                # 生产线基本简介
  oeminfo text not null default '',                  # OEM简介
  rdinfo text not null default '',                   # R&D简介
  servinfo text not null default '',                 # 公司服务简介
  historyinfo text not null default '',              # 公司历史简介
  teaminfo text not null default '',                 # 公司团队简介
  qcinfo text not null default '',                   # 质量管理简介
  videocode text not null default '',                # 公司视频嵌入代码
  staticcode text not null default '',               # 网站统计代码
  addtime timestamp default '0000-00-00 00:00:00',    # 增加时间
  uptime timestamp default current_timestamp,        # 更新时间
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因

  primary key (cid),
  index addtime (addtime),
  index uptime (uptime)
) engine=InnoDB default charset=utf8;

# QC证书管理表
create table if not exists certificates_uncheck (
  qid int not null auto_increment,                      # 证书id
  cid int not null default 0,                        # 公司id
  addtime timestamp default current_timestamp,       # 增加时间
  standard varchar(128) not null default '',         # 证书类型
  number varchar(128) not null default '',           # 证书号码
  issuedate varchar(128) not null default '',        # 发证日期
  expiredate varchar(128) not null default '',       # 失效日期
  scope varchar(128) not null default '',            # 证书范围
  issuedby varchar(256) not null default '',         # 发证机关
  sort tinyint not null default 0,                   # 证书排序
  status tinyint not null default 0,                 # 状态. 0(有效),1(删除)
  ischeck tinyint not null default 0,                # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',    # 审核不通过原因

  primary key (qid),
  KEY cid (cid)
) engine=InnoDB default charset=utf8;

# 产品分组
create table if not exists product_groups_uncheck (
  gid int not null auto_increment,                       # 分组id，自增
  cid int not null,                                      # 公司id
  name varchar(100) not null,                            # 分类名称
  urlname varchar(100) not null default '',              # 分类在url中的名称
  sort smallint not null default 0,                      # 分类排序
  level tinyint not null default 0,                      # 0(一级分类),1(二级分类)
  status tinyint not null default 0,                     # 分类状态. 0(正常),1(删除)
  addtime timestamp default '0000-00-00 00:00:00',        # 增加时间
  uptime timestamp not null default current_timestamp,   # 最后修改时间
  productcount int not null default 0,                   # 当前分类拥有产品数量
  ischeck tinyint not null default 0,                    # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',        # 审核不通过原因过

  PRIMARY KEY (gid),
  UNIQUE index cid (cid, urlname)
) engine=InnoDB default charset=utf8;

# 产品表
create table if not exists products_uncheck (
  pid int not null auto_increment,                         # 产品id
  cid int not null default 0,                              # 公司ID
  name varchar(500) not null default '',                   # 产品名称
  keyword varchar(500) not null default '',                # 产品关键词 逗号隔开
  remark mediumtext not null default '',                   # 产品描述
  catecode varchar(10) not null default '',                # 产品分类ID
  gid int not null default 0,                              # 产品分组ID
  picid int default null default 0,                        # 产品主图
  unit_type smallint not null default 0,                   # 产品计量单位: 0(piece) 1(), ...
  sell_type tinyint not null default 0,                    # 销售方式: 0(按计量单位卖) 1(按包卖)
  sell_lots_num int not null default 1,                    # 打包销售 每包多少件

  wholesale_support tinyint not null default 0,            # 是否支持批发价 1 支持 0 不支持

  # 以下废弃！
  # price decimal(15,2) not null default '0.00',             # 价格 (单位:美元)
  # wholesale_num int not null default 0,                    # 批发价最小起订量
  # wholesale_off int not null default '0',                  # 批发减免率

  minimum_ordered_quantity int not null default 0,         # 最小起订量

  freeshipping_support tinyint(1) not null default 0,      # 是否支持免运费 计算运费时需要根据实际判断 0(不支持) 1(支持)
  deliverytime int not null default 10,                    # 发货时间

  # 以下废弃！
  # innercode varchar(20) default '',                        # 产品内部编码

  status int not null default '0',                         # 产品状态. 0(有效),1(删除)
  isonline tinyint not null default '0',                   # 产品上架下架状态: 0(上架), 1(下架)
  stid int not null default 0,                             # 服务模板ID
  date_available timestamp not null default '0000-00-00 00:00:00', # 到期日期 有效期 过期自动下架
  validdays int not null default 0,                        # 有效期
  ischeck tinyint not null default 0,                      # 审核标志. 0(未审核),1(审核通过),2(审核未通过)
  ischeckreason varchar(256) not null default '',          # 审核不通过原因
  addtime timestamp not null default '0000-00-00 00:00:00',
  uptime timestamp not null default '0000-00-00 00:00:00',
  sell_param text null,                                    # 销售选项 可以选择样式 颜色等选项 json格式
  fromurl varchar(512) not null default '',                # 抓取来源url
  PRIMARY KEY (pid),
  index cid (cid),
  index catecode (catecode),
  index cid_gid (cid, gid),
  index cid_innercode (cid, innercode),
  index uptime (uptime)
) ENGINE=InnoDB default CHARSET=utf8;


# 客户网站模板列表
create table if not exists site_tpls (
  tplid int(11) not null auto_increment,
  type tinyint not null default 0,                         # 模板类型，0为英文站，1为中文站
  name varchar(100) not null,
  path varchar(100) not null default '',

  PRIMARY KEY (tplid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站模板列表';


# ip和host列表，方便管理
create table if not exists vhost_ips (
  vhost varchar(20) not null default '',                   # 公司服务器名称
  ip varchar(15) not null default '',                      # 来源IP

  primary key (ip)
) engine=InnoDB default charset=utf8;

# 运营使用的客户资料信息
CREATE TABLE IF NOT EXISTS ops_companys_info (
  cid int(11) NOT NULL,
  company_name varchar(100) NOT NULL,				# 公司中文名
  ename varchar(256) NOT NULL,						# 公司英文名
  addr varchar(500) NOT NULL default '',			# 公司地址
  province varchar(256) NOT NULL default '',		# 省
  city varchar(256) NOT NULL default '',			# 城市
  area varchar(256) NOT NULL default '',			# 区县
  business varchar(256) NOT NULL default '',		# 客户行业
  username varchar(50) NOT NULL,					# 签约联系人
  op_username varchar(50) NOT NULL,					# 操作联系人
  tel varchar(50) NOT NULL,							# 签约联系人电话
  op_tel varchar(50) NOT NULL,						# 操作联系人电话
  email varchar(500) NOT NULL,						# 签约联系人邮件
  op_email varchar(500) NOT NULL,					# 操作联系人邮件
  msn varchar(500) NOT NULL,						# 签约联系人MSN
  op_msn varchar(500) NOT NULL,						# 操作联系人MSN
  qq varchar(100) NOT NULL,							# 签约联系人QQ
  op_qq varchar(100) NOT NULL,						# 操作联系人QQ
  status tinyint(4) NOT NULL default '0',			# 客户状态. 0(未上线),1(已上线),2(挂起),3(已下线),5(翻译锁住)， 6
  addtime timestamp NOT NULL default '0000-00-00 00:00:00',		# 加入时间/客户开通时间
  opentime timestamp NOT NULL default '0000-00-00 00:00:00',	# 网站开通时间
  servstarttime timestamp NOT NULL default '2009-01-01 00:00:00',	# 服务开始时间
  servendtime timestamp NOT NULL default '2009-01-01 00:00:00',		# 服务结束时间
  trantime timestamp NOT NULL default '2009-01-01 00:00:00',		# 翻译时间
  onlinetime timestamp NOT NULL default '2009-01-01 00:00:00',		# 上线时间
  paytime timestamp NOT NULL default '2009-01-01 00:00:00',			# 到款时间
  uid int(11) NOT NULL default '0',									# 平台制作人员
  servuid int(11) NOT NULL default '0',								# 平台客服人员
  domain varchar(200) default NULL,									# 域名
  notes text NOT NULL,												# 备注
  checktime timestamp NOT NULL default '0000-00-00 00:00:00',		# 审核时间
  checkuid int(11) NOT NULL default '0',							# 审核UID
  PRIMARY KEY  (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运营使用的客户资料信息';

# 服务日志
drop table if exists ops_service_log;
create table ops_service_log (
  id int(11) NOT NULL auto_increment,
  cid int(11) NOT NULL,
  uid int(11) NOT NULL,
  username varchar(100) NOT NULL,
  name varchar(100) NOT NULL,
  notes varchar(2000) NOT NULL,
  create_time timestamp NULL default CURRENT_TIMESTAMP,
  type tinyint NOT NULL default 0,          # 0代表人工加，1代表系统日志

  PRIMARY KEY  (id),
  KEY cid (cid),
  KEY create_time (create_time)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='服务日志';

# 用户角色信息表
create table if not exists roles (
  id int not null auto_increment,                    # 角色ID
  name varchar(128) not null default '',             # 角色名称
  roledesc text not null default '',                 # 角色描述
  actions text not null default '',                  # 角色权限，逗号隔开, "all"为admin权限
  uptime timestamp default current_timestamp,        # 更新时间
  status tinyint not null default 0,                 # 角色状态. 0(有效),1(删除)
  type tinyint not null default 0,                   # 角色类型。0(后台角色,1卖家角色

  PRIMARY KEY  (id),
  KEY parentroleid (parentroleid),
  KEY uptime (uptime)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into roles set id=1, name='超级管理员', actions='all';
insert into roles set id=2, name='管理员';
insert into roles set id=3, name='客户专员';
insert into roles set id=4, name='制作专员';
insert into roles set id=5, name='运营专员';

# 公司后台用户 ,客户
create table if not exists users (
  uid int not null auto_increment,
  cid int not null default 0,                              # 公司ID
  email varchar(1024) not null default '',                 # 登录邮箱
  salt char(8) not null,                                   # 密码加密
  password varchar(32) not null default '',                # 用户密码
  nickname varchar(60) not null default '',                # 用户昵称
  gender tinyint not null default 0,                       # 性别. 0(女性),1(男性)
  tel varchar(32) not null,                                # 电话
  fax varchar(32) not null,                                # 传真
  mobile varchar(32) not null,                             # 手机
  province varchar(100) not null,                          # 所在省份
  city varchar(100) not null,                              # 所在城市
  roleid int not null default 0,                             # 角色id. 1(超级管理员), 2(管理员权限), 3(卖家业务员) 4(卖家制作专员),  其它(OPS帐号)
  dateadded datetime not null default '1970-01-01 00:00:00',
  status int not null default 0,                           # 状态： 0(正常) 2(冻结)
  login_count int not null default 0,                      # 登录总次数
  login_time timestamp not null default '0000-00-00 00:00:00', #最后登录时间
  login_ip varchar(20) not null default '',                #最后登录IP
  PRIMARY KEY (uid),
  KEY cid (cid)
) ENGINE=InnoDB default CHARSET=utf8;

# 用户登录日志表
create table if not exists user_loginlogs (
  id int not null auto_increment,
  uid int not null default 0,                                  # 买家ID
  ip varchar(15) not null default '',                          # 登录ip
  logindate datetime not null default '1970-01-01 00:00:00',   # 登录时间
  logoutdate datetime not null default '1970-01-01 00:00:00',  # 退出时间

  PRIMARY KEY (id),
  KEY uid (uid)
) ENGINE=InnoDB default CHARSET=utf8;

# 公司操作log表
create table if not exists company_operate_logs (
  id int not null auto_increment,                    # 自增id
  cid int not null default 0,                        # 公司ID
  sid int not null default 0,                        # 表的唯一id
  type varchar(100) not null default '',             # 操作类型,1为增加,2为更新,3为删除
  status tinyint not null default 0,                 # 状态。审核、未审核、已处理
  uptime timestamp default current_timestamp,        # 修改时间

  primary key (id),
  UNIQUE cid_sid_type (cid, sid, type),
  index uptime (uptime),
  index status (status)
) engine=InnoDB default charset=utf8;

# 翻译域名
create table if not exists tran_domain (
  id int not null auto_increment,                       # 记录ID
  cid int not null default 0,                        # 公司id
  domain varchar(200),                               # 公司域名
  status tinyint not null default 0,                 # 域名状态，0,ok，1封停，2其他原因停止
  times int not null default 0,                      # 封停次数
  addtime timestamp default current_timestamp,       # 添加时间
  uptime datetime default '1970-01-01 00:00:00',     # 修改时间

  primary key (id),
  index cid (cid)
) engine=InnoDB default charset=utf8;

# 翻译队列表
create table if not exists tran_queue (
  id int not null auto_increment,                    # 队列ID
  cid int not null default 0,                        # 公司id
  trantable varchar(100) not null default '',        # 需翻译表名
  tranid int not null default 0,                     # 需翻译id，表的唯一id
  trancolumn varchar(100) not null default '',       # 翻译字段名，空为翻译整个表
  tranlang varchar(1024) not null default '',        # 翻译语言，数字，逗号隔开 1,2,3,4
  status tinyint not null default 0,                 # 翻译状态. -2(不翻译),-1(翻译中),0(新添加),1(翻译成功),2(翻译失败),3(对应条目删除不需要翻译了)
  level tinyint not null default 0,                  # 优先级，越高越优先，普通修改0-9,新增10-19
  addtime timestamp default current_timestamp,       # 添加时间
  uptime datetime default '1970-01-01 00:00:00',     # 修改时间

  primary key (id),
  index level (level),
  index tranid (tranid),
  index addtime (addtime),
  index cid (cid),
  index status (status)
) engine=InnoDB default charset=utf8;

# 手工紧急：level=18
# 人工加强：level=16
# 单数都是翻译失败的情况
# 公司信息,分类14
# 公司细节12
# 产品名称，产品细节10
# 新增产品remark 8
# 更新产品remark 6
# 翻译失败 4

# 翻译表,备份翻译过的非富文本的资料
create table if not exists tran_word_centers (
  id int not null auto_increment,                    #
  kmd5 char(32) not null default '',                 # 关键词的MD5值，不区分大小写
  keyword varchar(768),                              # 关键词
  trankeyword varchar(768),                          # 翻译关键词
  uptime timestamp default current_timestamp,        # 更新时间
  tranlan varchar(32),                               # 翻译语言. fr,de,it,ru,es,pt,nl,el,ja,ko,ar

  primary key (id),
  index kmd5_tranlan (kmd5, tranlan)
) engine=InnoDB default charset=utf8;

#表的结构 sessions
create table if not exists sessions (
  id char(32) primary key,
  expire integer,
  data text
) ENGINE=InnoDB default CHARSET=utf8;


###############################################################
# 贸易通在线交易数据库设计 tradeonline_buyer(国外买家库)
##############################################################

#表的结构 sessions
create table if not exists sessions (
  id char(32) primary key,
  expire integer,
  data text
) ENGINE=InnoDB default CHARSET=utf8;

# 买家表
create table if not exists buyers (
  bid int not null auto_increment,
  domain varchar(200) not null default '',                   # 注册域名
  email varchar(128) not null default '',                    # email(作为登录帐号)
  firstname varchar(128) not null default '',                # firstname
  lastname varchar(128) not null default '',                 # lastname
  gender varchar(64) not null default '',                    # 称谓 0 ，女性； 1，男性
  edmemail varchar(128) not null default '',                 # email(作为联系邮箱)
  telephone varchar(64) not null default '',                 # 电话
  fax varchar(64) not null default '',                       # fax
  mobile varchar(32) not null,                               # 手机
  salt varchar(8) not null,                                  # 密码加密
  password varchar(32) not null default '',                  # 买家密码
  baid int not null default '0',                             # 买家默认地址ID
  country_code varchar(3) not null default 'US',             # 买家国家编码
  ip varchar(15) not null default '0',                       # 买家上次登录IP
  status int not null default 0,                             # 买家状态 0(正常) 1(冻结)
  addtime datetime not null default '1970-01-01 00:00:00',
  uptime datetime not null default '1970-01-01 00:00:00',
  lastlogin datetime not null default '1970-01-01 00:00:00', # 最后登录时间
  address_1 varchar(512) not null default '',
  address_2 varchar(512) not null default '',
  country varchar(128) not null default '',                  # 国家
  state varchar(128) not null default '',                    # 州
  city varchar(128) not null default '',                     # 城市
  postcode varchar(10) not null default '',                  # 邮编


  PRIMARY KEY (bid),
  KEY baid (baid),
  UNIQUE KEY email (email)
) ENGINE=InnoDB default CHARSET=utf8;

# 买家登录日志表
create table if not exists buyer_loginlogs (
  id int not null auto_increment,
  bid int not null default 0,                                  # 买家ID
  ip varchar(15) not null default '',                          # 登录ip
  logintime datetime not null default '1970-01-01 00:00:00',   # 登录时间
  logouttime datetime not null default '1970-01-01 00:00:00',  # 退出时间

  PRIMARY KEY (id),
  KEY bid (bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 买家邮寄地址信息
create table if not exists buyer_address (
  baid int not null auto_increment,
  bid int not null default 0,
  firstname varchar(128) not null default '',
  lastname varchar(128) not null default '',
  gender varchar(64) not null default '',                    # 称谓 0 ，女性； 1，男性
  address_1 varchar(512) not null default '',
  address_2 varchar(512) not null default '',
  country varchar(128) not null default '',                  # 国家
  country_code varchar(3) not null default 'US',             # 国家编码
  state varchar(128) not null default '',                    # 州
  city varchar(128) not null default '',                     # 城市
  postcode varchar(10) not null default '',                  # 邮编
  telephone varchar(64) not null default '',                 # 电话
  fax varchar(64) not null default '',                       # fax
  mobile varchar(32) not null,                               # 手机
  status tinyint not null default 0,                         # 地址状态
  isdefault tinyint not null default 0,                      # 是否默认地址

  PRIMARY KEY (baid),
  KEY bid (bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 买家处理订单表
CREATE TABLE IF NOT EXISTS buyer_orders (
  oid int(11) NOT NULL auto_increment,						# 订单ID
  cid int(11) NOT NULL default '0',							# 公司ID
  bid int(11) NOT NULL default '0',							# 买家ID
  order_code char(25) NOT NULL,								# 订单编号
  shipping_firstname varchar(128) NOT NULL default '',		# 收货人名称-名
  shipping_lastname varchar(128) NOT NULL default '',		# 收货人名称-姓
  shipping_address_1 varchar(512) NOT NULL default '',		# 收货人地址1
  shipping_address_2 varchar(512) NOT NULL default '',		# 收货人地址1
  shipping_country varchar(128) NOT NULL default '',		# 收货人国家
  shipping_country_code varchar(3) NOT NULL default '0',	# 收货人国家ISO编码
  shipping_state varchar(128) NOT NULL default '',			# 收货人州
  shipping_city varchar(128) NOT NULL default '',			# 收货人城市
  shipping_postcode varchar(10) NOT NULL default '',		# 收货人邮编
  shipping_telephone varchar(64) NOT NULL default '',		# 收货人电话
  shipping_fax varchar(64) NOT NULL default '',				# 收货人传真
  shipping_mobile varchar(64) NOT NULL default '',			# 收货人手机
  shipping_address_format text NOT NULL,					# 收货人地址组合
  payment_email varchar(128) NOT NULL default '',			# 付款人email
  payment_firstname varchar(128) NOT NULL default '',		# 付款人姓名
  payment_lastname varchar(128) NOT NULL default '',		# 付款人姓名
  payment_company varchar(32) NOT NULL default '',			# 付款人公司
  payment_address_1 varchar(512) NOT NULL default '',		# 付款人地址1
  payment_address_2 varchar(512) NOT NULL default '',		# 付款人地址2
  payment_country varchar(128) NOT NULL default '',			# 付款人国家
  payment_country_code varchar(3) NOT NULL default '0',		# 付款人国家编码
  payment_state varchar(128) NOT NULL default '',			# 付款人州
  payment_city varchar(128) NOT NULL default '',			# 付款人城市
  payment_postcode varchar(10) NOT NULL default '',			# 付款人邮编
  payment_address_format text NOT NULL,						# 付款人地址组合
  payment_method varchar(128) NOT NULL default '',			# 付款方式
  payment_id int NOT NULL default '0',						# 付款成功的ID
  payment_total DECIMAL( 15, 2 ) NULL ,             #'支付总额' ,
  payment_receiver_email VARCHAR( 200 ) NULL,      # '支付卖家账号' ,
  comment text NOT NULL,									# 买家备注
  total decimal(15,2) NOT NULL,								# 订单当前总金额
  product_total decimal(15,2) NOT NULL default '0.00',		# 订单产品总金额
  change_price decimal(15,2) NOT NULL default '0.00',		# 调整价格
  shipfee decimal(15,2) NOT NULL default '0.00',			# 订单总运费
  itemnum int(11) NOT NULL default '0',						# 订单明细数量
  oldtotal decimal(15,2) NOT NULL default '0.00',			# 订单调整前的总金额
  add_deliver int(11) NOT NULL default '0',					# 延长前的天数
  max_deliver_days int(11) NOT NULL default '0',			# 最大的产品的发货时间 单位(day)
  commission_rate decimal(15,2) NOT NULL default '0.00',	# 佣金
  status int(11) NOT NULL default '0',						# 订单状态 （买家可操作订单状态：成单、已付款、取消、确认到货和超时到货、退货）
  odid int(11) NOT NULL default '0',						# 纠纷ID
  iscancel tinyint(4) NOT NULL default '0',					# 是否取消 0 (未取消) 1(申请取消) 2(同意取消)
  isfrozen tinyint(4) NOT NULL default '0',					# 是否冻结 0(未冻结) 1(冻结)
  frozen_reason text NOT NULL,								# 冻结原因
  close_reason text NOT NULL,								# 关闭原因
  change_price_reason text NOT NULL,								# 关闭原因
  cancel_reason int(11) default NULL,						# 订单取消原因
  addtime timestamp NULL default NULL,						# 提交时间
  uptime timestamp NULL default NULL,						# 修改时间
  paytime timestamp NULL default NULL,						# 支付时间
  rectime timestamp NULL default NULL,						# 到货时间
  ip varchar(15) NOT NULL default '',						# 买家提交IP
  sync_flag int(11) NOT NULL default '0',					# 同步状态 （0,未同步到国内 1,已同步到国内）
  newdeliver int(11) NOT NULL default '0',					# 延长后的天数
  confirm_time timestamp NOT NULL default '0000-00-00 00:00:00',	# 确认日期
  ship_time timestamp NOT NULL default '0000-00-00 00:00:00',		# 发货时间
  close_time timestamp NOT NULL default '0000-00-00 00:00:00',		# 订单结束日期
  refund_time timestamp NOT NULL default '0000-00-00 00:00:00',		# 退款时间
  seller_new_msg int(11) NOT NULL, 									# 卖家新留言的数量
  buyer_new_msg int(11) NOT NULL,									# 买家新留言的数量
  part_ship_time timestamp NOT NULL default '0000-00-00 00:00:00',	# 发货时间
  add_recday int(11) NOT NULL default '0',							# 延长收货时间
  refundtotal decimal(15,2) NOT NULL default '0.00',				# 退款金额
  refund_reason int(11) NOT NULL default '0',						# 退款原因: 1 取消订单 2 纠纷
  refund_status int(11) NOT NULL default '0',						# 退款状态 0 不必退款 1 准备退款 2 退款失败 3 退款成功
  refund_msg varchar(500) NOT NULL default '',						# 退款的返回消息
  deposit decimal(15,2) NOT NULL default '0.00',					# 当时扣除的保证金的
  PRIMARY KEY  (oid),
  UNIQUE KEY order_code (order_code),
  KEY bid (bid),
  KEY oid_status (oid,staus),
  KEY cid (cid)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


# 买家订单同步日志表
CREATE TABLE IF NOT EXISTS buyer_order_sync_logs (
  id int(11) NOT NULL auto_increment,
  oid int(11) NOT NULL,									 # 订单ID
  status int(11) NOT NULL,								 # 订单当前状态
  old_status int(11) NOT NULL,							 # 修改前订单状态
  content text NOT NULL,		 						 # JSON格式存储的修改值
  addtime timestamp NOT NULL default CURRENT_TIMESTAMP,  # 添加时间
  sync_flag int(11) NOT NULL default 0, 				 # 同步标识: 0(未同步) 1(已经同步)

  PRIMARY KEY  (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

# 订单产品表
create table if not exists buyer_order_products (
  opid int not null auto_increment,                          # 订单产品项ID, 关联产品快照
  oid int not null default 0,                                # 订单ID
  pid int not null default 0,                                # 卖家产品ID
  cid int not null default 0,                                # 公司ID
  name varchar(255) not null default '',                         # 产品名称
  optionkey text not null default '',                            # 购物选项json格式
  quantity int not null default 0,                               # 购买数量
  price decimal(15,4) not null default '0.0000',                 # 计量单价
  tax decimal(15,4) not null default '0.0000',                   # 税费
  shpid varchar(20) not null default '',                         # 运输方式编码
  country_code varchar(3),                                       # 国家代码
  goodstotal decimal(15,4) not null default '0.0000',            # 商品总价
  shipfee decimal(15,4) not null default '0.0000',               # 运费总价,包含其他杂费
  subtotal decimal(15,4) not null default '0.0000',              # 小项总费用,此记录总价
  received tinyint not null default 0,                           # 是否已收货 0(未收) 1(已收)
  receive_date timestamp not null default '0000-00-00 00:00:00',  # 到货时间
  snapshot_id INT not null default '0',                           # 产品快照ID
  addtime timestamp not null default '0000-00-00 00:00:00',       # 加入时间

  PRIMARY KEY (opid),
  KEY oid (oid),
  KEY pid (pid),
  KEY cid (cid)
) ENGINE=InnoDB default CHARSET=utf8;

# 订单产品快照
CREATE TABLE IF NOT EXISTS product_snaps (
  id int(11) NOT NULL auto_increment,
  md5key varchar(32) NOT NULL,
  cid int(11) NOT NULL,
  pid int(11) NOT NULL,
  picid int(11) NOT NULL,
  name varchar(500) NOT NULL,
  snap text NOT NULL,
  addtime timestamp NULL default CURRENT_TIMESTAMP,

  PRIMARY KEY  (id),
  UNIQUE KEY md5key (md5key)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

# 延长发货时间
create table if not exists order_delay_delivers (
  id int not null auto_increment,
  oid int not null default 0,                                 # 订单ID
  bid int not null default 0,                                 # 买家ID
  uid int not null default 0,                                 # 操作人员
  olddeliver int not null default '0',                        # 延长前的天数
  newdeliver int not null default '0',                        # 延长后的天数
  addtime datetime not null default '1970-01-01 00:00:00',    # 增加时间
  uptime datetime not null default '1970-01-01 00:00:00',     # 修改时间
  status int not null default '0',                            # 状态。是否结束

  primary key (id),
  key oid (oid),
  key bid (bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 支付记录表
CREATE TABLE IF NOT EXISTS payment_infos (
  id int(11) NOT NULL auto_increment,
  cid int(11) NOT NULL default '0',						# 公司ID
  bid int(11) NOT NULL default '0',						# 买家ID
  oid int(11) NOT NULL default '0',						# 订单ID
  paytype tinyint(4) NOT NULL default '0',				# 支付类型
  payment_num int(11) NOT NULL default '0',				# 支付编码
  status int(11) NOT NULL default '0',					# 支付状态
  papal_transaction_code varchar(100) default NULL COMMENT '交易号',
  papal_txn_type varchar(100) default NULL COMMENT 'express_checkout',
  papal_transaction_date timestamp NULL default '0000-00-00 00:00:00' COMMENT '交易日期',
  papal_parent_txn_id varchar(100) default NULL COMMENT '退款，撤销情况下 原订单的txn_id',
  papal_custom varchar(255) default NULL COMMENT 'buyer_id',
  papal_mc_gross decimal(10,2) default NULL COMMENT '交易之前买家支付的全部金额金额',
  papal_mc_fee decimal(10,2) default NULL COMMENT '交易费',
  papal_mc_currency varchar(10) default NULL COMMENT '币种 US',
  papal_shipping decimal(10,2) default '0.00' COMMENT '运费',
  papal_payment_fee decimal(10,2) default NULL COMMENT '（美元特有）如果是美元交易，和mc_gross值相同',
  papal_payment_gross decimal(10,2) default NULL COMMENT '（美元特有）如果是美元交易，和mc_gross值相同',
  papal_payment_status varchar(20) default NULL COMMENT 'canceled-reversal：取消撤销撤销的资金返回您\n            completed：完成\n            Denied：拒绝付款\n            Failed：付款失败只有付款来源于买家银行帐户时才发生\n            Pending：款项待付\n            Refunded：退还付款\n            Reversed：撤销资金从帐户扣除返回给买家\n            Processed：付款已被接受\n            ',
  papal_pending_reason varchar(20) default NULL COMMENT 'addressaddress：款项待付，原因是买家未提供已确认的送货地址，而您的收款习惯设定设为允许手动接受或拒绝每笔此类付款。若要更改习惯设定，请前往您的用户信息中的习惯设定部分。\n            authorization：您在SetExpressCheckoutRequest上设置了<PaymentAction>Authorization</PaymentAction>，而尚未获取资金。\n            echeckecheck：款项待付，原因是其通过电子支票付款，而电子支票尚未结清',
  papal_item_number varchar(10) default NULL,
  papal_item_name varchar(50) default NULL,
  papal_quantity decimal(10,2) default NULL,
  papal_tax decimal(10,2) default NULL COMMENT '税',
  papal_verify_sign varchar(100) default NULL COMMENT 'AR7d6CCBc6pmZcBWVhpYGPIxWhP7A9RPHtIxD8wShRrmhXf5.ZI4CdDp',
  papal_receiver_id varchar(100) default NULL,
  papal_payer_id varchar(100) default NULL,
  papal_receiver_email varchar(100) default NULL,
  papal_payer_email varchar(100) default NULL,
  papal_payer_status char(10) default NULL COMMENT '是否 verify',
  papal_payer_first_name varchar(50) default NULL,
  papal_payer_last_name varchar(50) default NULL,
  papal_payer_residence_country varchar(100) default NULL,
  papal_protection_eligibility varchar(20) default NULL COMMENT 'Eligible',
  papal_payment_type char(10) default NULL COMMENT 'instant,echeck',
  papal_reason_code varchar(20) default NULL COMMENT '只有在payment_status=Reversed或Refunded时，才会设置此变量。\n            chargeback：由于买家提出扣款索偿，因此撤销这笔交易。\n            guarantee：由于买家触发退款担保，因此撤销这笔交易。\n            buyer-complaint：由于买家就交易提出投诉，因此撤销这笔交易。\n            refund：由于您向买家退款，因此撤销这笔交易。\n            other：由于上述原因以外的其他原因，撤销',
  addtime timestamp NOT NULL default '0000-00-00 00:00:00',
  uptime timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (id),
  KEY cid (cid),
  KEY bid (bid),
  KEY oid (oid)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


# 订单留言
create table if not exists order_leavewords (
  id int not null auto_increment,
  oid int not null default 0,                        # 订单ID
  bid int not null default 0,                        # 买家ID
  uid int not null default 0,                        # 操作人员
  cid int not null default 0,                        # 公司ID
  username varchar(100) not null default '',         # 冗余发布消息的用户名
  remark text not null default '',                   # 留言内容
  attachment text not null default '',               # 留言附件
  type tinyint not null default 0,                   # 留言人类型 1(buyer)  2(seller)
  viewed tinyint not null default 0,                 # 0(未读) 1(已读)
  addtime timestamp default current_timestamp,       # 增加时间

  primary key (id),
  KEY oid (oid),
  KEY bid (bid),
  KEY uid (uid)
) ENGINE=InnoDB default CHARSET=utf8;

# 纠纷订单
create table if not exists order_disputes (
  odid int not null auto_increment,                            # 纠纷id
  oid int not null default 0,                                  # 订单ID
  bid int not null default 0,                                  # 买家ID
  uid int not null default 0,                                  # 操作人员
  cid int not null default 0,                                  # 公司ID
  yourecvgoods tinyint not null default 0,                      # 是否收到货 0(未) 1(已)
  youreturn tinyint not null default 0,                         # 是否想退货 0(不退货) 1(退货)
  problemid smallint not null default 0,                       # 反馈问题列表中的选项ID
  needreturn tinyint not null default 0,                        # 是否需要退货 0(不需要) 1(需要)
  fullrefund tinyint not null default 0,                	    # 全部退款  0(否) 1(是)
  refundtotal decimal(15,2) not null default '0.000',   		# 退款金额
  addtime timestamp not null default '0000-00-00 00:00:00',     # 纠纷开始时间
  uptime timestamp not null default '0000-00-00 00:00:00',      # 纠纷状态更新时间
  endtime timestamp not null default '0000-00-00 00:00:00',     # 结束时间
  arbitime timestamp not null default '0000-00-00 00:00:00',    # 提交仲裁时间
  pact_times int not null default 0,                           # 协商次数
  status tinyint not null default 0,                           # 纠纷状态：
  isfrozen tinyint not null default 0,                         # 是否冻结
  last_dhid int not null default 0,                            # 最后一次协商ID
  remark text not null default '',                             # 备注
  operation_stuff varchar(20) default '',                      # 关闭纠纷人的id(买家 id或者 后台管理人员id )
  close_reason varchar(500),                                   # 解除纠纷原因
  arbi_dealdate timestamp not null default '1970-01-01 00:00:00', # 仲裁日期
  arbi_dealuser varchar(20),                                   # 仲裁人

  primary key (odid),
  KEY oid (oid),
  KEY bid (bid),
  KEY uid (uid)
) ENGINE=InnoDB default CHARSET=utf8;

# 纠纷协商历史
create table if not exists order_dispute_logs (
  id int not null auto_increment,                       # 纠纷协调ID
  odid int not null default 0,                          # 纠纷ID
  cid int not null default 0,                           # 公司ID
  uid int not null default 0,                           # 操作人ID buyerid, sellerid，运营平台 etc
  type tinyint not null default 0,                      # 提出者类型 0(平台) 1(买家) 2(卖家)
  yourecvgoods tinyint not null default 0,              # 是否收到货 0 未 1 收到
  needreturn tinyint not null default 0,                # 是否要求退货
  remark text not null default '',                      # 请求内容
  attachment text default '',                           # 附件
  fullrefund tinyint not null default 0,                # 全部退款  0(否) 1(是)
  refundtotal decimal(15,2) not null default '0.00',    # 退款金额
  action varchar(512) not null default '',              # 操作内容
  addtime timestamp not null default CURRENT_TIMESTAMP, #加入时间

  primary key (id)
) ENGINE=InnoDB default CHARSET=utf8;

#buyer: initiate, cancel, modify, accept, escalated , send goods
#seller: reject, accept, escalated, receive goods, drop goods

# 退货表
create table if not exists order_returns (
  orid int not null auto_increment,                     #
  oid int not null default 0,                           # 订单ID
  cid int not null default 0,                           # 公司ID
  bid int not null default 0,                           # 买家ID
  odid int not null,                                    # 关联的纠纷id
  shipmenthod varchar(256) not null default '',               # 运输方式编码
  trackno varchar(256) not null default '',              # 跟踪号
  remark text default '',
  addtime datetime not null default '1970-01-01 00:00:00',
  uptime datetime not null default '1970-01-01 00:00:00',
  is_received int not null default 0 ,
  receive_time timestamp not null default 0 ,
  drop_goods int not null default 0 ,                   # 放弃货物
  drop_goods_date timestamp not null default '0000-00-00 00:00:00' ,

  PRIMARY KEY (orid),
  KEY oid (oid),
  KEY cid (cid),
  KEY bid (bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 买家产品评论
create table if not exists product_feedbacks (
  id int not null auto_increment,
  cid int not null default 0,                           # 公司ID
  pid int not null default 0,                           # 产品ID 按type类型 0,为零 1,产品id 2,订单id 3,退货id
  bid int not null default 0,                           # 买家ID
  author varchar(64) not null default '',               # 提问买家
  question text not null default '',                    # 提问正文
  responder varchar(64) not null default '',            # 回答者
  answer  text not null default '',                     # 回复正文
  status tinyint not null default 0,                    # 评论前台展现. 0(不),1(展现)
  isread tinyint not null default 0,                    # 是否读取. 0(未回复),1(已回复) 2(回复已读)
  sisread int not null default '0',                     # 0，卖家未读 1,卖家已读
  ip varchar(15) not null default '',                   # 提问ip
  country_code varchar(3) not null default 'US',        # 国家代码
  addtime timestamp not null default CURRENT_TIMESTAMP,
  uptime timestamp not null default '0000-00-00 00:00:00',
  domain varchar(256) not null default '',              # 评论发布来源
  PRIMARY KEY (id),
  KEY pid (pid),
  KEY bid (bid),
  index pid_status(pid, status )
) ENGINE=InnoDB default CHARSET=utf8;

# 买家产品收藏
create table if not exists wishlists (
  id int not null auto_increment,
  bid int not null default 0,                    # 买家ID
  pid int not null,                              # 收藏产品ID
  cid int not null,                              # 公司id
  domain varchar(256) not null default '',       # 加入收藏操作来源
  addtime TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00', # 添加时间
  PRIMARY KEY (id),
  KEY bid (bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 买家店铺收藏
create table if not exists store_lists (
  id int not null auto_increment,
  bid int not null default 0,
  cid int not null default 0,
  addtime timestamp not null default '0000-00-00 00:00:00',
  PRIMARY KEY (id),
  INDEX bid(bid)
) ENGINE=InnoDB default CHARSET=utf8;

# 用户的产品浏览历史记录
create table if not exists viewed_histroys (
  bid int not null default 0,
  cid int not null default 0,
  pids text not null default '',
  uptime timestamp not null default '0000-00-00 00:00:00',
  PRIMARY KEY (bid,cid)
)ENGINE=InnoDB default CHARSET=utf8;


# 站内信
create table if not exists site_messages (
  id int not null auto_increment,
  bid int not null default 0,                          # 买家ID
  cid int not null default 0,                          # 关联公司
  uid int not null default 0,                          # 卖家用户ID
  body text default '',                                # 内容
  viewed tinyint not null default 0,                   # 是否已读
  type tinyint not null default 0,                     # 类型： 1 买家发布 2 卖家发布
  buy_new_msg int not null default 0,                  # 买家新消息个数
  sell_new_msg int not null default 0,                 # 卖家新消息个数
  attachments text default '',                         # 附件列表 json
  addtime timestamp not null default CURRENT_TIMESTAMP,
  uptime datetime not null default '1970-01-01 00:00:00',
  username varchar(100) NOT NULL, 					   # 用户名

  PRIMARY KEY (id),
  index bid_type (bid, type),
  index cid_type (cid, type)
) ENGINE=InnoDB default CHARSET=utf8;


# 站内信回复
create table if not exists site_message_reply(
  id int not null auto_increment,
  topic_id int not null default 0,                     # 主题ID
  bid int not null default 0,                          # 买家ID
  cid int not null default 0,                          # 关联公司
  uid int not null default 0,                          # 卖家用户ID
  body text default '',                                # 内容
  viewed tinyint not null default 0,                   # 是否已读
  type tinyint not null default 0,                     # 类型： 1 买家发布 2 卖家发布
  attachments text default '',                         # 附件列表 json
  addtime timestamp not null default CURRENT_TIMESTAMP,
  uptime timestamp not null default '0000-00-00 00:00:00',

  PRIMARY KEY (id),
  index bid_type (bid, type),
  index cid_type (bid, type)
) ENGINE=InnoDB default CHARSET=utf8;


# 公司保证金余额表
CREATE TABLE IF NOT EXISTS company_accounts (
  cid             int(11)       NOT NULL,
  isescrow        tinyint NOT NULL default 0, # 是否担保客户
  balance         decimal(10,4) NOT NULL,
  uptime          timestamp     NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  credit          decimal(15,2) NOT NULL default '1.00' COMMENT '信用系数,扣除保证金比例 0.00-1.00 默认1 即是 100%',
  line_of_credit  decimal(15,2) NOT NULL default '0.00' COMMENT '授信额度,透支的数量,默认0',
  commission_rate decimal(15,2) NOT NULL default '0.10' COMMENT '佣金比例 0-1.00 即是 0%-100% 默认10% 即是 0.10',

  PRIMARY KEY  (cid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 公司保证金变更记录表
create table if not exists company_account_logs (
  id int not null auto_increment,
  cid int not null,                                     # 公司ID
  type tinyint not null,                                # 类型：账户充值、订单扣除、订单佣金、订单完成恢复、买家赔付、关闭账户提现
  order_total decimal(10,2) not null,                   # 订单金额
  change_total decimal(10,2) not null,                  # 变更金额
  balance decimal(10,2) not null,                       # 保证金账户余额
  order_code int not null,                              # 关联订单号
  remark text not null,                                 # 备注
  addtime timestamp not null default CURRENT_TIMESTAMP,
  currency decimal(10,4),                               # 当时汇率
  rmb_amount decimal(10,2),                             # 冲值保证金才有值
  uid int not null,                                     # 操作员UID, 0(系统操作)

  PRIMARY KEY (id),
  index cid (cid)
) ENGINE=InnoDB default CHARSET=utf8;






####################################################################################################






# 产品SKU特性
create table if not exists product_sku_feature (
  psfid int not null auto_increment,                       # 产品SKU特性ID
  cid int not null default 0,                              # 公司ID
  pid int not null default 0,                              # 产品ID
  catefid int not null default 0,                          # 分类特性ID

  name varchar(64) not null,                               # 规格名称
  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime datetime not null default '1970-01-01 00:00:00',  # 更新时间

  PRIMARY KEY (psfid) # 索引需要按需调整
) engine=InnoDB default charset=utf8;


# 产品SKU特性值
create table if not exists product_sku_value (
  psvid int not null auto_increment,                       # 产品SKU特性值ID
  cid int not null default 0,                              # 公司ID
  pid int not null default 0,                              # 产品ID
  psfid int not null default 0,                            # 产品SKU特性ID
  catevid int not null default 0,                          # 分类特性值ID

  value varchar(64) not null,                              # 规格内容
  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime datetime not null default '1970-01-01 00:00:00',  # 更新时间

  PRIMARY KEY (psvid) # 索引需要按需调整
) engine=InnoDB default charset=utf8;


# 产品SKU信息
create table if not exists product_sku (
  pskuid int not null auto_increment,                      # 产品SKU的ID
  cid int not null default 0,                              # 公司ID
  pid int not null default 0,                              # 产品ID
  psvid1 int not null default 0,                           # 产品规格内容ID_1，如果无规格：0
  psvid2 int not null default 0,                           # 产品规格内容ID_2，如果只有一个维度：0

  left_num int not null default 0,                         # 备货数量
  price decimal(15,2) not null default '0.00',             # 价格 (单位:美元)
  innercode varchar(64) default '',                        # 产品内部编码

  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime datetime not null default '1970-01-01 00:00:00',  # 更新时间

  status tinyint not null default 0,                       # 0(正常),1(删除)

  PRIMARY KEY (pskuid) # 索引需要按需调整
) engine=InnoDB default charset=utf8;


# 批发价，需要开启products_uncheck::wholesale_support字段
create table if not exists product_wholesale (
  pwsid int not null auto_increment,                       # 批发价ID
  cid int not null default 0,                              # 公司ID
  pid int not null default 0,                              # 产品ID

  wholesale_num int not null default 0,                    # 批发价最小起订量
  wholesale_off int not null default '0',                  # 批发减免率

  addtime timestamp not null default current_timestamp,    # 添加时间
  uptime datetime not null default '1970-01-01 00:00:00',  # 更新时间

  PRIMARY KEY (pwsid) # 索引需要按需调整
) engine=InnoDB default charset=utf8;

#多个规格的评论，只能有一条记录
CREATE TABLE IF NOT EXISTS review_info (
    id int(11) NOT NULL auto_increment,
    pid int(11) NOT NULL,
    user_id int NOT NULL,
    user_name varchar(255) default NULL,
    score tinyint NOT NULL,
    status tinyint default 0, #0 正常 1 删除
    comment varchar(1024) default NULL,
    addtime timestamp not null default CURRENT_TIMESTAMP,
    uptime datetime not null default '1970-01-01 00:00:00',
    PRIMARY KEY  (id),
    KEY userIndex (user_id),
    UNIQUE KEY pid_user (pid,user_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS review_stat (
    pid int(11) NOT NULL,
    star_1 int default 0,
    star_2 int default 0,
    star_3 int default 0,
    star_4 int default 0,
    star_5 int default 0,
    score_all int,
    peoplenums_all int,
    addtime timestamp not null default CURRENT_TIMESTAMP,
    uptime datetime not null default '1970-01-01 00:00:00',
    PRIMARY KEY  (pid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;