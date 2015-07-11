
insert into com_dict_tb(sun_key,val,prompt) values ('K_MAILSTA','0','未绑定');
insert into com_dict_tb(sun_key,val,prompt) values ('K_MAILSTA','1','已绑定');

insert into com_dict_tb(sun_key,val,prompt) values ('K_ACCTSTA','0','未激活');
insert into com_dict_tb(sun_key,val,prompt) values ('K_ACCTSTA','1','已激活');
insert into com_dict_tb(sun_key,val,prompt) values ('K_ACCTSTA','2','已冻结');

insert into com_dict_tb(sun_key,val,prompt) values ('K_SEX','0','男');
insert into com_dict_tb(sun_key,val,prompt) values ('K_SEX','1','女');

insert into com_dict_tb(sun_key,val,prompt) values ('K_AMTTYPE','0','收入');
insert into com_dict_tb(sun_key,val,prompt) values ('K_AMTTYPE','1','支出');

insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSCHANNEL','0','WEB端');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSCHANNEL','1','手机端');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSCHANNEL','2','微信端');


insert into com_dict_tb(sun_key,val,prompt) values ('K_PAYCHANNEL','0','电子账户');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PAYCHANNEL','1','充值卡');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PAYCHANNEL','2','网银');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PAYCHANNEL','3','支付宝');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PAYCHANNEL','4','其他');

insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSTYPE','0','资金类交易');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSTYPE','1','账户类交易');

insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSSTATE','0','待付款');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSSTATE','1','交易失败');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSSTATE','2','超时');
insert into com_dict_tb(sun_key,val,prompt) values ('K_TRANSSTATE','S','成功');

insert into com_dict_tb(sun_key,val,prompt) values ('K_CARDTYPE','1','支取');
insert into com_dict_tb(sun_key,val,prompt) values ('K_CARDTYPE','1','体现');
insert into com_dict_tb(sun_key,val,prompt) values ('K_CARDTYPE','2','支付与提现');

insert into com_dict_tb(sun_key,val,prompt) values ('K_ISUSE','0','否');
insert into com_dict_tb(sun_key,val,prompt) values ('K_ISUSE','1','是');

insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODTYPE','0','货币基金');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODTYPE','1','普通基金');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODTYPE','2','小微企业贷款');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODTYPE','3','个人贷款');

insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODSTATE','0','募集');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODSTATE','1','开放');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODSTATE','2','封闭');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODSTATE','3','募集结束');
insert into com_dict_tb(sun_key,val,prompt) values ('K_PRODSTATE','4','产品终止');

insert into com_dict_tb(sun_key,val,prompt) values ('K_CURRTYPE','156','人民币');
insert into com_dict_tb(sun_key,val,prompt) values ('K_CURRTYPE','084','美元');

insert into com_dict_tb(sun_key,val,prompt) values ('K_REPAYTYPE','0','按月等额本金');
insert into com_dict_tb(sun_key,val,prompt) values ('K_REPAYTYPE','1','按月等额本息');
insert into com_dict_tb(sun_key,val,prompt) values ('K_REPAYTYPE','2','按季本额本金');
insert into com_dict_tb(sun_key,val,prompt) values ('K_REPAYTYPE','3','按季等额本息');
insert into com_dict_tb(sun_key,val,prompt) values ('K_REPAYTYPE','4','到期日一次性还款');




insert into com_dictmap_tb(prompt,sun_key) values('币种'	,	'K_CURRTYPE'	);
insert into com_dictmap_tb(prompt,sun_key) values('产品类别'	,	'K_PRODTYPE'	);
insert into com_dictmap_tb(prompt,sun_key) values('产品状态'	,	'K_PRODSTATE'	);
insert into com_dictmap_tb(prompt,sun_key) values('还款方式'	,	'K_REPAYTYPE'	);
insert into com_dictmap_tb(prompt,sun_key) values('交易类型'	,	'K_TRANSTYPE'	);
insert into com_dictmap_tb(prompt,sun_key) values('交易渠道'	,	'K_TRANSCHANNEL'	);
insert into com_dictmap_tb(prompt,sun_key) values('交易状态'	,	'K_TRANSSTATE'	);
insert into com_dictmap_tb(prompt,sun_key) values('卡类型'	,	'K_CARDTYPE'	);
insert into com_dictmap_tb(prompt,sun_key) values('是非'	,	'K_ISUSE'	);
insert into com_dictmap_tb(prompt,sun_key) values('性别'	,	'K_SEX'	);
insert into com_dictmap_tb(prompt,sun_key) values('邮箱是否验证',	'K_MAILSTA'	);
insert into com_dictmap_tb(prompt,sun_key) values('账户状态'	,	'K_ACCTSTA'	);
insert into com_dictmap_tb(prompt,sun_key) values('支付渠道'	,	'K_PAYCHANNEL'	);
insert into com_dictmap_tb(prompt,sun_key) values('资金流向'	,	'K_AMTTYPE'	);