#!/bin/bash
if [ $# -lt 1 ]; then
    echo "please input the correct param: /home/appops/sql_scripts/hive_table_migration.sh table_name"
    exit
fi

echo "##### 1、数据拷贝 [ table= $1 ]"
table=$1
sourceTablePath="/user/study/ykt/online/s2_output/s2_provider_backend_stat/${table}/*"
echo ${sourceTablePath}
destTablePath="/user/study/qyy/online/output/${table}"
echo ${destTablePath}
#hadoop fs -cp ${sourceTablePath} ${destTablePath}

echo "##### 2、add partition [ table = ${table} ]"
MarDaysArray=(07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31)
echo "处理3月"
for day in ${MarDaysArray[*]}
do
  echo "alter table qyy_output_online.${table} add if not exists partition(day='2017-03-${day}') location '${destTablePath}/day=2017-03-${day}';"
  #hive -e "alter table qyy_output_online.${table} add if not exists partition(day='2017-03-${day}') location '${destTablePath}/day=2017-03-${day}';"
done

AprDaysArray=(01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
echo "处理4月"
for day in ${AprDaysArray[*]}
do
  echo "alter table qyy_output_online.${table} add if not exists partition(day='2017-04-${day}') location '${destTablePath}/day=2017-04-${day}';"
  #hive -e "alter table qyy_output_online.${table} add if not exists partition(day='2017-04-${day}') location '${destTablePath}/day=2017-04-${day}';"
done

MayDaysArray=(01 02 03 04 05 06 07 08 09 10 11)
echo "处理5月"
for day in ${MayDaysArray[*]}
do
  echo "alter table qyy_output_online.${table} add if not exists partition(day='2017-05-${day}') location '${destTablePath}/day=2017-05-${day}';"
  #hive -e "alter table qyy_output_online.${table} add if not exists partition(day='2017-05-${day}') location '${destTablePath}/day=2017-05-${day}';"
done












