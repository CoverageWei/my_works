#!/bin/bash
if [ $# -lt 1 ]; then
    echo "please input the correct param: /home/appops/edu-bi-store/copy_jar.sh run_env"
    exit
fi



sourceJarPath="/home/appops/edu-bi-store/target/edu-bi-store-1.0-snapshot-uberjar.jar"
targetJarPath="/home/appops/edu-bi-store/run_jar/test/"

if [ $1 == "test" ];then
        targetJarPath="/home/appops/edu-bi-store/run_jar/test/"
else
        targetJarPath="/home/appops/edu-bi-store/run_jar/online/"
fi

echo $sourceJarPath
echo $targetJarPath

cp $sourceJarPath $targetJarPath


http://blog.csdn.net/yf210yf/article/details/9106629


#!/bin/bash
if [ $# -lt 1 ]; then
    echo "please input the correct param: /home/appops/sql_scripts/hive_table_migration.sh 2017-05-10"
    exit
fi

# 拷贝当天数据
total_data_table=(s2_term_learn_progress_stat s2_user_learn_record_stat_total)
for table in ${total_data_table[*]}
do
	echo "##### 1、数据拷贝 [ ${table} - $1 ]"
	sourceTablePath="/user/study/ykt/online/s2_output/s2_provider_backend_stat/${table}/day=$1"
	echo ${sourceTablePath}
	destTablePath="/user/study/qyy/online/output/data_copy/${table}"
	echo ${destTablePath}
	hadoop fs -cp ${sourceTablePath} ${destTablePath}

	echo "##### 2、load表数据 [ ${table} - $1 ]"
	targetLoadPath="${destTablePath}/day=$1"
	echo ${targetLoadPath}
	hive -e "LOAD DATA INPATH ${targetLoadPath} OVERWRITE INTO TABLE qyy_output_online.s2_term_learn_progress_statPARTITION (day='$1');"
done




