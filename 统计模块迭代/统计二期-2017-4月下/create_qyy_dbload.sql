CREATE EXTERNAL TABLE `qyy_dbload_online.s2_aggregation_learn`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '学习者id', 
  `target_id` string COMMENT '目标id', 
  `target_type` string COMMENT '', 
  `status` string COMMENT '0：进行中 1:已完成', 
  `last_learned_time` string COMMENT '最后学习时间', 
  `platform` string COMMENT '课程参与来源 1 web, 2 mob', 
  `enroll_type` string COMMENT '0 非自动enroll， 1 自动enroll', 
  `last_sync_content_time` string COMMENT '最近同步课件变更信息的时间', 
  `site_id` string COMMENT '归属站点', 
  `provider_id` string COMMENT '发布者id', 
  `single_enroll_type` string COMMENT '是否单独enroll 0 不是， 1 是')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_aggregation_learn';


CREATE EXTERNAL TABLE `qyy_dbload_online.s2_department`(
  `id` string COMMENT '部门id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `parent_id` string COMMENT '父节点id', 
  `extend` string COMMENT '扩展信息，json结构', 
  `name` string COMMENT '部门名称', 
  `provider_id` string COMMENT '发布者id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_department';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_forum_board`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `name` string COMMENT 'name', 
  `description` string COMMENT '描述', 
  `parent_id` string COMMENT '父讨论区id', 
  `release_time` string COMMENT '发布时间', 
  `type` string COMMENT '类型 1综合讨论区 2课程内容讨论区 3老师课堂交流区 4 测试作业讨论区 5自定义', 
  `allow_leaner_post` string COMMENT '', 
  `deleted` string COMMENT '', 
  `shown` string COMMENT '', 
  `newest_post_id` string COMMENT '', 
  `forced_closed_status` string COMMENT '强制关闭状态', 
  `forum_id` string COMMENT '讨论区依赖论坛id', 
  `board_closed_time` string COMMENT '板块关闭时间')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_forum_board';


  CREATE EXTERNAL TABLE `qyy_dbload_online.s2_forum_ref`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `forum_id` string COMMENT '', 
  `ref_id` string COMMENT '', 
  `ref_type` string COMMENT '0：班次', 
  `is_release` string COMMENT '0：没有发布')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_forum_ref';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_lesson_content_learn`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '学习者id', 
  `lesson_id` string COMMENT '课时id', 
  `unit_id` string COMMENT '单元id', 
  `learn_video_time` string COMMENT '视频进度', 
  `learn_text_page` string COMMENT '文本进度', 
  `has_finished` string COMMENT '是否已完成', 
  `has_started` string COMMENT '是否开始学习', 
  `term_id` string COMMENT '')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_lesson_content_learn';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_lesson_unit`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `name` string COMMENT '名称', 
  `position` string COMMENT '序号', 
  `lesson_id` string COMMENT '课时', 
  `chapter_id` string COMMENT '章节', 
  `term_id` string COMMENT '学期', 
  `content_type` string COMMENT '类型，1:视频 2：问题 3:pdf 4:text 等', 
  `content_id` string COMMENT '关联的资源id', 
  `json_content` string COMMENT '存放隋唐测试，视频驻点信息')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_lesson_unit';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_position`(
  `id` string COMMENT '部门id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `parent_id` string COMMENT '父节点id', 
  `extend` string COMMENT '扩展信息，json结构', 
  `name` string COMMENT '部门名称', 
  `provider_id` string COMMENT '发布者id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_position';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_post`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `ref_type` string COMMENT '类型 1普通帖子 2老师答疑 3课时内容', 
  `ref_id` string COMMENT '论坛板块id', 
  `board_id` string COMMENT '论坛板块id', 
  `forum_id` string COMMENT '论坛id', 
  `post_belong` string COMMENT '1表示论坛帖子，2表示外部帖子', 
  `poster_id` string COMMENT '发帖人id', 
  `post_time` string COMMENT '', 
  `title` string COMMENT 'name', 
  `last_replyer` string COMMENT '', 
  `last_reply_time` string COMMENT '', 
  `anonymous` string COMMENT '匿名', 
  `tag_agree` string COMMENT '赞同', 
  `tag_top` string COMMENT '置顶', 
  `tag_top_time` string COMMENT '置顶时间', 
  `tag_solve` string COMMENT '已解决', 
  `tag_lector` string COMMENT '讲师参与', 
  `count_browse` string COMMENT '浏览数', 
  `count_reply` string COMMENT '回复数', 
  `count_vote` string COMMENT '投票', 
  `deleted` string COMMENT '', 
  `active_flag` string COMMENT '1代表正常，0代表已反垃圾', 
  `lock_flag` string COMMENT '0 普通 1 锁住', 
  `isdraft` string COMMENT '0:正常 1：草稿')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_post';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_post_footprint`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `user_id` string COMMENT '', 
  `target_id` string COMMENT '', 
  `post_id` string COMMENT '', 
  `target_type` string COMMENT '帖子1，回复2,评论3', 
  `aggree` string COMMENT '顶1,踩0', 
  `forum_id` string COMMENT '论坛id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_post_footprint';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_provider_group`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `group_name` string COMMENT '群组名称', 
  `provider_id` string COMMENT '提供方id', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_provider_group';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_provider_group_rel`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `id_num` string COMMENT '员工编号', 
  `group_id` string COMMENT '群组id', 
  `provider_id` string COMMENT '提供方id', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_provider_group_rel';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_provider_staff_invite`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `provider_id` string COMMENT '发布者id', 
  `is_super_admin` string COMMENT '是否是管理员', 
  `phone_no` string COMMENT '手机号', 
  `id_num` string COMMENT '员工编号', 
  `name` string COMMENT '员工姓名', 
  `role_ids` string COMMENT '冗余的json格式的roleIds', 
  `remark_name` string COMMENT '备注名', 
  `status` string COMMENT '0未激活，1激活', 
  `invitecode` string COMMENT '激活码', 
  `gender` string COMMENT '')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_provider_staff_invite';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_provider_team`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '老师用户id', 
  `provider_id` string COMMENT '所属机构、店铺id', 
  `id_num` string COMMENT '员工编号id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_provider_team';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_reply`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `replyer_id` string COMMENT '', 
  `anonymous` string COMMENT '匿名', 
  `post_id` string COMMENT '', 
  `count_vote` string COMMENT '投票', 
  `count_comment` string COMMENT '评论数', 
  `reply_time` string COMMENT '', 
  `deleted` string COMMENT '', 
  `tag_agree` string COMMENT '赞同', 
  `tag_top` string COMMENT '置顶', 
  `tag_top_time` string COMMENT '置顶时间', 
  `active_flag` string COMMENT '1代表正常，0代表已反垃圾', 
  `forum_id` string COMMENT '', 
  `parent_reply_id` string COMMENT '回复对象id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_reply';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_staff_department_position_rel`(
  `id` string COMMENT '部门岗位员工关系id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `department_id` string COMMENT '部门id', 
  `position_id` string COMMENT '岗位id', 
  `staff_id` string COMMENT '员工id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_staff_department_position_rel';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `course_id` string COMMENT '课程id', 
  `publish_status` string COMMENT '0:草稿 1 下线 2 已发布', 
  `first_publish_time` string COMMENT '最初发布时间', 
  `price` string COMMENT '价格', 
  `last_submit_review_time` string COMMENT '最后一次审核的时间', 
  `allow_micro_course_enroll` string COMMENT '仅在该课程是微专业课程下有效，表示是否允许参加该课程', 
  `options` string COMMENT '操作状态，1为有后续课程', 
  `position` string COMMENT '学期的位置信息', 
  `term_type` string COMMENT '随到随学班次0 学期制班次3', 
  `name` string COMMENT 'NULL', 
  `last_content_delete_time` string COMMENT '最近删除课件的时间', 
  `composite_type` string COMMENT '组合类型，微专业5、系列课程10、单个课程0', 
  `provider_id` string COMMENT '虚拟机构id,版权内容归属', 
  `site_id` string COMMENT '归属站点', 
  `site_type` string COMMENT '课程管理类型 0 平台， 1 用于企业购买', 
  `online_flag` string COMMENT '是否线下培训 1:线上 2：线下', 
  `finish_flag` string COMMENT '是否结课 0:未结课 1：已结课')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_entry_mode`(
  `id` string COMMENT 'termId', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `enroll_type` string COMMENT '报名方式 1：指派员工学习 2：员工需主动报名', 
  `enroll_range` string COMMENT '报名指派范围方式 1：全部学习 2：特定员工', 
  `enroll_count` string COMMENT '报名人数 -1 全部', 
  `enroll_audit_type` string COMMENT '报名名单审核 1 无须审核 2：管理员审核', 
  `charge_type` string COMMENT '计费方式  1：免费 2：个人付费 3：部门付费', 
  `estimate_total_charge` string COMMENT '预估总费用', 
  `estimate_avg_charge` string COMMENT '预估人均费用')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_entry_mode';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_finish`(
  `id` string COMMENT 'termId', 
  `gmt_create` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `count_learn_member` string COMMENT '学习人数', 
  `effective_avg_charge` string COMMENT '有效人均费用', 
  `extra_avg_charge` string COMMENT '额外人均费用', 
  `effective_plus_extra_avg_charge` string COMMENT '总的人均费用', 
  `total_charge` string COMMENT '实际总费用', 
  `train_summary` string COMMENT '培训总结', 
  `extend` string COMMENT '自定义扩展字段', 
  `actual_lesson_duration` string COMMENT '实际授课时长（小时）')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_finish';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_member_allow`(
  `id` string COMMENT 'NULL', 
  `term_id` string COMMENT '期次id', 
  `member_id` string COMMENT '用户id', 
  `composite_term_id` string COMMENT '-1 单课程；其他值：组合课程id', 
  `status` string COMMENT '状态 1：已指派 2:待审核 3：审核通过 4：审核不通过 5：报名取消', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_operate` string COMMENT '操作时间', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_member_allow';




CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_member_signin`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `member_id` string COMMENT '用户ID', 
  `signin_id` string COMMENT '签到表ID', 
  `status` string COMMENT '1:未签到，2：已签到，3：已请假', 
  `gmt_operate` string COMMENT '签到时间', 
  `disabled` string COMMENT '是否失效')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_member_signin';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_schedule`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `start_time` string COMMENT '学期的开始时间, 32503651201000表示待定', 
  `end_time` string COMMENT '学期的结束时间，32503651201000表示待定', 
  `enroll_end_time` string COMMENT '报名截至时间点，默认课程开始时间', 
  `enroll_end_time_type` string COMMENT '报名截至时间限制类型，0无限制，1建议报名截至时间前报名，-1禁止在截至时间之后报名', 
  `duration` string COMMENT '持续时间', 
  `course_load` string COMMENT '课程负载', 
  `close_visable_status` string COMMENT '仅作用在学期结束，并且状态为已发布 0:open 1:half 2:close', 
  `close_visable_time` string COMMENT '课程结束后多久完全关闭', 
  `enroll_start_time` string COMMENT '报名开始时间', 
  `expect_lesson_duration` string COMMENT '预计授课时长（小时）')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_schedule';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_score_summary`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `member_id` string COMMENT 'NULL', 
  `objective_normalized_score` string COMMENT '客观题占比得分', 
  `subjective_normalized_score` string COMMENT '主观题占比得分', 
  `exam_normalized_score` string COMMENT '考试占比总分', 
  `discuss_normalized_score` string COMMENT '课堂讨论占比总分', 
  `origin_total_normalized_score` string COMMENT '百分制总分', 
  `tc_uptime` string COMMENT 'total score update time 学期总分更新时间', 
  `bonus_normalized_score` string COMMENT '老师额外加减分', 
  `total_normalized_score_plus_bonus` string COMMENT '总分+bonus分数', 
  `count_reply` string COMMENT '回复数', 
  `count_vote` string COMMENT '被赞数')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_score_summary';



CREATE EXTERNAL TABLE `qyy_dbload_online.s2_term_signin`(
  `id` string COMMENT '签到id', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `start_time` string COMMENT '开始时间', 
  `end_time` string COMMENT '结束时间')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/db_load/s2_term_signin';




CREATE EXTERNAL TABLE `qyy_dbload_test.s2_aggregation_learn`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '学习者id', 
  `target_id` string COMMENT '目标id', 
  `target_type` string COMMENT '', 
  `status` string COMMENT '0：进行中 1:已完成', 
  `last_learned_time` string COMMENT '最后学习时间', 
  `platform` string COMMENT '课程参与来源 1 web, 2 mob', 
  `enroll_type` string COMMENT '0 非自动enroll， 1 自动enroll', 
  `last_sync_content_time` string COMMENT '最近同步课件变更信息的时间', 
  `site_id` string COMMENT '归属站点', 
  `provider_id` string COMMENT '发布者id', 
  `single_enroll_type` string COMMENT '是否单独enroll 0 不是， 1 是')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_aggregation_learn';


CREATE EXTERNAL TABLE `qyy_dbload_test.s2_department`(
  `id` string COMMENT '部门id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `parent_id` string COMMENT '父节点id', 
  `extend` string COMMENT '扩展信息，json结构', 
  `name` string COMMENT '部门名称', 
  `provider_id` string COMMENT '发布者id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_department';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_forum_board`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `name` string COMMENT 'name', 
  `description` string COMMENT '描述', 
  `parent_id` string COMMENT '父讨论区id', 
  `release_time` string COMMENT '发布时间', 
  `type` string COMMENT '类型 1综合讨论区 2课程内容讨论区 3老师课堂交流区 4 测试作业讨论区 5自定义', 
  `allow_leaner_post` string COMMENT '', 
  `deleted` string COMMENT '', 
  `shown` string COMMENT '', 
  `newest_post_id` string COMMENT '', 
  `forced_closed_status` string COMMENT '强制关闭状态', 
  `forum_id` string COMMENT '讨论区依赖论坛id', 
  `board_closed_time` string COMMENT '板块关闭时间')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_forum_board';


  CREATE EXTERNAL TABLE `qyy_dbload_test.s2_forum_ref`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `forum_id` string COMMENT '', 
  `ref_id` string COMMENT '', 
  `ref_type` string COMMENT '0：班次', 
  `is_release` string COMMENT '0：没有发布')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_forum_ref';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_lesson_content_learn`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '学习者id', 
  `lesson_id` string COMMENT '课时id', 
  `unit_id` string COMMENT '单元id', 
  `learn_video_time` string COMMENT '视频进度', 
  `learn_text_page` string COMMENT '文本进度', 
  `has_finished` string COMMENT '是否已完成', 
  `has_started` string COMMENT '是否开始学习', 
  `term_id` string COMMENT '')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_lesson_content_learn';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_lesson_unit`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `name` string COMMENT '名称', 
  `position` string COMMENT '序号', 
  `lesson_id` string COMMENT '课时', 
  `chapter_id` string COMMENT '章节', 
  `term_id` string COMMENT '学期', 
  `content_type` string COMMENT '类型，1:视频 2：问题 3:pdf 4:text 等', 
  `content_id` string COMMENT '关联的资源id', 
  `json_content` string COMMENT '存放隋唐测试，视频驻点信息')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_lesson_unit';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_position`(
  `id` string COMMENT '部门id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `parent_id` string COMMENT '父节点id', 
  `extend` string COMMENT '扩展信息，json结构', 
  `name` string COMMENT '部门名称', 
  `provider_id` string COMMENT '发布者id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_position';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_post`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `ref_type` string COMMENT '类型 1普通帖子 2老师答疑 3课时内容', 
  `ref_id` string COMMENT '论坛板块id', 
  `board_id` string COMMENT '论坛板块id', 
  `forum_id` string COMMENT '论坛id', 
  `post_belong` string COMMENT '1表示论坛帖子，2表示外部帖子', 
  `poster_id` string COMMENT '发帖人id', 
  `post_time` string COMMENT '', 
  `title` string COMMENT 'name', 
  `last_replyer` string COMMENT '', 
  `last_reply_time` string COMMENT '', 
  `anonymous` string COMMENT '匿名', 
  `tag_agree` string COMMENT '赞同', 
  `tag_top` string COMMENT '置顶', 
  `tag_top_time` string COMMENT '置顶时间', 
  `tag_solve` string COMMENT '已解决', 
  `tag_lector` string COMMENT '讲师参与', 
  `count_browse` string COMMENT '浏览数', 
  `count_reply` string COMMENT '回复数', 
  `count_vote` string COMMENT '投票', 
  `deleted` string COMMENT '', 
  `active_flag` string COMMENT '1代表正常，0代表已反垃圾', 
  `lock_flag` string COMMENT '0 普通 1 锁住', 
  `isdraft` string COMMENT '0:正常 1：草稿')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_post';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_post_footprint`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `user_id` string COMMENT '', 
  `target_id` string COMMENT '', 
  `post_id` string COMMENT '', 
  `target_type` string COMMENT '帖子1，回复2,评论3', 
  `aggree` string COMMENT '顶1,踩0', 
  `forum_id` string COMMENT '论坛id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_post_footprint';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_provider_group`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `group_name` string COMMENT '群组名称', 
  `provider_id` string COMMENT '提供方id', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_provider_group';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_provider_group_rel`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `id_num` string COMMENT '员工编号', 
  `group_id` string COMMENT '群组id', 
  `provider_id` string COMMENT '提供方id', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_provider_group_rel';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_provider_staff_invite`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `provider_id` string COMMENT '发布者id', 
  `is_super_admin` string COMMENT '是否是管理员', 
  `phone_no` string COMMENT '手机号', 
  `id_num` string COMMENT '员工编号', 
  `name` string COMMENT '员工姓名', 
  `role_ids` string COMMENT '冗余的json格式的roleIds', 
  `remark_name` string COMMENT '备注名', 
  `status` string COMMENT '0未激活，1激活', 
  `invitecode` string COMMENT '激活码', 
  `gender` string COMMENT '')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_provider_staff_invite';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_provider_team`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `member_id` string COMMENT '老师用户id', 
  `provider_id` string COMMENT '所属机构、店铺id', 
  `id_num` string COMMENT '员工编号id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_provider_team';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_reply`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `replyer_id` string COMMENT '', 
  `anonymous` string COMMENT '匿名', 
  `post_id` string COMMENT '', 
  `count_vote` string COMMENT '投票', 
  `count_comment` string COMMENT '评论数', 
  `reply_time` string COMMENT '', 
  `deleted` string COMMENT '', 
  `tag_agree` string COMMENT '赞同', 
  `tag_top` string COMMENT '置顶', 
  `tag_top_time` string COMMENT '置顶时间', 
  `active_flag` string COMMENT '1代表正常，0代表已反垃圾', 
  `forum_id` string COMMENT '', 
  `parent_reply_id` string COMMENT '回复对象id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_reply';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_staff_department_position_rel`(
  `id` string COMMENT '部门岗位员工关系id', 
  `gmt_create` string COMMENT '创建时间', 
  `db_update_time` string COMMENT 'NULL', 
  `department_id` string COMMENT '部门id', 
  `position_id` string COMMENT '岗位id', 
  `staff_id` string COMMENT '员工id')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_staff_department_position_rel';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_modified` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `course_id` string COMMENT '课程id', 
  `publish_status` string COMMENT '0:草稿 1 下线 2 已发布', 
  `first_publish_time` string COMMENT '最初发布时间', 
  `price` string COMMENT '价格', 
  `last_submit_review_time` string COMMENT '最后一次审核的时间', 
  `allow_micro_course_enroll` string COMMENT '仅在该课程是微专业课程下有效，表示是否允许参加该课程', 
  `options` string COMMENT '操作状态，1为有后续课程', 
  `position` string COMMENT '学期的位置信息', 
  `term_type` string COMMENT '随到随学班次0 学期制班次3', 
  `name` string COMMENT 'NULL', 
  `last_content_delete_time` string COMMENT '最近删除课件的时间', 
  `composite_type` string COMMENT '组合类型，微专业5、系列课程10、单个课程0', 
  `provider_id` string COMMENT '虚拟机构id,版权内容归属', 
  `site_id` string COMMENT '归属站点', 
  `site_type` string COMMENT '课程管理类型 0 平台， 1 用于企业购买', 
  `online_flag` string COMMENT '是否线下培训 1:线上 2：线下', 
  `finish_flag` string COMMENT '是否结课 0:未结课 1：已结课')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_entry_mode`(
  `id` string COMMENT 'termId', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `enroll_type` string COMMENT '报名方式 1：指派员工学习 2：员工需主动报名', 
  `enroll_range` string COMMENT '报名指派范围方式 1：全部学习 2：特定员工', 
  `enroll_count` string COMMENT '报名人数 -1 全部', 
  `enroll_audit_type` string COMMENT '报名名单审核 1 无须审核 2：管理员审核', 
  `charge_type` string COMMENT '计费方式  1：免费 2：个人付费 3：部门付费', 
  `estimate_total_charge` string COMMENT '预估总费用', 
  `estimate_avg_charge` string COMMENT '预估人均费用')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_entry_mode';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_finish`(
  `id` string COMMENT 'termId', 
  `gmt_create` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `count_learn_member` string COMMENT '学习人数', 
  `effective_avg_charge` string COMMENT '有效人均费用', 
  `extra_avg_charge` string COMMENT '额外人均费用', 
  `effective_plus_extra_avg_charge` string COMMENT '总的人均费用', 
  `total_charge` string COMMENT '实际总费用', 
  `train_summary` string COMMENT '培训总结', 
  `extend` string COMMENT '自定义扩展字段', 
  `actual_lesson_duration` string COMMENT '实际授课时长（小时）')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_finish';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_member_allow`(
  `id` string COMMENT 'NULL', 
  `term_id` string COMMENT '期次id', 
  `member_id` string COMMENT '用户id', 
  `composite_term_id` string COMMENT '-1 单课程；其他值：组合课程id', 
  `status` string COMMENT '状态 1：已指派 2:待审核 3：审核通过 4：审核不通过 5：报名取消', 
  `gmt_create` string COMMENT 'NULL', 
  `gmt_operate` string COMMENT '操作时间', 
  `db_update_time` string COMMENT 'NULL')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_member_allow';




CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_member_signin`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `member_id` string COMMENT '用户ID', 
  `signin_id` string COMMENT '签到表ID', 
  `status` string COMMENT '1:未签到，2：已签到，3：已请假', 
  `gmt_operate` string COMMENT '签到时间', 
  `disabled` string COMMENT '是否失效')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_member_signin';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_schedule`(
  `id` string COMMENT '', 
  `gmt_create` string COMMENT '', 
  `gmt_modified` string COMMENT '', 
  `db_update_time` string COMMENT '', 
  `start_time` string COMMENT '学期的开始时间, 32503651201000表示待定', 
  `end_time` string COMMENT '学期的结束时间，32503651201000表示待定', 
  `enroll_end_time` string COMMENT '报名截至时间点，默认课程开始时间', 
  `enroll_end_time_type` string COMMENT '报名截至时间限制类型，0无限制，1建议报名截至时间前报名，-1禁止在截至时间之后报名', 
  `duration` string COMMENT '持续时间', 
  `course_load` string COMMENT '课程负载', 
  `close_visable_status` string COMMENT '仅作用在学期结束，并且状态为已发布 0:open 1:half 2:close', 
  `close_visable_time` string COMMENT '课程结束后多久完全关闭', 
  `enroll_start_time` string COMMENT '报名开始时间', 
  `expect_lesson_duration` string COMMENT '预计授课时长（小时）')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_schedule';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_score_summary`(
  `id` string COMMENT 'NULL', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `member_id` string COMMENT 'NULL', 
  `objective_normalized_score` string COMMENT '客观题占比得分', 
  `subjective_normalized_score` string COMMENT '主观题占比得分', 
  `exam_normalized_score` string COMMENT '考试占比总分', 
  `discuss_normalized_score` string COMMENT '课堂讨论占比总分', 
  `origin_total_normalized_score` string COMMENT '百分制总分', 
  `tc_uptime` string COMMENT 'total score update time 学期总分更新时间', 
  `bonus_normalized_score` string COMMENT '老师额外加减分', 
  `total_normalized_score_plus_bonus` string COMMENT '总分+bonus分数', 
  `count_reply` string COMMENT '回复数', 
  `count_vote` string COMMENT '被赞数')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_score_summary';



CREATE EXTERNAL TABLE `qyy_dbload_test.s2_term_signin`(
  `id` string COMMENT '签到id', 
  `gmt_create` string COMMENT 'NULL', 
  `db_update_time` string COMMENT 'NULL', 
  `term_id` string COMMENT '学期id', 
  `start_time` string COMMENT '开始时间', 
  `end_time` string COMMENT '结束时间')
PARTITIONED BY ( 
  `day` string)
ROW FORMAT SERDE 
  'org.openx.data.jsonserde.JsonSerDe' 
STORED AS INPUTFORMAT 
  'com.hadoop.mapred.DeprecatedLzoTextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/db_load/s2_term_signin';











select s2_term.id as id 
from s2_term_staff,s2_term 
where s2_term_staff.member_id = ? and s2_term_staff.rel_type = ? and s2_term.provider_id = ? and s2_term.id=s2_term_staff.term_id limit 1



select count(*)
from s2_term 
where publish_status = 2 and provider_id = 400000000003003 and course_id in t1.id
(select id 
from s2_course
where status = 2) t1



if( t1.online_flag = 1, if(cast(t4.term_unit_finished_count as bigint) >= cast(t3.term_unit_total_count as bigint), 1, 0),
            if(t1.online_flag = 2, if(from_unixtime(cast(t2.term_end_time / 1000 as bigint),'yyyy-MM-dd') <= '$etlDay', 1, 0),
            null)
        ) as term_end_status







select  term_id, unit_id 
from 

( select member_id,target_id from ${db_load}.s2_aggregation_learn where target_type=1 and day = '$etlDay' )t1
left outer join
( select )



insert overwrite table ${mid}.term_learn_progress_stat_kv  partition(day='$etlDay',category='term_unit_learn_count')
      select member_id,term_id, 'term_unit_learn_count', count(distinct unit_id) 
      from ${db_load}.s2_lesson_content_learn
      where day = '$etlDay' group by member_id,term_id



非分支课件学习数:
select term_id, member_id, 'term_unit_learn_count', count(distinct unit_id)
from (
  (select member_id, term_id, unit_id from ${db_load}.s2_lesson_content_learn where day = '$etlDay')t1
  left outer join
  (select id, term_id from ${db_load}.s2_lesson_unit where branch_stat = 0 and day = '$etlDay')t2
  on (t1.member_id = t2.member_id and t1.term_id = t2.term_id and t1.unit_id = t2.id)
)
where day = '$etlDay' group by member_id,term_id



