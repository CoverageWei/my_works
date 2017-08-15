# 用户期次学习进度统计表（用户、期次维度）
CREATE TABLE `s2_term_learn_progress_stat_bac_master` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`aggregation_learn_id` bigint(20) NOT NULL COMMENT 'aggregation_learn表主键id',
`member_id` bigint(20) DEFAULT NULL COMMENT '用户id',
`provider_id` bigint(20) DEFAULT '-1' COMMENT '机构id',
`term_id` bigint(20) DEFAULT NULL COMMENT '期次id',
`term_type` smallint(2) DEFAULT NULL COMMENT '期次类型，随到随学班次0 学期制班次3',
`term_choose_type` smallint(2) DEFAULT NULL COMMENT '选课类型，即期次报名方式，1指派 2 自选，取自s2_term_entry_mode 表的 enroll_type',
`online_flag` smallint(2) DEFAULT NULL COMMENT '是否线下培训 1:线上 2：线下',
`enroll_time` bigint(20) DEFAULT NULL COMMENT '课程参加时间',
`signed_count` smallint(6) DEFAULT NULL COMMENT '出勤次数，即签到次数',
`leave_count` smallint(6) DEFAULT NULL COMMENT '请假次数',
`not_signed_count` smallint(6) DEFAULT NULL COMMENT '缺勤次数',
`online_learn_duration` bigint(20) DEFAULT NULL COMMENT '线上学习总时长（毫秒数）',
`offline_learn_duration` bigint(20) DEFAULT NULL COMMENT '线下学习总时长（毫秒数）',
`term_unit_learn_count` smallint(6) DEFAULT NULL COMMENT '学期课件学习数',
`term_unit_finished_count` smallint(6) DEFAULT NULL COMMENT '学期课件完成数',
`term_unit_total_count` smallint(6) DEFAULT NULL COMMENT '学期总课件数',
`term_unit_duration` bigint(20) DEFAULT NULL COMMENT '课件观看时间',
`score` decimal(10,2) DEFAULT NULL COMMENT '学期成绩，来自s2_term_score_summary.total_normalized_score_plus_bonus',
`first_learn_time` bigint(20) DEFAULT NULL COMMENT '首次学习时间',
`last_learn_time` bigint(20) DEFAULT NULL COMMENT '最近学习时间',
`post_count` smallint(6) DEFAULT NULL COMMENT '发帖数',
`post_reply_count` smallint(6) DEFAULT NULL COMMENT '回帖数',
`post_comment_count` smallint(6) DEFAULT NULL COMMENT '评论数',
`post_top_count` smallint(6) DEFAULT NULL COMMENT '被顶数',
`term_web_unit_total_count` int(11) DEFAULT NULL COMMENT '期次web端可见课件总数',
`term_app_unit_total_count` int(11) DEFAULT NULL COMMENT '期次app端可见课件总数',
`term_web_unit_learn_count` int(11) DEFAULT NULL COMMENT 'web端可见 学期课件学习数',
`term_app_unit_learn_count` int(11) DEFAULT NULL COMMENT 'app端可见 学期课件学习数',
`term_web_unit_finished_count` int(11) DEFAULT NULL COMMENT 'web端可见 学期课件完成数',
`term_app_unit_finished_count` int(11) DEFAULT NULL COMMENT 'app端可见 学期课件完成数',
`user_web_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 web端可见课件 学习进度百分比',
`user_app_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 app端可见课件 学习进度百分比',
`term_user_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 最终学习进度百分比',
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY `idx_memberid_providerid` (`member_id`,`provider_id`),
KEY `idx_providerid_aggregationlearnid` (`provider_id`,`aggregation_learn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户期次学习进度统计表';


CREATE TABLE `s2_term_learn_progress_stat_bac_slave` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`aggregation_learn_id` bigint(20) NOT NULL COMMENT 'aggregation_learn表主键id',
`member_id` bigint(20) DEFAULT NULL COMMENT '用户id',
`provider_id` bigint(20) DEFAULT '-1' COMMENT '机构id',
`term_id` bigint(20) DEFAULT NULL COMMENT '期次id',
`term_type` smallint(2) DEFAULT NULL COMMENT '期次类型，随到随学班次0 学期制班次3',
`term_choose_type` smallint(2) DEFAULT NULL COMMENT '选课类型，即期次报名方式，1指派 2 自选，取自s2_term_entry_mode 表的 enroll_type',
`online_flag` smallint(2) DEFAULT NULL COMMENT '是否线下培训 1:线上 2：线下',
`enroll_time` bigint(20) DEFAULT NULL COMMENT '课程参加时间',
`signed_count` smallint(6) DEFAULT NULL COMMENT '出勤次数，即签到次数',
`leave_count` smallint(6) DEFAULT NULL COMMENT '请假次数',
`not_signed_count` smallint(6) DEFAULT NULL COMMENT '缺勤次数',
`online_learn_duration` bigint(20) DEFAULT NULL COMMENT '线上学习总时长（毫秒数）',
`offline_learn_duration` bigint(20) DEFAULT NULL COMMENT '线下学习总时长（毫秒数）',
`term_unit_learn_count` smallint(6) DEFAULT NULL COMMENT '学期课件学习数',
`term_unit_finished_count` smallint(6) DEFAULT NULL COMMENT '学期课件完成数',
`term_unit_total_count` smallint(6) DEFAULT NULL COMMENT '学期总课件数',
`term_unit_duration` bigint(20) DEFAULT NULL COMMENT '课件观看时间',
`score` decimal(10,2) DEFAULT NULL COMMENT '学期成绩，来自s2_term_score_summary.total_normalized_score_plus_bonus',
`first_learn_time` bigint(20) DEFAULT NULL COMMENT '首次学习时间',
`last_learn_time` bigint(20) DEFAULT NULL COMMENT '最近学习时间',
`post_count` smallint(6) DEFAULT NULL COMMENT '发帖数',
`post_reply_count` smallint(6) DEFAULT NULL COMMENT '回帖数',
`post_comment_count` smallint(6) DEFAULT NULL COMMENT '评论数',
`post_top_count` smallint(6) DEFAULT NULL COMMENT '被顶数',
`term_web_unit_total_count` int(11) DEFAULT NULL COMMENT '期次web端可见课件总数',
`term_app_unit_total_count` int(11) DEFAULT NULL COMMENT '期次app端可见课件总数',
`term_web_unit_learn_count` int(11) DEFAULT NULL COMMENT 'web端可见 学期课件学习数',
`term_app_unit_learn_count` int(11) DEFAULT NULL COMMENT 'app端可见 学期课件学习数',
`term_web_unit_finished_count` int(11) DEFAULT NULL COMMENT 'web端可见 学期课件完成数',
`term_app_unit_finished_count` int(11) DEFAULT NULL COMMENT 'app端可见 学期课件完成数',
`user_web_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 web端可见课件 学习进度百分比',
`user_app_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 app端可见课件 学习进度百分比',
`term_user_learn_progress` int(11) DEFAULT NULL COMMENT '期次用户 最终学习进度百分比',
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`id`),
KEY `idx_memberid_providerid` (`member_id`,`provider_id`),
KEY `idx_providerid_aggregationlearnid` (`provider_id`,`aggregation_learn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户期次学习进度统计表';






select term_id, count(id) as scorm_unit_sum from qyy_dbload_test.s2_lesson_unit where day = '2017-05-22' and content_type = 8 and (client_visible = 0 or client_visible = 1) and term_id=400000002163003 group by term_id limit 5;





insert overwrite table ${mid}.term_learn_progress_stat_kv partition(day='$etlDay',category='user_web_learn_progress')
            select t1.member_id, t1.term_id, 'user_web_learn_progress',
            if(cast(t2.term_web_unit_total_count as bigint) >= 1,
              if(cast(t2.term_web_unit_total_count as bigint) = 1 and cast(t4.scorm_unit_sum as bigint) = 1,
              if(t6.view_progress is null, 0, t6.view_progress * 100)
              ceiling(if(t6.view_progress is null, 0, t6.view_progress) * 100), ceiling((t3.term_web_unit_finished_count / t2.term_web_unit_total_count) * 100)),
              null) as user_web_learn_progress
            from
                (
                  select member_id, term_id, value as provider_id from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'provider_id' and category = 'common_property'
                ) t1
                left outer join (
                  select member_id, term_id, value as term_web_unit_total_count from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'term_web_unit_total_count' and category = 'common_attribute'
                ) t2 on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)
                left outer join (
                  select member_id, term_id, value as term_web_unit_finished_count from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'term_web_unit_finished_count' and category = 'term_web_unit_finished_count'
                ) t3 on (t1.member_id = t3.member_id and t1.term_id = t3.term_id)
                left outer join (
                  select term_id, count(id) as scorm_unit_sum from ${db_load}.s2_lesson_unit
                  where day = '$etlDay' and content_type = 8 and (client_visible = 0 or client_visible = 1) group by term_id
                ) t4 on (t1.term_id = t4.term_id)
                left outer join (
                  select term_id, id as scorm_unit_id from ${db_load}.s2_lesson_unit
                  where day = '$etlDay' and content_type = 8 and (client_visible = 0 or client_visible = 1) limit 1
                ) t5 on (t1.term_id = t5.term_id)
                left outer join (
                  select lesson_unit_id, learner_id, view_progress from ${db_load}.scorm_view_record
                  where day = '$etlDay'
                ) t6 on (t5.scorm_unit_id = t6.lesson_unit_id and t1.member_id = t6.learner_id)



insert overwrite table ${mid}.term_learn_progress_stat_kv partition(day='$etlDay',category='user_app_learn_progress')
            select tt1.member_id, tt1.term_id, 'user_app_learn_progress',
            if(cast(tt1.term_app_unit_total_count as bigint) >= 1,
              if(cast(tt1.term_app_unit_total_count as bigint) = 1 and cast(tt1.scorm_unit_sum as bigint) = 1,
              ceiling(if(t6.view_progress is null, 0, t6.view_progress) * 100), ceiling((tt1.term_app_unit_finished_count / tt1.term_app_unit_total_count) * 100)),
              null) as user_app_learn_progress
            from
            	(
            		select t1.member_id, t1.term_id, 
            				t2.term_app_unit_total_count,
            				t3.term_app_unit_finished_count,
            				t4.scorm_unit_sum,
            				t5.scorm_unit_id
	                from (
	                  select member_id, term_id, value as provider_id from ${mid}.term_learn_progress_stat_kv
	                  where day= '$etlDay' and type = 'provider_id' and category = 'common_property'
	                ) t1
	                left outer join (
	                  select member_id, term_id, value as term_app_unit_total_count from ${mid}.term_learn_progress_stat_kv
	                  where day= '$etlDay' and type = 'term_app_unit_total_count' and category = 'common_attribute'
	                ) t2 on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)
	                left outer join (
	                  select member_id, term_id, value as term_app_unit_finished_count from ${mid}.term_learn_progress_stat_kv
	                  where day= '$etlDay' and type = 'term_app_unit_finished_count' and category = 'term_app_unit_finished_count'
	                ) t3 on (t1.member_id = t3.member_id and t1.term_id = t3.term_id)
	                left outer join (
	                  select term_id, count(id) as scorm_unit_sum from ${db_load}.s2_lesson_unit
	                  where day = '$etlDay' and content_type = 8 and (client_visible = 0 or client_visible = 2) group by term_id
	                ) t4 on (t1.term_id = t4.term_id)
	                left outer join (
	                  select term_id, id as scorm_unit_id from ${db_load}.s2_lesson_unit
	                  where day = '$etlDay' and content_type = 8 and (client_visible = 0 or client_visible = 2) limit 1
	                ) t5 on (t1.term_id = t5.term_id)
                ) tt1
                left outer join (
                  select lesson_unit_id, learner_id, view_progress from ${db_load}.scorm_view_record
                  where day = '$etlDay'
                ) t6 on (tt1.member_id = t6.learner_id and tt1.scorm_unit_id = t6.lesson_unit_id)



insert overwrite table ${mid}.term_learn_progress_stat_kv partition(day='$etlDay',category='term_user_learn_progress')
            select t1.member_id, t1.term_id, 'user_app_learn_progress',
            if(t4.term_unit_total_count is not null and t4.term_unit_total_count >= 1,
              if(t2.user_web_learn_progress is null,
                if(t3.user_app_learn_progress is null, 0, t3.user_app_learn_progress),
                if(t3.user_app_learn_progress is null, t2.user_web_learn_progress, if(t2.user_web_learn_progress >= t3.user_app_learn_progress, t2.user_web_learn_progress, t3.user_app_learn_progress))),
              null
            ) as term_user_learn_progress
            from
                (
                  select member_id, term_id, value as provider_id from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'provider_id' and category = 'common_property'
                ) t1
                left outer join (
                  select member_id, term_id, cast(value as bigint) as user_web_learn_progress from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'user_web_learn_progress' and category = 'user_web_learn_progress'
                )t2 on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)
                left outer join (
                  select member_id, term_id, cast(value as bigint) as user_app_learn_progress from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'user_app_learn_progress' and category = 'user_app_learn_progress'
                )t3 on (t1.member_id = t3.member_id and t1.term_id = t3.term_id)
                left outer join (
                  select member_id, term_id, cast(value as bigint) as term_unit_total_count from ${mid}.term_learn_progress_stat_kv
                  where day= '$etlDay' and type = 'term_unit_total_count' and category = 'common_attribute'
                ) t4 on (t1.member_id = t4.member_id and t1.term_id = t4.term_id)






select member_id, term_id, cast(value as bigint) from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute' and term_id = "400000002103002" and member_id = "7735049" limit 5;


select member_id, term_id, if(cast(value as bigint)>=1, true, false) from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute' and term_id = "400000002103002" and member_id = "7735049" limit 5;

select member_id, term_id, if(value >= 1, if(value= 1, 1, ceiling((value / value) * 100)), null) from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute' and term_id = "400000002103002" and member_id = "7735049" limit 5;


select * from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and category='user_web_learn_progress' and term_id = "400000002103002" and member_id = "7735049" limit 5;



select * from qyy_mid_test.term_learn_progress_stat where day="2017-05-22" and term_id = "400000002103002" and member_id = "7735049";



term_id : 400000002163003

select * from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and category='user_web_learn_progress' and term_id = "400000002163003" and member_id = "7735049" limit 5;

select member_id, term_id, value as term_web_unit_total_count from qyy_mid_test.term_learn_progress_stat_kv where day="2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute' and term_id = "400000002163003" and member_id = "7735049" limit 5;

select term_id, count(id) as scorm_unit_sum from qyy_dbload_test.s2_lesson_unit where day = '2017-05-22' and content_type = 8 and (client_visible = 0 or client_visible = 1) and term_id=400000002163003 group by term_id limit 5;

select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit where day = '2017-05-22' and content_type = 8 and (client_visible = 0 or client_visible = 1) and term_id = 400000002163003 limit 1;

select lesson_unit_id, learner_id, view_progress from qyy_dbload_test.scorm_view_record where day = "2017-05-22" and lesson_unit_id = 400000002229025 and learner_id = 7735049;

select lesson_unit_id, learner_id, ceiling(view_progress * 100) from qyy_dbload_test.scorm_view_record where day = "2017-05-22" and lesson_unit_id = 400000002229025 and learner_id = 7735049;

select lesson_unit_id, learner_id, ceiling(if(view_progress is null, 0, view_progress) * 100), ceiling(view_progress * 100) from qyy_dbload_test.scorm_view_record where day = "2017-05-22" and lesson_unit_id =400000002229025 and learner_id =7735049;


select t5.term_id, t5.scorm_unit_id, t6.lesson_unit_id, t6.learner_id, t6.view_progress
from (
select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit
where day ="2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) and term_id = 400000002163003 limit 1
) t5
left outer join (
select lesson_unit_id, learner_id, view_progress from qyy_dbload_test.scorm_view_record
where day ="2017-05-22" 
) t6 on (t5.scorm_unit_id = t6.lesson_unit_id and t6.learner_id = 7735049);



select lesson_unit_id, learner_id, ceiling(if(view_progress is null, 0, view_progress) * 100), ceiling(view_progress * 100) from qyy_dbload_test.scorm_view_record where day = "2017-05-22" and lesson_unit_id =13001 and learner_id =1017232410;




****************************************************************** 20170524




select tt1.member_id, tt1.term_id, tt1.term_web_unit_total_count, tt1.term_web_unit_finished_count, tt1.scorm_unit_sum, tt1.scorm_unit_id, t6.view_progress
from (
	select t1.member_id, t1.term_id,
		t2.term_web_unit_total_count,
		t3.term_web_unit_finished_count,
		t4.scorm_unit_sum,
		t5.scorm_unit_id
    from (
      select member_id, term_id, value as provider_id from qyy_mid_test.term_learn_progress_stat_kv
      where day= "2017-05-22" and type = 'provider_id' and category = 'common_property'
    ) t1
    left outer join (
      select member_id, term_id, value as term_web_unit_total_count from qyy_mid_test.term_learn_progress_stat_kv
      where day= "2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute'
    ) t2 on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)
    left outer join (
      select member_id, term_id, value as term_web_unit_finished_count from qyy_mid_test.term_learn_progress_stat_kv
      where day= "2017-05-22" and type = 'term_web_unit_finished_count' and category = 'term_web_unit_finished_count'
    ) t3 on (t1.member_id = t3.member_id and t1.term_id = t3.term_id)
    left outer join (
      select term_id, count(id) as scorm_unit_sum from qyy_dbload_test.s2_lesson_unit
      where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) group by term_id
    ) t4 on (t1.term_id = t4.term_id)
    left outer join (
      select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit
      where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) limit 1
    ) t5 on (t1.term_id = t5.term_id)
) tt1
left outer join (
  select lesson_unit_id, learner_id, view_progress from qyy_dbload_test.scorm_view_record
  where day = "2017-05-22"
) t6 on (tt1.member_id = t6.learner_id and tt1.scorm_unit_id = t6.lesson_unit_id)
where term_id = "400000002163003" and member_id = "7735049" limit 5;

结果： 7735049	400000002163003	1	NULL	1	NULL	NULL


select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) and term_id=400000002163003 limit 1 group by term_id;
结果：400000002163003	400000002229025




select t1.member_id, t1.term_id,
	t2.term_web_unit_total_count,
	t3.term_web_unit_finished_count,
	t4.scorm_unit_sum,
	t5.scorm_unit_id
from (
  select member_id, term_id, value as provider_id from qyy_mid_test.term_learn_progress_stat_kv
  where day= "2017-05-22" and type = 'provider_id' and category = 'common_property'
) t1
left outer join (
  select member_id, term_id, value as term_web_unit_total_count from qyy_mid_test.term_learn_progress_stat_kv
  where day= "2017-05-22" and type = 'term_web_unit_total_count' and category = 'common_attribute'
) t2 on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)
left outer join (
  select member_id, term_id, value as term_web_unit_finished_count from qyy_mid_test.term_learn_progress_stat_kv
  where day= "2017-05-22" and type = 'term_web_unit_finished_count' and category = 'term_web_unit_finished_count'
) t3 on (t1.member_id = t3.member_id and t1.term_id = t3.term_id)
left outer join (
  select term_id, count(id) as scorm_unit_sum from qyy_dbload_test.s2_lesson_unit
  where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) group by term_id
) t4 on (t1.term_id = t4.term_id)
left outer join (
  select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit
  where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) limit 1
) t5 on (t1.term_id = t5.term_id)
where t1.term_id = "400000002163003" and t1.member_id = "7735049" limit 5;

结果：7735049	400000002163003	1	NULL	1	NULL



select t1.member_id, t1.term_id,
	t4.scorm_unit_sum,
	t5.scorm_unit_id
from (
  select member_id, term_id, value as provider_id from qyy_mid_test.term_learn_progress_stat_kv
  where day= "2017-05-22" and type = 'provider_id' and category = 'common_property'
) t1
left outer join (
  select term_id, count(id) as scorm_unit_sum from qyy_dbload_test.s2_lesson_unit
  where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) group by term_id
) t4 on (t1.term_id = t4.term_id)
left outer join (
  select term_id, id as scorm_unit_id from qyy_dbload_test.s2_lesson_unit
  where day = "2017-05-22" and content_type = 8 and (client_visible = 0 or client_visible = 1) limit 1
) t5 on (t1.term_id = t5.term_id)
where t1.term_id = "400000002163003" and t1.member_id = "7735049" limit 5;












select term_id, min(id) as scorm_unit_id from ${db_load}.s2_lesson_unit 
where day = '$etlDay' and content_type = 8 and (client_visible = 0 or client_visible = 1) GROUP BY term_id 
          	


400000002008344,1020394936,400000001055001,400000001623088,0,2,1,1481253807884,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N
400000002912660,1020394937,400000001055001,400000001653002,3,1,2,1482116261092,\N,\N,3,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N
400000003615947,1020394939,400000001055001,400000002125003,0,1,1,1495443279365,\N,\N,\N,\N,\N,\N,\N,5,\N,\N,\N,\N,\N,\N,\N,\N,0
400000001902244,1020394943,400000001055001,400000001637003,0,1,1,1481201081478,\N,\N,\N,\N,\N,\N,\N,1,\N,\N,\N,\N,\N,\N,\N,\N,0
400000002038737,1020394944,400000001055001,400000001638001,3,1,1,1481261921409,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N,\N



alter table s2_term_learn_progress_stat_master add column `term_user_learn_progress` smallint(11) DEFAULT NULL COMMENT '期次用户 最终学习进度百分比(向上取整)';


# 测试RDS 表变更
# 用户期次学习进度统计表（用户、期次维度）
CREATE TABLE `s2_term_learn_progress_stat_bac_master` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`aggregation_learn_id` bigint(20) NOT NULL COMMENT 'aggregation_learn表主键id',
`member_id` bigint(20) DEFAULT NULL COMMENT '用户id',
`provider_id` bigint(20) DEFAULT '-1' COMMENT '机构id',
`term_id` bigint(20) DEFAULT NULL COMMENT '期次id',
`term_type` smallint(2) DEFAULT NULL COMMENT '期次类型，随到随学班次0 学期制班次3',
`term_choose_type` smallint(2) DEFAULT NULL COMMENT '选课类型，即期次报名方式，1指派 2 自选，取自s2_term_entry_mode 表的 enroll_type',
`online_flag` smallint(2) DEFAULT NULL COMMENT '是否线下培训 1:线上 2：线下',
`enroll_time` bigint(20) DEFAULT NULL COMMENT '课程参加时间',
`signed_count` smallint(6) DEFAULT NULL COMMENT '出勤次数，即签到次数',
`leave_count` smallint(6) DEFAULT NULL COMMENT '请假次数',
`not_signed_count` smallint(6) DEFAULT NULL COMMENT '缺勤次数',
`online_learn_duration` bigint(20) DEFAULT NULL COMMENT '线上学习总时长（毫秒数）',
`offline_learn_duration` bigint(20) DEFAULT NULL COMMENT '线下学习总时长（毫秒数）',
`term_unit_learn_count` smallint(6) DEFAULT NULL COMMENT '学期课件学习数',
`term_unit_finished_count` smallint(6) DEFAULT NULL COMMENT '学期课件完成数',
`term_unit_total_count` smallint(6) DEFAULT NULL COMMENT '学期总课件数',
`term_unit_duration` bigint(20) DEFAULT NULL COMMENT '课件观看时间',
`score` decimal(10,2) DEFAULT NULL COMMENT '学期成绩，来自s2_term_score_summary.total_normalized_score_plus_bonus',
`first_learn_time` bigint(20) DEFAULT NULL COMMENT '首次学习时间',
`last_learn_time` bigint(20) DEFAULT NULL COMMENT '最近学习时间',
`post_count` smallint(6) DEFAULT NULL COMMENT '发帖数',
`post_reply_count` smallint(6) DEFAULT NULL COMMENT '回帖数',
`post_comment_count` smallint(6) DEFAULT NULL COMMENT '评论数',
`post_top_count` smallint(6) DEFAULT NULL COMMENT '被顶数',
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`term_user_learn_progress` smallint(11) DEFAULT NULL COMMENT '期次用户 最终学习进度百分比(向上取整)',
PRIMARY KEY (`id`),
KEY `idx_memberid_providerid_termid` (`member_id`,`provider_id`,`term_id`),
KEY `idx_memberid_providerid_search` (`member_id`,`provider_id`,`enroll_time`,`term_type`,`online_flag`,`term_choose_type`),
KEY `idx_providerid_aggregationlearnid` (`provider_id`,`aggregation_learn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户期次学习进度统计表';
 
CREATE TABLE `s2_term_learn_progress_stat_bac_slave` (
`id` bigint(20) NOT NULL AUTO_INCREMENT,
`aggregation_learn_id` bigint(20) NOT NULL COMMENT 'aggregation_learn表主键id',
`member_id` bigint(20) DEFAULT NULL COMMENT '用户id',
`provider_id` bigint(20) DEFAULT '-1' COMMENT '机构id',
`term_id` bigint(20) DEFAULT NULL COMMENT '期次id',
`term_type` smallint(2) DEFAULT NULL COMMENT '期次类型，随到随学班次0 学期制班次3',
`term_choose_type` smallint(2) DEFAULT NULL COMMENT '选课类型，即期次报名方式，1指派 2 自选，取自s2_term_entry_mode 表的 enroll_type',
`online_flag` smallint(2) DEFAULT NULL COMMENT '是否线下培训 1:线上 2：线下',
`enroll_time` bigint(20) DEFAULT NULL COMMENT '课程参加时间',
`signed_count` smallint(6) DEFAULT NULL COMMENT '出勤次数，即签到次数',
`leave_count` smallint(6) DEFAULT NULL COMMENT '请假次数',
`not_signed_count` smallint(6) DEFAULT NULL COMMENT '缺勤次数',
`online_learn_duration` bigint(20) DEFAULT NULL COMMENT '线上学习总时长（毫秒数）',
`offline_learn_duration` bigint(20) DEFAULT NULL COMMENT '线下学习总时长（毫秒数）',
`term_unit_learn_count` smallint(6) DEFAULT NULL COMMENT '学期课件学习数',
`term_unit_finished_count` smallint(6) DEFAULT NULL COMMENT '学期课件完成数',
`term_unit_total_count` smallint(6) DEFAULT NULL COMMENT '学期总课件数',
`term_unit_duration` bigint(20) DEFAULT NULL COMMENT '课件观看时间',
`score` decimal(10,2) DEFAULT NULL COMMENT '学期成绩，来自s2_term_score_summary.total_normalized_score_plus_bonus',
`first_learn_time` bigint(20) DEFAULT NULL COMMENT '首次学习时间',
`last_learn_time` bigint(20) DEFAULT NULL COMMENT '最近学习时间',
`post_count` smallint(6) DEFAULT NULL COMMENT '发帖数',
`post_reply_count` smallint(6) DEFAULT NULL COMMENT '回帖数',
`post_comment_count` smallint(6) DEFAULT NULL COMMENT '评论数',
`post_top_count` smallint(6) DEFAULT NULL COMMENT '被顶数',
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`term_user_learn_progress` smallint(11) DEFAULT NULL COMMENT '期次用户 最终学习进度百分比(向上取整)',
PRIMARY KEY (`id`),
KEY `idx_memberid_providerid_termid` (`member_id`,`provider_id`,`term_id`),
KEY `idx_memberid_providerid_search` (`member_id`,`provider_id`,`enroll_time`,`term_type`,`online_flag`,`term_choose_type`),
KEY `idx_providerid_aggregationlearnid` (`provider_id`,`aggregation_learn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户期次学习进度统计表';


insert into study_stat_switch (id, db_create_time, k, v) VALUES ('27', CURRENT_TIMESTAMP, 's2_term_learn_progress_stat_bac', 'master');




select term_unit_total_count,term_unit_learn_count,term_unit_finished_count,term_web_unit_finished_count,term_app_unit_finished_count,term_user_learn_progress from qyy_mid_test.term_learn_progress_stat where day="2017-05-22" and member_id=7735049 and term_id =400000002163003;


("s2_term_learn_progress_stat".equals(table.getTablePrefix())) ? "s2_term_learn_progress_stat_bac" : table.getTablePrefix()



/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java -jar /home/appops/edu-bi-store/run_jar/scorm_test/edu-bi-store-1.0-snapshot-uberjar.jar learnStatisticsRecordStorageForScorm test 2017-05-22

mv target/edu-bi-store-1.0-snapshot-uberjar.jar run_jar/scorm_test/




















400000002181154		all-2
2/3 = 67%

400000002181152		all-2-web-2
web: 2/4
取web： 50%


web-3-app-2			400000002181147
web: 2/3
app: 1/2
取web : 67%


400000002181149		all-2-web2-app2
all： 1
web：1
app：2
web ： 2/4=50%,  app: 3/4=75%



400000002181143		单scorm-都可见
0.6


web-2-app-3		400000002181148
web：1/2=50%
app：2/3=67%
取app：67%


400000002181146			单课件非scorm
100%


单期次scorm-1	web端可见 	400000002181144
100%




List<TermDraftDoc> docs = termDraftDocDao.getByCondition(Arrays.asList("courseId = ?"), courseId);

alter TABLE `scorm_view_record` modify column `view_record` text DEFAULT NULL COMMENT '观看记录的json，由前端传入';




RDS:
select * from s2_term_learn_progress_stat_master where member_id = 7735049 and  provider_id = 400000001139001;


select * from qyy_mid_test.term_learn_progress_stat where day="2017-05-25" and member_id=7735049 and term_id=400000002181154;





alter table qyy_mid_test.term_learn_progress_stat drop partition (day='2017-05-25');

alter table qyy_mid_test.term_learn_progress_stat add if not exists partition(day='2017-05-25') location '/user/study/qyy/test/middle/term_learn_progress_stat/day=2017-05-25';

alter table qyy_output_test.s2_term_learn_progress_stat drop partition (day='2017-05-25');

alter table qyy_output_test.s2_term_learn_progress_stat add if not exists partition(day='2017-05-25') location '/user/study/qyy/test/output/s2_term_learn_progress_stat/day=2017-05-25';






上传的 scorm包里 本身支持 scorm（flash） 和 H5 的， 这样 这个 是 两端都可见的， 但是 在播放的时候 会自动 在web端 播放 flash，移动端 播放 H5；
上传的 包里 有 flsh 和 MP4， 那么 flash web端课件， 对应 MP4 移动端课件；
上传的 包里 只有 MP4，那么 MP4 两端都可见；




账号：ww-user1
编号：ww-1111



lecctorIds
1019833007


scorm_view_record



CREATE TABLE `scorm_view_record_detail` (
`id` bigint(20) NOT NULL COMMENT 'scorm_view_record 主键id',
`gmt_create` bigint(20) DEFAULT NULL,
`db_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`view_record` text COMMENT '观看记录的json，由前端传入',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='scorm观看记录详情表' /* BF=id, POLICY=s2_p1, STARTID=1, ASSIGNIDTYPE=USB */;


ww-1111
WW-2



edu-statistic-server	done
scorm-server			done
enterprise-web			done
edu-bi-store 			done
enterprise-etl			done



6105628

400000000023005



courseId: 400000000107526
siteId : 400000000023005
providerId: 400000000023005

fromProviderId: 6105628




400000000023005



