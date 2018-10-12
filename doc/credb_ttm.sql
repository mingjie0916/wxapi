/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2011-8-18 9:14:26                            */
/*==============================================================*/


drop table if exists T_BS_BILL_ADDR;

drop table if exists T_BS_BUYER_COMP;

drop table if exists T_BS_BUYER_INFO;

drop table if exists T_BS_BUYER_LOGINLOG;

drop table if exists T_BS_COMP_CATEGORY;

drop table if exists T_BS_SHIP_ADDR;

drop table if exists T_EDM_CATEGORIES;

drop table if exists T_EDM_USER_CATEGORIES;

drop table if exists T_EDM_USER_CUSTOM_CAT;

drop table if exists T_FS_BANKINFO_MODIFYLOG;

drop table if exists T_FS_GL;

drop table if exists T_FS_PAYMENT_INFO;

drop table if exists T_FS_REQCASH_INFO;

drop table if exists T_FS_SL;

drop table if exists T_IDX_IDXPROD;

drop table if exists T_IDX_TMP_CATE;

drop table if exists T_IDX_TMP_CATE2;

drop table if exists T_OS_ORDER_INFO;

drop table if exists T_OS_ORDER_ITEMS;

drop table if exists T_OS_ORDER_ITEMS_PRODINFO;

drop table if exists T_OS_ORDER_LOG;

drop table if exists T_OS_PRODPRICE_SNAPSHOT;

drop table if exists T_REP_BUYER;

drop table if exists T_REP_DAILYREPORT;

drop table if exists T_REP_SELLER_PRO;

drop table if exists T_RS_GOODS_ENQ;

drop table if exists T_RS_MSG;

drop table if exists T_RS_REVIEW;

drop table if exists T_SS_ABORDER_INFO;

drop table if exists T_SS_ABORDER_ITEMS;

drop table if exists T_SS_ATTR;

drop table if exists T_SS_ATTRVALUE;

drop table if exists T_SS_BASECAT_GROUP;

drop table if exists T_SS_BASE_CAT;

drop table if exists T_SS_COMP_CATEGORY;

drop table if exists T_SS_GOODS;

drop table if exists T_SS_GOODS_OPTION;

drop table if exists T_SS_GOODS_PRICE;

drop table if exists T_SS_GOODS_SHIPTYPE;

drop table if exists T_SS_OP_LOG;

drop table if exists T_SS_ORDER_CONTROL;

drop table if exists T_SS_ORDER_LOG;

drop table if exists T_SS_PRODSALE_ATTR;

drop table if exists T_SS_PRODUCT;

drop table if exists T_SS_PRODUCT_SALE;

drop table if exists T_SS_PROD_ATTR;

drop table if exists T_SS_PROD_OPTION;

drop table if exists T_SS_PROD_PRICE;

drop table if exists T_SS_PROD_PROHIBITWORDS;

drop table if exists T_SS_PROD_SHIPTYPE;

drop table if exists T_SS_QUESTION_ANSWER;

drop table if exists T_SS_QUESTION_CATEGORY;

drop table if exists T_SS_SALE_CAT;

drop table if exists T_SS_SALE_CAT_RELATION;

drop table if exists T_SS_SELLER_AUTH;

drop table if exists T_SS_SELLER_COMP;

drop table if exists T_SS_SELLER_CREDIT;

drop table if exists T_SS_SELLER_INFO;

drop table if exists T_SS_SELLER_LEVEL;

drop table if exists T_SS_SELLER_LOGINLOG;

drop table if exists T_SS_SELLER_ORDER;

drop table if exists T_SS_SHPMODEL;

drop table if exists T_SS_SHPMODEL_ITEMS;

drop table if exists T_SS_SHPTYPE_DISCOUNT;

drop table if exists T_SS_VALUE_TO_ATTRANDVALUE;

drop table if exists T_SURVEY_ANSWER;

drop table if exists T_SURVEY_PAPER;

drop table if exists T_SURVEY_QUESTION;

drop table if exists T_SURVEY_USERANSWER;

drop table if exists T_SYS_DISPUTE;

drop table if exists T_SYS_DISPUTE_PACT_DETAIL;

drop table if exists T_SYS_GEO;

drop table if exists T_SYS_MAILQUEUE;

drop table if exists T_SYS_PAYTYPE;

drop table if exists T_SYS_PROD_SEC;

drop table if exists T_SYS_PROD_SEC_POWER;

drop table if exists T_SYS_RESEARCH;

drop table if exists T_SYS_SHIPPING_PRICE;

drop table if exists T_SYS_SHIPPING_REGION;

drop table if exists T_SYS_SHPTYPE;

drop table if exists T_SYS_SYSTEM_FLAG;

drop table if exists t_sys_sec_popular_search;

drop table if exists t_sys_sec_recommended_prod;

/*==============================================================*/
/* Table: T_BS_BILL_ADDR                                        */
/*==============================================================*/
create table T_BS_BILL_ADDR
(
   bill_addr_id         int(10) not null auto_increment comment 'bill收货地址ID',
   buyer_id             int(10) comment '买家ID',
   dt                   datetime,
   status               char(10) comment '状态（1-默认地址）',
   company_name         varchar(100) comment 'bill公司',
   contact_name         varchar(100) comment 'bill姓名',
   addr_line1           varchar(500) comment 'bill地址栏1',
   addr_line2           varchar(500) comment 'bill地址栏2',
   city                 varchar(100) comment 'bill市',
   province             varchar(100) comment 'bill省、州',
   country              varchar(100) comment 'bill国家',
   postal_code          varchar(100) comment 'bill邮编',
   phone_number         varchar(100) comment 'bill电话号码',
   fax_number           varchar(100) comment 'bill传真',
   primary key (bill_addr_id)
)
type = MYISAM;

alter table T_BS_BILL_ADDR comment '买家BILL地址信息表';

/*==============================================================*/
/* Table: T_BS_BUYER_COMP                                       */
/*==============================================================*/
create table T_BS_BUYER_COMP
(
   buyer_id             int(10) not null comment '买家ID',
   cat_code             char(6) comment '分类编码',
   comp_name            varchar(256) comment '公司名称',
   compdesc             text comment '公司描述',
   comptype             char(4) comment '公司类型,可以预定义公司类型',
   addr                 varchar(256) comment '公司地址',
   linkman_fname        varchar(16) comment '联系人 姓',
   linkman_lname        varchar(16) comment '联系人 名',
   linkman_sex          char(1) comment '性别（1-女，2-男）',
   country              varchar(100) comment '国家',
   state                varchar(100) comment '州',
   city                 varchar(100) comment '城市',
   postcode             varchar(50) comment '邮编',
   mobile               varchar(100) comment '手机',
   fax                  varchar(100) comment '传真',
   skype                varchar(100) comment 'skype',
   msn                  varchar(100) comment 'msn',
   biz_email            varchar(100) comment '商业EMAIL',
   biz_phone            varchar(100) comment '商业电话',
   webpage              varchar(300) comment '公司网址',
   primary key (buyer_id)
)
type = MYISAM;

alter table T_BS_BUYER_COMP comment '买家公司信息';

/*==============================================================*/
/* Table: T_BS_BUYER_INFO                                       */
/*==============================================================*/
create table T_BS_BUYER_INFO
(
   buyer_id             int(10) not null auto_increment comment '买家ID',
   email                varchar(64) comment '买家登录名',
   passwd               varchar(32) comment '登录密码MD5',
   nickname             varchar(16) comment '昵称',
   reg_date             datetime comment '注册时间',
   reg_ip               varchar(32) comment '注册ip地址',
   buyerstatus          char(1) comment '状态
            （1-邮件待验证
            4-正常
            5-冻结）',
   buyertype            char(1) comment '类型',
   isActived            bool comment '是否激活',
   actived_date         datetime comment '激活时间',
   freeze_date          datetime comment '冻结日期',
   freeze_user          varchar(20) comment '冻结操作原',
   buyer_score          int comment '信用积分',
   primary key (buyer_id)
)
type = MYISAM;

alter table T_BS_BUYER_INFO comment '买家基本信息';

/*==============================================================*/
/* Table: T_BS_BUYER_LOGINLOG                                   */
/*==============================================================*/
create table T_BS_BUYER_LOGINLOG
(
   logid                int(12) not null auto_increment comment '日志id',
   buyer_id             int(10) comment '买家id',
   login_dt             datetime comment '登陆时间',
   logout_dt            datetime comment '退出时间',
   login_ip             varchar(30) comment '登陆ip',
   primary key (logid)
)
type = MYISAM;

alter table T_BS_BUYER_LOGINLOG comment '买家登陆日志';

/*==============================================================*/
/* Table: T_BS_COMP_CATEGORY                                    */
/*==============================================================*/
create table T_BS_COMP_CATEGORY
(
   cat_code             char(6) not null comment '分类编码',
   cat_name             varchar(100) comment '分类名称',
   primary key (cat_code)
)
type = MYISAM;

alter table T_BS_COMP_CATEGORY comment '公司分类表';

/*==============================================================*/
/* Table: T_BS_SHIP_ADDR                                        */
/*==============================================================*/
create table T_BS_SHIP_ADDR
(
   ship_addr_id         int(10) not null auto_increment comment '买家收货地址ID',
   buyer_id             int(10) comment '买家ID',
   dt                   datetime,
   status               char(1) comment '状态（1-默认地址）',
   company_name         varchar(100) comment '收件人公司',
   contact_name         varchar(100) comment '收件人姓名',
   addr_line1           varchar(500) comment '地址栏1',
   addr_line2           varchar(500) comment '地址栏2',
   city                 varchar(100) comment '市',
   province             varchar(100) comment '省、州',
   country              varchar(100) comment '国家',
   postal_code          varchar(100) comment '邮编',
   phone_number         varchar(100) comment '电话号码',
   fax_number           varchar(100) comment '传真',
   primary key (ship_addr_id)
)
type = MYISAM;

alter table T_BS_SHIP_ADDR comment '买家收货地址信息表';

/*==============================================================*/
/* Table: T_EDM_CATEGORIES                                      */
/*==============================================================*/
create table T_EDM_CATEGORIES
(
   category_id          int not null auto_increment comment '类目id',
   category_name        varchar(200) comment '类目名',
   create_dt            datetime comment '创建日期',
   create_user          varchar(100) comment '创建者',
   category_status      char(1) comment '类目状态（1-正常、2-删除）',
   primary key (category_id)
);

alter table T_EDM_CATEGORIES comment 'EDM类目表';

/*==============================================================*/
/* Table: T_EDM_USER_CATEGORIES                                 */
/*==============================================================*/
create table T_EDM_USER_CATEGORIES
(
   id                   int not null auto_increment comment '自增id',
   user_id              int comment '用户id',
   user_type            char(1) comment '用户状态(1-买家、2-卖家)',
   category_id          int comment '类目id',
   primary key (id)
);

alter table T_EDM_USER_CATEGORIES comment '分类edm发送列表';

/*==============================================================*/
/* Table: T_EDM_USER_CUSTOM_CAT                                 */
/*==============================================================*/
create table T_EDM_USER_CUSTOM_CAT
(
   id                   int not null auto_increment comment 'id',
   user_id              int comment '用户id',
   custom_cat_desc      varchar(500) comment '定制分类的描述',
   create_date          datetime comment '创建日期',
   primary key (id)
);

alter table T_EDM_USER_CUSTOM_CAT comment '用户定制的分类';

/*==============================================================*/
/* Table: T_FS_BANKINFO_MODIFYLOG                               */
/*==============================================================*/
create table T_FS_BANKINFO_MODIFYLOG
(
   id                   int not null auto_increment comment 'id',
   user_id              varchar(20) comment '操作员id',
   modify_dt            datetime comment '更新日期',
   seller_id            int comment 'sellerid',
   oldinfo              varchar(500) comment '修改前信息',
   newinfo              varchar(500) comment '修改后信息',
   reason               varchar(500) comment '修改原因',
   primary key (id)
)
type = MYISAM;

alter table T_FS_BANKINFO_MODIFYLOG comment '修改seller银行信息日志';

/*==============================================================*/
/* Table: T_FS_GL                                               */
/*==============================================================*/
create table T_FS_GL
(
   gl_id                int not null auto_increment comment '帐户id',
   gl_name              varchar(100) comment '帐户名称',
   user_id              int comment '用户id',
   gl_type              char(1) comment '帐户类型
            （
            1-入账过渡户，
            2-出账过渡户，
            3-ttm帐户，
            4-买家帐户，
            5-卖家帐户，
            6-卖家现金帐户，
            7-卖家保证金帐户，
            8-卖家冻结资金帐户（纠纷资金账号），
            9-ttm利润账号
            ）
            （注：
            买家通过信用卡、paypal等渠道付款成功时，
            买家帐户加（借），入账过渡户减（贷）；之后，ttm帐户加（借），买家帐户减（贷）；
            卖家请款成功时（确认收货后），
            卖家帐户加（借），卖家保证金帐户加（借），ttm利润帐户加，ttm帐户减（贷）；
            卖家提现成功时，
            卖家现金帐户加（借），卖家帐户减（贷）；
            
            纠纷产生时（情况1，资金处于ttm帐户中），
            帐户无变化；
            纠纷产生时（情况2，资金处于卖家帐户中），
            卖家帐户减（贷），卖家纠纷帐户加（借）；
            
            退款成功时（情况1，资金处于ttm帐户中），
            买家帐户加（借），ttm帐户减（贷）；之后，出账过渡户加（借），买家帐户减（贷）；
            退款成功时（情况2，资金处于卖家帐户中），
            买家帐户加（借），卖家帐户减（贷）；之后，出账过渡户加（借），买家帐户减（贷）；
            退款成功时（情况3，资金处于卖家现金帐户中），
            买家帐户加（借），卖家帐户减（贷）；之后，出账过渡户加（借），买家帐户减（贷）；
            
            解除纠纷解除纠纷没有形成退款时（情况1，资金处于ttm帐户中），
            帐户无变化；
            解除纠纷没有形成退款时（情况2，资金处于卖家纠纷帐户中）
            卖家纠纷帐户减（贷），卖家帐户加（借）；
            
            返还保证金期限到时，
            卖家保证金帐户减（贷），卖家帐户加（借）
            ）',
   gl_status            char(1) comment '帐户状态（）',
   gl_risklevel         char(1) comment '帐户风险等级',
   gl_amount            numeric(10,2) comment '帐户余额',
   bank_ename           varchar(100) comment '开户人英文名称（只有帐户类型是seller现金帐户的才有开户行等信息）',
   bank_cname           varchar(100) comment '开户人中文名称',
   bank_country         varchar(100) comment '开户人国家',
   bank_city            varchar(100) comment '开户人城市',
   bank_swiftcode       varchar(100) comment '电汇编码',
   bank_number          varchar(100) comment '银行账号',
   bank_addr_cn         varchar(100) comment '开户人地址中文',
   bank_addr_en         varchar(100) comment '开户人地址英文',
   bank_bankaddr_cn     varchar(100) comment '银行地址中文',
   bank_bankaddr_en     varchar(100) comment '银行地址英文',
   bank_bankname_cn     varchar(100) comment '银行名称中文',
   bank_bankname_en     varchar(100) comment '银行名称英文',
   bank_agentbankname_cn varchar(100) comment '代理行名称中文',
   bank_agentbankname_en varchar(100) comment '代理行名称英文',
   bank_agentbankaddr_cn varchar(100) comment '代理行地址中文',
   bank_agentbankaddr_en varchar(100) comment '代理行地址英文',
   bank_agentbank_number varchar(100) comment '代理行账号',
   primary key (gl_id)
)
type = InnoDB;

alter table T_FS_GL comment '总账表（general ledger）';

/*==============================================================*/
/* Table: T_FS_PAYMENT_INFO                                     */
/*==============================================================*/
create table T_FS_PAYMENT_INFO
(
   pay_id               int not null auto_increment comment 'id',
   finance_flag         char(1) comment '财务标识（0-未入账，1-已入账（即已经更新gl和sl表））',
   pay_type             varchar(20) comment '支付类型（papal、银行转账、西联）',
   pay_serialnum        char(21) comment '支付流水号，作为不重复交易的标识',
   order_code           varchar(1000) comment '订单号(多个订单号的集合，以备后查)',
   confirm_user         varchar(20) comment '财务确认人员',
   confirm_dt           datetime comment '财务确认日期',
   confirm_remark       varchar(500) comment '财务确认备注',
   bank_sendername      varchar(100) comment '银行转账付款人姓名',
   bank_amount          numeric(10,2) comment '银行转账金额',
   bank_paymentdate     datetime comment '银行转账日期',
   bank_address         varchar(100) comment '地址',
   bank_country         varchar(100) comment '国家',
   wu_controlnumber     varchar(100) comment '西联控制码',
   wu_sendername        varchar(100) comment '西联支付人姓名',
   wu_amount            numeric(10,2) comment '西联支付金额',
   wu_paymentdate       datetime comment '西联支付日期',
   wu_address           varchar(100) comment '地址',
   wu_country           varchar(100) comment '国家',
   cc_country           varchar(50),
   cc_fname             varchar(100),
   cc_lname             varchar(100),
   cc_ccnumber          varchar(100),
   cc_paytype           varchar(100),
   cc_expirationdate    datetime,
   cc_address1          varchar(100),
   cc_address2          varchar(100),
   cc_city              varchar(100),
   cc_state             varchar(100),
   cc_postcode          varchar(100),
   cc_hometelephone     varchar(100),
   cc_email             varchar(100),
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
   papal_payment_type   char(10) comment 'instant、echeck',
   papal_reason_code    varchar(20) comment '只有在payment_status=Reversed或Refunded时，才会设置此变量。
            chargeback：由于客户提出扣款索偿，因此撤销这笔交易。
            guarantee：由于客户触发退款担保，因此撤销这笔交易。
            buyer-complaint：由于客户就交易提出投诉，因此撤销这笔交易。
            refund：由于您向客户退款，因此撤销这笔交易。
            other：由于上述原因以外的其他原因，撤销这笔交易。
            ',
   primary key (pay_id)
)
type = InnoDB;

alter table T_FS_PAYMENT_INFO comment '买家支付信息表';

/*==============================================================*/
/* Table: T_FS_REQCASH_INFO                                     */
/*==============================================================*/
create table T_FS_REQCASH_INFO
(
   reqcash_id           int not null auto_increment comment '申请id',
   order_code           varchar(1000) comment '订单号',
   seller_id            int comment '卖家id（冗余）',
   rc_type              char(1) comment '类型
            （
            1-确认收货,
            3-seller提现,
            4-退款,
            5-取消退款,
            6-取消提现,
            7-调账,//临时使用
            8-纠纷,
            9-解除纠纷,
            10--保证金扣押
            11-保证金返还
            ）',
   amount               numeric(10,2) comment '金额',
   req_dt               datetime comment '申请日期',
   comfirm_user         varchar(20) comment '财务确认人员',
   comfirm_dt           datetime comment '财务确认日期',
   comfirm_remark       varchar(500) comment '财务确认备注信息',
   remit_user           varchar(20) comment '汇款人',
   remit_date           datetime comment '汇款日期',
   remit_remark         varchar(500) comment '汇款备注',
   refund_req_user      varchar(20) comment '退款申请人',
   refund_req_date      datetime comment '退款申请日期',
   refund_req_remark    varchar(500) comment '退款申请备注',
   primary key (reqcash_id)
)
type = MYISAM;

alter table T_FS_REQCASH_INFO comment '卖家请款提现信息表';

/*==============================================================*/
/* Table: T_FS_SL                                               */
/*==============================================================*/
create table T_FS_SL
(
   sl_id                int not null auto_increment comment '明细账id',
   gl_id                int comment '帐户id',
   sl_type              char(1) comment '明细类型
            （
            1-付款，2-请款，
            3-提现，4-退款，
            5-拒付，6-纠纷，
            7-保证金
            ）',
   sl_amount            numeric(10,2) comment '金额',
   sl_direct            char(1) comment '资金流转方向（即借还是贷）',
   sl_balance           numeric(10,2) comment '帐户余额',
   sl_dt                datetime comment '发生时间',
   about_id             int comment '关联id
            （
            付款关联pay_id，
            请款、提现、退款、拒付对应reqcash_id
            
            卖家情况表或买家payment表
            ）',
   op_user              varchar(20) comment '操作员',
   remark               varchar(500) comment '备注',
   primary key (sl_id)
)
type = InnoDB;

alter table T_FS_SL comment '明细账（subsidiary ledger）';

/*==============================================================*/
/* Table: T_IDX_IDXPROD                                         */
/*==============================================================*/
create table T_IDX_IDXPROD
(
   id                   int not null auto_increment,
   prod_id              int comment '产品id',
   sku                  varchar(100) comment '产品唯一编码',
   prod_ename           varchar(300) comment '英文名',
   keyword_desc         varchar(500) comment '关键词描述',
   long_desc            text comment '长描述',
   short_desc           varchar(500) comment '短描述',
   related_kw           varchar(512) comment '关键词',
   last_update_dt       datetime comment '最后更新时间',
   bc_id                int,
   sc_id                tinytext,
   min_price            double,
   max_price            double,
   attrs                tinytext,
   seller_id            tinytext,
   primary key (id)
)
type = MYISAM;

alter table T_IDX_IDXPROD comment '引擎临时表';

/*==============================================================*/
/* Table: T_IDX_TMP_CATE                                        */
/*==============================================================*/
create table T_IDX_TMP_CATE
(
   Leaf_cate_id         int unsigned,
   update_time          timestamp comment '日期',
   primary key ()
)
type = MYISAM;

alter table T_IDX_TMP_CATE comment '引擎临时表';

/*==============================================================*/
/* Table: T_IDX_TMP_CATE2                                       */
/*==============================================================*/
create table T_IDX_TMP_CATE2
(
   prod_id              int unsigned,
   update_time          timestamp comment '日期',
   primary key ()
)
type = MYISAM;

alter table T_IDX_TMP_CATE2 comment '引擎临时表';

/*==============================================================*/
/* Table: T_OS_ORDER_INFO                                       */
/*==============================================================*/
create table T_OS_ORDER_INFO
(
   order_code           char(18) not null comment '订单编号（例：2008103015280038）',
   buy_serialnum        char(21) comment '购买流水号（例：buy200810301426390027）',
   pay_serialnum        char(21) comment '支付流水号（例：pay200810301426390027）
            注：有此支付号的不一定已经成功支付，只是表示用户进行了一次支付行为。
            需要在支付表中查看该订单是否支付成功。',
   buyer_id             int(10) comment '买家ID',
   seller_id            int comment '卖家id',
   csr                  varchar(100) comment '订单来源',
   dispute_flag         char(1) comment '纠纷标识（0-无纠纷，1-纠纷）',
   cancel_flag          char(1) comment '订单取消标识',
   delete_flag          char(1) comment '删除订单标识（1-删除）',
   submit_date          datetime comment '订单提交时间（未付款状态）',
   ip                   varchar(30) comment '订单提交时的IP',
   receive_date         datetime comment '订单收货时间（已收货状态）',
   pay_date             datetime comment '付款时间（已付款状态）
            注：如果是线上支付，那么paypal返回支付成功信息后填写该字段。
            如果是线下支付，那么需要运营人员确认货款到账后填写该字段。',
   tran_order_comfirm_date datetime comment '买家确认转单日期',
   tran_order_comfirm_flag int comment '确认转单标识',
   tran_order_flag      int comment '转单标识',
   goods_price          numeric(10,2) comment '商品总价（产品标价）',
   goods_call_price     numeric(10,2) comment '商品结算价（打折或者由于用户等级等原因缠上的结算价）',
   traffic_price        numeric(10,2) comment '运费总价（运费标价）',
   traffic_call_price   numeric(10,2) comment '运费结算价（打折或者由于用户等级等原因缠上的结算价）',
   order_price          numeric(10,2) comment '订单总价（产品总价+运费总价）',
   order_call_price     numeric(10,2) comment '订单结算价（产品结算价+运费结算价）',
   transaction_cost     numeric(10,4) comment '当时佣金比例',
   order_final_paydiscount_price numeric(10,2) comment '最终支付折扣价（由于用户选择了不同的支付方式而获得折扣后，在最终订单价格基础上进行折扣后的价格）',
   pay_type             varchar(20) comment '支付类型（1表示通过paypal支付）',
   update_date          datetime comment '订单最后更新时间',
   order_status         int comment '订单状态
            （
            1-未支付状态
            2-支付中状态
            3-已支付状态
            4-待发货状态
            5-已发货状态
            6-收货待验证
            7-平台已验证
            8-已收货状态
            ）',
   syn_flag             char(1) comment '同步状态（0-尚未同步到国内库，1-已经同步到国内库）',
   remark               varchar(500) comment '备注',
   shipaddr_company_name varchar(100) comment '收货人公司',
   shipaddr_contact_name varchar(100) comment '收货人姓名',
   shipaddr_addr_line1  varchar(500) comment '收货人地址',
   shipaddr_addr_line2  varchar(500) comment '收货人地址',
   shipaddr_city        varchar(100) comment '收货人城市',
   shipaddr_province    varchar(100) comment '收货人省份',
   shipaddr_country     varchar(100) comment '收货人国家',
   shipaddr_postal_code varchar(100) comment '收获邮编',
   shipaddr_phone_number varchar(100) comment '收货人电话',
   shipaddr_fax_number  varchar(100) comment '收货人传真',
   billaddr_company_name varchar(100) comment 'bill公司',
   billaddr_contact_name varchar(100) comment 'bill联系人',
   billaddr_addr_line1  varchar(500) comment 'bill地址',
   billaddr_addr_line2  varchar(500) comment 'bill地址',
   billaddr_city        varchar(100) comment 'bill城市',
   billaddr_province    varchar(100) comment 'bill省份',
   billaddr_country     varchar(100) comment 'bill国家',
   billaddr_postal_code varchar(100) comment 'bill邮编',
   billaddr_phone_number varchar(100) comment 'bill电话',
   billaddr_fax_number  varchar(100) comment 'bill传真',
   paypal_email         varchar(100),
   paypal_userid        varchar(100),
   paypal_userstatus    varchar(100),
   paypal_username      varchar(100),
   paypal_username2     varchar(100),
   paypal_country       varchar(100),
   paypal_recv_name     varchar(100),
   paypal_recv_street   varchar(100),
   paypal_recv_city     varchar(100),
   paypal_recv_state    varchar(100),
   paypal_recv_postcode varchar(100),
   paypal_recv_countrycode varchar(100),
   paypal_recv_countryname varchar(100),
   paypal_recv_addressstatus varchar(100),
   paypal_tel           varchar(100),
   primary key (order_code)
)
type = MYISAM;

alter table T_OS_ORDER_INFO comment '订单信息表';

/*==============================================================*/
/* Table: T_OS_ORDER_ITEMS                                      */
/*==============================================================*/
create table T_OS_ORDER_ITEMS
(
   item_id              int(10) not null auto_increment comment '订单详细项id',
   order_code           char(18) comment '订单编号',
   goods_id             int(10) comment '商品ID',
   price_spec           varchar(100) comment '规格（定价时的规格）',
   goods_num            numeric(10,2) comment '产品数量',
   goods_attr_value     varchar(500) comment '必选属性（不影响价格的必选属性值对，key=>value格式）',
   shp_type             char(1) comment '运输方式（EMS/UPS/FEDEX等）',
   shp_normal           char(1) comment '运费标识（标准运费、自定义运费）',
   shp_geocode          varchar(100) comment '运输国家（自定义运费时需要限定运输国家）',
   shp_fee              numeric(10,2) comment '运费（根据相关条件计算出来的运费）',
   seller_price         numeric(10,2) comment '供应商价格',
   web_price            numeric(10,2) comment '网络报价（加上交易佣金）',
   delivery_days        int comment '交货天数',
   seller_id            int comment '卖家id',
   prod_ename           varchar(300) comment '产品名称',
   review_id            int comment '评论id（标识该商品时候已经被评论）',
   delete_flag          char(1) comment '订单明细项状态（1-删除）',
   primary key (item_id)
)
type = MYISAM;

alter table T_OS_ORDER_ITEMS comment '订单明细表';

/*==============================================================*/
/* Table: T_OS_ORDER_ITEMS_PRODINFO                             */
/*==============================================================*/
create table T_OS_ORDER_ITEMS_PRODINFO
(
   item_id              int(10) not null comment '订单详细项id',
   order_code           char(18) comment '订单编号',
   prod_ename           varchar(300) comment '产品名称',
   prod_cname           varchar(300) comment '中文名',
   prod_status          char(1) comment '产品状态',
   prod_catcode         int comment '产品分类',
   pack_type            char(1) comment '包装类型',
   prod_unit            varchar(20) comment '产品单位',
   dozen_mount          numeric(10,2) comment '打包（如果打包卖的话，每包多少个产品）',
   prod_length          numeric(10,2) comment '长',
   prod_width           numeric(10,2) comment '宽',
   prod_high            numeric(10,2) comment '高',
   prod_weight          numeric(10,2) comment '重',
   keyword_Desc         varchar(500),
   description          varchar(2000),
   specification_html   varchar(500),
   spe_desc             varchar(500),
   smallpic_path        varchar(200),
   bigpic_path          varchar(200),
   keyvalue_desc        text,
   tag                  varchar(500),
   origin               varchar(200),
   isdisplayed          int,
   effectivetime        datetime,
   remark               varchar(200) comment '备注（buyer填写的）',
   primary key (item_id)
)
type = MYISAM;

alter table T_OS_ORDER_ITEMS_PRODINFO comment '订单明细表';

/*==============================================================*/
/* Table: T_OS_ORDER_LOG                                        */
/*==============================================================*/
create table T_OS_ORDER_LOG
(
   logid                int not null auto_increment comment 'id',
   opdt                 datetime comment '操作日期',
   opip                 varchar(100) comment 'ip地址',
   userid               varchar(100) comment '操作者',
   optype               char(1) comment '流水类型（1-状态迁移，2-标识转换）',
   order_operation      varchar(500) comment '订单操作描述',
   order_code           varchar(20) comment '订单编号',
   primary key (logid)
)
type = MYISAM;

alter table T_OS_ORDER_LOG comment '买家订单操作流水（记录订单状态的迁移、订单标识的转换过程）';

/*==============================================================*/
/* Table: T_OS_PRODPRICE_SNAPSHOT                               */
/*==============================================================*/
create table T_OS_PRODPRICE_SNAPSHOT
(
   snapshot_id          int not null auto_increment comment '自增id',
   order_code           varchar(18) comment '订单号',
   prod_price_id        int comment '价格id',
   goods_id             int comment '产品编号',
   prod_spe             varchar(200) comment '规格',
   start_pur_mount      numeric(10,2) comment '起始数量',
   end_pur_mount        numeric(10,2) comment '截止数量',
   seller_price         numeric(10,2) comment '价位',
   discount_price       numeric(10,2) comment '折扣价位',
   delivery_days        int comment '交货天数',
   primary key (snapshot_id)
);

alter table T_OS_PRODPRICE_SNAPSHOT comment '订单产品价格快照表';

/*==============================================================*/
/* Table: T_REP_BUYER                                           */
/*==============================================================*/
create table T_REP_BUYER
(
   id                   int not null auto_increment,
   dt                   datetime comment '日期',
   buyer_id             int comment 'buyerid',
   orders_sum           numeric(10) comment '下单总数',
   orders_amount_sum    numeric(10,2) comment '下单总金额',
   orders_pay_sum       numeric(10) comment '支付订单总数',
   orders_payamount_sum numeric(10,2) comment '支付订单总金额',
   send_message_sum     numeric(10) comment '发送消息条数',
   rec_message_sum      numeric(10) comment '收到消息条数',
   primary key (id)
)
type = MYISAM;

alter table T_REP_BUYER comment '买家统计';

/*==============================================================*/
/* Table: T_REP_DAILYREPORT                                     */
/*==============================================================*/
create table T_REP_DAILYREPORT
(
   id                   int not null auto_increment,
   dt                   datetime comment '日期',
   type                 char(1) comment '类型（1-日报）',
   usr_buyer_notvaild   numeric(10) comment '累计未验证买家',
   usr_buyer_vaild      numeric(10) comment '累计已验证买家',
   usr_buyer_regnum     numeric(10) comment '当天注册量买家',
   usr_seller_notvalid  numeric(10) comment '累计未验证卖家',
   usr_seller_valid     char(10) comment '累计已验证卖家',
   usr_seller_valid_notverify numeric(10) comment '累计已验证&累计未认证卖家 ',
   usr_seller_valid_verify numeric(10) comment '累计已验证&累计已认证卖家 ',
   usr_seller_regnum    numeric(10) comment '当天注册量卖家',
   usr_seller_daily_pass numeric(10) comment '身份认证',
   usr_seller_daily_refuse numeric(10) comment '身份认证',
   order_new_nopay      numeric(10) comment '新增订单中未支付订单数',
   order_new_pay        numeric(10) comment '新增订单中已支付订单数',
   order_old_pay        numeric(10) comment '历史生成订单在统计日发生支付',
   order_all_pay        numeric(10) comment '统计日累计发生支付的订单',
   order_all_amount     numeric(10,2) comment '统计日累计支付金额',
   order_arpo           numeric(10) comment 'ARPO',
   order_complain       numeric(10) comment '统计日发生纠纷订单',
   order_refund         numeric(10) comment '统计日发生退款订单',
   order_refund_amount  numeric(10,2) comment '统计日发生退款金额',
   order_chargeback     numeric(10) comment '统计日发生chargrback笔数（paypal中统计）',
   order_chargeback_amount numeric(10,2) comment '统计日发生chargrback金额（paypal中统计）',
   product_all          numeric(10) comment '统计产品总数',
   product_online       numeric(10) comment '统计已上架产品总数',
   product_new          numeric(10) comment '统计日增产品总数',
   product_new_online   numeric(10) comment '统计日新增上架产品总数',
   primary key (id)
)
type = MYISAM;

alter table T_REP_DAILYREPORT comment '日报表';

/*==============================================================*/
/* Table: T_REP_SELLER_PRO                                      */
/*==============================================================*/
create table T_REP_SELLER_PRO
(
   id                   int not null auto_increment,
   dt                   datetime comment '日期',
   seller_id            int comment 'sellerid',
   prod_sum             numeric(10) comment '产品总数',
   prod_offline_sum     numeric(10) comment '下架产品总数',
   prod_online_sum      numeric(10) comment '上架产品总数',
   prod_forceoffline_sum numeric(10) comment '强制下架产品总数',
   primary key (id)
)
type = MYISAM;

alter table T_REP_SELLER_PRO comment '卖家产品统计';

/*==============================================================*/
/* Table: T_RS_GOODS_ENQ                                        */
/*==============================================================*/
create table T_RS_GOODS_ENQ
(
   goods_enq_id         int not null auto_increment comment '商品询盘ID',
   goods_enq_parentid   int comment '父id',
   goods_id             int comment '商品号',
   rw_status            char(1) comment '评论状态',
   credit_value         int comment 'n颗星',
   title                varchar(200) comment '评论标题',
   content              text comment '评论内容',
   seller_id            int(10) comment '卖家id',
   buyer_id             int(10) comment '买家id',
   buyer_nickname       varchar(100) comment '买家昵称',
   buyer_email          varchar(200) comment '买家email',
   buyer_email_if       char(1) comment '买家是否同意接收广告',
   pub_date             datetime comment '评论发布时间',
   last_update_dt       datetime comment '最后更新时间',
   pub_ip               varchar(30) comment '评论发布地址',
   country_ename        varchar(100) comment 'ip国家',
   city_ename           varchar(100) comment 'ip城市',
   check_by             varchar(100) comment '审核人',
   check_date           datetime comment '审核时间',
   is_read              char(1) comment '已读标识',
   object_type          char(1) comment '发布对象类型（1-买家，2-卖家）',
   primary key (goods_enq_id)
)
type = MYISAM;

alter table T_RS_GOODS_ENQ comment '商品售前询盘表';

/*==============================================================*/
/* Table: T_RS_MSG                                              */
/*==============================================================*/
create table T_RS_MSG
(
   msgid                int not null auto_increment comment '消息',
   msg_type             char(1) comment '消息类型
            0-订单评论，（该类型不用，移出）买卖双方对对方进行的评价（作为评分使用）+评论（评论理由），一个订单最多只能有两条评论记录，买卖家各一条。
            1-订单消息，针对该订单的消息，不限条数。
            2-产品消息，针对产品的消息，不限条数。
            3-买家系统公告，系统针对买家的公告消息。
            4-卖家系统公告，系统针对卖家的公告消息。
            5-系统消息，系统针对所有用户的消息。',
   pmsgid               int comment '父id',
   title                varchar(100) comment '消息标题',
   content              text comment '消息内容',
   seller_id            int(10) comment '卖家id',
   buyer_id             int(10) comment '买家id',
   pub_date             datetime comment '消息发布时间',
   pub_ip               varchar(30) comment '消息发布地址',
   check_date           datetime comment '审核时间',
   check_by             int(10) comment '审核人',
   isread               char(1) comment '是否已读',
   isdelete             char(2) comment '是否删除',
   att_path             varchar(200) comment '附件',
   launch_user_id       int comment '发起人',
   object_type          char(1) comment '发布对象类型（1-买家，2-卖家，3-全部）',
   rw_status            char(1) comment '消息状态',
   primary key (msgid)
)
type = MYISAM;

alter table T_RS_MSG comment '消息表';

/*==============================================================*/
/* Table: T_RS_REVIEW                                           */
/*==============================================================*/
create table T_RS_REVIEW
(
   review_id            int not null auto_increment comment '评论ID',
   order_code           char(18) comment '订单编号',
   goods_id             int comment '商品号',
   rw_type              char(1) comment '评论类型（rw_type)
            0-订单评论，买卖双方对对方进行的评价（作为评分使用）+评论（评论理由），一个订单最多只能有两条评论记录，买卖家各一条。
            1-订单消息，针对该订单的消息，不限条数。
            2-产品消息，针对产品的消息，不限条数。
            3-买家系统公告，系统针对买家的公告消息。
            4-卖家系统公告，系统针对卖家的公告消息。
            5-系统消息，系统针对所有用户的消息。',
   rw_status            char(1) comment '评论状态',
   credit_value         char(1) comment '评价（0-表示差评，1-表示中平，2-表示好评）',
   credit_flag          char(1) comment '评分标识（是否已经评分）',
   title                varchar(100) comment '评论标题',
   content              text comment '评论内容',
   seller_id            int(10) comment '卖家id',
   buyer_id             int(10) comment '买家id',
   pub_date             datetime comment '评论发布时间',
   last_update_dt       datetime comment '最后更新时间',
   pub_ip               varchar(30) comment '评论发布地址',
   check_date           datetime comment '审核时间',
   check_by             int(10) comment '审核人',
   isread               char(1) comment '是否已读',
   about_id             int comment '父id（评论回复的父子关系）',
   primary key (review_id)
)
type = MYISAM;

alter table T_RS_REVIEW comment '买家订单商品评论信息表';

/*==============================================================*/
/* Table: T_SS_ABORDER_INFO                                     */
/*==============================================================*/
create table T_SS_ABORDER_INFO
(
   aborder_id           int not null auto_increment,
   order_code           char(18) not null comment '订单编号（例：2008103015280038）',
   buy_serialnum        char(21) comment '购买流水号（例：buy200810301426390027）',
   pay_serialnum        char(21) comment '支付流水号（例：pay200810301426390027）
            注：有此支付号的不一定已经成功支付，只是表示用户进行了一次支付行为。
            需要在支付表中查看该订单是否支付成功。',
   buyer_id             int(10) comment '买家ID',
   seller_id            int,
   dispute_flag         char(1) comment '纠纷标识（0-无纠纷，1-纠纷）',
   cancel_flag          char(1) comment '订单取消标识',
   submit_date          datetime comment '订单提交时间（未付款状态）',
   ip                   varchar(30) comment '订单提交时的IP',
   receive_date         datetime comment '订单收货时间（已收货状态）',
   pay_date             datetime comment '付款时间（已付款状态）
            注：如果是线上支付，那么paypal返回支付成功信息后填写该字段。
            如果是线下支付，那么需要运营人员确认货款到账后填写该字段。',
   tran_order_comfirm_date datetime comment '买家确认转单日期',
   tran_order_comfirm_flag int comment '确认转单标识',
   tran_order_flag      int comment '转单标识',
   goods_price          numeric(10,2) comment '商品总价（产品标价）',
   goods_call_price     numeric(10,2) comment '商品结算价（打折或者由于用户等级等原因缠上的结算价）',
   traffic_price        numeric(10,2) comment '运费总价（运费标价）',
   traffic_call_price   numeric(10,2) comment '运费结算价（打折或者由于用户等级等原因缠上的结算价）',
   order_price          numeric(10,2) comment '订单总价（产品总价+运费总价）',
   order_call_price     numeric(10,2) comment '订单结算价（产品结算价+运费结算价）',
   transaction_cost     numeric(10,4) comment '当时佣金比例',
   order_final_paydiscount_price numeric(10,2) comment '最终支付折扣价（由于用户选择了不同的支付方式而获得折扣后，在最终订单价格基础上进行折扣后的价格）',
   pay_type             varchar(20) comment '支付类型（1表示通过paypal支付）',
   update_date          datetime comment '订单最后更新时间',
   order_status         int comment '订单状态
            （
            1-未支付状态
            2-支付中状态
            3-已支付状态
            4-待发货状态
            5-已发货状态
            6-收货待验证
            7-平台已验证
            8-已收货状态
            ）',
   syn_flag             char(1) comment '同步状态（0-尚未同步到国内库，1-已经同步到国内库）',
   remark               varchar(500) comment '备注',
   shipaddr_company_name varchar(100) comment '收货人公司',
   shipaddr_contact_name varchar(100) comment '收货人姓名',
   shipaddr_addr_line1  varchar(500) comment '收货人地址',
   shipaddr_addr_line2  varchar(500) comment '收货人地址',
   shipaddr_city        varchar(100) comment '收货人城市',
   shipaddr_province    varchar(100) comment '收货人省份',
   shipaddr_country     varchar(100) comment '收货人国家',
   shipaddr_postal_code varchar(100) comment '收获邮编',
   shipaddr_phone_number varchar(100) comment '收货人电话',
   shipaddr_fax_number  varchar(100) comment '收货人传真',
   billaddr_company_name varchar(100) comment 'bill公司',
   billaddr_contact_name varchar(100) comment 'bill联系人',
   billaddr_addr_line1  varchar(500) comment 'bill地址',
   billaddr_addr_line2  varchar(500) comment 'bill地址',
   billaddr_city        varchar(100) comment 'bill城市',
   billaddr_province    varchar(100) comment 'bill省份',
   billaddr_country     varchar(100) comment 'bill国家',
   billaddr_postal_code varchar(100) comment 'bill邮编',
   billaddr_phone_number varchar(100) comment 'bill电话',
   billaddr_fax_number  varchar(100) comment 'bill传真',
   paypal_email         varchar(100),
   paypal_userid        varchar(100),
   paypal_userstatus    varchar(100),
   paypal_username      varchar(100),
   paypal_username2     varchar(100),
   paypal_country       varchar(100),
   paypal_recv_name     varchar(100),
   paypal_recv_street   varchar(100),
   paypal_recv_city     varchar(100),
   paypal_recv_state    varchar(100),
   paypal_recv_postcode varchar(100),
   paypal_recv_countrycode varchar(100),
   paypal_recv_countryname varchar(100),
   paypal_recv_addressstatus varchar(100),
   paypal_tel           varchar(100),
   seller_confirm_dt    datetime,
   seller_ship_dt       datetime,
   seller_transportno   varchar(50),
   order_final_price    numeric(10,2),
   order_final_webprice numeric(10,2),
   order_final_price_dt datetime,
   seller_reqmoneymail_dt datetime,
   seller_reqmoneymail_user varchar(20),
   seller_refund_dt     date,
   seller_abandoned_dt  datetime,
   seller_order_status  int,
   seller_remark        varchar(500),
   primary key (aborder_id, order_code)
)
type = MYISAM;

alter table T_SS_ABORDER_INFO comment '订单信息表';

/*==============================================================*/
/* Table: T_SS_ABORDER_ITEMS                                    */
/*==============================================================*/
create table T_SS_ABORDER_ITEMS
(
   id                   int not null auto_increment comment '自增',
   aborder_id           int comment 'aborder_id',
   item_id              int(10) comment '订单id',
   goods_id             int(10) comment '产品ID',
   prod_num             numeric(10,2) comment '产品数量',
   price_spec           varchar(100) comment '规格（定价时的规格）',
   order_code           char(18) comment '订单号',
   shp_type             char(1) comment '运输方式（EMS/UPS/FEDEX等）',
   shp_normal           char(1) comment '运费标识（标准运费、自定义运费）',
   shp_geocode          varchar(100) comment '运输国家（自定义运费时需要限定运输国家）',
   shp_fee              numeric(10,2) comment '运费（根据相关条件计算出来的运费）',
   price_type           int comment '价格类型',
   seller_price         numeric(10,2) comment '供应商价格',
   web_price            numeric(10,2) comment '网络报价（加上交易用尽）',
   delivery_days        int comment '交货天数',
   seller_id            int comment '卖家id',
   prod_name            varchar(300) comment '产品名称',
   prod_cname           varchar(300) comment '中文名',
   prod_status          char(1) comment '产品状态',
   prod_catcode         varchar(100) comment '产品分类',
   pack_type            char(1) comment '包装类型',
   prod_unit            numeric(10,2) comment '产品单位',
   dozen_mount          numeric(10,2) comment '打包（如果打包卖的话，每包多少个产品）',
   prod_length          numeric(10,2) comment '长',
   prod_width           numeric(10,2) comment '宽',
   prod_high            numeric(10,2) comment '高',
   prod_weight          numeric(10,2) comment '重',
   sec_flg              char(1) comment 'sec标识',
   keyword_Desc         varchar(500),
   description          varchar(2000),
   smallpic_path        varchar(200),
   bigpic_path          varchar(200),
   keyvalue_desc        text,
   tag                  varchar(500),
   origin               varchar(200),
   isdisplayed          int,
   effectivetime        datetime,
   primary key (id)
)
type = MYISAM;

alter table T_SS_ABORDER_ITEMS comment '弃单明细表';

/*==============================================================*/
/* Table: T_SS_ATTR                                             */
/*==============================================================*/
create table T_SS_ATTR
(
   attrid               int not null comment '属性id',
   attrname             varchar(100) comment '属性名称',
   attrname_cn          varchar(100) comment '属性中文名称',
   basecatid            int comment '基础类id',
   select_flag_seller   char(1) comment '卖家选择标识（1-可选，2-卖家必选（亦作为卖家过滤产品使用））',
   select_flag_buyer    char(1) comment '买家选择标识（1-可选，2-买家必选）',
   filter_flag          char(1) comment '过滤标识（1-过滤，2-非过滤）',
   option_flag          char(1) comment '规格标识（1-规格，2-非规格，影响价格的属性定义为规格）',
   sortnum              int comment '排序',
   value_type           char(1) comment '值类型（1-单选，2-多选，3-下拉框，4-输入框）',
   status               char(1) comment '状态',
   primary key (attrid)
);

alter table T_SS_ATTR comment '属性表';

/*==============================================================*/
/* Table: T_SS_ATTRVALUE                                        */
/*==============================================================*/
create table T_SS_ATTRVALUE
(
   attrvalueid          int not null comment '属性值id',
   attrvaluename        varchar(100) comment '属性值',
   attrvaluename_cn     varchar(100) comment '属性值中文名',
   remark               varchar(200) comment '备注',
   attrid               int comment '属性id',
   sortnum              int comment '显示排序',
   mastervalueflag      int comment '前导属性值标识
            （
            1-非前导属性值，
            2-决定属性的前导属性值，
            3-决定属性值的前导属性值，
            4-决定属性和属性值的前导属性值）',
   primary key (attrvalueid)
);

alter table T_SS_ATTRVALUE comment '属性值表';

/*==============================================================*/
/* Table: T_SS_BASECAT_GROUP                                    */
/*==============================================================*/
create table T_SS_BASECAT_GROUP
(
   catgroupid           int not null auto_increment comment '品类分组id',
   catgroupname         varchar(100) comment '品类分组名',
   catgroupname_cn      varchar(100) comment '品类分组中文名',
   pcatgroupid          int comment '父id',
   leaf_flag            char(1) comment '叶子目录标识（1-是，2-非，只有叶子类才能对应基础类）',
   sortnum              int comment '显示排序',
   status               char(1) comment '状态',
   primary key (catgroupid)
);

alter table T_SS_BASECAT_GROUP comment '品类分组目录表';

/*==============================================================*/
/* Table: T_SS_BASE_CAT                                         */
/*==============================================================*/
create table T_SS_BASE_CAT
(
   basecatid            int not null auto_increment comment '基础类id',
   basecatname          varchar(100) comment '基础类名',
   basecatname_cn       varchar(100) comment '基础类中文名',
   groupdirid           int comment '分组目录id',
   sortnum              int comment '显示排序',
   status               char(1) comment '基础类状态',
   primary key (basecatid)
);

alter table T_SS_BASE_CAT comment '基础品类表';

/*==============================================================*/
/* Table: T_SS_COMP_CATEGORY                                    */
/*==============================================================*/
create table T_SS_COMP_CATEGORY
(
   cat_code             char(6) not null comment '分类编码',
   cat_name             varchar(100) comment '分类名称',
   primary key (cat_code)
)
type = MYISAM;

alter table T_SS_COMP_CATEGORY comment '公司分类表';

/*==============================================================*/
/* Table: T_SS_GOODS                                            */
/*==============================================================*/
create table T_SS_GOODS
(
   goods_id             int not null auto_increment comment '商品id',
   prod_id              int comment '产品id',
   seller_id            int comment 'sellerid',
   create_dt            datetime comment '创建时间',
   online_dt            datetime comment '上架时间',
   offline_dt           datetime comment '下架时间',
   force_offline_dt     datetime comment '强制下架日期',
   force_offline_user   varchar(100) comment '强制下架人员',
   last_update_dt       datetime comment '最后更新日期',
   effective_days       int comment '有效期',
   goods_status         char(1) comment '商品状态',
   bestseller_flag      char(1) comment '热卖标识',
   sec_flag             char(1) comment '搜索标识（1-搜索列表显示的商品，2-不显示）',
   pack_type            char(1) comment '包卖标识',
   prod_unit            varchar(12) comment '单位',
   prod_length          numeric(10,2) comment '长',
   prod_width           numeric(10,2) comment '宽',
   prod_high            numeric(10,2) comment '高',
   prod_weight          numeric(10,2) comment '重量',
   dosen_count          numeric(10,2) comment '一包的数量',
   effectivetime        datetime comment '有效期',
   primary key (goods_id)
);

alter table T_SS_GOODS comment '商品表';

/*==============================================================*/
/* Table: T_SS_GOODS_OPTION                                     */
/*==============================================================*/
create table T_SS_GOODS_OPTION
(
   id                   int not null auto_increment comment '自增id',
   optiongroupid        varchar(100) comment 'optiongroupid（一组决定商品价格的属性组成一个唯一码）',
   attrid               int comment '属性id',
   valueid              int comment '属性值id（分隔符分割）',
   goods_id             int comment '商品id（冗余）',
   primary key (id)
);

alter table T_SS_GOODS_OPTION comment '商品规格表';

/*==============================================================*/
/* Table: T_SS_GOODS_PRICE                                      */
/*==============================================================*/
create table T_SS_GOODS_PRICE
(
   prod_price_id        int not null auto_increment comment '价格id',
   goods_id             int comment '商品id',
   optiongroupid        varchar(100) comment '规格组id（）',
   start_pur_mount      numeric(10,2) comment '起始采购量',
   end_pur_mount        numeric(10,2) comment '截止采购量',
   seller_price         numeric(10,2) comment '供应商价格',
   discount_price       numeric(10,2) comment '折扣价格',
   delivery_days        int comment '交货天数',
   primary key (prod_price_id)
)
type = MYISAM;

alter table T_SS_GOODS_PRICE comment '商品价格表
';

/*==============================================================*/
/* Table: T_SS_GOODS_SHIPTYPE                                   */
/*==============================================================*/
create table T_SS_GOODS_SHIPTYPE
(
   prod_shptype_id      int not null auto_increment,
   goods_id             int(10),
   shp_type             varchar(20) comment '运输方式（1-ems、2-fedex、3-ups、4-tnt、5-dhl）',
   normal               int comment '1-标准运费（需要查询运费表进行运费计算），
            2-自定义运费（直接从该表计算运费）
            3-免运费（运费为0）',
   start_pur_mount      numeric(10,2) comment '起始购买量',
   end_pur_mount        numeric(10,2) comment '截止购买量',
   lowest_shpfee        numeric(10,2) comment '最低运费',
   add_mount_unit       numeric(10,2) comment '超过截止购买量的附加运费单位（即超过截止采购量，每增加该数量或以内的产品数量需要增加一个运费单位）',
   add_shpfee_unit      numeric(10,2) comment '一次附加运费金额',
   geo_code             varchar(100) comment '可运输国家代码（用逗号分割的多个国家，该信息仅仅作为排除不期望地区的buyer来用）',
   self_discount        numeric(10,2) comment '针对产品、运输区域的折扣',
   primary key (prod_shptype_id)
)
type = MYISAM;

alter table T_SS_GOODS_SHIPTYPE comment '商品运输方式表';

/*==============================================================*/
/* Table: T_SS_OP_LOG                                           */
/*==============================================================*/
create table T_SS_OP_LOG
(
   logid                int(12) not null auto_increment comment '日志id',
   op_user              varchar(20) comment '操作者',
   op_dt                datetime comment '操作时间',
   op_ip                varchar(100) comment '操作地点',
   op_type              varchar(10) comment '操作类型(1-黑白名单操作)',
   op_content           varchar(500) comment '操作内容',
   seller_id            int,
   primary key (logid)
)
type = MYISAM;

alter table T_SS_OP_LOG comment '操作日志';

/*==============================================================*/
/* Table: T_SS_ORDER_CONTROL                                    */
/*==============================================================*/
create table T_SS_ORDER_CONTROL
(
   id                   int not null auto_increment comment '自增id',
   order_code           varchar(20) comment '订单号',
   buyer_id             int comment '买家id',
   seller_id            int comment '卖家id',
   it_info              varchar(100) comment '电脑信息',
   ship_addr            varchar(100) comment '收获详细抵制',
   pay_username         varchar(100) comment '付款人姓名',
   pay_email            varchar(100) comment '支付email',
   reg_email            varchar(100) comment '注册email',
   receive_username     varchar(100) comment '收货人姓名',
   receive_usertel      varchar(100) comment '收货人电话',
   primary key (id)
);

alter table T_SS_ORDER_CONTROL comment '防控订单（）';

/*==============================================================*/
/* Table: T_SS_ORDER_LOG                                        */
/*==============================================================*/
create table T_SS_ORDER_LOG
(
   logid                int not null auto_increment comment 'id',
   opdt                 datetime comment '操作日期',
   opip                 varchar(100) comment 'ip地址',
   userid               varchar(100) comment '操作者',
   optype               char(1) comment '流水类型（1-状态迁移，2-标识转换）',
   order_operation      varchar(500) comment '订单操作描述',
   order_code           char(10) comment '订单编号',
   primary key (logid)
)
type = MYISAM;

alter table T_SS_ORDER_LOG comment '卖家订单操作流水（记录订单状态的迁移、订单标识的转换过程）';

/*==============================================================*/
/* Table: T_SS_PRODSALE_ATTR                                    */
/*==============================================================*/
create table T_SS_PRODSALE_ATTR
(
   prod_id              int not null comment '产品id',
   attrid               int not null comment '属性id',
   attrvalue            varchar(200) comment '分隔符分割的属性值',
   attrvalue_text       varchar(200) comment '文本属性值（非可穷举的属性值）',
   primary key (prod_id, attrid)
);

alter table T_SS_PRODSALE_ATTR comment '在卖产品属性表(包含属性值)';

/*==============================================================*/
/* Table: T_SS_PRODUCT                                          */
/*==============================================================*/
create table T_SS_PRODUCT
(
   prod_id              int not null auto_increment comment '产品id',
   seller_id            int(10) comment '卖家id',
   basecatid            int comment '基础类id',
   sku_flag             varchar(100) comment '已经挑选到sku产品库中（0-未挑选，1-已经挑选）',
   prod_ename           varchar(300) comment '英文名',
   create_dt            datetime comment '产品创建时间',
   last_update_dt       datetime comment '最后更新时间',
   prod_cname           varchar(300) comment '中文名',
   prod_status          char(1) comment '产品状态
            （
            1--待审核，
            2-审核未通过
            3-审核通过
            4-删除状态
            ）',
   pack_type            char(1) comment '按包卖标识',
   prod_unit            varchar(20) comment '单位（克、公斤、件等）',
   prod_length          numeric(10,2) comment '长',
   prod_width           numeric(10,2) comment '宽',
   prod_high            numeric(10,2) comment '高',
   prod_weight          numeric(10,2) comment '重量',
   dozen_count          char(10) comment '一包的数量',
   keyword_desc         varchar(500) comment '关键词描述',
   description          text comment '产品描述',
   specification_html   text comment '用户自定义描述（包含文字、图片等）',
   spe_desc             varchar(500) comment '短描述',
   pic_path             text comment '图片路径（xml描述，可支持多个图片、多种媒体）',
   effectivetime        datetime comment '产品有效期',
   relatedwords         varchar(500) comment '相关关键词',
   effective_days       int comment '有效期',
   primary key (prod_id)
)
type = MYISAM;

alter table T_SS_PRODUCT comment '卖家产品表';

/*==============================================================*/
/* Table: T_SS_PRODUCT_SALE                                     */
/*==============================================================*/
create table T_SS_PRODUCT_SALE
(
   prod_id              int not null auto_increment comment '产品id',
   sku                  varchar(100) comment '产品唯一编码',
   basecatid            int comment '基础品类',
   prod_ename           varchar(300) comment '英文名',
   create_dt            datetime comment '产品创建时间',
   last_update_dt       datetime comment '最后更新时间',
   prod_cname           varchar(300) comment '中文名',
   prod_status          char(1) comment '产品状态
            （
            1-可售卖
            2-不可售卖
            ）',
   keyword_desc         varchar(500) comment '关键词描述',
   description          text comment '产品描述',
   short_desc           varchar(500) comment '短描述',
   pic_path             text comment '图片路径（xml描述，可支持多个图片、多种媒体）',
   relatedwords         varchar(500) comment '相关关键词',
   primary key (prod_id)
)
type = MYISAM;

alter table T_SS_PRODUCT_SALE comment '精品产品表(在售产品表)';

/*==============================================================*/
/* Table: T_SS_PROD_ATTR                                        */
/*==============================================================*/
create table T_SS_PROD_ATTR
(
   prod_id              int not null comment '产品id',
   attrid               int not null comment '属性id',
   attrvalue            varchar(200) comment '分隔符分割的属性值',
   attrvalue_text       varchar(200) comment '文本属性值（非可穷举的属性值）',
   primary key (prod_id, attrid)
);

alter table T_SS_PROD_ATTR comment '产品属性表(包含属性值)';

/*==============================================================*/
/* Table: T_SS_PROD_OPTION                                      */
/*==============================================================*/
create table T_SS_PROD_OPTION
(
   id                   int not null auto_increment comment '自增id',
   optiongroupid        int comment 'optiongroupid（一组决定商品价格的属性组成一个唯一码）',
   attrid               int comment '属性id',
   valueid              int comment '属性值id（分隔符分割）',
   prod_id              int comment '产品id（冗余）',
   prod_price_id        int comment '价格id',
   primary key (id)
);

alter table T_SS_PROD_OPTION comment '产品规格表';

/*==============================================================*/
/* Table: T_SS_PROD_PRICE                                       */
/*==============================================================*/
create table T_SS_PROD_PRICE
(
   prod_price_id        int not null auto_increment comment '价格id',
   prod_id              int comment '产品id',
   id                   int comment '自增id',
   optiongroupid        int comment '规格组id（）',
   start_pur_mount      numeric(10,2) comment '起始采购量',
   end_pur_mount        numeric(10,2) comment '截止采购量',
   seller_price         numeric(10,2) comment '供应商价格',
   discount_price       numeric(10,2) comment '折扣价格',
   delivery_days        int comment '交货天数',
   primary key (prod_price_id)
)
type = MYISAM;

alter table T_SS_PROD_PRICE comment '产品价格表
';

/*==============================================================*/
/* Table: T_SS_PROD_PROHIBITWORDS                               */
/*==============================================================*/
create table T_SS_PROD_PROHIBITWORDS
(
   wordid               int not null auto_increment comment '违禁词id',
   wordname             varchar(200) comment '违禁词',
   opuser               varchar(100) comment '操作用户',
   create_dte           datetime comment '创建日期',
   remark               varchar(500) comment '备注',
   primary key (wordid)
)
type = MYISAM;

alter table T_SS_PROD_PROHIBITWORDS comment '违禁词表';

/*==============================================================*/
/* Table: T_SS_PROD_SHIPTYPE                                    */
/*==============================================================*/
create table T_SS_PROD_SHIPTYPE
(
   prod_shptype_id      int not null auto_increment,
   prod_id              int(10),
   shp_type             varchar(20) comment '运输方式（1-ems、2-fedex、3-ups、4-tnt、5-dhl）',
   normal               int comment '1-标准运费（需要查询运费表进行运费计算），
            2-自定义运费（直接从该表计算运费）
            3-免运费（运费为0）',
   start_pur_mount      numeric(10,2) comment '起始购买量',
   end_pur_mount        numeric(10,2) comment '截止购买量',
   lowest_shpfee        numeric(10,2) comment '最低运费',
   add_mount_unit       numeric(10,2) comment '超过截止购买量的附加运费单位（即超过截止采购量，每增加该数量或以内的产品数量需要增加一个运费单位）',
   add_shpfee_unit      numeric(10,2) comment '一次附加运费金额',
   geo_code             varchar(100) comment '可运输国家代码（用逗号分割的多个国家，该信息仅仅作为排除不期望地区的buyer来用）',
   self_discount        numeric(10,2) comment '针对产品、运输区域的折扣',
   primary key (prod_shptype_id)
)
type = MYISAM;

alter table T_SS_PROD_SHIPTYPE comment '产品运输方式表';

/*==============================================================*/
/* Table: T_SS_QUESTION_ANSWER                                  */
/*==============================================================*/
create table T_SS_QUESTION_ANSWER
(
   q_a_id               int not null auto_increment,
   parent_id            int comment '父帖子id',
   q_a_type             char(1) comment '帖子类型（包括以下四种）
            1，提问帖
            2，回复贴
            3，提问者对提问贴的补充
            4，提问者对回复贴的评价
            注：帖子之间的关系用parent_id关联
            ',
   q_a_status           char(1) comment '帖子状态
            1，待解决
            2，已解决
            3，未解决',
   seller_id            int(10) comment '卖家id，如果不登录回复为0，页面显示guest',
   is_delete            char(1) comment '是否屏蔽',
   is_top_answer        char(1) comment '是否最佳答案,提问者可最多选择5个回复作为最佳答案',
   is_anonymous         char(1) comment '是否匿名（在提问者或者回复者登录的时候也可以选择‘匿名’）',
   cate_id              int comment '分类id',
   title                varchar(120) comment '标题',
   content              text comment '内容',
   pub_ip               varchar(30) comment 'ip',
   pub_date             datetime comment '发布时间',
   last_update_date     datetime comment '最后更新时间',
   att_path             varchar(200) comment '附件',
   check_by             int comment '审核人',
   check_date           datetime comment '审核时间',
   rep_num              int comment '回帖数量',
   primary key (q_a_id)
);

alter table T_SS_QUESTION_ANSWER comment '卖家站外贸通提问及回答帖子';

/*==============================================================*/
/* Table: T_SS_QUESTION_CATEGORY                                */
/*==============================================================*/
create table T_SS_QUESTION_CATEGORY
(
   cate_id              int not null auto_increment comment '分类id',
   parent_id            int comment '父分类id',
   cate_name            varchar(128) comment '分类名称',
   cate_level           int comment '分类级别(目前只有两级，将来可能会扩展)',
   is_leaf              char(1) comment '是否叶子节点(提问者必须选择到叶子节点？)',
   primary key (cate_id)
);

alter table T_SS_QUESTION_CATEGORY comment '卖家站外贸通提问分类';

/*==============================================================*/
/* Table: T_SS_SALE_CAT                                         */
/*==============================================================*/
create table T_SS_SALE_CAT
(
   salecatid            int not null auto_increment comment '销售类id',
   salecatname          varchar(100) comment '销售类名',
   salecatname_cn       varchar(100) comment '销售类中文名',
   psalecatid           int comment '父id',
   leaf_flag            char(1) comment '叶子类标识（1-是，2-非，只有叶子类才能对应基础类）',
   sortnum              int comment '显示排序',
   status               char(1) comment '状态',
   picpath              varchar(200) comment '图片路径',
   primary key (salecatid)
);

alter table T_SS_SALE_CAT comment '销售品类表';

/*==============================================================*/
/* Table: T_SS_SALE_CAT_RELATION                                */
/*==============================================================*/
create table T_SS_SALE_CAT_RELATION
(
   salecatrelationid    int not null auto_increment comment '销售品类关系id',
   salecatid            int comment '销售类id',
   basecatid            int comment '基础类id',
   attrid               int comment '属性id',
   attrvalueid          int comment '属性值id',
   primary key (salecatrelationid)
);

alter table T_SS_SALE_CAT_RELATION comment '销售品类关系表';

/*==============================================================*/
/* Table: T_SS_SELLER_AUTH                                      */
/*==============================================================*/
create table T_SS_SELLER_AUTH
(
   id                   int not null auto_increment comment 'id',
   seller_id            int comment '卖家id',
   upload_type          char(1) comment '证件类型（1-身份证，2-执照等）',
   paper_num            varchar(100) comment '证件号码',
   upload_date          datetime comment '证件上传日期',
   upload_path          varchar(200) comment '证件上传路径',
   verify_user          varchar(100) comment '认证操作员',
   verify_date          datetime comment '认证日期',
   ispass               char(1) comment '是否通过认证
            （
            1-未审核，
            2-驳回，
            3-通过，如果通过则同时修改seller_status状态
            4-通过实名认证
            ）',
   reject_reason        varchar(500) comment '驳回原因',
   real_name            varchar(100),
   real_mob             varchar(100),
   primary key (id)
)
type = MYISAM;

alter table T_SS_SELLER_AUTH comment '认证信息表';

/*==============================================================*/
/* Table: T_SS_SELLER_COMP                                      */
/*==============================================================*/
create table T_SS_SELLER_COMP
(
   seller_id            int(10),
   comp_name            varchar(256) comment '公司名称',
   comp_cat             char(6) comment '公司分类',
   employee_num         varchar(100) comment '公司员工数',
   pri_business_desc    varchar(500) comment '主营业务',
   establish_dt         varchar(100) comment '成立日期',
   sale_peryear         varchar(100) comment '年营业额',
   compdesc             text comment '公司描述',
   comptype             char(4) comment '公司类型（1-公司，2-个人）',
   addr                 varchar(256) comment '公司地址',
   linkman_fname        varchar(16) comment '真实姓名',
   linkman_lname        varchar(16) comment '公司联系人（）',
   linkman_sex          char(1) comment '联系人性别（1-女，2-男）',
   country              varchar(100) comment '国家',
   state                varchar(100) comment '省份',
   city                 varchar(100) comment '城市',
   postcode             varchar(50) comment '邮编',
   mobile               varchar(100) comment '手机',
   fax                  varchar(100) comment '传真',
   skype                varchar(100) comment 'skype',
   msn                  varchar(100) comment 'msn',
   biz_email            varchar(100) comment '商业邮箱',
   biz_phone            varchar(100) comment '商业电话',
   webpage              varchar(300) comment '公司首页'
)
type = MYISAM;

alter table T_SS_SELLER_COMP comment '卖家公司信息表';

/*==============================================================*/
/* Table: T_SS_SELLER_CREDIT                                    */
/*==============================================================*/
create table T_SS_SELLER_CREDIT
(
   seller_id            int(10) not null comment 'sellerid',
   level                int(1) comment '信用等级',
   buyercount           int(10) comment '信用积分',
   primary key (seller_id)
)
type = MYISAM;

alter table T_SS_SELLER_CREDIT comment '卖家信用信息表';

/*==============================================================*/
/* Table: T_SS_SELLER_INFO                                      */
/*==============================================================*/
create table T_SS_SELLER_INFO
(
   seller_id            int(10) not null auto_increment comment 'sellerid',
   seller_email         varchar(64) comment '注册email',
   passwd               varchar(32) comment '密码',
   nickname             varchar(16) comment '别名',
   reg_date             datetime comment '注册日期',
   reg_ip               varchar(32) comment '注册ip',
   seller_status        char(1) comment 'seller状态（1-邮件待验证
            2-待认证
            3-待审核
            4-正常
            5-冻结
            6-删除）',
   seller_type          char(1) comment 'seller类型（1-公司用户，2-个人用户，3-ttm用户）',
   isactived            int comment '激活状态（0-未激活，1-已激活）',
   actived_date         datetime comment '激活日期',
   freeze_date          datetime comment '冻结日期',
   freeze_user          varchar(20) comment '冻结操作员',
   seller_score         int comment '信用积分',
   recommend_seller_id  int comment '推荐人id',
   seller_cat           int comment '卖家分类',
   primary key (seller_id)
)
type = MYISAM;

alter table T_SS_SELLER_INFO comment '卖家信息表';

/*==============================================================*/
/* Table: T_SS_SELLER_LEVEL                                     */
/*==============================================================*/
create table T_SS_SELLER_LEVEL
(
   seller_id            int not null comment '卖家id',
   questions            int comment '提问数',
   answers              int comment '回复数',
   level                int comment '级别',
   primary key (seller_id)
);

alter table T_SS_SELLER_LEVEL comment '卖家在外贸通中级别，由提问和回复数决定';

/*==============================================================*/
/* Table: T_SS_SELLER_LOGINLOG                                  */
/*==============================================================*/
create table T_SS_SELLER_LOGINLOG
(
   logid                int(12) not null auto_increment comment '日志id',
   seller_id            int(10) comment '买家id',
   login_dt             datetime comment '登陆时间',
   logout_dt            datetime comment '退出时间',
   login_ip             varchar(30) comment '登陆ip',
   primary key (logid)
)
type = MYISAM;

alter table T_SS_SELLER_LOGINLOG comment '卖家登陆日志';

/*==============================================================*/
/* Table: T_SS_SELLER_ORDER                                     */
/*==============================================================*/
create table T_SS_SELLER_ORDER
(
   order_code           char(18) not null comment '订单号',
   seller_id            int(10) comment '卖家id',
   buyer_id             int comment '买家id（冗余）',
   seller_comfirm_dt    datetime comment '确认日期（确认状态）',
   seller_ship_dt       datetime comment '发货日期（已发货状态）',
   freeze_flag          char(1) comment '冻结标识（0-正常，1-冻结）',
   freeze_dt            datetime comment '冻结时间',
   refund_flag          char(1) comment '退款标识（0-正常，1-全部退款，2-部分退款）',
   transferorder_flag   char(1) comment '转单标识（？是否需要）体现过程1、2、3',
   cancel_flag          char(1) comment '订单取消标识（1-取消，卖家不能浏览到）',
   close_flag           char(1) comment '订单结束标识',
   close_dt             datetime comment '订单结束日期',
   audit_flag           char(1) comment '审核标识',
   transportno_verifyflag char(1) comment '验证标识',
   transportno_verifydt datetime comment '验证日期',
   seller_transportno   varchar(500) comment '运单号',
   order_final_price    numeric(10,2) comment '订单最终价（买卖家协商后，卖家同意最终的成交价格，
            由卖家最终确认修改该价格）',
   order_final_webprice numeric(10,2) comment '买家看到的最终价格',
   order_final_price_dt datetime comment '最终价修改时间（卖家修改最终价时间）',
   seller_reqmoneymail_dt date comment '催收邮件日期（运营人员填写）',
   seller_reqmoneymail_user varchar(20) comment '催收操作员（运营人员填写）',
   seller_refund_dt     date comment '退款日期',
   seller_abandoned_dt  datetime comment '弃单日期（卖家放弃订单时填写）',
   seller_order_status  int comment '订单状态
            （
            1-未支付状态
            2-支付中状态
            3-已支付状态
            4-待发货状态
            5-已发货状态
            6-收货待验证
            7-平台已验证
            8-已收货状态
            ）',
   seller_remark        varchar(500) comment '卖家备注信息',
   primary key (order_code)
)
type = MYISAM;

alter table T_SS_SELLER_ORDER comment 'SELLER端订单表（记录seller对order表的状态等的更新，比如是否已经发货等）';

/*==============================================================*/
/* Table: T_SS_SHPMODEL                                         */
/*==============================================================*/
create table T_SS_SHPMODEL
(
   shpmodel_id          int not null auto_increment,
   seller_id            int(10) comment 'sellerid',
   shpmodel_name        varchar(100),
   shpmodel_desc        varchar(500),
   shp_type             datetime,
   primary key (shpmodel_id)
)
type = MYISAM;

alter table T_SS_SHPMODEL comment '运费模板表';

/*==============================================================*/
/* Table: T_SS_SHPMODEL_ITEMS                                   */
/*==============================================================*/
create table T_SS_SHPMODEL_ITEMS
(
   item_id              int not null auto_increment,
   shpmodel_id          int,
   shp_type             varchar(20),
   normal               int,
   start_pur_mount      numeric(10,2),
   end_pur_mount        numeric(10,2),
   lowest_shpfee        numeric(10,2),
   add_mount_unit       numeric(10,2),
   add_shpfee_unit      numeric(10,2),
   geo_code             varchar(100),
   self_discount        numeric(10,2) comment '针对产品、运输区域的折扣',
   primary key (item_id)
)
type = MYISAM;

alter table T_SS_SHPMODEL_ITEMS comment '运费模板明细表';

/*==============================================================*/
/* Table: T_SS_SHPTYPE_DISCOUNT                                 */
/*==============================================================*/
create table T_SS_SHPTYPE_DISCOUNT
(
   shptype_discount_id  int not null auto_increment,
   seller_id            int,
   shp_type             varchar(20),
   shp_discount         numeric(10,2),
   primary key (shptype_discount_id)
)
type = MYISAM;

alter table T_SS_SHPTYPE_DISCOUNT comment '卖家运输方式折扣';

/*==============================================================*/
/* Table: T_SS_VALUE_TO_ATTRANDVALUE                            */
/*==============================================================*/
create table T_SS_VALUE_TO_ATTRANDVALUE
(
   id                   int not null auto_increment comment '自增id',
   attrvalueid          int comment '前导属性值id',
   slave_attrid         int comment '从属性id',
   slave_attrvalueid    int comment '从属性值id（如果为空则是属性约束）',
   primary key (id)
);

alter table T_SS_VALUE_TO_ATTRANDVALUE comment '前导属性值约束表（某个或某些属性及属性值只有在某个或某些属性值成立的前提下有意义，即这部分属性及属性值受约束与前导属性值';

/*==============================================================*/
/* Table: T_SURVEY_ANSWER                                       */
/*==============================================================*/
create table T_SURVEY_ANSWER
(
   answer_id            int not null auto_increment comment '答案id',
   answer_desc          text comment '答案描述',
   question_id          int comment '问题id',
   primary key (answer_id)
);

alter table T_SURVEY_ANSWER comment '答案表';

/*==============================================================*/
/* Table: T_SURVEY_PAPER                                        */
/*==============================================================*/
create table T_SURVEY_PAPER
(
   paper_id             int not null auto_increment comment '问卷id',
   paper_name           varchar(500) comment '问卷名称',
   paper_createdt       datetime comment '问卷创建日期',
   paper_create_user    varchar(100) comment '问卷创建者',
   primary key (paper_id)
);

alter table T_SURVEY_PAPER comment '问卷表';

/*==============================================================*/
/* Table: T_SURVEY_QUESTION                                     */
/*==============================================================*/
create table T_SURVEY_QUESTION
(
   question_id          int not null auto_increment comment '问题id',
   question_name        varchar(500) comment '问题名称',
   question_desc        text comment '问题描述',
   question_type        char(1) comment '问题类型',
   paper_id             int comment '问卷id',
   primary key (question_id)
);

alter table T_SURVEY_QUESTION comment '问卷问题表';

/*==============================================================*/
/* Table: T_SURVEY_USERANSWER                                   */
/*==============================================================*/
create table T_SURVEY_USERANSWER
(
   id                   int not null auto_increment comment '自增id',
   user_email           varchar(200) comment '用户email（如果email空则填写年月日时分秒再加4位随机数）',
   user_ip              varchar(100) comment '用户ip',
   submit_dt            datetime comment '问卷提交日期',
   question_id          int comment '问题id',
   answer_id            int comment '用户对此问题的答案',
   answer_advice        text comment '用户对此答案的补充描述',
   primary key (id)
);

alter table T_SURVEY_USERANSWER comment '用户填写表';

/*==============================================================*/
/* Table: T_SYS_DISPUTE                                         */
/*==============================================================*/
create table T_SYS_DISPUTE
(
   dispute_id           int not null auto_increment comment '纠纷id',
   order_code           varchar(20) comment '订单号',
   buyer_id             int comment '买家id',
   seller_id            int comment '卖家id',
   dispute_reason       varchar(500) comment '纠纷描述',
   picurl               varchar(500) comment '图片url',
   dispute_type         char(1) comment 'dispute类型1.未收到货，2.货与订单不符',
   create_date          datetime comment 'dispute 开始时间',
   end_date             datetime comment 'dispute 结束时间',
   arbitration_date     datetime comment '提交仲裁时间',
   pact_times           int comment '协定次数',
   last_pact_id         int comment '最后一次协定id ',
   dispute_status       char(1) comment 'dispute 状态：1.新建，2.协议中，3仲裁中，4协议达成，5已仲裁，6仲裁确认，7协议确认, 8关闭',
   operation_stuff      varchar(20) comment '关闭纠纷人的id(买家 id或者 后台管理人员id )',
   paypal_reason        varchar(2) comment 'paypal 纠纷原因 1:buyer dispute 2.paypal hold',
   close_reason         varchar(500) comment '解除纠纷原因',
   arbitration_dealdate datetime comment '仲裁日期',
   arbitration_dealuser varchar(20) comment '仲裁人',
   primary key (dispute_id)
);

alter table T_SYS_DISPUTE comment '纠纷表';

/*==============================================================*/
/* Table: T_SYS_DISPUTE_PACT_DETAIL                             */
/*==============================================================*/
create table T_SYS_DISPUTE_PACT_DETAIL
(
   id                   int not null auto_increment comment '纠纷协定id',
   dispute_id           int comment '纠纷id',
   pact_type            char(1) comment ' 协定类型：1全额退款，2换货，3部分退款 4,重新发货，5，证据提交',
   message              varchar(500) comment '描述',
   picurl               varchar(500) comment '图片',
   momey                numeric(10,2) comment ' 协定金额',
   buyer_code           varchar(50) comment '运单号或发货单号',
   seller_code          varchar(50) comment '运单号或发货单号',
   is_agree             char(1) comment '协定是否达成 1买家拒绝，2卖家拒绝，3-达成',
   buyer_confirm        char(1) comment '买家确认，0未确认，1.确认，',
   seller_confirm       char(1) comment '卖家确认，0未确认，1.确认，',
   organiger            char(1) comment '发起人 1买家 2卖家，3平台',
   msg_to               char(1) comment '消息接收人： 1买家 2卖家，3平台 4，买卖双方',
   create_time          datetime comment '创建时间',
   end_time             datetime comment '协定结束时间',
   b_ship_type          char(50),
   s_ship_type          char(50),
   primary key (id)
);

alter table T_SYS_DISPUTE_PACT_DETAIL comment '纠纷协定记录表';

/*==============================================================*/
/* Table: T_SYS_GEO                                             */
/*==============================================================*/
create table T_SYS_GEO
(
   geo_code             varchar(50) not null comment '地理位置编码',
   geo_name             varchar(100) comment '地理位置',
   geo_type             char(1) comment '类型（1-国内，2-国外）',
   geo_ename            varchar(100) comment '英文名',
   paypal_ename         varchar(10) comment 'paypal地理信息缩写',
   primary key (geo_code)
)
type = MYISAM;

alter table T_SYS_GEO comment '地理位置信息表';

/*==============================================================*/
/* Table: T_SYS_MAILQUEUE                                       */
/*==============================================================*/
create table T_SYS_MAILQUEUE
(
   mailid               int not null auto_increment comment '自增id',
   mailtype             int,
   mailfrom             varchar(300),
   mailfrom_name        varchar(300),
   mailto               varchar(300),
   mailto_name          varchar(300),
   attachment           varchar(300),
   attachment_name      varchar(300),
   subject              varchar(300),
   body                 text,
   altbody              varchar(300),
   mailcc               varchar(300),
   inquerytime          datetime,
   sendmailtime         datetime,
   send_ip              varchar(300),
   mail_flag            int(2),
   mail_send_level      int(2),
   primary key (mailid)
)
type = MYISAM;

alter table T_SYS_MAILQUEUE comment '邮件队列表';

/*==============================================================*/
/* Table: T_SYS_PAYTYPE                                         */
/*==============================================================*/
create table T_SYS_PAYTYPE
(
   paytype_code         varchar(20) not null comment '支付类型码（paypal/westernunion/visa/banktransfer）',
   paytype_desc         varchar(100) comment '描述',
   pay_discount         numeric(10,4) comment '折扣比例',
   pay_on_offline       char(1) comment '线上还是线下',
   primary key (paytype_code)
)
type = MYISAM;

alter table T_SYS_PAYTYPE comment '支付类型表';

/*==============================================================*/
/* Table: T_SYS_PROD_SEC                                        */
/*==============================================================*/
create table T_SYS_PROD_SEC
(
   prod_id              int not null,
   prod_ename           varchar(300),
   description          text,
   tootoocat            varchar(300),
   prod_catcode         int unsigned,
   create_dt            datetime,
   tag                  text,
   wholesaleonly        int,
   freeshipping         int,
   price                numeric(10,2),
   download_flag        char(1) comment '抓取标识',
   seller_id            int,
   keyworddesc          varchar(500),
   prod_status          char(1),
   sec_in_flag          char(1),
   sec_out_flag         char(1),
   primary key (prod_id)
)
type = MYISAM;

alter table T_SYS_PROD_SEC comment '产品引擎表（引擎建立索引的时候使用该表）';

/*==============================================================*/
/* Table: T_SYS_PROD_SEC_POWER                                  */
/*==============================================================*/
create table T_SYS_PROD_SEC_POWER
(
   id                   int not null auto_increment,
   prod_id              int comment '产品id',
   keyword              varchar(500) comment '关键词',
   power                int comment '权值',
   user                 varchar(100) comment '用户',
   dt                   datetime comment '日期',
   primary key (id)
)
type = MYISAM;

alter table T_SYS_PROD_SEC_POWER comment '产品权值表';

/*==============================================================*/
/* Table: T_SYS_RESEARCH                                        */
/*==============================================================*/
create table T_SYS_RESEARCH
(
   id                   int not null auto_increment comment 'id',
   email_addr           varchar(100) comment 'email地址',
   email_content        varchar(500) comment 'email内容',
   ip_addr              varchar(100) comment 'ip地址',
   create_dt            datetime comment '创建日期',
   deal_status          char(1) comment '处理状态',
   deal_dt              datetime comment '处理日期',
   deal_user            varchar(100) comment '处理人',
   remark               varchar(1000) comment '备注',
   primary key (id)
)
type = MYISAM;

alter table T_SYS_RESEARCH comment '调研用表';

/*==============================================================*/
/* Table: T_SYS_SHIPPING_PRICE                                  */
/*==============================================================*/
create table T_SYS_SHIPPING_PRICE
(
   shpprice_id          int not null auto_increment comment '运费id',
   shp_type             varchar(20) comment '运输方式（1-ems、2-fedex、3-ups、4-tnt、5-dhl）',
   start_region         varchar(50) comment '起始地区域码（1-中国）',
   pack_type            char(1) comment '包装类型（1-包裹）',
   weight_kgs           numeric(10,2) comment '货物重量',
   release_dt           datetime comment '发布日期',
   scale_1              numeric(10,4) comment '计费标准1',
   scale_2              numeric(10,4),
   scale_3              numeric(10,4),
   scale_4              numeric(10,4),
   scale_5              numeric(10,4),
   scale_6              numeric(10,4),
   scale_7              numeric(10,4),
   scale_8              numeric(10,4),
   scale_9              numeric(10,4),
   scale_10             numeric(10,4),
   scale_11             numeric(10,4),
   scale_12             numeric(10,4),
   primary key (shpprice_id)
)
type = MYISAM;

alter table T_SYS_SHIPPING_PRICE comment '运费表';

/*==============================================================*/
/* Table: T_SYS_SHIPPING_REGION                                 */
/*==============================================================*/
create table T_SYS_SHIPPING_REGION
(
   region_id            int not null auto_increment comment '地域id',
   geo_code             varchar(50) comment '地理位置编码',
   region_name          varchar(100) comment '地域名称',
   start_end_flag       char(1) comment '起始地目的地标识（0-起始地、1-目的地）',
   service_type         varchar(20) comment '服务类型（1-全球速快）',
   ems_shpregion        varchar(10) comment 'ems地域区码',
   fedex_shpregion      varchar(10) comment 'fedex地域区码',
   ups_shpregion        varchar(10) comment 'ups地域区码',
   tnt_shpregion        varchar(10) comment 'tnt地域区码',
   dhl_shpregion        varchar(10) comment 'dhl地域区码',
   primary key (region_id)
)
type = MYISAM;

alter table T_SYS_SHIPPING_REGION comment '物流区域信息表';

/*==============================================================*/
/* Table: T_SYS_SHPTYPE                                         */
/*==============================================================*/
create table T_SYS_SHPTYPE
(
   shptype_code         char(1) not null comment '编码',
   shptype_name         varchar(20) comment '运输方式（1-ems、2-fedex、3-ups、4-tnt、5-dhl）',
   shptype_tax          numeric(10,4) comment '燃油税',
   vol_weight_scale     numeric(10,4) comment '体积重量系数（用体积除以这个系数得到体积重量）',
   primary key (shptype_code)
)
type = MYISAM;

alter table T_SYS_SHPTYPE comment '物流方式表';

/*==============================================================*/
/* Table: T_SYS_SYSTEM_FLAG                                     */
/*==============================================================*/
create table T_SYS_SYSTEM_FLAG
(
   id                   int not null auto_increment,
   transaction_cost     numeric(10,4) comment '交易佣金比例',
   transaction_days     int comment '交易默认期限',
   exchange_rate_dollar numeric(10,4) comment '汇率（美元）',
   primary key (id)
)
type = MYISAM;

alter table T_SYS_SYSTEM_FLAG comment '系统标志表（该表仅一条记录，记录一些系统状态信息，比如交易佣金、交易期默认天数等）';

/*==============================================================*/
/* Table: t_sys_sec_popular_search                              */
/*==============================================================*/
create table t_sys_sec_popular_search
(
   search_id            int not null auto_increment comment '自动增量',
   search_word          varchar(500) comment '热门搜索词',
   recom_id             int unsigned comment '按类出产品的类编码，类编码可延伸到刻画词编码',
   recom_ename          varchar(128) comment '按类出产品的类英文名称',
   word_rank            int comment '搜索词权重',
   is_mannual           char(1) comment '表示这个记录是手动产生或是机器自动产生',
   update_time          datetime comment '存储更新时间',
   primary key (search_id)
);

alter table t_sys_sec_popular_search comment '推荐热词表（给引擎用）';

/*==============================================================*/
/* Table: t_sys_sec_recommended_prod                            */
/*==============================================================*/
create table t_sys_sec_recommended_prod
(
   id                   int not null auto_increment comment '自动增量',
   recom_id             int unsigned comment '按类出产品的类编码，类编码可延伸到刻画词编码',
   recom_ename          varchar(128),
   cat_firstid          int unsigned comment '一级分类id',
   cat_firstname        varchar(128) comment '一级分类名称',
   cat_secondid         int unsigned comment '二级分类id',
   cat_secondname       varchar(128) comment '二级分类名称',
   cat_thirdid          int unsigned comment '三级分类id',
   cat_thirdname        varchar(128) comment '三级分类名称',
   is_product           char(1) comment '表示按类出的是产品或主题图片',
   prod_id              int comment '当is_product=1时，存储的是一个产品id，可从产品库读取产品相关的信息',
   ename                varchar(300) comment '当is_product=0时有效，存储主题名称',
   pic_url              varchar(500) comment '当is_product=0时有效，存储主题图片',
   link_url             varchar(500) comment '当is_product=0时有效，存储主题所对应的目标链接',
   is_mannual           char(1) comment '表示这个记录是手动产生或是机器自动产生',
   update_time          datetime comment '存储更新时间',
   product_status       char(1) comment '产品状态：上架和下架；当is_product=1有效',
   info_source          char(1) comment '推荐来源：订单或新上传',
   primary key (id)
);

alter table t_sys_sec_recommended_prod comment '引擎推荐产品表（给引擎推荐产品使用）';

alter table T_BS_BILL_ADDR add constraint FK_bs_billaddr_buyer_id foreign key (buyer_id)
      references T_BS_BUYER_INFO (buyer_id) on delete restrict on update restrict;

alter table T_BS_BUYER_COMP add constraint FK_bs_buyercomp_catcode foreign key (cat_code)
      references T_BS_COMP_CATEGORY (cat_code) on delete restrict on update restrict;

alter table T_BS_BUYER_COMP add constraint FK_bs_comp_buyer_id foreign key (buyer_id)
      references T_BS_BUYER_INFO (buyer_id) on delete restrict on update restrict;

alter table T_BS_SHIP_ADDR add constraint FK_addr_buyer_id foreign key (buyer_id)
      references T_BS_BUYER_INFO (buyer_id) on delete restrict on update restrict;

alter table T_EDM_USER_CATEGORIES add constraint FK_Reference_56 foreign key (category_id)
      references T_EDM_CATEGORIES (category_id) on delete restrict on update restrict;

alter table T_FS_REQCASH_INFO add constraint FK_Reference_42 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_FS_SL add constraint FK_Reference_34 foreign key (gl_id)
      references T_FS_GL (gl_id) on delete restrict on update restrict;

alter table T_FS_SL add constraint FK_Reference_36 foreign key (about_id)
      references T_FS_PAYMENT_INFO (pay_id) on delete restrict on update restrict;

alter table T_FS_SL add constraint FK_Reference_37 foreign key (about_id)
      references T_FS_REQCASH_INFO (reqcash_id) on delete restrict on update restrict;

alter table T_FS_SL add constraint FK_Reference_43 foreign key (about_id)
      references T_FS_REQCASH_INFO (reqcash_id) on delete restrict on update restrict;

alter table T_OS_ORDER_INFO add constraint FK_os_order_buyer_buyerid foreign key (buyer_id)
      references T_BS_BUYER_INFO (buyer_id) on delete restrict on update restrict;

alter table T_OS_ORDER_INFO add constraint FK_Reference_35 foreign key (pay_type)
      references T_SYS_PAYTYPE (paytype_code) on delete restrict on update restrict;

alter table T_OS_ORDER_ITEMS add constraint FK_os_orderitems_ordercode foreign key (order_code)
      references T_OS_ORDER_INFO (order_code) on delete restrict on update restrict;

alter table T_OS_ORDER_ITEMS_PRODINFO add constraint FK_Reference_62 foreign key (item_id)
      references T_OS_ORDER_ITEMS (item_id) on delete restrict on update restrict;

alter table T_OS_PRODPRICE_SNAPSHOT add constraint FK_Reference_58 foreign key (order_code)
      references T_OS_ORDER_INFO (order_code) on delete restrict on update restrict;

alter table T_RS_MSG add constraint FK_FK_rs_review_ordercode foreign key ()
      references T_OS_ORDER_INFO (order_code) on delete restrict on update restrict;

alter table T_SS_ATTR add constraint FK_Reference_73 foreign key (basecatid)
      references T_SS_BASE_CAT (basecatid) on delete restrict on update restrict;

alter table T_SS_ATTRVALUE add constraint FK_Reference_74 foreign key (attrid)
      references T_SS_ATTR (attrid) on delete restrict on update restrict;

alter table T_SS_BASE_CAT add constraint FK_Reference_82 foreign key (groupdirid)
      references T_SS_BASECAT_GROUP (catgroupid) on delete restrict on update restrict;

alter table T_SS_GOODS add constraint FK_Reference_68 foreign key (prod_id)
      references T_SS_PRODUCT_SALE (prod_id) on delete restrict on update restrict;

alter table T_SS_GOODS add constraint FK_Reference_83 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_GOODS_OPTION add constraint FK_Reference_63 foreign key (goods_id)
      references T_SS_GOODS (goods_id) on delete restrict on update restrict;

alter table T_SS_GOODS_PRICE add constraint FK_Reference_19 foreign key (goods_id)
      references T_SS_PRODUCT (prod_id) on delete restrict on update restrict;

alter table T_SS_GOODS_PRICE add constraint FK_Reference_64 foreign key ()
      references T_SS_GOODS_OPTION (id) on delete restrict on update restrict;

alter table T_SS_GOODS_PRICE add constraint FK_Reference_65 foreign key (goods_id)
      references T_SS_GOODS (goods_id) on delete restrict on update restrict;

alter table T_SS_GOODS_PRICE add constraint FK_Reference_70 foreign key (goods_id)
      references T_SS_GOODS (goods_id) on delete restrict on update restrict;

alter table T_SS_GOODS_SHIPTYPE add constraint FK_Reference_21 foreign key (goods_id)
      references T_SS_PRODUCT (prod_id) on delete restrict on update restrict;

alter table T_SS_GOODS_SHIPTYPE add constraint FK_Reference_69 foreign key (goods_id)
      references T_SS_GOODS (goods_id) on delete restrict on update restrict;

alter table T_SS_PRODSALE_ATTR add constraint FK_Reference_75 foreign key (prod_id)
      references T_SS_PRODUCT_SALE (prod_id) on delete restrict on update restrict;

alter table T_SS_PRODSALE_ATTR add constraint FK_Reference_81 foreign key (attrid)
      references T_SS_ATTR (attrid) on delete restrict on update restrict;

alter table T_SS_PRODUCT add constraint FK_Reference_10 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_PRODUCT add constraint FK_Reference_61 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_PRODUCT add constraint FK_Reference_80 foreign key (basecatid)
      references T_SS_BASE_CAT (basecatid) on delete restrict on update restrict;

alter table T_SS_PRODUCT_SALE add constraint FK_Reference_72 foreign key (basecatid)
      references T_SS_BASE_CAT (basecatid) on delete restrict on update restrict;

alter table T_SS_PROD_ATTR add constraint FK_Reference_79 foreign key (prod_id)
      references T_SS_PRODUCT (prod_id) on delete restrict on update restrict;

alter table T_SS_PROD_OPTION add constraint FK_Reference_67 foreign key (prod_price_id)
      references T_SS_PROD_PRICE (prod_price_id) on delete restrict on update restrict;

alter table T_SS_PROD_PRICE add constraint FK_Reference_60 foreign key (prod_id)
      references T_SS_PRODUCT (prod_id) on delete restrict on update restrict;

alter table T_SS_PROD_SHIPTYPE add constraint FK_Reference_59 foreign key (prod_id)
      references T_SS_PRODUCT (prod_id) on delete restrict on update restrict;

alter table T_SS_QUESTION_ANSWER add constraint FK_Reference_49 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_QUESTION_ANSWER add constraint FK_Reference_50 foreign key (cate_id)
      references T_SS_QUESTION_CATEGORY (cate_id) on delete restrict on update restrict;

alter table T_SS_SALE_CAT_RELATION add constraint FK_Reference_76 foreign key (salecatid)
      references T_SS_SALE_CAT (salecatid) on delete restrict on update restrict;

alter table T_SS_SALE_CAT_RELATION add constraint FK_Reference_77 foreign key (basecatid)
      references T_SS_BASE_CAT (basecatid) on delete restrict on update restrict;

alter table T_SS_SALE_CAT_RELATION add constraint FK_Reference_78 foreign key (attrid)
      references T_SS_ATTR (attrid) on delete restrict on update restrict;

alter table T_SS_SELLER_AUTH add constraint FK_Reference_44 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SELLER_COMP add constraint FK_Reference_12 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SELLER_COMP add constraint FK_Reference_28 foreign key (comp_cat)
      references T_SS_COMP_CATEGORY (cat_code) on delete restrict on update restrict;

alter table T_SS_SELLER_COMP add constraint FK_Reference_32 foreign key (comp_cat)
      references T_SS_COMP_CATEGORY (cat_code) on delete restrict on update restrict;

alter table T_SS_SELLER_CREDIT add constraint FK_Reference_22 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SELLER_LEVEL add constraint FK_Reference_51 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SELLER_ORDER add constraint FK_Reference_13 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SHPMODEL add constraint FK_Reference_30 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SS_SHPMODEL_ITEMS add constraint FK_Reference_31 foreign key (shpmodel_id)
      references T_SS_SHPMODEL (shpmodel_id) on delete restrict on update restrict;

alter table T_SS_SHPTYPE_DISCOUNT add constraint FK_Reference_33 foreign key (seller_id)
      references T_SS_SELLER_INFO (seller_id) on delete restrict on update restrict;

alter table T_SURVEY_ANSWER add constraint FK_Reference_53 foreign key (question_id)
      references T_SURVEY_QUESTION (question_id) on delete restrict on update restrict;

alter table T_SURVEY_QUESTION add constraint FK_Reference_52 foreign key (paper_id)
      references T_SURVEY_PAPER (paper_id) on delete restrict on update restrict;

alter table T_SURVEY_USERANSWER add constraint FK_Reference_54 foreign key (question_id)
      references T_SURVEY_QUESTION (question_id) on delete restrict on update restrict;

alter table T_SURVEY_USERANSWER add constraint FK_Reference_55 foreign key (answer_id)
      references T_SURVEY_ANSWER (answer_id) on delete restrict on update restrict;

alter table T_SYS_DISPUTE_PACT_DETAIL add constraint FK_Reference_57 foreign key (dispute_id)
      references T_SYS_DISPUTE (dispute_id) on delete restrict on update restrict;

alter table T_SYS_SHIPPING_REGION add constraint FK_Reference_14 foreign key (geo_code)
      references T_SYS_GEO (geo_code) on delete restrict on update restrict;

