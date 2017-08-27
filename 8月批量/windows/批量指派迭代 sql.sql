
select count(distinct term_id) from s2_term_member_allow where status = 2 and term_id in (?)


select * from s2_term where provider_id = ? and publish_status = 2;





select count(distinct term_id)
from s2_term_member_allow, s2_term
where s2_term_member_allow.status = 2 and s2_term.provider_id = ? and s2_term_member_allow.term_id = s2_term.id;



select term_id
from (
	select term_id, max(gmt_create) as max_gmt_create
	from s2_term_member_allow, s2_term
	where s2_term_member_allow.status = 2 and s2_term.provider_id = ? and s2_term_member_allow.term_id = s2_term.id
	group by s2_term_member_allow.term_id
) order by max_gmt_create desc limit 20;



select term_id, max(gmt_create) as max_gmt_create
from s2_term_member_allow
where status = 2 and term_id in (?) group by term_id; 




********************************************* 通过
select t1.term_id, t1.max_gmt_create 
from
	(select term_id, max(gmt_create) as max_gmt_create from qyy_dbload_online.s2_term_member_allow where day="2017-08-25" and status = 2 group by term_id) t1
	inner join 
	(select id from qyy_dbload_online.s2_term where day="2017-08-25" and provider_id = 400000000011001) t2
	on (t1.term_id = t2.id)

400000000049018	1502439277366
400000000052044	1480411766703
400000000145001	1480605447753
400000000152001	1486274394423
400000000153001	1480406300175
400000000153003	1480406444293
400000000154003	1480422340887
400000000184107	1501838436794
400000000287001	1488169233414
400000001682002	1503644676732



select t1.term_id, t1.max_gmt_create 
from
	(select term_id, max(gmt_create) as max_gmt_create from qyy_dbload_online.s2_term_member_allow where day="2017-08-25" and status = 2 group by term_id) t1
	inner join 
	(select id from qyy_dbload_online.s2_term where day="2017-08-25" and provider_id = 400000000011001) t2
	on (t1.term_id = t2.id) order by t1.max_gmt_create desc limit 20

400000001682002	1503644676732
400000000049018	1502439277366
400000000184107	1501838436794
400000000287001	1488169233414
400000000152001	1486274394423
400000000145001	1480605447753
400000000154003	1480422340887
400000000052044	1480411766703
400000000153003	1480406444293
400000000153001	1480406300175

select term_id
from (
select t1.term_id, t1.max_gmt_create 
from
	(select term_id, max(gmt_create) as max_gmt_create from qyy_dbload_online.s2_term_member_allow where day="2017-08-25" and status = 2 group by term_id) t1
	inner join 
	(select id from qyy_dbload_online.s2_term where day="2017-08-25" and provider_id = 400000000011001) t2
	on (t1.term_id = t2.id) order by t1.max_gmt_create desc
  ) tt1 limit 20

400000001682002
400000000049018
400000000184107
400000000287001
400000000152001
400000000145001
400000000154003
400000000052044
400000000153003
400000000153001




********************************** 20170827 

Caused by: java.lang.RuntimeException: sql:
select term_id, max_gmt_create from (  
	select term_id, max(gmt_create) as max_gmt_create 
	from s2_term_member_allow, s2_term 
	where s2_term_member_allow.status = 2 and s2_term.provider_id = 400000000003003 and s2_term_member_allow.term_id = s2_term.id 
	group by s2_term_member_allow.term_id ) 
order by max_gmt_create desc limit 20,params:[]


Caused by: com.netease.backend.db.common.exceptions.DBSQLException: SQL: 
"select term_id, max_gmt_create from (  
select term_id, max(gmt_create) as max_gmt_create 
from s2_term_member_allow, s2_term 
where s2_term_member_allow.status = 2 and s2_term.provider_id = 400000000003003 and s2_term_member_allow.term_id = s2_term.id 
group by s2_term_member_allow.term_id ) 
order by max_gmt_create desc limit 20", 
Token '(' , Illegal identifier.



【修正】

select term_id, max(gmt_create) as max_gmt_create 
	from s2_term_member_allow, s2_term 
	where s2_term_member_allow.status = 2 and s2_term.provider_id = 400000000003003 and s2_term_member_allow.term_id = s2_term.id 
	group by s2_term_member_allow.term_id
	order by max_gmt_create desc limit 20




讲师：
400000002190110  400000001916003  400000002192061 
期次负责人：
400000000028001 

课程负责人：
400000001438001

