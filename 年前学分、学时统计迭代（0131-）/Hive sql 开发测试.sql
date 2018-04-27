select member_id, term_id, mp['type'] as type, mp['value'] as value
from (
    select member_id, term_id, mp
    from (
        select t1.member_id , t1.target_id as term_id,
            array(
                map('type','credit', 'value', t3.credit ),
                map('type','credit_hours', 'value', t3.credit_hours ),
                map('type','obtain_time', 'value',t3.obtain_time),
                map('type','obtain_date_time', 'value', unix_timestamp(from_unixtime(cast(t3.obtain_time / 1000 as bigint), 'yyyy-MM-dd' ), 'yyyy-MM-dd' ) * 1000 )
            ) as arr
        from
            (select member_id, target_id, target_type from qyy_dbload_test.s2_aggregation_learn where day = '2018-02-06' and provider_id is not null) t1
            join
            (select id from qyy_dbload_test.s2_term where day = '2018-02-06' ) t2
            on t1.target_id = t2.id
            left join
            (select member_id, target_id, target_type, credit, credit_hours, obtain_time from qyy_dbload_test.s2_member_credit_detail where day = '2018-02-06' ) t3
            on (t1.member_id = t3.member_id and t1.target_id = t3.target_id and t1.target_type = t3.target_type)
    ) tt1 lateral view explode(arr) arr as mp
) ttt1
where mp['value'] is not null





select member_id, project_id, mp['type'] as type, mp['value'] as value
from (
  select member_id, project_id, mp
  from (
      select t1.member_id, t1.project_id as project_id,
          array(
              map('type','credit', 'value', t2.credit ),
              map('type','credit_hours', 'value', t2.credit_hours ),
              map('type','obtain_time', 'value',t2.obtain_time),
              map('type','obtain_date_time', 'value', unix_timestamp(from_unixtime(cast(t2.obtain_time / 1000 as bigint), 'yyyy-MM-dd' ), 'yyyy-MM-dd' ) * 1000 )
          ) as arr
      from
          ( select member_id, target_id as project_id, target_type
            from qyy_dbload_test.s2_aggregation_learn
            where day = '2018-02-06' and target_type = 2 and provider_id is not null) t1
          left join
          ( select member_id, target_id, target_type, credit, credit_hours, obtain_time
            from qyy_dbload_test.s2_member_credit_detail
            where day = '2018-02-06' ) t2
          on (t1.member_id = t2.member_id and t1.project_id = t2.target_id and t1.target_type = t2.target_type)
  ) tt1 lateral view explode(arr) arr as mp
) ttt1
where mp['value'] is not null












CREATE EXTERNAL TABLE `qyy_test.customer1`(
  `name1` string COMMENT '名字', 
  `date1` string COMMENT '时间', 
  `date_tag1` string COMMENT '时间天', 
  `type` string COMMENT '类型', 
  `member_id` string COMMENT '用户id', 
  `provider_id` string COMMENT '企业ID')
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/customer1';

name1   aaaa    1111    1   1111    2222
name2   bbbb    1111    1   2222    3333
name3   cccc    1111    2   3333    4444
name4   dddd    1111    2   4444    5555
name5   eeee    2222    1   5555    6666
name6   ffff    2222    2   6666    7777

CREATE EXTERNAL TABLE `qyy_test.customer2`(
  `name2` string COMMENT '名字', 
  `value2` string COMMENT '值2', 
  `date2` string COMMENT '时间', 
  `date_tag2` string COMMENT '时间天', 
  `type` string COMMENT '类型', 
  `member_id` string COMMENT '用户id', 
  `provider_id` string COMMENT '企业ID')
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/test/customer2';


name1.1 value1.1    1485878400100   1111    1   1111    2222
name1.2 value1.2    1486224000100   2222    1   1111    2222
name1.3 value1.3    1486310400100   3333    1   1111    2222
name2   value2  1485878400200   2222    1   2222    3333
name3   vaue3   1485878400300   3333    2   3333    4444


select if(t1.provider_id is null, t2.provider_id, t1.provider_id) as provider_id,
    if(t1.member_id is null, t2.member_id, t1.member_id) as member_id,
    if(t1.date_tag is null, t2.date_tag, t1.date_tag) as date_tag,
    t1.name,
    t2.name2,
    t2.value2
from
    (select provider_id, member_id, date_tag1 as date_tag, name from qyy_test.customer1 ) t1
    full outer join
    (select provider_id, member_id, date_tag2 as date_tag, name2, value2 from qyy_test.customer2 ) t2
    on (t1.provider_id = t2.provider_id and t1.member_id = t2.member_id and t1.date_tag = t2.date_tag);



2222    1111    1111    name1   name1.1 value1.1
2222    1111    2222    NULL    name1.2 value1.2
2222    1111    3333    NULL    name1.3 value1.3
3333    2222    1111    name2   NULL    NULL
3333    2222    2222    NULL    name2   value2
4444    3333    1111    name3   NULL    NULL
4444    3333    3333    NULL    name3   vaue3
5555    4444    1111    name4   NULL    NULL
6666    5555    2222    name5   NULL    NULL
7777    6666    2222    name6   NULL    NULL








select if(t3.department is null, q3.department, t3.department) as department,
    if(if(t3.date_tag is null, q3.date_tag, t3.date_tag) is null, unix_timestamp('2018-02-06','yyyy-MM-dd')*1000, if(t3.date_tag is null, q3.date_tag, t3.date_tag)),
    t4.staff_num,
    t3.assign_staff_count,
    t3.enroll_staff_count,
    t3.assign_staff_finished_count,
    t3.enroll_staff_finished_count,
    if(t3.provider is null, q3.provider, t3.provider) as provider,
    q3.assign_credit,
    q3.enroll_credit,
    q3.assign_credit_hours,
    q3.enroll_credit_hours
from
    (select t1.provider_id as provider, t1.department_id as department,
         t2.enroll_date_time as date_tag,
         sum(if(enroll_type = 1,1,0)) as assign_staff_count,
         sum(if(enroll_type = 2,1,0)) as enroll_staff_count,
         sum(if(enroll_type = 1 and term_learn_finish_status = 1,1,0)) as assign_staff_finished_count,
         sum(if(enroll_type = 2 and term_learn_finish_status = 1,1,0)) as enroll_staff_finished_count
    from
        (select provider_id, department_id, member_id, staff_id
         from qyy_mid_test.department_member
         where department_id is not null and provider_id is not null ) t1
        join
        (select provider_id, member_id, enroll_date_time, enroll_type, term_learn_finish_status
         from qyy_mid_test.term_learn_progress_stat
         where day = '2018-02-06' and target_type = '1') t2
        on t1.provider_id = t2.provider_id and t1.member_id = t2.member_id
    group by t1.provider_id, t1.department_id, t2.enroll_date_time
    ) t3

    full outer join

    (select q1.provider_id as provider, q1.department_id as department,
         q2.obtain_date_time as date_tag,
         sum(if(enroll_type = 1, credit, 0)) as assign_credit,
         sum(if(enroll_type = 2, credit, 0)) as enroll_credit,
         sum(if(enroll_type = 1, credit_hours, 0)) as assign_credit_hours,
         sum(if(enroll_type = 2, credit_hours, 0)) as enroll_credit_hours
    from
        (select provider_id, department_id, member_id
         from qyy_mid_test.department_member
         where department_id is not null and provider_id is not null ) q1
        join
        (select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
        from qyy_mid_test.term_learn_progress_stat where day = '2018-02-06' and target_type = '1') q2
        on q1.provider_id = q2.provider_id and q1.member_id = q2.member_id
    group by q1.provider_id, q1.department_id, q2.obtain_date_time
    ) q3
    on (t3.provider = q3.provider and t3.department = q3.department and t3.date_tag = q3.date_tag)

    right outer join

    (select provider_id, department_id, count(distinct staff_id) as staff_num
     from qyy_mid_test.department_member
     where department_id is not null and provider_id is not null
     group by provider_id, department_id
    ) t4
    on (t3.provider = t4.provider_id and t3.department = t4.department_id)









member_id=1017232410 and provider_id= 400000000003003 and obtain_time >=1513699200000 and obtain_time <=1513785600000



select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
from qyy_mid_test.term_learn_progress_stat where day = '2018-02-06' and target_type = '1'
and member_id =1017232410 and provider_id= 400000000003003 and ;





select provider_id, member_id, sum(credit), sum(credit_hours)
from qyy_mid_test.term_learn_progress_stat 
where day = '2018-02-06' and target_type = '1' and member_id =1017232410 and provider_id= 400000000003003 
and obtain_date_time=1513699200000
group by provider_id,member_id;

400000000003003 1017232410  2652.0  2860.0      26个期次


select sum(credit), sum(credit_hours) 
from qyy_dbload_test.s2_member_credit_detail 
where day="2018-02-06" and member_id=1017232410 and provider_id= 400000000003003 
and obtain_time >=1513699200000 and obtain_time <=1513785600000 and target_type = 1;

2856.0      3080.0          28 个期次


select * from qyy_mid_test.term_learn_progress_stat 
where day="2018-02-06" and member_id =1017232410 and provider_id= 400000000003003 and term_id=400000001747001;

null



select * from qyy_output_test.s2_department_learn_term_date 
where day="2018-02-10" and provider_id=400000000003003 and department_id=144001 and date_tag = 1513699200000 limit 20;





*************************************************  2018-02-08



select *
from
    (select t1.provider_id as provider, t1.department_id as department,
         t2.enroll_date_time as date_tag,
         sum(if(enroll_type = 1,1,0)) as assign_staff_count,
         sum(if(enroll_type = 2,1,0)) as enroll_staff_count,
         sum(if(enroll_type = 1 and term_learn_finish_status = 1,1,0)) as assign_staff_finished_count,
         sum(if(enroll_type = 2 and term_learn_finish_status = 1,1,0)) as enroll_staff_finished_count
    from
        (select provider_id, department_id, member_id, staff_id
         from qyy_mid_test.department_member
         where department_id is not null and provider_id is not null ) t1
        join
        (select provider_id, member_id, enroll_date_time, enroll_type, term_learn_finish_status
         from qyy_mid_test.term_learn_progress_stat
         where day = '2018-02-06' and target_type = '1') t2
        on t1.provider_id = t2.provider_id and t1.member_id = t2.member_id
    where t1.provider_id = 400000000003003 and t1.department_id = 144001
    group by t1.provider_id, t1.department_id, t2.enroll_date_time
    ) t3

    full outer join

    (select q1.provider_id as provider, q1.department_id as department,
         q2.obtain_date_time as date_tag,
         sum(if(enroll_type = 1, credit, 0)) as assign_credit,
         sum(if(enroll_type = 2, credit, 0)) as enroll_credit,
         sum(if(enroll_type = 1, credit_hours, 0)) as assign_credit_hours,
         sum(if(enroll_type = 2, credit_hours, 0)) as enroll_credit_hours
    from
        (select provider_id, department_id, member_id
         from qyy_mid_test.department_member
         where department_id is not null and provider_id is not null ) q1
        join
        (select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
        from qyy_mid_test.term_learn_progress_stat where day = '2018-02-06' and target_type = '1') q2
        on q1.provider_id = q2.provider_id and q1.member_id = q2.member_id
    where q1.provider_id = 400000000003003 and q1.department_id = 144001
    group by q1.provider_id, q1.department_id, q2.obtain_date_time
    ) q3
    on (t3.provider = q3.provider and t3.department = q3.department and t3.date_tag = q3.date_tag)




select t4.department_id,
    tt1.date_tag,
    t4.staff_num,
    tt1.assign_staff_count,
    tt1.enroll_staff_count,
    tt1.assign_staff_finished_count,
    tt1.enroll_staff_finished_count,
    t4.provider_id,
    tt1.assign_credit,
    tt1.enroll_credit,
    tt1.assign_credit_hours,
    tt1.enroll_credit_hours
from
    (select if(t3.department is null, q3.department, t3.department) as department,
          if(if(t3.date_tag is null, q3.date_tag, t3.date_tag) is null,
              unix_timestamp('2018-02-06','yyyy-MM-dd')*1000,
              if(t3.date_tag is null, q3.date_tag, t3.date_tag)) as date_tag,
          t3.assign_staff_count,
          t3.enroll_staff_count,
          t3.assign_staff_finished_count,
          t3.enroll_staff_finished_count,
          if(t3.provider is null, q3.provider, t3.provider) as provider,
          q3.assign_credit,
          q3.enroll_credit,
          q3.assign_credit_hours,
          q3.enroll_credit_hours
    from
      (select t1.provider_id as provider, t1.department_id as department,
           t2.enroll_date_time as date_tag,
           sum(if(enroll_type = 1,1,0)) as assign_staff_count,
           sum(if(enroll_type = 2,1,0)) as enroll_staff_count,
           sum(if(enroll_type = 1 and term_learn_finish_status = 1,1,0)) as assign_staff_finished_count,
           sum(if(enroll_type = 2 and term_learn_finish_status = 1,1,0)) as enroll_staff_finished_count
      from
          (select provider_id, department_id, member_id, staff_id
           from qyy_mid_test.department_member
           where department_id is not null and provider_id is not null ) t1
          join
          (select provider_id, member_id, enroll_date_time, enroll_type, term_learn_finish_status
           from qyy_mid_test.term_learn_progress_stat
           where day = '2018-02-06' and target_type = '1') t2
          on t1.provider_id = t2.provider_id and t1.member_id = t2.member_id
      where t1.provider_id = 400000000003003 and t1.department_id = 144001
      group by t1.provider_id, t1.department_id, t2.enroll_date_time
      ) t3

      full outer join

      (select q1.provider_id as provider, q1.department_id as department,
           q2.obtain_date_time as date_tag,
           sum(if(enroll_type = 1, credit, 0)) as assign_credit,
           sum(if(enroll_type = 2, credit, 0)) as enroll_credit,
           sum(if(enroll_type = 1, credit_hours, 0)) as assign_credit_hours,
           sum(if(enroll_type = 2, credit_hours, 0)) as enroll_credit_hours
      from
          (select provider_id, department_id, member_id
           from qyy_mid_test.department_member
           where department_id is not null and provider_id is not null ) q1
          join
          (select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
          from qyy_mid_test.term_learn_progress_stat where day = '2018-02-06' and target_type = '1') q2
          on q1.provider_id = q2.provider_id and q1.member_id = q2.member_id
      where q1.provider_id = 400000000003003 and q1.department_id = 144001
      group by q1.provider_id, q1.department_id, q2.obtain_date_time
      ) q3
      on (t3.provider = q3.provider and t3.department = q3.department and t3.date_tag = q3.date_tag)
    ) tt1
    right outer join

    (select provider_id, department_id, count(distinct staff_id) as staff_num
    from qyy_mid_test.department_member
    where department_id is not null and provider_id is not null
            and provider_id = 400000000003003 and department_id = 144001
    group by provider_id, department_id
    ) t4
    on (tt1.provider = t4.provider_id and tt1.department = t4.department_id)







**************************** 2018-02-26


select provider_id, department_id, member_id, staff_id
from qyy_mid_test.department_member
where department_id is not null and provider_id is not null and department_id=82006;

provider_id department_id   member_id   staff_id
400000000003003 82006   NULL    1690001


select if(t3.department is null, q3.department, t3.department) as department,
  if(if(t3.date_tag is null, q3.date_tag, t3.date_tag) is null,
      unix_timestamp('2018-02-26','yyyy-MM-dd')*1000,
      if(t3.date_tag is null, q3.date_tag, t3.date_tag)) as date_tag,
  t3.assign_staff_count,
  t3.enroll_staff_count,
  t3.assign_staff_finished_count,
  t3.enroll_staff_finished_count,
  if(t3.provider is null, q3.provider, t3.provider) as provider,
  q3.assign_credit,
  q3.enroll_credit,
  q3.assign_credit_hours,
  q3.enroll_credit_hours
from
  (
    select t1.provider_id as provider, t1.department_id as department,
       t2.enroll_date_time as date_tag,
       sum(if(enroll_type = 1,1,0)) as assign_staff_count,
       sum(if(enroll_type = 2,1,0)) as enroll_staff_count,
       sum(if(enroll_type = 1 and term_learn_finish_status = 1,1,0)) as assign_staff_finished_count,
       sum(if(enroll_type = 2 and term_learn_finish_status = 1,1,0)) as enroll_staff_finished_count
  from
      (select provider_id, department_id, member_id, staff_id
       from qyy_mid_test.department_member
       where department_id is not null and provider_id is not null ) t1
      join
      (select provider_id, member_id, enroll_date_time, enroll_type, term_learn_finish_status
       from qyy_mid_test.term_learn_progress_stat
       where day = '2018-02-26' and target_type = '1') t2
      on t1.provider_id = t2.provider_id and t1.member_id = t2.member_id
  group by t1.provider_id, t1.department_id, t2.enroll_date_time

NULL


select q1.provider_id as provider, q1.department_id as department,
   q2.obtain_date_time as date_tag,
   sum(if(enroll_type = 1, credit, 0)) as assign_credit,
   sum(if(enroll_type = 2, credit, 0)) as enroll_credit,
   sum(if(enroll_type = 1, credit_hours, 0)) as assign_credit_hours,
   sum(if(enroll_type = 2, credit_hours, 0)) as enroll_credit_hours
from
  (select provider_id, department_id, member_id
   from qyy_mid_test.department_member
   where department_id is not null and provider_id is not null and department_id=82006) q1
  join
  (select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
  from qyy_mid_test.term_learn_progress_stat where day = '2018-02-26' and target_type = '1') q2
  on q1.provider_id = q2.provider_id and q1.member_id = q2.member_id
group by q1.provider_id, q1.department_id, q2.obtain_date_time






select if(t3.department is null, q3.department, t3.department) as department,
                  if(if(t3.date_tag is null, q3.date_tag, t3.date_tag) is null,
                      unix_timestamp('2018-02-26','yyyy-MM-dd')*1000,
                      if(t3.date_tag is null, q3.date_tag, t3.date_tag)) as date_tag,
                  t3.assign_staff_count,
                  t3.enroll_staff_count,
                  t3.assign_staff_finished_count,
                  t3.enroll_staff_finished_count,
                  if(t3.provider is null, q3.provider, t3.provider) as provider,
                  q3.assign_credit,
                  q3.enroll_credit,
                  q3.assign_credit_hours,
                  q3.enroll_credit_hours
              from
                  (select t1.provider_id as provider, t1.department_id as department,
                       t2.enroll_date_time as date_tag,
                       sum(if(enroll_type = 1,1,0)) as assign_staff_count,
                       sum(if(enroll_type = 2,1,0)) as enroll_staff_count,
                       sum(if(enroll_type = 1 and term_learn_finish_status = 1,1,0)) as assign_staff_finished_count,
                       sum(if(enroll_type = 2 and term_learn_finish_status = 1,1,0)) as enroll_staff_finished_count
                  from
                      (select provider_id, department_id, member_id, staff_id
                       from qyy_mid_test.department_member
                       where department_id is not null and provider_id is not null ) t1
                      join
                      (select provider_id, member_id, enroll_date_time, enroll_type, term_learn_finish_status
                       from qyy_mid_test.term_learn_progress_stat
                       where day = '2018-02-26' and target_type = '1') t2
                      on t1.provider_id = t2.provider_id and t1.member_id = t2.member_id
                  group by t1.provider_id, t1.department_id, t2.enroll_date_time
                  ) t3

                  full outer join

                  (select q1.provider_id as provider, q1.department_id as department,
                       q2.obtain_date_time as date_tag,
                       sum(if(enroll_type = 1, credit, 0)) as assign_credit,
                       sum(if(enroll_type = 2, credit, 0)) as enroll_credit,
                       sum(if(enroll_type = 1, credit_hours, 0)) as assign_credit_hours,
                       sum(if(enroll_type = 2, credit_hours, 0)) as enroll_credit_hours
                  from
                      (select provider_id, department_id, member_id
                       from qyy_mid_test.department_member
                       where department_id is not null and provider_id is not null ) q1
                      join
                      (select provider_id, member_id, enroll_type, credit, credit_hours, obtain_date_time
                      from qyy_mid_test.term_learn_progress_stat where day = '2018-02-26' and target_type = '1') q2
                      on q1.provider_id = q2.provider_id and q1.member_id = q2.member_id
                  group by q1.provider_id, q1.department_id, q2.obtain_date_time
                  ) q3
                  on (t3.provider = q3.provider and t3.department = q3.department and t3.date_tag = q3.date_tag)









