select * from qyy_mid_test.user_term_learn_duration where member_id=1020212008 and term_id in (400000002420003,400000002420004);

1020212008	400000002420004	60002	2017-06-30	1d	all_learn
1020212008	400000002420004	60002	2017-06-30	td	all_learn

1020212008	400000002420004	60002	2017-07-01	td	all_learn

1020212008	400000002420004	60002	2017-07-02	td	all_learn

1020212008	400000002420004	120008	2017-07-03	1d	all_learn
1020212008	400000002420004	180010	2017-07-03	td	all_learn


select * from qyy_mid_test.user_project_learn_duration where member_id=1020212008 and project_id=400000002420007;

1020212008	400000002420007	NULL	2017-06-29	1d
1020212008	400000002420007	NULL	2017-06-29	td

1020212008	400000002420007	240696.0	2017-06-30	1d
1020212008	400000002420007	240696.0	2017-06-30	td

1020212008	400000002420007	360024.0	2017-07-03	1d
1020212008	400000002420007	721068.0	2017-07-03	td



select * from qyy_mid_test.user_project_task_rel where day="2017-07-03" and member_id=1020212008 and project_id=400000002420007;

400000001139001	1020212008	400000002420007	0	400000002420007	2017-06-30
400000001139001	1020212008	400000002420007	12	310001	2017-06-30
400000001139001	1020212008	400000002420007	9	400000002420003	2017-06-30
400000001139001	1020212008	400000002420007	9	400000002420004	2017-06-30





select t1.member_id, t1.project_id, t1.target_id, t2.duration
from
    ( select member_id, project_id, target_id from qyy_mid_test.user_project_task_rel where target_type in (0, 9) and project_id is not null ) t1
    left outer join
    ( select member_id, term_id, duration from qyy_mid_test.user_term_learn_duration where day = '2017-06-30' and type='1d' and tag='all_learn') t2
    on (t1.member_id = t2.member_id and t1.target_id = t2.term_id)






select * from qyy_mid_test.user_term_learn_duration where day="2017-07-01" and member_id=1020212008 and term_id in (400000002420003,400000002420004,400000002420007);


1d:
1020212008	400000002420004	60002	2017-06-30	1d	all_learn
1020212008	400000002420007	60346	2017-06-30	1d	all_learn
1020212008	400000002420004	180010	2017-07-03	1d	all_learn

1020212008	400000002420003	60005	2017-07-04	1d	all_learn
1020212008	400000002420007	60002	2017-07-04	1d	all_learn
1020212008	400000002420003	60005	2017-07-04	1d	unit_learn



td:
1020212008	400000002420004	60002	2017-06-30	td	all_learn
1020212008	400000002420007	60346	2017-06-30	td	all_learn

1020212008	400000002420004	60002	2017-07-01	td	all_learn
1020212008	400000002420007	60346	2017-07-01	td	all_learn

1020212008	400000002420004	60002	2017-07-02	td	all_learn
1020212008	400000002420007	60346	2017-07-02	td	all_learn

1020212008	400000002420004	240012	2017-07-03	td	all_learn
1020212008	400000002420007	60346	2017-07-03	td	all_learn

1020212008	400000002420003	60005	2017-07-04	td	all_learn
1020212008	400000002420004	240012	2017-07-04	td	all_learn
1020212008	400000002420007	120348	2017-07-04	td	all_learn
1020212008	400000002420003	60005	2017-07-04	td	unit_learn





project: 
1d:
1020212008	400000002420007	NULL	2017-06-29	1d
1020212008	400000002420007	120348	2017-06-30	1d
1020212008	400000002420007	180010	2017-07-03	1d
1020212008	400000002420007	120007	2017-07-04	1d

td:
1020212008	400000002420007	NULL	2017-06-29	td
1020212008	400000002420007	120348	2017-06-30	td
1020212008	400000002420007	120348	2017-07-01	td
1020212008	400000002420007	120348	2017-07-02	td
1020212008	400000002420007	300358	2017-07-03	td
1020212008	400000002420007	420365	2017-07-04	td




/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java -jar /home/appops/edu-bi-store/run_jar/test/edu-bi-store-1.0-snapshot-uberjar.jar learnStatistics test 2017-07-04



select member_id, term_id,online_learn_total_time,offline_learn_total_time from qyy_mid_test.term_learn_progress_stat where day="2017-07-04" and member_id=1020212008 and provider_id=400000001139001;

1020212008	400000002420007	120348	NULL
1020212008	400000002163004	NULL	NULL
1020212008	400000002420008	240011	NULL 		360359
1020212008	400000002163005	NULL	NULL
1020212008	400000002420009	NULL	NULL
1020212008	400000002124001	NULL	NULL
1020212008	400000002124002	NULL	432000000
1020212008	400000002103001	NULL	NULL
1020212008	400000002420002	NULL	NULL
1020212008	400000002171055	NULL	NULL
1020212008	400000002420003	60005	NULL 		420364
1020212008	400000002420004	240012	NULL    	660376
1020212008	400000002420005	NULL	72000000
1020212008	400000002420006	NULL	144000000






select * from qyy_mid_test.user_project_task_rel where day="2017-07-04" and member_id=1020212008 and provider_id=400000001139001;

400000001139001	1020212008	400000002420007	0	400000002420007	2017-07-04
400000001139001	1020212008	400000002420007	12	310001	2017-07-04
400000001139001	1020212008	400000002420007	9	400000002420003	2017-07-04
400000001139001	1020212008	400000002420007	9	400000002420004	2017-07-04
400000001139001	1020212008	400000002420008	0	400000002420008	2017-07-04
400000001139001	1020212008	400000002420008	12	310002	2017-07-04
400000001139001	1020212008	400000002420008	9	400000002420004	2017-07-04
400000001139001	1020212008	400000002420008	9	400000002420005	2017-07-04
400000001139001	1020212008	400000002420009	0	400000002420009	2017-07-04
400000001139001	1020212008	400000002420009	9	400000002420005	2017-07-04
400000001139001	1020212008	400000002420009	9	400000002420006	2017-07-04


select * from qyy_mid_test.user_term_learn_duration where member_id=1020212008 and term_id in (400000002420003,400000002420004,400000002420007);



select * from qyy_mid_test.user_term_learn_duration where member_id=1020212008 and term_id in (400000002420008,400000002420004,400000002420005);

1020212008	400000002420004	60002	2017-06-30	1d	all_learn
1020212008	400000002420004	60002	2017-06-30	td	all_learn

1020212008	400000002420004	60002	2017-07-01	td	all_learn

1020212008	400000002420004	60002	2017-07-02	td	all_learn

1020212008	400000002420004	180010	2017-07-03	1d	all_learn
1020212008	400000002420008	240011	2017-07-03	1d	all_learn
1020212008	400000002420004	240012	2017-07-03	td	all_learn
1020212008	400000002420008	240011	2017-07-03	td	all_learn

1020212008	400000002420004	240012	2017-07-04	td	all_learn
1020212008	400000002420008	240011	2017-07-04	td	all_learn


select * from qyy_mid_test.user_project_learn_duration where member_id=1020212008 and project_id=400000002420008;

1020212008	400000002420008	NULL	2017-06-29	1d
1020212008	400000002420008	NULL	2017-06-29	td

1020212008	400000002420008	60002	2017-06-30	1d
1020212008	400000002420008	60002	2017-06-30	td

1020212008	400000002420008	60002	2017-07-01	td
1020212008	400000002420008	60002	2017-07-02	td

1020212008	400000002420008	420021	2017-07-03	1d
1020212008	400000002420008	480023	2017-07-03	td

1020212008	400000002420008	NULL	2017-07-04	1d
1020212008	400000002420008	480023	2017-07-04	td






*************************************************** 20170710

select * from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type != 'web' and biz_dat['provider_id'] = 400000001156001 and user_id is not null and biz_dat['start_time'] != 0;

select * from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['provider_id'] = 400000001139001 and user_id is not null;


select user_id from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type = 'web' and  biz_dat['provider_id'] =400000000003003 and user_id is not null group by user_id;


select distinct user_id as uid from qyy_mid_online.user_behavior where day = '2017-07-07' and user_id is not null and active_name in ('lesson_unit_learn_record' ,'user_learn_record', 'pageview') and device_type = 'web';



select biz_dat['provider_id'] as provider_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type != 'web' and biz_dat['provider_id'] = 400000001156001 and user_id is not null and biz_dat['start_time'] != 0;


select biz_dat['provider_id'] as provider_id, sum (biz_dat['end_time'] - biz_dat['start_time']) from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['provider_id'] = 400000001139001 and user_id is not null group by biz_dat['provider_id'];





select count(*) from s2_provider_team where provider_id=1014085054;


select count(*) from s2_provider_staff_invite where provider_id=1014085054;


select provider_id, online_user_web_count, online_user_app_count, online_user_total_count, web_online_total_duration, app_online_total_duration, user_add_count, user_active_count, user_add_total_count, user_active_total_count from qyy_output_online.platform_health_stat_date where day="2017-07-07" and provider_id=400000000029002;


select provider_id, online_count as online_user_web_count from qyy_output_online.s2_online_user_stat_date where day = '2017-07-07' and provider_id=400000000029002;

select provider_id, online_count as online_user_web_count from qyy_output_online.s2_online_user_stat_date_mob where day = '2017-07-07' and provider_id=400000000029002;

select provider_id, online_count as online_user_web_count from qyy_output_online.s2_online_user_stat_date_total where day = '2017-07-07' and provider_id=400000000029002;


select user_id as uid from qyy_mid_online.user_behavior where day = '2017-07-07' and user_id is not null and active_name in ('lesson_unit_learn_record' ,'user_learn_record', 'pageview') and biz_dat['provider_id']=400000000029002;

select distinct user_id as uid from qyy_mid_online.user_behavior where day = '2017-07-07' and user_id is not null and active_name in ('lesson_unit_learn_record' ,'user_learn_record', 'pageview') and device_type = 'web' and biz_dat['provider_id']=400000000029002;


********************************************************* 20170711


select provider_id, sum(cast((end_time - start_time) as bigint)) as web_online_total_duration
from (
	select biz_dat['provider_id'] as provider_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time 
		from qyy_mid_test.user_behavior 
		where day = '2017-07-05' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record')
			and biz_dat['provider_id'] = 400000001139001 and user_id is not null
) d1;




select provider_id, sum(cast((end_time - start_time) as bigint)) as web_online_total_duration
from (
select biz_dat['provider_id'] as provider_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time
from qyy_mid_test.user_behavior
where day = '2017-07-05' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record')
and biz_dat['provider_id'] = 400000001139001 and user_id is not null
) d1
group by provider_id;




select biz_dat['provider_id'] as provider_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time from qyy_mid_test.user_behavior where day = '2017-07-05' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end', 'user_learn_record', 'user_learn_end') and biz_dat['provider_id'] = 400000001139001 and user_id is not null and biz_dat['start_time'] != 0;




*******************************************************************************************************************

************************* 2017-07-07

select count(*), sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id']=400000000052001;

14990	916187140


select count(*), sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id']=400000000052001 and device_type = 'web';

13765	663340853


select count(*), sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id']=400000000052001 and device_type != 'web';

1225	252846287




select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07";
117295	2228176401

	select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id'] is null;
	80493	30701

	select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id'] is not null;
	36802	2228145700

		select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id'] is not null and active_name in ('user_learn_record', 'lesson_unit_learn_record');
		35458	2228145700

		select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id'] is not null and active_name not in ('user_learn_record', 'lesson_unit_learn_record');
		1344	NULL



日志数据中： provider_id 为 null 的情况（老的移动端的日志） 只有 30S的误差；



select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id= 400000000052001 group by provider_id;
205	843869982


select user_id, active_name, biz_dat['term_id'], biz_dat['provider_id']  from qyy_mid_online.user_behavior where day="2017-07-07" and biz_dat['provider_id']=400000000052001 limit 20;





去重后日志表：

select count(*), sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_test_temp.user_behavior_partitions where day="2017-06-28" and biz_dat['provider_id']=400000000052001;


select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-06-28" and provider_id= 400000000052001 group by provider_id;


************************* 2017-07-08	

select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08";
83130	1644817111

	select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and biz_dat['provider_id'] is null;
	59364	NULL

	select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and biz_dat['provider_id'] is not null;
	23766	1644817111

		select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and biz_dat['provider_id']=400000000052001;
		14988	880819256

		select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and biz_dat['provider_id'] != 400000000052001;
		8778	763997855

日志数据中,不存在 provider_id 为 null 的时长日志； 所以，在时长计算的时候 可以基本排除 provider_id 为null 的情况； 


select count(*),sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-08" and provider_id=400000000052001;
206	820087899
[比原始日志计算时长 少]


select t2.provider_id, t1.member_id, t1.term_id, duration
from
(select member_id, term_id,duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'all_learn' and member_id=1024804319)t1
join
(select id, provider_id from qyy_dbload_online.s2_term where day = '2017-07-08' and  composite_type != '15') t2
on t1.term_id = t2.id;


400000000052001	1024804319	400000000207049	6532
400000000052001	1024804319	400000000408003	6961


select member_id, term_id,duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'all_learn' and member_id=1024804319;
1024804319	400000000207049	6532
1024804319	400000000408003	6961



select t1.date_tag,
               t1.member_id,
               t2.provider_id,
               t1.duration as online_learn_duration,
               null as offline_learn_duration
        from
        (select unix_timestamp('2017-07-08','yyyy-MM-dd')*1000 as date_tag,
               member_id,
               term_id,
               duration
        from qyy_mid_online.user_term_learn_duration
        where day = '2017-07-08'
        and type = '1d'
        and tag = 'all_learn' and member_id=1024804319) t1
        join
        (select id, provider_id from qyy_dbload_online.s2_term where day = '2017-07-08' and  composite_type != '15') t2
        on t1.term_id = t2.id;





select * from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-08" and member_id=1024804319 and provider_id=400000000052001;
1499443200000	1024804319	400000000052001	6532	NULL	2017-07-08
1499443200000	1024804319	400000000052001	6961	NULL	2017-07-08




1024116835:

select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'all_learn' and member_id=1024116835;
1024116835	400000001009025	13355 

【猛犸上 执行作业，跑完原job sql， 与最终 结果一致：13355】【有问题】


select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'unit_learn' and member_id=1024116835;
1024116835	400000001009025	3049


select user_id, count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and biz_dat['provider_id']=400000000052001 and user_id = 1024116835 group by user_id;
1024116835	8	16404


select user_id, count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116835 group by user_id;
1024116835	8	16404



select active_name, device_type, user_id, biz_dat['term_id'], biz_dat['provider_id'], biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116835;
lesson_unit_learn_record	AndroidPhone	1024116835	400000001009025	400000000052001	1499517422021	1499517422022	1
lesson_unit_learn_record	AndroidPhone	1024116835	400000001009025	400000000052001	1499517426173	1499517428110	1937
pageview					AndroidPhone	1024116835	NULL			400000000052001	NULL	NULL	NULL
pageview					AndroidPhone	1024116835	NULL			400000000052001	NULL	NULL	NULL
lesson_unit_learn_record	AndroidPhone	1024116835	400000001009025	400000000052001	1499517425054	1499517425054	0
pageview					AndroidPhone	1024116835	NULL			400000000052001	NULL	NULL	NULL
user_learn_record			AndroidPhone	1024116835	400000001009025	400000000052001	1499517419081	1499517432436	13355
lesson_unit_learn_record	AndroidPhone	1024116835	400000001009025	400000000052001	1499517429549	1499517430660	1111



select active_name, device_type, app_name, user_id, biz_dat['term_id'], biz_dat['provider_id'], biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116835;
lesson_unit_learn_record	AndroidPhone	study_enterprise	1024116835	400000001009025	400000000052001	1499517422021	1499517422022	1
lesson_unit_learn_record	AndroidPhone	study_enterprise	1024116835	400000001009025	400000000052001	1499517426173	1499517428110	1937
pageview					AndroidPhone	study_enterprise	1024116835	NULL	400000000052001	NULL	NULL	NULL
pageview					AndroidPhone	study_enterprise	1024116835	NULL	400000000052001	NULL	NULL	NULL
lesson_unit_learn_record	AndroidPhone	study_enterprise	1024116835	400000001009025	400000000052001	1499517425054	1499517425054	0
pageview					AndroidPhone	study_enterprise	1024116835	NULL	400000000052001	NULL	NULL	NULL
user_learn_record			AndroidPhone	study_enterprise	1024116835	400000001009025	400000000052001	1499517419081	1499517432436	13355
lesson_unit_learn_record	AndroidPhone	study_enterprise	1024116835	400000001009025	400000000052001	1499517429549	1499517430660	1111




1024116852:

select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'all_learn' and member_id=1024116852;
1024116852	400000000849049	7702
1024116852	400000001012033	5862240
1024116852	400000001015031	7333649
1024116852	400000001018026	117508

13321099	[与 date表 累计一致]


select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'unit_learn' and member_id=1024116852;
1024116852	400000001012033	690835
1024116852	400000001015031	1750459
1024116852	400000001018026	109826

2551120 [date表 时长 + unit_learn 时长 =  原始日志计算时长]


select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116852 and active_name = 'user_learn_record' group by user_id;




1024116857 ：

select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'all_learn' and member_id=1024116857;
1024116857	400000001018026	32363
1024116857	400000001019028	3900597


select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day="2017-07-08" and type = '1d' and tag = 'unit_learn' and member_id=1024116857;
1024116857	400000001018026	10376
1024116857	400000001019028	3900597



select user_id, count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 group by user_id;
1024116857	577	3943336


select active_name, device_type, app_name, user_id, biz_dat['term_id'], biz_dat['provider_id'], biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857;



select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 and active_name in ( 'user_learn_record','lesson_unit_learn_record') group by user_id;
1024116857	3943336


select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 and active_name in ('user_learn_record') group by user_id;
1024116857	32363



select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 and active_name in ('lesson_unit_learn_record') group by user_id;
1024116857	3910973

select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 and active_name in ('lesson_unit_learn_record') and app_name is null group by user_id;
1024116857	3900597

select user_id, sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-08" and user_id = 1024116857 and active_name in ('lesson_unit_learn_record') and app_name is not null group by user_id;
1024116857	10376








1、必须分开计算  web + app 学习时长数据；	







select biz_dat['provider_id'] as provider_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time
from ${mid}.user_behavior
where day = '$etlDay' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record')
	and biz_dat['provider_id'] is not null and biz_dat['term_id'] is not null and user_id is not null



select t2.provider_id as provider_id, sum(cast((t1.end_time - t1.start_time) as bigint)) as web_online_total_duration
from
(select biz_dat['term_id'] as term_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time
from ${mid}.user_behavior
where day = '$etlDay' and day = '$etlDay' and device_type = 'web' and active_name in ('lesson_unit_learn_record', 'user_learn_record')
    and biz_dat['term_id'] is not null and user_id is not null) t1
join 
( select id, provider_id from ${db_load}.s2_term where day = '$etlDay' and  composite_type != '15' and provider_id is not null) t2
on t1.term_id = t2.id
group by provider_id





select r2.provider_id as provider_id, sum(cast((r1.end_time - r1.start_time) as bigint)) as web_online_total_duration
from
( select biz_dat['term_id'] as term_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time
from ${mid}.user_behavior
where day = '$etlDay' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end')
        and biz_dat['term_id'] is not null and user_id is not null and app_name is null and biz_dat['start_time'] != 0

 union all

 select biz_dat['term_id'] as term_id, biz_dat['start_time'] as start_time, biz_dat['end_time'] as end_time
from ${mid}.user_behavior
where day = '$etlDay' and device_type != 'web' and active_name in ('user_learn_record', 'user_learn_end')
        and biz_dat['term_id'] is not null and user_id is not null and biz_dat['start_time'] != 0

) r1
join 
( select id, provider_id from ${db_load}.s2_term where day = '$etlDay' and  composite_type != '15' and provider_id is not null) r2
on (r1.term_id = r2.id)
group by provider_id








select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-11" and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['term_id'] is null;
919	28193862


select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-11" and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['term_id'] is null and biz_dat['provider_id'] is null;
0	NULL

select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-11" and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['term_id'] is null and biz_dat['provider_id'] is not null;
919	28193862










select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id= 400000000052001 group by provider_id;
205	843869982

400000000052001	1499356800000	110	77	160	651759123	192110859	0	0	1827	1827		[数据一致]



select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000037001 group by provider_id;
145	32700866

400000000037001	1499356800000	122	152	160	4620159	28080707	0	0	8052	8052



select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000046001 group by provider_id;
4	1077992

400000000046001	1499356800000	11	4	14	960499	117493	0	0	200	181


select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000052005 group by provider_id;
2	569734

400000000052005	1499356800000	0	1	1	0	569734	0	0	212	212





select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000073001 group by provider_id;
248	397945301

400000000073001	1499356800000	97	38	120	333100974	64597327	3	3	499	499



select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and active_name in ('lesson_unit_learn_record', 'user_learn_record') and biz_dat['provider_id'] = 400000000073001;




select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000074001 group by provider_id;
121	162259387

400000000074001	1499356800000	29	88	105	93141245	69118142	0	0	4633	4633



select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000078002 group by provider_id;
7	7840080
400000000078002	1499356800000	3	1	3	7800013	40067	0	0	468	468



select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" and provider_id=400000000096005 group by provider_id;
4	9434762
400000000096005	1499356800000	2	4	5	3420503	6014259	0	0	54	54



select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-07" and active_name in = 'user_learn_record' and biz_dat['term_id'] is not null and user_id is not null and biz_dat['start_time'] != 0;






select provider_id, sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-07" group by provider_id;





select count(*),sum(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)) from qyy_mid_online.user_behavior where day="2017-07-20" and biz_dat['term_id']=400000001501001 and user_id=1028272250 and active_name = 'lesson_unit_learn_record';


select min(cast(biz_dat['start_time'] as bigint)), max(cast(biz_dat['end_time'] as bigint)) from qyy_mid_online.user_behavior where day="2017-07-20" and biz_dat['term_id']=400000001501001 and user_id=1028272250 and active_name = 'lesson_unit_learn_record';


select biz_dat['term_id'], user_id, biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000,device_type,active_name from qyy_mid_online.user_behavior where day="2017-07-20" and user_id=1027923606 and biz_dat['term_id']=400000001501001;

select biz_dat['term_id'], user_id, from_unixtime(cast(cast(biz_dat['start_time'] as bigint)/1000 as bigint), 'yyyy/MM/dd HH:mm:ss'), from_unixtime(cast(cast(biz_dat['end_time'] as bigint)/1000 as bigint), 'yyyy/MM/dd HH:mm:ss'), cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 from qyy_mid_online.user_behavior where day="2017-07-20" and user_id=1027923606 and biz_dat['term_id']=400000001501001;



修改本地时间导致时长超长：
select biz_dat['term_id'], device_type,active_name, user_id, biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 from qyy_mid_online.user_behavior where day="2017-07-18" and user_id=1024804295 and cast(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 as bigint) > 1000 limit 100;


select biz_dat['term_id'], device_type,active_name, user_id, biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 from qyy_mid_online.user_behavior where day="2017-07-18" and cast(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 as bigint) > 10000 limit 100


(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) <= 600000)




select biz_dat['term_id'], device_type,active_name, user_id, biz_dat['start_time'], biz_dat['end_time'], cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 from qyy_mid_online.user_behavior where day="2017-07-18" and cast(cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint)/1000 as bigint) > 100000 limit 100;


1500000000

select biz_dat['term_id'], device_type,active_name, user_id, biz_dat['start_time'], biz_dat['end_time'] from qyy_mid_online.user_behavior where day="2017-07-18" and cast(biz_dat['start_time'] as bigint) <= 1500000000 limit 100;



select web_online_total_duration, app_online_total_duration, cast((web_online_total_duration + app_online_total_duration) as bigint) from qyy_output_online.platform_health_stat_date where provider_id = 400000000108001 and day >= "2017-07-14";









select count(*), sum(cast(online_learn_duration as bigint)) from qyy_output_online.s2_user_learn_time_stat_date where day="2017-07-14" and provider_id= 400000000108001 group by provider_id;























