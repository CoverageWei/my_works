CREATE EXTERNAL TABLE `qyy_dbload_online.s2_resource_credit_setting`(
  `id` string COMMENT '',
  `gmt_create` string COMMENT '',
  `provider_id` string COMMENT '机构id',
  `target_id` string COMMENT '各种教学活动id',
  `target_type` string COMMENT '1:课程 2：项目 3：独立考试',
  `credit` string COMMENT '学分',
  `credit_hours` string COMMENT '学时')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE
  'org.openx.data.jsonserde.JsonSerDe'
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_resource_credit_setting';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_member_credit_detail`(
  `id` string COMMENT '',
  `gmt_create` string COMMENT '',
  `provider_id` string COMMENT '机构id',
  `target_id` string COMMENT '各种教学活动id',
  `target_type` string COMMENT '1:课程 2：项目 3：独立考试',
  `credit` string COMMENT '学分',
  `credit_hours` string COMMENT '学时',
  `member_id` string COMMENT '学习者id',
  `obtain_time` string COMMENT '得到学分时间')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE
  'org.openx.data.jsonserde.JsonSerDe'
STORED AS INPUTFORMAT
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_member_credit_detail';



alter table qyy_mid_online.term_learn_progress_stat add columns(
`credit` string COMMENT '学分',
`credit_hours` string COMMENT '学时',
`obtain_time` string COMMENT '得到学分时间',
`obtain_date_time` string COMMENT '得到学分日期，yyyy-MM-dd');
 
 
alter table qyy_mid_online.user_project_learn_stat add columns(
`credit` string COMMENT '学分',
`credit_hours` string COMMENT '学时',
`obtain_time` string COMMENT '得到学分时间',
`obtain_date_time` string COMMENT '得到学分日期，yyyy-MM-dd');


alter table qyy_output_online.s2_department_learn_term_date add columns(
`assign_credit` string COMMENT '获指派课学分',
`assign_credit_hours` string COMMENT '获指派课学时',
`enroll_credit` string COMMENT '获自选课学分',
`enroll_credit_hours` string COMMENT '获自选课学时');
 
alter table qyy_output_online.s2_department_learn_duration_date add columns(
`active_online_learn_duration` string COMMENT '激活状态下部门员工在线学习时长');



CREATE EXTERNAL TABLE `qyy_output_online.s2_department_learn_term_active_date`(
  `department_id` string COMMENT '部门ID',
  `date_tag` string COMMENT '日期',
  `staff_num` string COMMENT '部门 激活员工数，包括所有子节点的员工',
  `assign_staff_count` string COMMENT '当日部门课程指派人次',
  `enroll_staff_count` string COMMENT '当日部门课程自选人次',
  `assign_staff_finished_count` string COMMENT 'assign_staff_count范围中截止目前完课数',
  `enroll_staff_finished_count` string COMMENT 'enroll_staff_count范围中截止目前完课数',
  `provider_id` string COMMENT '企业ID',
  `assign_credit` string COMMENT '获指派课学分',
  `assign_credit_hours` string COMMENT '获指派课学时',
  `enroll_credit` string COMMENT '获自选课学分',
  `enroll_credit_hours` string COMMENT '获自选课学时')
PARTITIONED BY (
  `day` string COMMENT '统计日期')
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/output/s2_department_learn_term_active_date';




alter table qyy_output_online.s2_position_learn_term_date add columns(
`assign_credit` string COMMENT '获指派课学分',
`assign_credit_hours` string COMMENT '获指派课学时',
`enroll_credit` string COMMENT '获自选课学分',
`enroll_credit_hours` string COMMENT '获自选课学时');


alter table qyy_output_online.s2_position_learn_duration_date add columns(
    `active_online_learn_duration` string COMMENT '激活状态下 岗位员工在线学习时长');


CREATE EXTERNAL TABLE `qyy_output_online.s2_position_learn_term_active_date`(
  `position_id` string COMMENT '岗位ID',
  `date_tag` string COMMENT '日期',
  `staff_num` string COMMENT '岗位员工数，包括所有子节点的员工',
  `assign_staff_count` string COMMENT '当日岗位 课程指派人次',
  `enroll_staff_count` string COMMENT '当日岗位 课程自选人次',
  `assign_staff_finished_count` string COMMENT 'assign_staff_count范围中截止目前完课数',
  `enroll_staff_finished_count` string COMMENT 'enroll_staff_count范围中截止目前完课数',
  `provider_id` string COMMENT '企业ID',
  `assign_credit` string COMMENT '获指派课学分',
  `assign_credit_hours` string COMMENT '获指派课学时',
  `enroll_credit` string COMMENT '获自选课学分',
  `enroll_credit_hours` string COMMENT '获自选课学时')
PARTITIONED BY (
  `day` string COMMENT '统计日期')
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/output/s2_position_learn_term_active_date';



alter table qyy_output_online.s2_group_learn_term_date add columns(
`assign_credit` string COMMENT '获指派课学分',
`assign_credit_hours` string COMMENT '获指派课学时',
`enroll_credit` string COMMENT '获自选课学分',
`enroll_credit_hours` string COMMENT '获自选课学时');


alter table qyy_output_online.s2_group_learn_duration_date add columns(
`active_online_learn_duration` string COMMENT '激活状态下 标签员工在线学习时长');


CREATE EXTERNAL TABLE `qyy_output_online.s2_group_learn_term_active_date`(
  `group_id` string COMMENT '标签ID',
  `date_tag` string COMMENT '日期',
  `staff_num` string COMMENT '标签员工数，包括所有子节点的员工',
  `assign_staff_count` string COMMENT '当日标签 课程指派人次',
  `enroll_staff_count` string COMMENT '当日标签 课程自选人次',
  `assign_staff_finished_count` string COMMENT 'assign_staff_count范围中截止目前完课数',
  `enroll_staff_finished_count` string COMMENT 'enroll_staff_count范围中截止目前完课数',
  `provider_id` string COMMENT '企业ID',
  `assign_credit` string COMMENT '获指派课学分',
  `assign_credit_hours` string COMMENT '获指派课学时',
  `enroll_credit` string COMMENT '获自选课学分',
  `enroll_credit_hours` string COMMENT '获自选课学时')
PARTITIONED BY (
  `day` string COMMENT '统计日期')
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT
  'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/output/s2_group_learn_term_active_date';



alter table qyy_output_online.s2_user_learn_total_duration_stat add columns(
	`total_credit` string COMMENT '总学分',
	`total_credit_hours` string COMMENT '总学时');
 
alter table qyy_output_online.s2_user_platform_learn_overview add columns(
`assign_credit` string COMMENT '指派学分',
`assign_credit_hours` string COMMENT '指派学时',
`enroll_credit` string COMMENT '指派学分',
`enroll_credit_hours` string COMMENT '指派学时');
  
alter table qyy_output_online.s2_user_term_select_record_stat_date add columns(
`assign_credit` string COMMENT '指派学分',
`assign_credit_hours` string COMMENT '指派学时',
`enroll_credit` string COMMENT '指派学分',
`enroll_credit_hours` string COMMENT '指派学时');


alter table qyy_output_online.s2_term_learn_progress_stat add columns(
`credit` string COMMENT '学分',
`credit_hours` string COMMENT '学时');


alter table qyy_output_online.s2_user_project_stat_total add columns(
`assign_credit` string COMMENT '指派学分',
`assign_credit_hours` string COMMENT '指派学时',
`enroll_credit` string COMMENT '指派学分',
`enroll_credit_hours` string COMMENT '指派学时');
  
alter table qyy_output_online.s2_user_learn_record_stat_total add columns(
`assign_credit` string COMMENT '指派学分',
`assign_credit_hours` string COMMENT '指派学时',
`enroll_credit` string COMMENT '指派学分',
`enroll_credit_hours` string COMMENT '指派学时');

alter table qyy_output_online.s2_user_project_select_record_date add columns(
`assign_credit` string COMMENT '指派学分',
`assign_credit_hours` string COMMENT '指派学时',
`enroll_credit` string COMMENT '指派学分',
`enroll_credit_hours` string COMMENT '指派学时');

alter table qyy_output_online.s2_user_project_learn_stat add columns(
`credit` string COMMENT '学分',
`credit_hours` string COMMENT '学时');
