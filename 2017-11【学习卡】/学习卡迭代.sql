
一、说明
学习卡 1 —— n 批次 1 —— n 该批次下的卡 1 —— 1【实体卡/兑换码】 

学习卡：包含学习卡名称、封面图、有效期、分成比例、折扣、发放渠道以及适用范围。
批次：在不同批次下，卡的数量和面额可任意配置。


二、运营侧-学习卡管理【运营后台 study-backend】
1、学习卡管理

1.1、创建批次：
批次db表字段设计：
id , gmt_create, gmt_modified，card_id , amount , count ，operator_id ， 已绑定数；


生成 count 个 卡【有无需求？卡号 不取数据库id，避免遍历】，每个卡生成 唯一的 符合规则的 兑换码；

批次下的卡：
batch_id , id , gmt_create， gmt_modified ，兑换码 redeemCode ， 余额【remain_amount】， 面值amount【在批次中，冗余进来】， bind_status 【枚举定义，统一状态判断复用】， 退卡状态 ，
 valid_start_time , valid_end_time [绑定时候 计算起始时间，写进来] ， bind_time【待定？？】， bing_login_id , bind_member_id

批量生成 学习卡的 多个批次！！！
【问题】 “增加限制” 的 一次性创建的总批次数字 可以给出来；

2、创建/编辑 学习卡
id , gmt_create, gmt_modified,
name , photo_url , creator_id ,
适用范围： json 字段吗？【增加 detail 表 存储】【底层读取、解析 课程接口 封装好做通用】
分成比例： fee_rate【和 C端 保持一致字段 和 类型长度，保持统一】【支付相关的 概念和 C端保持一致】
折扣： discount_rate 【C端 一致】
发放渠道： delivery_channel 
有效时间: valid_time_type + valid_start_time, valid_end_time;   valid_period

面额： `amount`

【注意】学习卡号 要不要 随机，免遍历？

3、查看批次

查看范围： 可以考虑缓存课程列表【courseId】信息；
卡号搜索： 精确搜索即可；

未绑定 但是 卡过期了 不能退！！！


三、前台-学习卡使用wap 【cp 后台， study-teach】
3.1、学习卡兑换（p0）
3.1.1、wap端学习卡入口
当前账号登陆方式如果是  重工（企业）跳转过来的可以在“帐号”tab找到“我的学习卡”入⼝，通过输入兑换码，绑定学习卡；

登录处 做特殊处理；
member 对应绑定的 login_account 应该是 重工（企业） 的特殊登录类型，据此判断 是否有 “我的学习卡”入口；

3.1.2、学习卡兑换

（1）可使用/已使用/已过期 的学习卡：
排序： 按照⽤用户的绑定时间逆时针排序。【db 需要 bind_time 字段，且加索引】
分页： 10条分页；

可使用： 已绑定且余额>0在有效期内的学习卡
已使用：余额为0
已过期：超过有效期

（2）输入兑换码绑定
操作 批次内卡数据表；【单事务】

（3）兑换卡 查看范围：
考虑加缓存；

3.2、支付下单页（p0）
3.2.1、可使用学习卡列表
排序方式：显示可使用的学习卡按时间逆时针排序

提交订单 ——> 跳转到企业app，使用福利点券支付剩余金额;

【问题】 订单支付 不走我们的 支付接口吗？

3.3、实体卡


四、订单显示
4.1、分成说明

4.2、用户侧wap-我的订单
我的订单列表： 查询订单支付中是否使用 学习卡 和 福利点券？

4.3、cp侧
交易管理 - 订单查询：
订单列表中 支付方式列：
订单详情： 学习卡/福利点券列【新增列】 + 交易金额列：

4.4、平台侧

（1）C端后台
订单列表： 添加“学习卡”、“福利点券“2列【新增列】

（2）运营后台（study-backend）
结算管理：
	增加 顶部导航栏“交易管理”：
	根据订单id 做批量结算： 更新订单状态；【 C端 交互】



五、temp 删除
5.1、web学习卡兑换





【迭代开发建议】
1、[学习卡列表]	多个地方都有，可以交给一个人去维护；

支付下单页： 用户的可使用学习卡列表，倒序；
	显示字段：余额、面值、有效期，封面图；

2、
电子协议、H5学习（加密视频播放、PDF播放）、财务结算：

支付方式中 福利点券 的功能在后面支持，这期先支持现金：


************************************************************************************************************************


【问题】
一、学习卡管理（p0）
1.1、“创建批次” > “增加限制”: 批次 数字上限 可以给出来？
1.2、学习卡 列表中， 学习卡“有效时间” 为什么 只显示 开卡截止时间，不显示 起始时间？
1.3、适用范围 排序方式：按加入课程输入的顺序; 分页规则？
	以json字符串的 课程编辑为顺序？ 【数据库 插入记录的 时候 注意插入 gmt_create 时间递增好了】
	要分页的！！！

2、创建／编辑学习卡
（1）学习课 基本信息 支持 多次编辑，哪些字段 可以改，哪些不能改？比如 适用范围、分成比例、折扣等 ？
（2）“有效时间” 设置：有2种模式， “未开卡最终使用期限” 怎么理解？
（3）“开卡截至时间” 是 一个时间 还是 起始 2个时间，是一个时间范围？

（4）若未填写学习卡分成比例，默认按原课程分成比例
	以前分成比例 是 挂在 课程维度上的吗？ 一个订单上的 不同课程，分成比例 不同，到时候怎么算？

3、查看批次
（1）


**************************************************************************************** db 设计

学习卡模板：
CREATE TABLE `pay_card` (
`id` bigint(20) NOT NULL,
`gmt_create` bigint(20) NOT NULL,
`gmt_modified` bigint(20) NOT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

`name` VARCHAR(45) DEFAULT NULL COMMENT '学习卡名称',
`cover_url` VARCHAR(45) DEFAULT NULL COMMENT '封面图',
`target_id` BIGINT(20) DEFAULT NULL COMMENT '允许的机构/课程id',
`target_type` SMALLINT(4) DEFAULT NULL COMMENT '0-全场通用，10-机构，20-课程，30-关联表',
`app_type` SMALLINT(4) DEFAULT NULL COMMENT '0:ykt 2:mooc k12:3 kada:4 enterprise:5',
`app_id` BIGINT(20) DEFAULT NULL COMMENT '',
`channel_type` SMALLINT(4) DEFAULT NULL COMMENT '1:2C，2:2B',
`channel_name` VARCHAR(45) DEFAULT NULL COMMENT '发放渠道，“;”隔开',
`creator_id` BIGINT(20) DEFAULT NULL COMMENT '创建者 member_id',

PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习卡基础表' /* BF=id, POLICY=p1, STARTID=1, ASSIGNIDTYPE=USB */;


CREATE TABLE `pay_card_course_rel` (
`id` bigint(20) NOT NULL,
`gmt_create` bigint(20) NOT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

`pay_card_id` BIGINT(20) NOT NULL COMMENT '学习卡模版id', 
`product_id` bigint(20) NOT NULL COMMENT '学习卡 试用产品id',
`product_type` smallint(6) NOT NULL COMMENT '学习卡 试用产品类型， 0 study，3 yooc，微专业',
`plat_type` smallint(6) NOT NULL COMMENT '平台类型 0云课堂',

PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习卡基础表' /* BF=pay_card_id, POLICY=p1, STARTID=1, ASSIGNIDTYPE=USB */;


CREATE TABLE `pay_card_batch` (
`id` bigint(20) NOT NULL,
`gmt_create` bigint(20) NOT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

`pay_card_id` BIGINT(20) NOT NULL COMMENT '学习卡模版id',
`amount` DECIMAL(6,2) NOT NULL COMMENT '面额',
`total_count` INT NOT NULL COMMENT '发放总数量',
`discount_rate` decimal(10,2) DEFAULT NULL COMMENT '折扣',

`use_expire_time` BIGINT(20) NOt NULL COMMENT '开卡后有效使用天数，存储时间毫秒数',
`bind_end_time` BIGINT(20) NOt NULL COMMENT '开卡截至时间,即卡兑换截至时间',

`binded_count` INT DEFAULT NULL COMMENT '已绑定总数量',
`created_count` INT DEFAULT NULL COMMENT '已经创建数量，最终应=total_count',
`creator_id` BIGINT(20) NOT NULL COMMENT '创建者 member_id',

PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习卡批次表' /* BF=id, POLICY=p1, STARTID=1, ASSIGNIDTYPE=USB */;


CREATE TABLE `批次下的卡` (
`id` bigint(20) NOT NULL COMMENT '卡号',
`gmt_create` bigint(20) NOT NULL,
`gmt_modified` bigint(20) NOT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

`code` VARCHAR(45) NOT NULL COMMENT '兑换码',
`pay_card_id` BIGINT(20) NOT NULL COMMENT '学习卡模版id',
`pay_card_batch_id` BIGINT(20) NOt NULL COMMENT '学习卡批次id',

`amount` DECIMAL(10,2) NOT NULL COMMENT '面额',
`surplus_amount` DECIMAL(10,2) NOT NULL COMMENT '剩余额度',

`status` SMALLINT(2) NOT NULL COMMENT '-1 已退卡，0 未绑定，1 已绑定',
`bind_user_id` BIGINT(20) NOT NULL COMMENT '绑定用户id',
`bind_login_id` BIGINT(20) NOT NULL COMMENT '绑定用户登录账号id，对应 login_account表的 login_id',
`bind_time` BIGINT(20) DEFAULT NULL COMMENT '绑定时间',
`use_expire_time` BIGINT(20) NOt NULL COMMENT '开卡后有效使用天数，存储时间毫秒数',

PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习卡实体表' /* BF=id, POLICY=p1, STARTID=1, ASSIGNIDTYPE=USB */;



运营后台 - 参与合作的课程：
1、运营后台 “参与合作的课程” 中搜索条件 ： 课程类型、课程id、CP-ID 三个 搜索条件 是 并集一起搜的是吧？
2、课程价格 目前 有2个价格，分别是啥？


3、微专业 是否有 cp id？



***************************************************************************************** 2017-11-15

后端  ww cy
****************************************  ww 10
协议渠道运营端 			0.5d			2
协议渠道cp端 				1d
微专业加入学习卡计划脚本 	0.5d

创建批次【兑换码分批生成】 	1d				4
批次列表(包括搜索) 		1d 
查看发放情况 				0.5d 
学习卡批次详情 			0.5d
退卡 					0.5d
查看绑定账号 				0.5d

学习卡扣款相关底层接口【余额扣减】 	1.5d	2	
订单需要获取渠道课程 				0.5d

pdf视频播放 								1.5d 
新工程环境 								0.5d 

****************************************  cy 9.75

创建学习卡 			1.5d				3.75
学习卡详情 			0.5d
学习卡列表（包括搜索） 1.25d
查看范围 				0.5d【编辑时候更新】

绑定 							0.5d 	3.5
我的学习卡 						0.5d
学习卡使用范围查看(排序) 			0.5d
学习卡适用课程索引建立 				2d

批次列表批量导出 							1.5d 【新工具】
运营侧 合作列表 导出						1d




{
	"bindLoginInfo":{"login_id":"", "login_type":""}
	"otherLoginInfo" : [{"login_id":"", "login_type":""},
		{"login_id":"", "login_type":""},
		{"login_id":"", "login_type":""}]

}


	{	
		"bindLoginInfo":{"login_id":"111", "login_type":"1"},
		"otherLoginInfo":[{"login_id":"111", "login_type":"1"},{"login_id":"111", "login_type":"1"}]
	}

1142001
30
1030267004






http://hengyi.study.163.com/courses/400000001902005/lecture-400000003159723



select * from s2_lesson_content_learn where term_id=400000001902005 and unit_id=400000003159723 and member_id=1032485608;




<?xml version="1.0" encoding="UTF-8"?>
<root>
<project-list>edu-second-party-base;edu-third-party-base;market-server;study-platform;study-teach;study-backend</project-list>
<branch-name>feature/cooperation_protocol_ww_20171117</branch-name>
<version-suffix>cooperation_protocol_ww_20171117</version-suffix>
</root>


pay_card_promoted

alter table s2_cps_promote_product add column `pay_card_promoted` smallint(6) DEFAULT '0' COMMENT '参与学习卡-企业合作课程';
alter table s2_cps_promote_product add column `scene_type` smallint(6) DEFAULT '1' COMMENT '使用场景类型， 1：CPS 分销；2：学习卡 合作课程列表；';


alter table s2_pay_card add column `fee_rate` decimal(7,6) DEFAULT '0.000000' COMMENT '平台卖家课程分成比例，目前默认 55分成';


微专业 和 系列课程 合作课程 订正接口：
http://admin.study.163.com/cp/cps/course/addCpsProduct.do?productType=30&productIdStr=""
	微专业： 30
	系列课程： 25




CREATE TABLE `s2_pay_card_batch_detail` (
`id` bigint(20) NOT NULL COMMENT '学习卡批次id',
`gmt_create` bigint(20) NOT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`remark` text NOT NULL COMMENT '学习卡批次 备注信息',
 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习卡批次 详情表' /* BF=id, POLICY=p1, STARTID=1, ASSIGNIDTYPE=USB */;


alter table s2_pay_card_use_log DROP COLUMN member_id;





insert into s2_pay_card (id,gmt_create,gmt_modified,redeem_code,pay_card_template_id,pay_card_batch_id,amount,surplus_amount,status,bind_end_time) 
values (seq,1511837116000,1511837116000,'QWERTYUPASDASDFG',1,2,50.00,50.00,0,1511971200000);


alter table s2_pay_card modify column `bind_member_id` BIGINT(20) DEFAULT NULL COMMENT '绑定用户id';
alter table s2_pay_card modify column `bind_ext_info` VARCHAR(125) DEFAULT NULL COMMENT '绑定用户登录账号信息，json 存储:{"loginId":"XXX", "loginType":"XXX"}';
alter table s2_pay_card modify column `refunder_id` BIGINT(20) DEFAULT NULL COMMENT '退卡操作者的member_id';

alter table s2_pay_card modify column `use_end_time` BIGINT(20) DEFAULT NULL COMMENT '开卡后使用有效截止时间，通过s2_pay_card_batch表的use_expire_time + bind_time获得';






12001,1002230001,1002229004,1002238001,1002240002,1002241005,1002239001,1002239002,1002255001




http://admin.study.163.com/cp/cps/course/addCpsProduct.do?productId=1002238001,1002240002,1002241005,1002239001,1002239002,1002255001&productType=30&sceneType=2



{"loginId":"echo_hasi2@163.com", "loginType":"-1"}

1514452554000




************************************************************************* 2017-11-29

一、mxx
1、需求
LessonLearnBean.updateTextLearnPage
pdf记录当前播放到第几页的接口

http://study.163.com/dwr/call/plaincall/LessonLearnBean.getTextLearnInfo.dwr?1511861560859
这个接口 pdfUrl


pdf课程的接口 LessonLearnBean.getTextLearnInfo

视频接口 LessonLearnBean.getVideoLearnInfo



2、pdf



URL url = EduNosUtil.getEduNosInstance(docConfig.getNosAccessKey(), docConfig.getNosSecretKey())
					.generateDownloadURL(docContent.getNosBucket(), dto.getNosKey(), expire, dto.getFileName());

企业云：

视频：
	UnitVideoResourceVo
		private String          m3u8SdUrl = null;
	    private String          m3u8HdUrl = null;
	    private String          m3u8ShdUrl = null;

		String                  videoDecryptData;		增肌 ios 和 安卓 的 key


C 端：
lesson_video_content		课件视频资源表；
	lesson_id = ？
	video_id
video 				视频表

结果：  VideoVo   	在edu-core 包中定义；



pdf:
	DocContentDto
		private String nosDownloadUrl;//待下载的连接，非swf


C端：
lesson_pdf_content 表 ：存放 pdf 资源；
	lesson_id = ？
lesson_pdf_swf 表： pdf 转为 flash ；
	pdf_content_id = ？（lesson_pdf_content 的 id）


1.0 study-platform nos 配置：

测试环境： 
nos_bucket_pdfsrc=edu-lesson-pdfsrc
nos_bucket_content=edu-lesson-content

线上 环境：
nos_bucket_pdfsrc=edu-lesson-pdfsrc
nos_bucket_content=edu-lesson-content


nos_duration=300000
nos_accessKey=7ba71f968e4340f1ab476ecb300190fa
nos_secretKey=ef576e1c94744030b82e46a47c79b3ad



<exclusions>
    <exclusion>
        <groupId>org.springframework</groupId>
        <artifactId>spring</artifactId>
    </exclusion>
</exclusions>










冒烟：
1、创建批次，弹窗：渠道不是 hover 显示，而是全部显示出来的；		【ww-冒烟3】
2、查看批次页面，发放渠道 内容没有 hover，样式溢出来了；	http://admin.study.163.com/admin.htm#/m/payCard/checkBatch/?id=13007
3、

select * from  s2_pay_card where  pay_card_batch_id = 12007  order by gmt_create desc limit 20 params:[]

select * from  s2_pay_card where  pay_card_batch_id = 12007  order by gmt_create desc limit 20 offset 20 params:[]







.	androidM3u8DecryptionKey: "http://ls.study.163.com/j/lecture/video/key.json?id=1007886003", 
iosM3u8DecryptionKey: "g1ZtxJ5GRDeK3C8CzWn4cg==", opacity: 10,
 videoDecryptionKey: "ODM1NjZkYzQ5ZTQ2NDQzNzhhZGMyZjAyY2Q2OWY4NzI="}

	.	androidM3u8DecryptionKey : "http://ls.study.163.com/j/lecture/video/key.json?id=1007886003" 
iosM3u8DecryptionKey : "g1ZtxJ5GRDeK3C8CzWn4cg==" opacity : 10 
videoDecryptionKey : "ODM1NjZkYzQ5ZTQ2NDQzNzhhZGMyZjAyY2Q2OWY4NzI=" 


video_key:  ODM1NjZkYzQ5ZTQ2NDQzNzhhZGMyZjAyY2Q2OWY4NzI=





"c972aec118fee69f"




{"videoDecryptionKey":"MjdkODdhY2YxZDZjNGMzMzhjMWViMzRjYzBlNjg2MmQ=",
"opacity":10,"salt":"A18111C4952D3053FC7B0A1AD9E8173C",
"iosM3u8DecryptionKey":[39,-40,122,-49,29,108,76,51,-116,30,-77,76,-64,-26,-122,45],
"androidM3u8DecryptionKey":"http://ls.study.163.com/j/lecture/video/key.json?id=1004121127"}

Process finished with exit code 0



JeiGMN2qJkGSlBtbq8Gc/BDg2D1x0U7cpB5PwtZ3LW2r/JhtFeLQOz9s3325xDISt1Syl9MJ6SJnmzICWp2OL+pbq4dHGyoAjOHwqLe+qtnRfu4wWFOd3/OtQsKhUJ6ExNrDTC+kb1llfHV6HpYltHS1P0X/U9PMoDAj0bdhX5DdK1KfgGVYTIlqOrBTeP34A5b1Vv5avRM4xGwyXFJ4qbETKJgA7Ot1UFM+Mre/GwU=

Process finished with exit code 0




********************************** 2017-11-30 晚上冒烟
一、 TODO

1、批次 使用信息 的 count；
 pay_card_batch_id = ? and (status = 0 and bind_end_time <= ? ) or (status = 1 and use_end_time <= ?)


select * from s2_pay_card where pay_card_batch_id=16001 and ((status = 0 and bind_end_time <= 1512056560000 ) or (status = 1 and use_end_time <= 1512056560000));



2、查看绑定账号：

手机号显示不对；【待修改】
	手机号根据 login_id = app_passport.id 取 app_user_login_id 即为手机号；

微信：
	login_type = 6， login_id 即为 微信的 唯一标识；
微博：
	login_type = 2， login_id 即为 微博的 唯一标识；
人人：
	login_type = 3， login_id 即为 人人的 唯一标识；



二、构造数据

数据库数据修改：

id： 88013473
	bindEndTime ： 	1513267200000	修改为 1512027900061



2017-11-30 23:00   1512054000000


实用技能课程：
1004966001;1004968005;1004983001;1004974001


lesson_id = 1003222107 		1004122133		修改为 1006446024
							


三、sql 查询语句

select * from s2_pay_card where pay_card_batch_id = 16001 and status = 1;


已过期卡数：
select count(*) from  s2_pay_card where pay_card_batch_id = 16001 and  ((status = 0 and bind_end_time <= 1512060843109) or (status = 1 and use_end_time <= 1512060843109))  params:[16001, , ]

select count(*) from s2_pay_card where pay_card_batch_id=16001 and status = 0 and bind_end_time <= 1512060843109;

select count(*) from s2_pay_card where pay_card_batch_id=16001 and status = 1 and use_end_time <= 1512060843109;

剩余可使用金额：
select sum(surplus_amount) from s2_pay_card where pay_card_batch_id = 16001 and  status = 1 and use_end_time > 1512062264000  params:[16001, 1512061689290]

已过期留存金额：
select sum(surplus_amount) from s2_pay_card where pay_card_batch_id = 16001 and  status = 1 and use_end_time <= 1512061689290  params:[16001, 1512061689290]



四、冒烟问题

1、 【待确认】已退卡的 学习卡 状态应显示 ”已退卡“，目前显示的 是 ”未绑定“（”操作“ 和 ”状态“栏 和交互稿不太一致）； 
	http://admin.study.163.com/admin.htm#/m/payCard/checkBatch/?id=16001      【88024018 卡】
2、 开卡截至时间设置为 2017-12-01 ，bindEndTime 存的是 2017/12/1 0:0:0， 应该是 2017/12/2 0:0:0（即 12-1号24点）；

3、第一次点击 “推广合作计划”，弹框，点确认； 
数据库 再删掉 该协议弹窗记录，再点 不会弹窗； 切换cp 后再进该 cp，则会弹窗；

而且，弹框的时候，列表 还能看到，应该隐藏的；
 
4、




********************************** 2017-12-1 冒烟

nicole_hf2@163.com qa1234



88024006  
88024018





query:select * from  s2_pay_card where  pay_card_batch_id = 16001  order by gmt_create desc limit 20 params:[]

query:select * from  s2_pay_card where  pay_card_batch_id = 16001  order by gmt_create desc limit 20 offset 20 params:[]

query:select * from  s2_pay_card where  pay_card_batch_id = 16001  order by gmt_create desc limit 20 offset 40 params:[]





select count(*) from  course where owner_id = ? and audit_status = ? and published = ? and active_flag = ? and web_visible = 1 
and price > 0 and display_type = 0 order by learner_count desc  params:[400000001204001, 4, 1, 1]



select id,learner_count  from  course where owner_id = ? and audit_status = ? and published = ? and active_flag = ? and web_visible = 1 
and price > 0 and display_type = 0 order by learner_count desc  limit 20 params:[400000001204001, 4, 1, 1]


select * from  course where owner_id = ? and audit_status = ? and published = ? and active_flag = ? and web_visible = 1 
and price > 0 and display_type = 0   limit 20 params:[400000001204001, 4, 1, 1]




select id,learner_count  from  course where owner_id = 400000001204001 and audit_status = 4 and published = 1 and active_flag = 1 and web_visible = 1 and price > 0 and display_type = 0 order by learner_count desc  limit 20;






select id,learner_count  from  course where owner_id = 400000001204001 and audit_status = 4 and published = 1 and active_flag = 1 and web_visible = 1 
and price > 0 and display_type = 0 order by learner_count desc  limit 20 
params:[400000001204001, 4, 1, 1]







server    一键发布就行；
	检查 日志 是否有 sql 进来；
web：
	可以先 统一构建好；
	2、  front 包含 nginx + ftl发布（和 后端web机器一一对应）
		所以 front 构建好之后，可以点击 “发布”；  ndp 已经自动做好了 分批，即 nginx 是一批，剩下的 ftl 机器 分别没台作为一批；
		所以点击 “发布” 就好，会自动发；
	
	3、 web 机器构件好，点击 “发布”，自动分批；
		注意 web 机器 和 ftl 机器 一一对应； 
		web 机器 “发布”，监控 发布日志，在 “offline success”阶段的时候，发布对应机器的 ftl；（一般来说，ftl 发布会很快，所以在 web 下线 到 上线前 这段时间 就是
		ftl 的发布时间，当然会有小概率时间 web上线好 而前端 还没发不好，这时候 会有一小部分请求 错误，可以忽略）；

操作顺序：
	1、fornt-XXX 构建，server， web 构建 （可以并行）；
	2、先发 server； 
		注意检查第一批机器的 发布日志，等到 有 sql 即表示成功；
	3、front-XX 和 web 已经构建好之后；
	3.1、现发布 front-XXX，包括 nginx 和 ftl（和web机器一一对应）；
		点击“发布”，此时 ndp 已经 做好了分批，先发 nginx...
	3.2、nginx 发布好之后，发布 web；
		点击 “发布”，ndp 对 机器 分批发布，即 一台一台 发布；比如当前 发布 机器A 的 web服务...
			监控发布日志，在 “offline success”阶段的时候，去发布 机器A 对应的 ftl（即 front-XXX）；
		机器A 最终 web 和 ftl 都发布好之后，再循环 3.2，操作 下一台机器 B...直至所有机器 发布完毕；

【注意】中间若有机器 发布失败，必须 回滚当前机器的 服务； 点击 “回滚” > "确定"（弹窗），会出现 选择 历史发布版本，选择 上一次 版本即可；



****************************** 2017-12-11

select * from s2_lesson_content_learn where term_id=400000002274004 and member_id=1030539434;


select user_id as uid, day, sum(cast((biz_dat['end_time']  - biz_dat['start_time']) as bigint))
from qyy_mid_online.user_behavior
where day >= "2017-12-01" and active_name in ('user_learn_record', 'lesson_unit_learn_record','user_learn_record', 'user_learn_end') 
and biz_dat['term_id'] is not null and user_id is not null 
and user_id = 1030539434 and biz_dat['term_id'] = 400000002274004 group by user_id,day;



{"start_time":"1512720073784","end_time":"1512720090180","course_id":"400000002233008","uid":"1030539434","content_type":"7","learn_type":"206","site_type":"0","term_id":"400000002274004","live_content_id":"400000000322008","provider_id":"400000000073001"}





sql 语句review：


select count(*) from s2_pay_card where pay_card_batch_id = ?;

select count(*) from s2_pay_card where pay_card_batch_id = ? and status = ? and surplus_amount > 0 and use_end_time > ?;

select * from s2_pay_card where bind_member_id = ? and status = ? and surplus_amount > 0 and use_end_time > ? order by bind_time desc limit ? offset ?;

select count(*) from s2_pay_card where pay_card_batch_id = ? and status = ? and use_end_time <= ?;

select count(*) from s2_pay_card where pay_card_batch_id = ? and ((status = 0 and bind_end_time <= ?) or (status = 1 and use_end_time <= ?));

select sum(amount - surplus_amount) from s2_pay_card where pay_card_batch_id = ? and status = 1 and use_end_time > ?;

select sum(surplus_amount) from s2_pay_card where pay_card_batch_id = ? and status = 1 and use_end_time > ?;

select sum(surplus_amount) from s2_pay_card where pay_card_batch_id = ? and status = 1 and use_end_time <= ?;


key `batch_query_key` (`pay_card_batch_id`, `status`, `use_end_time`),
key `member_query_key` (`bind_member_id`, `status`, `use_end_time`,`surplus_amount`,`pay_card_template_id`)




<?xml version="1.0" encoding="UTF-8"?>
<root>
<project-list>edu-second-party-base;edu-third-party-base;edu-core;video-server;edu-yooc</project-list>
<branch-name>feature/micro_unitlearnInWap_ww_20171210</branch-name>
<version-suffix>micro_unitlearnInWap_ww_20171210</version-suffix>
</root>




video-server;search-server;provider-server;   cy
market-server;study-teach;study-backend;    ww
member-server;passport-web 			yhh
edu-biz-server;study-platform;    	pjt




yooc，微专业 视频播放：
http://mooc.study.163.com/learn/1000072000?tid=1000096000#/learn/content




云课堂（web） 设置 > 账号设置   解绑账号：

http://study.163.com/dwr/call/plaincall/BindAccountBean.unbindMember.dwr?1513163648078

callCount=1
scriptSessionId=${scriptSessionId}190
httpSessionId=ea9492803a2544278ba5c2bf0d7186ca
c0-scriptName=BindAccountBean
c0-methodName=unbindMember 
c0-id=0
c0-param0=number:30 				loginType
batchId=1513163624250






video-server    发布中
search   
member


market-server




<?xml version="1.0" encoding="UTF-8"?>
<root>
<project-list>study-platform;edu-yooc</project-list>
<branch-name>hotfix/h5_video_delete_mp4url_20171218</branch-name>
<version-suffix>h5_video_delete_mp4url_20171218</version-suffix>
</root>




上线顺序：
batch1: front-study;front-yooc;
batch2：study-platform 和 front-study的 ftl部分；edu-yooc和front-yooc 的ftl部分；




"freemarker_html_root": "file://${edu_front_path}/${static_freemarker_dir_midfix}",
"edu_front_path": "${deploy_home}/static/${front_app_name}",
"front_app_name": "front-${app_name}",
"app_name": "study-backend-web",

"static_freemarker_dir_midfix": "pub/v",





