CREATE EXTERNAL TABLE `qyy_mid_online.department_date`(
  `id` string COMMENT '部门ID', 
  `name` string COMMENT '部门名称', 
  `parent_id` string COMMENT '父节点ID', 
  `parent_name` string COMMENT '父节点名称', 
  `id_path` array<string> COMMENT '从根部门到当前部门的ID路径', 
  `name_path` array<string> COMMENT '从根部门到当前部门的名称路径', 
  `provider_id` string COMMENT '发布者ID')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/department_date';




CREATE EXTERNAL TABLE `qyy_mid_online.department2`(
  `id` string COMMENT '部门ID', 
  `name` string COMMENT '部门名称', 
  `parent_id` string COMMENT '父节点ID', 
  `parent_name` string COMMENT '父节点名称', 
  `id_path` array<string> COMMENT '从根部门到当前部门的ID路径', 
  `name_path` array<string> COMMENT '从根部门到当前部门的名称路径', 
  `provider_id` string COMMENT '发布者ID')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/department2';



CREATE EXTERNAL TABLE `qyy_mid_online.department_member_date`(
  `provider_id` string COMMENT '机构ID', 
  `department_id` string COMMENT '部门ID', 
  `member_id` string COMMENT '用户ID', 
  `staff_id` string COMMENT '员工ID', 
  `id_num` string COMMENT '员工号', 
  `status` string COMMENT '激活状态')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/department_member_date';




CREATE EXTERNAL TABLE `qyy_mid_online.position_date`(
  `id` string COMMENT '职位ID', 
  `name` string COMMENT '职位名称', 
  `parent_id` string COMMENT '父节点ID', 
  `parent_name` string COMMENT '父节点名称', 
  `id_path` array<string> COMMENT '从根职位到当前职位的ID路径', 
  `name_path` array<string> COMMENT '从根职位到当前职位的名称路径', 
  `provider_id` string COMMENT '发布者ID')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/position_date';



CREATE EXTERNAL TABLE `qyy_mid_online.position2`(
  `id` string COMMENT '职位ID', 
  `name` string COMMENT '职位名称', 
  `parent_id` string COMMENT '父节点ID', 
  `parent_name` string COMMENT '父节点名称', 
  `id_path` array<string> COMMENT '从根职位到当前职位的ID路径', 
  `name_path` array<string> COMMENT '从根职位到当前职位的名称路径', 
  `provider_id` string COMMENT '发布者ID')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/position2';




CREATE EXTERNAL TABLE `qyy_mid_online.position_member_date`(
  `provider_id` string COMMENT '机构ID', 
  `position_id` string COMMENT '职位ID', 
  `member_id` string COMMENT '用户ID', 
  `staff_id` string COMMENT '员工ID', 
  `id_num` string COMMENT '员工号', 
  `status` string COMMENT '激活状态')
PARTITIONED BY (
  `day` string)
ROW FORMAT SERDE 
  'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat'
LOCATION
  'hdfs://hz-cluster3/user/study/qyy/online/middle/position_member_date';


