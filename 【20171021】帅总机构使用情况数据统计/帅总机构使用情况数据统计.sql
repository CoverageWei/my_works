57    * 10

线上使用的就这57家：
400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,400000000235094,400000000250004

**************************************************


一、课程

已创建课程数量（企业自建的）
	select count(*) 
	from s2_course 
	where provider_id = ? and status = 2 
	and gmt_create >= ? and gmt_create <= ? 
	and delete_status = 0 and composite_type = 0 and copyright_type = 0;

已被enroll的课程数量（指派+报名）
	select count(distinct target_id)
	from s2_aggregation_learn
	where provider_id = ? and target_type = 1;



二、学习项目

已创建的学习项目数量
	select count(*) 
	from s2_course 
	where provider_id = ? and status = 2 
	and 

	and delete_status = 0 and composite_type = 15 and copyright_type = 0;

已被enroll的学习项目数量（指派+报名）
	select count(distinct target_id)
	from s2_aggregation_learn
	where provider_id = ? and target_type = 2;


三、直播



四、考试

已创建的考试数量


课程考试
select count(*) 
from s2_teach_node_resource_rel
where resource_type = 4 and term_id = ? 
and gmt_create >= ? and gmt_create <= ?;


select * 
from s2_exam
where id= ?


独立考试
s2_paper_assign_rel




每场考试enroll人数

select count(distinct answerer_id)
from s2_exam_answerform
where exam_id = ? and effect_status = 1
and gmt_create >= ? and gmt_create <= ?;




*********************************************************************************************************************************

main.args=import --connection-manager org.apache.sqoop.manager.DDBManager --driver com.netease.backend.db.DBDriver --connect "${db.uri}" --table s2_aggregation_learn --split-by id --target-dir "${db_load_path}/s2_aggregation_learn/day=${job.etl_date}" --delete-target-dir -m 2 --hive-drop-import-delims --as-jsonfile --compression-codec com.hadoop.compression.lzo.LzopCodec


CREATE EXTERNAL TABLE `qyy_dbload_online.s2_course`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `status` string COMMENT '0:草稿 1 已下线 2 已发布',
  `provider_id` string COMMENT '虚拟机构id,版权内容归属', 
  `delete_status` string COMMENT '删除状态,0 未删除, 1 已删除', 
  `copyright_type` string COMMENT '课程获取类型 0 自建， 1 购买',
  `composite_type` string COMMENT '组合类型，微专业5、系列课程10、单个课程0')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_course';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_live_content`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `biz_id` string COMMENT '业务id',
  `app_id` string COMMENT '平台自定义app_id',
  `accurate_play_time` string COMMENT '实际直播时长时间戳',
  `max_member_num` string COMMENT '峰值人数')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_live_content';





CREATE EXTERNAL TABLE `qyy_dbload_online.s2_teach_node_resource_rel`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `resource_id` string COMMENT '资源id',
  `resource_type` string COMMENT '资源类型 1 习题 2 考试',
  `term_id` string COMMENT '期次id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_teach_node_resource_rel';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_exam`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `release_time` string COMMENT '考试发布时间')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_exam';



`release_time` bigint(20) DEFAULT NULL COMMENT '考试发布时间',



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_exam_answerform`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `answerer_id` string COMMENT '答题者',
  `exam_id` string COMMENT '考试id',
  `effect_status` string COMMENT '是否有效提交 0无效 1有效')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_exam_answerform';




CREATE EXTERNAL TABLE `qyy_dbload_online.eduos_paper`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `application_id` string COMMENT '给app分配的id',
  `scene_id` string COMMENT '所属场景ID',
  `scene_type` string COMMENT '所属场景类型')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/eduos_paper';

application_id = "enterprise" and scene_type= 101 and scene_id= provider_id



CREATE EXTERNAL TABLE `qyy_dbload_online.eduos_paper_stat`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `submit_paper_count` string COMMENT '给app分配的id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/eduos_paper_stat';









hive.query.28=alter table s2_course add if not exists partition(day='${job.etl_date}') location '${db_load_path}/s2_course/day=${job.etl_date}';
hive.query.29=alter table s2_live_content add if not exists partition(day='${job.etl_date}') location '${db_load_path}/s2_live_content/day=${job.etl_date}';
hive.query.30=alter table s2_teach_node_resource_rel add if not exists partition(day='${job.etl_date}') location '${db_load_path}/s2_teach_node_resource_rel/day=${job.etl_date}';
hive.query.31=alter table s2_exam add if not exists partition(day='${job.etl_date}') location '${db_load_path}/s2_exam/day=${job.etl_date}';
hive.query.32=alter table s2_exam_answerform add if not exists partition(day='${job.etl_date}') location '${db_load_path}/s2_exam_answerform/day=${job.etl_date}';

hive.query.33=alter table eduos_paper add if not exists partition(day='${job.etl_date}') location '${db_load_path}/eduos_paper/day=${job.etl_date}';
hive.query.34=alter table eduos_paper_stat add if not exists partition(day='${job.etl_date}') location '${db_load_path}/eduos_paper_stat/day=${job.etl_date}';




********************************************************************************************************************************************

1	1483200000000 		
2	1485878400000
3 	1488297600000
4	1490976000000
5	1493568000000
6	1496246400000
7	1498838400000
8	1501516800000
9	1504195200000
10	1506787200000
11	1509465600000


select unix_timestamp('20170101 00:00:00','yyyyMMdd HH:mm:ss') from qyy_dbload_online.s2_course;


sql 执行：



## 1-10 月 自建课程和学习项目数
select t1.provider_id as provider_id, 
    t1.provider_name as provider_name,
    if(t2.1_create_course_count is null, 0, t2.1_create_course_count) as 1_create_course_count,
    if(t2.2_create_course_count is null, 0, t2.2_create_course_count) as 2_create_course_count,
    if(t2.3_create_course_count is null, 0, t2.3_create_course_count) as 3_create_course_count,
    if(t2.4_create_course_count is null, 0, t2.4_create_course_count) as 4_create_course_count,
    if(t2.5_create_course_count is null, 0, t2.5_create_course_count) as 5_create_course_count,
    if(t2.6_create_course_count is null, 0, t2.6_create_course_count) as 6_create_course_count,
    if(t2.7_create_course_count is null, 0, t2.7_create_course_count) as 7_create_course_count,
    if(t2.8_create_course_count is null, 0, t2.8_create_course_count) as 8_create_course_count,
    if(t2.9_create_course_count is null, 0, t2.9_create_course_count) as 9_create_course_count,
    if(t2.10_create_course_count is null, 0, t2.10_create_course_count) as 10_create_course_count,
    if(t2.1_create_project_count is null, 0, t2.1_create_project_count) as 1_create_project_count,
    if(t2.2_create_project_count is null, 0, t2.2_create_project_count) as 2_create_project_count,
    if(t2.3_create_project_count is null, 0, t2.3_create_project_count) as 3_create_project_count,
    if(t2.4_create_project_count is null, 0, t2.4_create_project_count) as 4_create_project_count,
    if(t2.5_create_project_count is null, 0, t2.5_create_project_count) as 5_create_project_count,
    if(t2.6_create_project_count is null, 0, t2.6_create_project_count) as 6_create_project_count,
    if(t2.7_create_project_count is null, 0, t2.7_create_project_count) as 7_create_project_count,
    if(t2.8_create_project_count is null, 0, t2.8_create_project_count) as 8_create_project_count,
    if(t2.9_create_project_count is null, 0, t2.9_create_project_count) as 9_create_project_count,
    if(t2.10_create_project_count is null, 0, t2.10_create_project_count) as 10_create_project_count
from 
(select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
    and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
        400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
        400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
        400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
        400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
        400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
        400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
        400000000235094,400000000250004) ) t1
left outer join 
(select provider_id, 
    sum(if(composite_type = 0 and gmt_create >1483200000000 and gmt_create <= 1485878400000, 1, 0)) as 1_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1485878400000 and gmt_create <= 1488297600000, 1, 0)) as 2_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1488297600000 and gmt_create <= 1490976000000, 1, 0)) as 3_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1490976000000 and gmt_create <= 1493568000000, 1, 0)) as 4_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1493568000000 and gmt_create <= 1496246400000, 1, 0)) as 5_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1496246400000 and gmt_create <= 1498838400000, 1, 0)) as 6_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1498838400000 and gmt_create <= 1501516800000, 1, 0)) as 7_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1501516800000 and gmt_create <= 1504195200000, 1, 0)) as 8_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1504195200000 and gmt_create <= 1506787200000, 1, 0)) as 9_create_course_count,
    sum(if(composite_type = 0 and gmt_create >1506787200000 and gmt_create <= 1509465600000, 1, 0)) as 10_create_course_count,
    sum(if(composite_type = 15 and gmt_create >1483200000000 and gmt_create <= 1485878400000, 1, 0)) as 1_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1485878400000 and gmt_create <= 1488297600000, 1, 0)) as 2_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1488297600000 and gmt_create <= 1490976000000, 1, 0)) as 3_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1490976000000 and gmt_create <= 1493568000000, 1, 0)) as 4_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1493568000000 and gmt_create <= 1496246400000, 1, 0)) as 5_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1496246400000 and gmt_create <= 1498838400000, 1, 0)) as 6_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1498838400000 and gmt_create <= 1501516800000, 1, 0)) as 7_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1501516800000 and gmt_create <= 1504195200000, 1, 0)) as 8_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1504195200000 and gmt_create <= 1506787200000, 1, 0)) as 9_create_project_count,
    sum(if(composite_type = 15 and gmt_create >1506787200000 and gmt_create <= 1509465600000, 1, 0)) as 10_create_project_count
    from qyy_dbload_online.s2_course 
    where day="2017-10-21" and status = 2 and gmt_create >1483200000000  and gmt_create <=1509465600000 and delete_status = 0 and copyright_type = 0 
    group by provider_id) t2
on (t1.provider_id = t2.provider_id)


select count(*) from s2_course where provider_id=400000000037001 and delete_status = 0 and copyright_type = 0 and composite_type = 0 and status = 2 and 




select provider_id, provider_name, month,
    course_id, term_id, course_enroll_count
from 
(
    select t1.provider_id as provider_id, 
        t1.provider_name as provider_name, 
        t2.month as month,
        t2.course_id as course_id, 
        t3.term_id as term_id, 
        t4.course_enroll_count as course_enroll_count
    from 
        (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
            and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
                400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
                400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
                400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
                400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
                400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
                400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
                400000000235094,400000000250004) ) t1
        left outer join 

        (select id as course_id, provider_id, from_unixtime(cast(gmt_create / 1000 as bigint),'yyyy-MM-dd') as month
        from qyy_dbload_online.s2_course 
        where day="2017-10-21" and status = 2 and gmt_create >1483200000000 and gmt_create <=1509465600000 
            and delete_status = 0 and copyright_type = 0 and composite_type = 0) t2
        on (t1.provider_id = t2.provider_id)

        left outer join

        (select id as term_id, course_id
        from qyy_dbload_online.s2_term
        where day="2017-10-21" and publish_status = 2) t3
        on (t2.course_id = t3.course_id)

        left outer join

        (select target_id, count(distinct member_id) as course_enroll_count
        from qyy_dbload_online.s2_aggregation_learn
        where day="2017-10-21" and target_type = 1
        group by target_id) t4
        on (t3.term_id = t4.target_id)
)tt1
order by provider_id, course_id, term_id



    
## 直播 场次数量
select t1.provider_id as provider_id, 
    t1.provider_name as provider_name,
    if(t2.1_create_live_count is null, 0, t2.1_create_live_count) as 1_create_live_count,
    if(t2.2_create_live_count is null, 0, t2.2_create_live_count) as 2_create_live_count,
    if(t2.3_create_live_count is null, 0, t2.3_create_live_count) as 3_create_live_count,
    if(t2.4_create_live_count is null, 0, t2.4_create_live_count) as 4_create_live_count,
    if(t2.5_create_live_count is null, 0, t2.5_create_live_count) as 5_create_live_count,
    if(t2.6_create_live_count is null, 0, t2.6_create_live_count) as 6_create_live_count,
    if(t2.7_create_live_count is null, 0, t2.7_create_live_count) as 7_create_live_count,
    if(t2.8_create_live_count is null, 0, t2.8_create_live_count) as 8_create_live_count,
    if(t2.9_create_live_count is null, 0, t2.9_create_live_count) as 9_create_live_count,
    if(t2.10_create_live_count is null, 0, t2.10_create_live_count) as 10_create_live_count
from
    (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
        and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
            400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
            400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
            400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
            400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
            400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
            400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
            400000000235094,400000000250004) ) t1
    left outer join 
    ( select app_id, 
        sum(if(gmt_create >1483200000000 and gmt_create <= 1485878400000, 1, 0)) as 1_create_live_count,
        sum(if(gmt_create >1485878400000 and gmt_create <= 1488297600000, 1, 0)) as 2_create_live_count,
        sum(if(gmt_create >1488297600000 and gmt_create <= 1490976000000, 1, 0)) as 3_create_live_count,
        sum(if(gmt_create >1490976000000 and gmt_create <= 1493568000000, 1, 0)) as 4_create_live_count,
        sum(if(gmt_create >1493568000000 and gmt_create <= 1496246400000, 1, 0)) as 5_create_live_count,
        sum(if(gmt_create >1496246400000 and gmt_create <= 1498838400000, 1, 0)) as 6_create_live_count,
        sum(if(gmt_create >1498838400000 and gmt_create <= 1501516800000, 1, 0)) as 7_create_live_count,
        sum(if(gmt_create >1501516800000 and gmt_create <= 1504195200000, 1, 0)) as 8_create_live_count,
        sum(if(gmt_create >1504195200000 and gmt_create <= 1506787200000, 1, 0)) as 9_create_live_count,
        sum(if(gmt_create >1506787200000 and gmt_create <= 1509465600000, 1, 0)) as 10_create_live_count
        from qyy_dbload_online.s2_live_content
        where day="2017-10-21" and gmt_create >1483200000000  and gmt_create <=1509465600000
        group by app_id) t2
    on (t1.provider_id = t2.app_id)




## 直播时长+参加人数
select provider_id, provider_name, month,
    live_id, live_time, live_member_count
from(
    select t1.provider_id as provider_id, 
        t1.provider_name as provider_name, 
        t2.month as month,
        t2.id as live_id,
        t2.live_time as live_time,
        t2.max_member_num as live_member_count
    from
        (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
            and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
                400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
                400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
                400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
                400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
                400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
                400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
                400000000235094,400000000250004) ) t1
        left outer join 
        (select id, app_id, cast(accurate_play_time as bigint) / (3600 * 1000) as live_time, max_member_num, from_unixtime(cast(gmt_create / 1000 as bigint),'yyyy-MM-dd') as month
            from qyy_dbload_online.s2_live_content
            where day="2017-10-21" and gmt_create >1483200000000  and gmt_create <=1509465600000 ) t2
        on (t1.provider_id = t2.app_id)
)tt1
order by provider_id, month



## 考试

select tt1.provider_id, tt1.provider_name, tt1.course_id, tt1.term_id  
from(
    select t1.provider_id, t1.provider_name, t2.course_id, t3.term_id
    from
        (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
            and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
                400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
                400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
                400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
                400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
                400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
                400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
                400000000235094,400000000250004) ) t1
        left outer join 

        (select id as course_id, provider_id, 
        from qyy_dbload_online.s2_course 
        where day="2017-10-21" and status = 2 and 
            and delete_status = 0 and copyright_type = 0 and composite_type in (0, 15) ) t2
        on (t1.provider_id = t2.provider_id)

        left outer join

        (select id as term_id, course_id
        from qyy_dbload_online.s2_term
        where day="2017-10-21" and publish_status = 2) t3
        on (t2.course_id = t3.course_id)
)tt1


## 创建的考试数量
select t1.provider_id as provider_id, 
    t1.provider_name as provider_name,
    if(t2.1_create_exam_count is null, 0, t2.1_create_exam_count) as 1_create_exam_count,
    if(t2.2_create_exam_count is null, 0, t2.2_create_exam_count) as 2_create_exam_count,
    if(t2.3_create_exam_count is null, 0, t2.3_create_exam_count) as 3_create_exam_count,
    if(t2.4_create_exam_count is null, 0, t2.4_create_exam_count) as 4_create_exam_count,
    if(t2.5_create_exam_count is null, 0, t2.5_create_exam_count) as 5_create_exam_count,
    if(t2.6_create_exam_count is null, 0, t2.6_create_exam_count) as 6_create_exam_count,
    if(t2.7_create_exam_count is null, 0, t2.7_create_exam_count) as 7_create_exam_count,
    if(t2.8_create_exam_count is null, 0, t2.8_create_exam_count) as 8_create_exam_count,
    if(t2.9_create_exam_count is null, 0, t2.9_create_exam_count) as 9_create_exam_count,
    if(t2.10_create_exam_count is null, 0, t2.10_create_exam_count) as 10_create_exam_count
from
    (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
        and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
            400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
            400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
            400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
            400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
            400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
            400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
            400000000235094,400000000250004) ) t1
    left outer join 

    (select provider_id,
        sum(if(gmt_create >1483200000000 and gmt_create <= 1485878400000, 1, 0)) as 1_create_exam_count,
        sum(if(gmt_create >1485878400000 and gmt_create <= 1488297600000, 1, 0)) as 2_create_exam_count,
        sum(if(gmt_create >1488297600000 and gmt_create <= 1490976000000, 1, 0)) as 3_create_exam_count,
        sum(if(gmt_create >1490976000000 and gmt_create <= 1493568000000, 1, 0)) as 4_create_exam_count,
        sum(if(gmt_create >1493568000000 and gmt_create <= 1496246400000, 1, 0)) as 5_create_exam_count,
        sum(if(gmt_create >1496246400000 and gmt_create <= 1498838400000, 1, 0)) as 6_create_exam_count,
        sum(if(gmt_create >1498838400000 and gmt_create <= 1501516800000, 1, 0)) as 7_create_exam_count,
        sum(if(gmt_create >1501516800000 and gmt_create <= 1504195200000, 1, 0)) as 8_create_exam_count,
        sum(if(gmt_create >1504195200000 and gmt_create <= 1506787200000, 1, 0)) as 9_create_exam_count,
        sum(if(gmt_create >1506787200000 and gmt_create <= 1509465600000, 1, 0)) as 10_create_exam_count
    from(
        select e3.provider_id as provider_id,
            e1.resource_id as exam_id, 
            e2.gmt_create as gmt_create
        from
            (select resource_id, term_id
                from qyy_dbload_online.s2_teach_node_resource_rel
                where day="2017-10-21" and resource_type = 4 ) e1
            join
            (select id as exam_id, gmt_create
                from qyy_dbload_online.s2_exam 
                where day="2017-10-21" and gmt_create >1483200000000 and gmt_create <=1509465600000 ) e2
            on (e1.resource_id = e2.exam_id)
            join
            (select id, provider_id
                from qyy_dbload_online.s2_term
                where day="2017-10-21" and publish_status = 2) e3
            on (e1.term_id = e3.id)
    )ee1
    group by provider_id) t2
on (t1.provider_id = t2.provider_id)




## 课程考试 enroll人数

select t1.provider_id as provider_id, 
    t1.provider_name as provider_name,
    t2.month,
    t2.term_id as term_id,
    t2.exam_id as exam_id,
    t2.exam_enroll_count as exam_enroll_count
from
    (select id as provider_id, provider_name from qyy_dbload_online.s2_virtual_provider where day="2017-10-21" 
        and id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
            400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
            400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
            400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
            400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
            400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
            400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
            400000000235094,400000000250004) ) t1
    left outer join 

    (select ee1.provider_id, ee1.exam_id,ee1.term_id, ee1.month, 
        ee2.exam_enroll_count
    from
        (select e3.provider_id as provider_id,
                e1.resource_id as exam_id, 
                e1.term_id as term_id,
                e2.month as month
        from
            (select resource_id, term_id
                from qyy_dbload_online.s2_teach_node_resource_rel
                where day="2017-10-21" and resource_type = 4 ) e1
            join
            (select id as exam_id, from_unixtime(cast(gmt_create / 1000 as bigint),'yyyy-MM-dd') as month
                from qyy_dbload_online.s2_exam 
                where day="2017-10-21" and gmt_create >1483200000000 and gmt_create <=1509465600000 ) e2
            on (e1.resource_id = e2.exam_id)
            join
            (select id, provider_id
                from qyy_dbload_online.s2_term
                where day="2017-10-21" and publish_status = 2) e3
            on (e1.term_id = e3.id)
        )ee1
        left outer join
        (select exam_id, count(distinct answerer_id) as exam_enroll_count
            from qyy_dbload_online.s2_exam_answerform
            where effect_status = 1
            group by exam_id) ee2
        on (ee1.exam_id = ee2.exam_id)
    ) t2
on (t1.provider_id = t2.provider_id)
order by provider_id, term_id







select scene_id, id, gmt_create, from_unixtime(gmt_create/1000) from eduos_paper where gmt_create >1483200000000 and gmt_create <=1509465600000 and application_id = "enterprise" and scene_type= 101 and scene_id in (400000000029002,400000000008007,400000000030003,400000000030004,400000000042003,400000000043004,400000000052009,
            400000000054003,400000000055001,400000000056001,400000000062002,400000000070001,400000000071001,400000000073001,400000000073002,
            400000000074001,400000000075002,400000000078002,400000000078003,400000000082001,400000000087001,400000000090002,400000000090003,
            400000000096003,400000000096005,400000000101004,400000000037001,400000000106002,400000000108001,400000000110001,400000000115001,
            400000000114001,400000000112003,400000000114002,400000000115002,400000000116001,400000000116002,400000000125001,400000000134001,
            400000000135002,400000000137001,400000000052001,400000000140001,400000000149001,400000000128001,400000000199009,400000000200009,
            400000000214007,400000000233006,400000000232001,400000000230013,400000000239013,400000000237025,400000000235027,400000000237077,
            400000000235094,400000000250004) order by scene_id;

scene_id        | id              |
+-----------------+-----------------+
| 400000000030003 | 410000000125001 |
| 400000000030003 | 410000000101004 |
| 400000000052001 | 410000000023014 |
| 400000000054003 | 410000000019004 |
| 400000000054003 | 410000000023010 |
| 400000000054003 | 410000000022019 |
| 400000000054003 | 410000000022020 |
| 400000000054003 | 410000000022003 |
| 400000000074001 | 410000000036016 |
| 400000000125001 | 410000000023016 |
| 400000000125001 | 410000000036007 |
| 400000000135002 | 410000000071001 |
| 400000000135002 | 410000000075001 |
| 400000000137001 | 410000000123002 |
| 400000000137001 | 410000000084004 |
| 400000000140001 | 410000000092001 |
| 400000000140001 | 410000000097003 |
| 400000000140001 | 410000000084002 |
| 400000000140001 | 410000000097002 |
| 400000000140001 | 410000000099005 |
+-----------------+-----------------+


scene_id        | COUNT(id) |
+-----------------+-----------+
| 400000000030003 | 2         |
| 400000000052001 | 1         |
| 400000000054003 | 5         |
| 400000000074001 | 1         |
| 400000000125001 | 2         |
| 400000000135002 | 2         |
| 400000000137001 | 2         |
| 400000000140001 | 5         |



select id,submit_paper_count from eduos_paper_stat where id in (410000000125001,410000000101004,410000000023014,410000000019004,410000000023010,410000000022019,410000000022020,410000000022003,410000000036016,410000000023016,410000000036007,410000000071001,410000000075001,410000000123002,410000000084004,410000000092001,410000000097003,410000000084002,410000000097002,410000000099005)

id              | submit_paper_count |
+-----------------+--------------------+
| 410000000123002 | 14                 |
| 410000000071001 | 4                  |
| 410000000075001 | 0                  |
| 410000000023014 | 1                  |
| 410000000019004 | 49                 |
| 410000000022003 | 0                  |
| 410000000022020 | 1                  |
| 410000000023016 | 188                |
| 410000000097002 | 5                  |
| 410000000097003 | 7                  |
| 410000000022019 | 3                  |
| 410000000036007 | 2                  |
| 410000000023010 | NULL               |
| 410000000092001 | 7                  |
| 410000000125001 | 0                  |
| 410000000084002 | 6                  |
| 410000000036016 | 1                  |
| 410000000101004 | 12                 |
| 410000000099005 | 0                  |
| 410000000084004 | 10               




400000000030003 | 410000000125001 | 1508230942538 | 2017-10-17 17:02:22.538            |
| 400000000030003 | 410000000101004 | 1505703678312 | 2017-09-18 11:01:18.312            |
| 400000000052001 | 410000000023014 | 1499852914124 | 2017-07-12 17:48:34.124            |
| 400000000054003 | 410000000019004 | 1499758014209 | 2017-07-11 15:26:54.209            |
| 400000000054003 | 410000000023010 | 1499743350699 | 2017-07-11 11:22:30.699            |
| 400000000054003 | 410000000022019 | 1499848320073 | 2017-07-12 16:32:00.073            |
| 400000000054003 | 410000000022020 | 1499849434347 | 2017-07-12 16:50:34.347            |
| 400000000054003 | 410000000022003 | 1499649865436 | 2017-07-10 09:24:25.436            |
| 400000000074001 | 410000000036016 | 1500968229759 | 2017-07-25 15:37:09.759            |
| 400000000125001 | 410000000023016 | 1499996096079 | 2017-07-14 09:34:56.079            |
| 400000000125001 | 410000000036007 | 1500555963794 | 2017-07-20 21:06:03.794
| 400000000135002 | 410000000071001 | 1501895609919 | 2017-08-05 09:13:29.919            |
| 400000000135002 | 410000000075001 | 1502269744358 | 2017-08-09 17:09:04.358            |
| 400000000137001 | 410000000123002 | 1508136853126 | 2017-10-16 14:54:13.126            |
| 400000000137001 | 410000000084004 | 1503984448031 | 2017-08-29 13:27:28.031            |
| 400000000140001 | 410000000092001 | 1504061269592 | 2017-08-30 10:47:49.592            |
| 400000000140001 | 410000000097003 | 1505101954688 | 2017-09-11 11:52:34.688            |
| 400000000140001 | 410000000084002 | 1503459910135 | 2017-08-23 11:45:10.135            |
| 400000000140001 | 410000000097002 | 1504855654963 | 2017-09-08 15:27:34.963            |
| 400000000140001 | 410000000099005 | 1506073052538 | 2017-09-22 17:37:32.538





















