
************************************ 20170901
背景： 运营同学发现 某个用户的 某一天学习时间 有点长，分别为 24小时 和 20小时，怀疑数据是否计算有误；


# 获取某个用户 某一天的全部日志数据
select user_id, biz_dat['term_id'], active_name , cast(biz_dat['end_time'] as bigint) - cast(biz_dat['start_time'] as bigint) as duration from qyy_mid_online.user_behavior where day="2017-08-27" and user_id = 1028144952;
【猛犸上 Hive执行作业 跑出所有数据，下载 Excel，查看是否 单挑日志时长有误，并 Excel自动求和时长】

# 获取某个用户 某一天的 日志数据，按类型聚合时长
select  active_name, sum(cast(biz_dat['end_time'] as bigint) - cast(biz_dat['start_time'] as bigint)) as duration from qyy_mid_online.user_behavior where day="2017-08-27" and user_id = 1028144952 group by active_name;






