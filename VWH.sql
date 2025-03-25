use role accountadmin;
use database aniket;
use schema mart;

CREATE or replace TABLE aniket.mart.employee (
dept_id int,
id int,
firstname varchar (20),
middlename varchar (20),
lastname varchar (20),
age int,
salary int, 
location varchar (20),
join_date varchar(30)
);

CREATE or replace WAREHOUSE git_vwh
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  MIN_CLUSTER_COUNT = 1
  MAX_CLUSTER_COUNT = 1
  SCALING_POLICY = 'STANDARD'
  COMMENT = 'Warehouse for data processing';
