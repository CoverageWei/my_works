58 机构：
400000000074001



站点:
http://ntesfiintra.study.163.com/
site_id : 400000000097001

provider_id = 400000000100001;


蒋旻臻 H6181  1026239932
伊佳佳 H6546  1026243133
严敏			 1026242223

select * from s2_provider_team where provider_id=400000000100001 and id_num in ('H6181','H6546') limit 10;



select member_id, term_unit_duration/3600000, online_learn_duration/3600000 
from qyy_output_online.s2_term_learn_progress_stat 
where  day="2017-12-21" and provider_id=400000000100001 and member_id in (1026239932,1026243133);


1026243133      0.005824166666666667    0.008044722222222222
1026239932      2.016113888888889       2.0729291666666665
1026243133      0.6546372222222222      0.6602530555555556
1026239932      3.597344722222222       3.6461794444444444
1026239932      2.607972222222222       2.6313697222222223
1026239932      3.2341158333333335      3.268291666666667
1026243133      8.675E-4        0.004770555555555556
1026239932      0.41671916666666664     0.41671916666666664
1026239932      0.8491075       0.8669819444444444
1026239932      NULL    0.0010469444444444445
1026239932      0.8667280555555555      0.8811222222222223
1026243133      0.23893166666666665     0.24429333333333333
1026239932      NULL    0.003152777777777778
1026239932      0.20545416666666666     0.2467175
1026243133      2.6261225       2.6354491666666666
1026243133      2.278256388888889       NULL
1026239932      0.26341722222222225     0.38135277777777776
1026243133      0.05000333333333333     0.05000333333333333
1026239932      NULL    7.036111111111111E-4
1026239932      NULL    6.127777777777777E-4
1026243133      4.418628611111111       6.225E-4





select member_id, term_id, duration, duration/3600000 
from qyy_mid_online.user_term_learn_duration 
where day = '2017-12-21' and type = 'td' and tag = 'all_learn' and member_id=1026239932; 

1026239932      400000000838088 1500189 0.41671916666666664
1026239932      400000000840062 11350   0.003152777777777778
1026239932      400000000843117 7462545 2.0729291666666665
1026239932      400000000846033 9472931 2.6313697222222223
1026239932      400000000853020 13126246        3.6461794444444444
1026239932      400000000968006 2533    7.036111111111111E-4
1026239932      400000000969002 1372870 0.38135277777777776
1026239932      400000000975001 888183  0.2467175
1026239932      400000000981001 2206    6.127777777777777E-4
1026239932      400000001637002 3769    0.0010469444444444445
1026239932      400000001638004 11765850        3.268291666666667
1026239932      400000002231005 3121135 0.8669819444444444
1026239932      400000002241005 3172040 0.8811222222222223



select member_id, sum(duration), sum(duration)/3600000
from qyy_mid_online.user_term_learn_duration 
where day = '2017-12-21' and type = 'td' and tag = 'all_learn' and member_id=1026239932 group by member_id; 

1026239932      5.1901847E7     14.417179722222222



select member_id, day, online_learn_total_duration, online_learn_total_duration/3600000 
from qyy_output_online.s2_user_platform_learn_overview
where day >="2017-12-01" and day <= "2017-12-21"
and provider_id=400000000100001 and member_id in (1026239932)

member_id	day	online_learn_total_duration	_c3
1026239932	2017-12-01	6961208	1.9336688888888889
1026239932	2017-12-02	6961208	1.9336688888888889
1026239932	2017-12-03	6961208	1.9336688888888889
1026239932	2017-12-04	6961208	1.9336688888888889
1026239932	2017-12-05	6961208	1.9336688888888889
1026239932	2017-12-06	6961208	1.9336688888888889
1026239932	2017-12-07	6961208	1.9336688888888889
1026239932	2017-12-08	6961208	1.9336688888888889
1026239932	2017-12-09	6961208	1.9336688888888889
1026239932	2017-12-10	6961208	1.9336688888888889
1026239932	2017-12-11	6961208	1.9336688888888889
1026239932	2017-12-12	6961208	1.9336688888888889
1026239932	2017-12-13	6961208	1.9336688888888889
1026239932	2017-12-14	6961208	1.9336688888888889
1026239932	2017-12-15	6961208	1.9336688888888889
1026239932	2017-12-16	6961208	1.9336688888888889
1026239932	2017-12-17	6961208	1.9336688888888889
1026239932	2017-12-18	6961208	1.9336688888888889
1026239932	2017-12-19	17249552	4.791542222222223
1026239932	2017-12-20	36121940	10.033872222222222
1026239932	2017-12-21	51901847	14.417179722222222






**************************************



select member_id, day, term_id, term_unit_duration, term_unit_duration/3600000, 
online_learn_duration, online_learn_duration/3600000 
from qyy_output_online.s2_term_learn_progress_stat
where day = "2017-12-21"
and provider_id=400000000100001 and member_id in (1026239932)

member_id	day	term_id	term_unit_duration	_c4	online_learn_duration	_c6
1026239932	2017-12-21	400000000843117	7258010		2.016113888888889	7462545		2.0729291666666665
1026239932	2017-12-21	400000000853020	12950441	3.597344722222222	13126246	3.6461794444444444
1026239932	2017-12-21	400000000846033	9388700		2.607972222222222	9472931		2.6313697222222223
1026239932	2017-12-21	400000001638004	11642817	3.2341158333333335	11765850	3.268291666666667
1026239932	2017-12-21	400000000838088	1500189		0.41671916666666664	1500189		0.41671916666666664
1026239932	2017-12-21	400000002231005	3056787		0.8491075			3121135		0.8669819444444444
1026239932	2017-12-21	400000001637002	NULL		NULL				3769		0.0010469444444444445
1026239932	2017-12-21	400000002241005	3120221		0.8667280555555555	3172040		0.8811222222222223
1026239932	2017-12-21	400000000840062	NULL		NULL				11350		0.003152777777777778
1026239932	2017-12-21	400000000975001	739635		0.20545416666666666	888183		0.2467175
1026239932	2017-12-21	400000000969002	948302		0.26341722222222225	1372870		0.38135277777777776
1026239932	2017-12-21	400000000968006	NULL		NULL				2533		7.036111111111111E-4
1026239932	2017-12-21	400000000981001	NULL		NULL				2206		6.127777777777777E-4



select member_id, day, term_id, duration, duration/3600000
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-21"
and member_id = 1026239932 and type = 'td' and tag = 'all_learn';

member_id	day	term_id	duration	_c4
1026239932	2017-12-21	400000000838088	1500189	0.41671916666666664
1026239932	2017-12-21	400000000840062	11350	0.003152777777777778
1026239932	2017-12-21	400000000843117	7462545	2.0729291666666665
1026239932	2017-12-21	400000000846033	9472931	2.6313697222222223
1026239932	2017-12-21	400000000853020	13126246	3.6461794444444444
1026239932	2017-12-21	400000000968006	2533	7.036111111111111E-4
1026239932	2017-12-21	400000000969002	1372870	0.38135277777777776
1026239932	2017-12-21	400000000975001	888183	0.2467175
1026239932	2017-12-21	400000000981001	2206	6.127777777777777E-4
1026239932	2017-12-21	400000001637002	3769	0.0010469444444444445
1026239932	2017-12-21	400000001638004	11765850	3.268291666666667
1026239932	2017-12-21	400000002231005	3121135	0.8669819444444444
1026239932	2017-12-21	400000002241005	3172040	0.8811222222222223


select member_id, day, online_learn_total_duration, online_learn_total_duration/3600000 
from qyy_output_online.s2_user_platform_learn_overview
where day ="2017-12-21"
and provider_id=400000000100001 and member_id in (1026239932);

1026239932      2017-12-21      51901847        14.417179722222222



*********************


select member_id, day, term_id, term_unit_duration, term_unit_duration/3600000, 
online_learn_duration, online_learn_duration/3600000 
from qyy_output_online.s2_term_learn_progress_stat
where day = "2017-12-21"
and provider_id=400000000100001 and member_id in (1026243133)

member_id	day	term_id	term_unit_duration	_c4	online_learn_duration	_c6
1026243133	2017-12-21	400000002242003	20967	0.005824166666666667	28961	0.008044722222222222
1026243133	2017-12-21	400000002231006	2356694	0.6546372222222222		2376911	0.6602530555555556
1026243133	2017-12-21	400000000969002	3123	8.675E-4				17174	0.004770555555555556
1026243133	2017-12-21	400000000853020	860154	0.23893166666666665		879456	0.24429333333333333
1026243133	2017-12-21	400000000846033	9454041	2.6261225				9487617	2.6354491666666666
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889		NULL	NULL
1026243133	2017-12-21	400000000843117	180012	0.05000333333333333		180012	0.05000333333333333
1026243133	2017-12-21	400000001637002	15907063	4.418628611111111	2241	6.225E-4


select member_id, day, term_id, duration, duration/3600000
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-21"
and member_id = 1026243133 and type = 'td' and tag = 'all_learn';

member_id	day	term_id	duration	_c4
1026243133	2017-12-21	400000000843117	180012	0.05000333333333333
1026243133	2017-12-21	400000000846033	9487617	2.6354491666666666
1026243133	2017-12-21	400000000853020	879456	0.24429333333333333
1026243133	2017-12-21	400000000969002	17174	0.004770555555555556
1026243133	2017-12-21	400000001637002	2241	6.225E-4
1026243133	2017-12-21	400000002231006	2376911	0.6602530555555556
1026243133	2017-12-21	400000002242003	28961	0.008044722222222222



select member_id, day, online_learn_total_duration, online_learn_total_duration/3600000 
from qyy_output_online.s2_user_platform_learn_overview
where day ="2017-12-21"
and provider_id=400000000100001 and member_id in (1026243133);


1026243133      2017-12-21      12972372        3.6034366666666666



************************ 




select member_id, day, term_id, duration, duration/3600000, type, tag
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-21"
and member_id = 1026243133 and term_id=400000001638004;


member_id	day	term_id	duration	_c4	type	tag
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889	1d	unit_learn
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889	td	unit_learn



select user_id as uid, day, sum(cast((biz_dat['end_time']  - biz_dat['start_time']) as bigint)),active_name
from qyy_mid_online.user_behavior
where day = "2017-12-21" and  biz_dat['term_id'] is not null and user_id is not null 
and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004 group by user_id,day,active_name;

uid	day	_c2	active_name
1026243133	2017-12-21	8201723	lesson_unit_learn_end
1026243133	2017-12-21	NULL	lesson_unit_learn_start
1026243133	2017-12-21	NULL	user_learn_start




select uid, term_id, sum(cast((end_time - start_time) as bigint))
             from (
                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type = 'web' and active_name = 'user_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type = 'web' and active_name = 'lesson_unit_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and app_name is null and biz_dat['start_time'] != 0 
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type != 'web' and active_name in ('user_learn_record', 'user_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and biz_dat['start_time'] != 0 
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004
             ) t1
             where end_time > start_time group by term_id, uid






select member_id, day, term_id, term_unit_duration, term_unit_duration/3600000, 
online_learn_duration, online_learn_duration/3600000 
from qyy_output_online.s2_term_learn_progress_stat
where day = "2017-12-21"
and provider_id=400000000100001 and member_id in (1026243133) and term_id=400000001638004;

member_id	day	term_id	term_unit_duration	_c4	online_learn_duration	_c6
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889	NULL	NULL





select *
from qyy_mid_online.user_behavior
where day = '2017-12-21' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end')
  and biz_dat['term_id'] is not null and user_id is not null and app_name is null and biz_dat['start_time'] != 0 
  and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
  and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004;

null




一、term_learn_progress_stat


select member_id, day, term_id, term_unit_learn_time, term_unit_learn_time/3600000, 
online_learn_total_time, online_learn_total_time/3600000 
from qyy_mid_online.term_learn_progress_stat
where day = "2017-12-22"
and provider_id=400000000100001 and member_id in (1026243133);


member_id	day	term_id	term_unit_learn_time	_c4	online_learn_total_time	_c6
1026243133	2017-12-22	400000000843117	180012		0.05000333333333333		180012	0.05000333333333333
1026243133	2017-12-22	400000002242003	20967		0.005824166666666667	28961	0.008044722222222222
1026243133	2017-12-22	400000000969002	3123		8.675E-4				17174	0.004770555555555556
1026243133	2017-12-22	400000000853020	17898506	4.971807222222222		17994356	4.998432222222222
1026243133	2017-12-22	400000000846033	9454041		2.6261225				9487617	2.6354491666666666
1026243133	2017-12-22	400000001638004	17124748	4.756874444444445		8966457	2.4906825
1026243133	2017-12-22	400000002231006	2356694		0.6546372222222222		2376911	0.6602530555555556
1026243133	2017-12-22	400000000838090	NULL		NULL					NULL	NULL
1026243133	2017-12-22	400000001637002	15907063	4.418628611111111		8258	0.0022938888888888887
1026243133	2017-12-22	400000000840064	1418834		0.39412055555555553		NULL	NULL



hive 输出表：


select member_id, day, term_id, term_unit_duration, term_unit_duration/3600000, 
online_learn_duration, online_learn_duration/3600000 
from qyy_output_online.s2_term_learn_progress_stat
where day = "2017-12-22"
and provider_id=400000000100001 and member_id in (1026243133);


member_id	day	term_id	term_unit_duration	_c4	online_learn_duration	_c6
1026243133	2017-12-22	400000002242003	20967		0.005824166666666667	28961	0.008044722222222222
1026243133	2017-12-22	400000000846033	9454041		2.6261225				9487617	2.6354491666666666
1026243133	2017-12-22	400000001638004	17124748	4.756874444444445		8966457	2.4906825
1026243133	2017-12-22	400000000840064	1418834		0.39412055555555553		NULL	NULL
1026243133	2017-12-22	400000000969002	3123		8.675E-4				17174	0.004770555555555556
1026243133	2017-12-22	400000000838090	NULL		NULL					NULL	NULL
1026243133	2017-12-22	400000001637002	15907063	4.418628611111111		8258	0.0022938888888888887
1026243133	2017-12-22	400000002231006	2356694		0.6546372222222222		2376911	0.6602530555555556
1026243133	2017-12-22	400000000843117	180012		0.05000333333333333		180012	0.05000333333333333
1026243133	2017-12-22	400000000853020	17898506	4.971807222222222		17994356	4.998432222222222



output 表数据查看：

select member_id, provider_id, term_id, term_unit_duration, online_learn_duration
from s2_term_learn_progress_stat_master
where provider_id=400000000100001 and member_id in (1026243133)

1026243133	400000000100001	400000000838090		
1026243133	400000000100001	400000000840064	1418834	1418834 			不对
1026243133	400000000100001	400000000843117	180012	180012
1026243133	400000000100001	400000000846033	9454041	9487617
1026243133	400000000100001	400000000853020	17898506	17994356
1026243133	400000000100001	400000000969002	3123	17174
1026243133	400000000100001	400000001637002	15907063	15907063  		不对
1026243133	400000000100001	400000001638004	17124748	17124748 		不对
1026243133	400000000100001	400000002231006	2356694	2376911
1026243133	400000000100001	400000002242003	20967	28961


1026243133,400000000100001,400000001637002





select member_id, day, term_id, duration, duration/3600000, type, tag
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-21"
and member_id = 1026243133 
sort by member_id, day, term_id, type, tag;

member_id	day	term_id	duration	_c4	type	tag
1026243133	2017-12-21	400000000843117	180012	0.05000333333333333	td	all_learn
1026243133	2017-12-21	400000000843117	180012	0.05000333333333333	td	unit_learn
1026243133	2017-12-21	400000000846033	9487617	2.6354491666666666	1d	all_learn
1026243133	2017-12-21	400000000846033	9454041	2.6261225	1d	unit_learn
1026243133	2017-12-21	400000000846033	9487617	2.6354491666666666	td	all_learn
1026243133	2017-12-21	400000000846033	9454041	2.6261225	td	unit_learn
1026243133	2017-12-21	400000000853020	879456	0.24429333333333333	td	all_learn
1026243133	2017-12-21	400000000853020	860154	0.23893166666666665	td	unit_learn
1026243133	2017-12-21	400000000969002	17174	0.004770555555555556	1d	all_learn
1026243133	2017-12-21	400000000969002	3123	8.675E-4	1d	unit_learn
1026243133	2017-12-21	400000000969002	17174	0.004770555555555556	td	all_learn
1026243133	2017-12-21	400000000969002	3123	8.675E-4	td	unit_learn
1026243133	2017-12-21	400000001637002	2241	6.225E-4	1d	all_learn
1026243133	2017-12-21	400000001637002	15907063	4.418628611111111	1d	unit_learn
1026243133	2017-12-21	400000001637002	2241	6.225E-4	td	all_learn
1026243133	2017-12-21	400000001637002	15907063	4.418628611111111	td	unit_learn
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889	1d	unit_learn
1026243133	2017-12-21	400000001638004	8201723	2.278256388888889	td	unit_learn
1026243133	2017-12-21	400000002231006	2376911	0.6602530555555556	1d	all_learn
1026243133	2017-12-21	400000002231006	2356694	0.6546372222222222	1d	unit_learn
1026243133	2017-12-21	400000002231006	2376911	0.6602530555555556	td	all_learn
1026243133	2017-12-21	400000002231006	2356694	0.6546372222222222	td	unit_learn
1026243133	2017-12-21	400000002242003	28961	0.008044722222222222	1d	all_learn
1026243133	2017-12-21	400000002242003	20967	0.005824166666666667	1d	unit_learn
1026243133	2017-12-21	400000002242003	28961	0.008044722222222222	td	all_learn
1026243133	2017-12-21	400000002242003	20967	0.005824166666666667	td	unit_learn

400000001637002

select member_id, day, term_id, duration, duration/3600000, type, tag
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-22"
and member_id = 1026243133 
sort by member_id, day, term_id, type, tag;


member_id	day	term_id	duration	_c4	type	tag
1026243133	2017-12-22	400000000840064	1418834	0.39412055555555553	1d	unit_learn   【有问题】
1026243133	2017-12-22	400000000840064	1418834	0.39412055555555553	td	unit_learn
1026243133	2017-12-22	400000000843117	180012	0.05000333333333333	td	all_learn
1026243133	2017-12-22	400000000843117	180012	0.05000333333333333	td	unit_learn
1026243133	2017-12-22	400000000846033	9487617	2.6354491666666666	td	all_learn
1026243133	2017-12-22	400000000846033	9454041	2.6261225	td	unit_learn
1026243133	2017-12-22	400000000853020	17114900	4.754138888888889	1d	all_learn
1026243133	2017-12-22	400000000853020	17038352	4.732875555555555	1d	unit_learn
1026243133	2017-12-22	400000000853020	17994356	4.998432222222222	td	all_learn
1026243133	2017-12-22	400000000853020	17898506	4.971807222222222	td	unit_learn
1026243133	2017-12-22	400000000969002	17174	0.004770555555555556	td	all_learn
1026243133	2017-12-22	400000000969002	3123	8.675E-4	td	unit_learn
1026243133	2017-12-22	400000001637002	6017	0.001671388888888889	1d	all_learn
1026243133	2017-12-22	400000001637002	8258	0.0022938888888888887	td	all_learn
1026243133	2017-12-22	400000001637002	15907063	4.418628611111111	td	unit_learn
1026243133	2017-12-22	400000001638004	8966457	2.4906825	1d	all_learn
1026243133	2017-12-22	400000001638004	8923025	2.4786180555555557	1d	unit_learn
1026243133	2017-12-22	400000001638004	8966457	2.4906825	td	all_learn
1026243133	2017-12-22	400000001638004	17124748	4.756874444444445	td	unit_learn
1026243133	2017-12-22	400000002231006	2376911	0.6602530555555556	td	all_learn
1026243133	2017-12-22	400000002231006	2356694	0.6546372222222222	td	unit_learn
1026243133	2017-12-22	400000002242003	28961	0.008044722222222222	td	all_learn
1026243133	2017-12-22	400000002242003	20967	0.005824166666666667	td	unit_learn




select user_id as uid, day, sum(cast((biz_dat['end_time']  - biz_dat['start_time']) as bigint)),active_name
from qyy_mid_online.user_behavior
where day = "2017-12-22" and  biz_dat['term_id'] is not null and user_id is not null 
and user_id = 1026243133 and biz_dat['term_id'] = 400000000840064 group by user_id,day,active_name;

uid	day	_c2	active_name
1026243133	2017-12-22	1418834	lesson_unit_learn_end
1026243133	2017-12-22	NULL	lesson_unit_learn_start
1026243133	2017-12-22	NULL	user_learn_start








insert overwrite table ${mid}.user_term_learn_duration partition(day='$etlDay',type='td',tag='all_learn')
    select member_id,term_id,sum(cast(duration as bigint))
    from (
        select member_id,term_id,duration from ${mid}.user_term_learn_duration where day='${etlDay.yesterday}'
          and type = 'td' and tag = 'all_learn'
        
        union all

        select member_id, term_id, max(t1.duration, t2.duration) as duration
        from
	        (select member_id,term_id,duration from ${mid}.user_term_learn_duration where day='$etlDay' and type = '1d' and tag = 'all_learn') t1
	        join
	        (select member_id,term_id,duration from ${mid}.user_term_learn_duration where day='$etlDay' and type = '1d' and tag = 'unit_learn') t2

    ) t1 group by member_id, term_id








select member_id,term_id,sum(cast(duration as bigint))
    from (
        select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration where day='2017-12-20'
          and type = 'td' and tag = 'all_learn' and member_id=1026243133
        
        union all

        select if(q1.member_id is null, q2.member_id, q1.member_id) as member_id, 
        		if(q1.term_id is null, q2.term_id, q1.term_id) as term_id, 
        		if(cast(q1.duration as bigint) >= cast(q2.duration as bigint), q1.duration, q2.duration) as duration
        from 
	        (select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration where day='2017-12-21' and type = '1d' and tag = 'all_learn' and member_id=1026243133) q1
	        full outer join
	        (select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration where day='2017-12-21' and type = '1d' and tag = 'unit_learn' and member_id=1026243133) q2
	        on (q1.member_id = q2.member_id and q1.term_id = q2.term_id)
    ) t1 group by member_id, term_id

member_id	term_id	_c2
NULL	NULL	8201723
1026243133	400000000843117	180012
1026243133	400000000846033	18975234
1026243133	400000000853020	879456
1026243133	400000000969002	34348
1026243133	400000001637002	4482
1026243133	400000002231006	4753822
1026243133	400000002242003	57922







select if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
                if(t1.term_id is null, t2.term_id, t1.term_id) as term_id,
                if(cast(t1.duration as bigint) >= cast(t2.duration as bigint), t1.duration, t2.duration) as duration
         from
             (select uid as member_id, term_id, sum(cast((end_time - start_time) as bigint)) as duration
             from (
                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type = 'web' and active_name = 'user_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type = 'web' and active_name = 'lesson_unit_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and app_name is null and biz_dat['start_time'] != 0 
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '2017-12-21' and device_type != 'web' and active_name in ('user_learn_record', 'user_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and biz_dat['start_time'] != 0 
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
                      and user_id = 1026243133 and biz_dat['term_id'] = 400000001638004
             ) tt1
             where end_time > start_time group by term_id, uid ) t1

             full outer join

             (select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day='2017-12-21'
                    and type = '1d' and tag = 'unit_learn' and member_id = 1026243133 and term_id = 400000001638004) t2
             on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)



***************************************** 2017-12-25


UserTermLearnDuration

UserProjectLearnDuration 			(type='1d' and tag='all_learn')

OnlineLearnTotalTime 				(type = 'td' and tag='all_learn')		【kv，忽略，全量表，最后一天取正确的 全量即可】
TermUnitLearnTime 					(type = 'td' and tag='unit_learn')		【kv，忽略，全量表，最后一天取正确的 全量即可】

s2_user_platform_learn_overview     (type = 'td' and tag = 'all_learn') 	【忽略，全量表，最后一天取正确的 全量即可】

S2UserProjectLearnTimeDate 			(type='1d' and tag='all_learn')
S2UserProjectStatTotal				(type='td' and tag='all_learn') 		【忽略，全量表，最后一天取正确的 全量即可】

S2DepartmentLearnTermDate 			(type = '1d' and tag = 'all_learn')
S2GroupLearnTermDate 				(type = '1d' and tag = 'all_learn')
S2PositionLearnTermDate 			(type = '1d' and tag = 'all_learn')

S2UserLearnRecordStatTotal 			(type = 'td' and tag = 'all_learn') 	【忽略，全量表，最后一天取正确的 全量即可】

S2UserLearnTimeStatDate 			(type = '1d' and tag = 'all_learn')
S2UserLearnTotalDurationStat 		(type = 'td' and tag='all_learn')		【忽略，全量表，最后一天取正确的 全量即可】



总结：

UserTermLearnDuration

UserProjectLearnDuration

S2UserProjectLearnTimeDate

S2DepartmentLearnTermDate
S2GroupLearnTermDate
S2PositionLearnTermDate

S2UserLearnTimeStatDate


ForAppFix20171225


select distinct(user_id)
from qyy_mid_online.user_behavior
where day = "2017-12-19" and  biz_dat['term_id'] is not null and user_id is not null 
and biz_dat['provider_id'] = 400000000100001 and active_name = 'lesson_unit_learn_end';





insert overwrite table qyy_mid_online.user_term_learn_duration partition(day='2017-12-19',type='1d',tag='all_learn')
select if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
    if(t1.term_id is null, t2.term_id, t1.term_id) as term_id,
    if(cast(t1.duration as bigint) >= cast(t2.duration as bigint), t1.duration, t2.duration) as duration
from
	(select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration 
	where day='2017-12-19' and type = '1d' and tag = 'all_learn' 
	and member_id = 1026242199) t1
	
	full outer join

 	(select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day='2017-12-19'
        and type = '1d' and tag = 'unit_learn'
        and member_id = 1026242199) t2
 	on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)





(select uid as member_id, term_id, sum(cast((end_time - start_time) as bigint)) as duration
             from (
                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '$curEtlDay' and device_type = 'web' and active_name = 'user_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '$curEtlDay' and device_type = 'web' and active_name = 'lesson_unit_learn_record'
                      and biz_dat['term_id'] is not null and user_id is not null
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '$curEtlDay' and device_type != 'web' and active_name in ('lesson_unit_learn_record', 'lesson_unit_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and app_name is null and biz_dat['start_time'] != 0
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)

                 union all

                 select biz_dat['term_id'] as term_id,
                        user_id as uid,
                        biz_dat['start_time'] as start_time,
                        biz_dat['end_time'] as end_time
                 from qyy_mid_online.user_behavior
                 where day = '$curEtlDay' and device_type != 'web' and active_name in ('user_learn_record', 'user_learn_end')
                      and biz_dat['term_id'] is not null and user_id is not null and biz_dat['start_time'] != 0
                      and (cast((biz_dat['end_time'] - biz_dat['start_time']) as bigint) < 24*60*60*1000)
             ) tt1
             where end_time > start_time group by term_id, uid ) t1




******************************


select member_id, day, term_id, duration, duration/3600000, type, tag
from qyy_mid_online.user_term_learn_duration
where day ="2017-12-19"
sort by member_id, day, term_id, type, tag;


1020572786  400000002292016 		NULL



2、 实验

select if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
    if(t1.term_id is null, t2.term_id, t1.term_id) as term_id,
    if(cast(t1.duration as bigint) >= cast(t2.duration as bigint), t1.duration, t2.duration) as duration
from
	(select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration 
	where day='2017-12-19' and type = '1d' and tag = 'all_learn' 
	and member_id = 1020572786) t1
	
	full outer join

 	(select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day='2017-12-19'
        and type = '1d' and tag = 'unit_learn'
        and member_id = 1020572786) t2
 	on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)


member_id	term_id	duration
1020572786	400000000191081	1379050
1020572786	400000002292016	NULL


select if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
    if(t1.term_id is null, t2.term_id, t1.term_id) as term_id,
	t1.duration, t2.duration,
	cast(t1.duration as bigint),
	cast(t2.duration as bigint),
	cast(t1.duration as bigint) >= cast(t2.duration as bigint),
	if(cast(t1.duration as bigint) >= cast(t2.duration as bigint), 0, 1)
from
	(select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration 
	where day='2017-12-19' and type = '1d' and tag = 'all_learn' 
	and member_id = 1020572786) t1
	
	full outer join

 	(select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day='2017-12-19'
        and type = '1d' and tag = 'unit_learn'
        and member_id = 1020572786) t2
 	on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)

member_id	term_id	t1.duration	t2.duration	_c4	_c5	_c6	_c7
1020572786	400000000191081	1379050	1375409	1379050	1375409	true	0
1020572786	400000002292016	13850	NULL	13850	NULL	NULL	1

【结论】
数字不能直接 和 NULL 比大小，必须要判断 非NULL，在 非NULL情况下 比较发小；




修改：

insert overwrite table qyy_mid_online.user_term_learn_duration partition(day='2017-12-19',type='1d',tag='all_learn')

select if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
    if(t1.term_id is null, t2.term_id, t1.term_id) as term_id,
    if(if(cast(t1.duration as bigint) is null, 0, cast(t1.duration as bigint)) >= if(cast(t2.duration as bigint) is null, 0, cast(t2.duration as bigint)), 
    	t1.duration, t2.duration) as duration
from
	(select member_id,term_id,duration from qyy_mid_online.user_term_learn_duration 
	where day='2017-12-19' and type = '1d' and tag = 'all_learn' 
	and member_id = 1020572786) t1
	
	full outer join

 	(select member_id, term_id, duration from qyy_mid_online.user_term_learn_duration where day='2017-12-19'
        and type = '1d' and tag = 'unit_learn'
        and member_id = 1020572786) t2
 	on (t1.member_id = t2.member_id and t1.term_id = t2.term_id)




select member_id, day, term_id, duration, duration/3600000, type, tag
from qyy_mid_online.user_term_learn_duration
where day="2017-08-28" and member_id=1024791075 and term_id=400000001085001
sort by member_id, day, term_id, type, tag;




*********************************



S2UserProjectLearnTimeDate

S2DepartmentLearnTermDate
S2GroupLearnTermDate
S2PositionLearnTermDate

S2UserLearnTimeStatDate



s2_department_learn_duration_date

`department_id`,`date`,`online_learn_duration`


s2_group_learn_duration_dates

`group_id`,`date`,`online_learn_duration`


s2_position_learn_duration_date

`position_id`,`date`,`online_learn_duration`


s2_user_learn_time_stat_date

`date`, `member_id`, `provider_id`, `online_learn_duration`, `offline_learn_duration`

s2_user_project_learn_time_date

`member_id`, `provider_id`, `online_learn_duration`, `offline_learn_duration`, `date`



************************** 2018-01-10


一、执行脚本命令：
/usr/lib/jvm/java-6-openjdk-amd64/jre/bin/java -jar /home/appops/edu-bi-store/run_jar/userIncrementFix/edu-bi-store-1.0-snapshot-uberjar.jar UserDayIncrementDurationFix20180108 online 2017-08-28 2018-01-09 > ~/userIncrementFix.txt


做的更好：
1、应该 先跑1天 看看数据的；！！！




















