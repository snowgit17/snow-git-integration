CREATE or replace WAREHOUSE my_warehouse
  WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 300
  AUTO_RESUME = TRUE
  INITIALLY_SUSPENDED = TRUE
  MIN_CLUSTER_COUNT = 1
  MAX_CLUSTER_COUNT = 1
  SCALING_POLICY = 'STANDARD'
  COMMENT = 'Warehouse for data processing';

  alter warehouse compute_wh resume if suspended;

  create role adm_demo;

  create user sys_demo;

  desc warehouse my_warehouse;

  show warehouses;

  alter warehouse my_warehouse set warehouse_size = 'medium';

  show users;

  Create or replace storage integration ext_int
Type = external_stage
Enabled = true
Storage_provider = S3
storage_allowed_locations = ('s3://mysnowbucket1710/csv/')
storage_aws_role_arn = 'arn:aws:iam::634053346381:role/snowflake';


desc storage integration ext_int;
list @ext_int;

show stages;

create or replace stage demo_ext
url = 's3://mysnowbucket1710/csv/'
storage_integration = ext_int; 

desc stage demo_ext;











drop storage integration ext_int;


#######################################

grant usage on database aniket to role orgadmin;

grant usage on schema public to role orgadmin;

revoke usage on database aniket from role orgadmin;

grant usage on schema public to role orgadmin;

select * from login_history limit 1;


desc view login_history;


desc view access_history;

select * from access_history ;

desc view query_history;

select * from query_history where DATABASE_NAME = 'ANIKET';


desc SECURITY INTEGRATION OKTAINTEGRATION ;

select * from objects;

create or replace table check_demo (
name varchar,
lastname varchar
);

insert into check_demo values ('aniket', 'raut'), ('sachin','tendulkar');

select * from check_demo;



select * from snowflake.account_usage.access_history where query_id= '01b771df-3201-3e63-0009-efa600081292';

select * from snowflake.account_usage.access_history where user_name ='BIOGEN';





select * from SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY where database_name = 'ANIKET' ;


Insert into check_demo values ('virat','kohali');



create or replace role under_sysadm; 

grant role under_sysadm to role sysadmin;

grant usage on warehouse compute_wh to role under_sysadm;

grant modify on warehouse compute_wh to role under_sysadm;

grant operate on warehouse compute_wh to role under_sysadm;

show grants to role sysadmin;

grant role under_sysadm to user nitin;

use role sysadmin;

alter warehouse compute_wh resume if suspended ;

use role accountadmin;

grant usage on database aniket to role under_sysadm;

show grants to role under_sysadm;

grant create database on account to role under_sysadm;

grant create warehouse on account to role under_sysadm;

revoke create warehouse on account from role under_sysadm;

grant create warehouse on account to role sysadmin;


Show stages;

create or replace stage Demo_Test;

list@Demo_Test;

use role accountadmin;
show schemas;


grant usage on schema public to role rolex_ov;

revoke usage on schema public from role rolex_ov;

grant all privileges on table public.check_demo to role rolex_ov;

grant create table on schema public to role rolex_ov;

grant usage on schema public to role rolex_ov;

grant all privileges on all tables in schema public to role rolex_ov;


show grants to user biogen;

create or replace schema aniket.check_schema;

grant all privileges on database aniket to role rolex_ov;

grant all privileges on all schemas in database aniket to role rolex_ov;

revoke all privileges on all schemas in database aniket from role rolex_ov;

grant ownership on schema aniket.check_schema to role rolex_ov;



create or replace table aniket.check_schema.check_demo (
name varchar,
lastname varchar
);

insert into check_demo values ('aniket', 'raut'), ('sachin','tendulkar');

select * from check_demo;

grant create table on schema aniket.aniket2 to role rolex_ov;

alter warehouse compute_wh resume if suspended;

alter warehouse compute_wh suspend;

create or replace database BI_Analytics;
create or replace schema analytics;

show stages;
list @demo_test;

show tables;

desc table demo_2;

select get_ddl('table','demo_2');









show grants to role public;




show accounts;


########################################


desc view snowflake.account_usage.users;


create or replace role abhi_OV;
grant usage on database snowflake to role abhi_OV;


select * from snowflake.account_usage.users;

show grants to role abhi_ov;

USE ROLE ACCOUNTADMIN;

GRANT IMPORTED PRIVILEGES ON database snowflake TO role abhi_OV;

GRANT IMPORTED PRIVILEGES ON schema snowflake.account_usage TO role abhi_OV;

Alter schema snowflake.account_usage set IMPORTED PRIVILEGES = True;

create or replace role rolex_ov;

GRANT IMPORTED PRIVILEGES ON database snowflake TO role rolex_ov;

REVOKE IMPORTED PRIVILEGES ON database snowflake  FROM role rolex_ov;

grant role rolex_ov to user rolex;

show tables ;

select * from check_demo;

create stream str_tbl on table check_demo;
desc stream str_tbl;

select * from  str_tbl;




------ CREATING SESSION POLICY --------


CREATE SESSION POLICY session_policy_prod_1
  SESSION_IDLE_TIMEOUT_MINS = 5
  --SESSION_UI_IDLE_TIMEOUT_MINS = 5
  COMMENT = 'session policy for use in the prod_1 environment';

Alter account set session policy session_policy_prod_1;

ALTER ACCOUNT UNSET SESSION POLICY;


show SESSION POLICIES;

desc SESSION POLICy session_policy_prod_1;

drop SESSION POLICY session_policy_prod_1;


show users;

drop user undertaker;

ALTER USER nitin SET SESSION POLICY session_policy_prod_1;

ALTER USER nitin UNSET SESSION POLICY ;


select * from SNOWFLAKE.ACCOUNT_USAGE.login_history;


##########################################



show security integrations;

desc security integration OKTAINTEGRATION ;

CREATE OR REPLACE PROCEDURE output_message(message VARCHAR)
RETURNS VARCHAR NOT NULL
LANGUAGE SQL
AS
$$
BEGIN
  RETURN message;
END;
$$
;



-- calling stored procedure
CALL output_message('Hello World, Welcome to the sky universe');

desc procedure output_message(VARCHAR);

show procedures like 'RETURN%' ;


grant role rolex_ov to user nitin;

grant usage on database aniket to role rolex_ov;

grant usage on schema public to role rolex_ov;

grant select on all tables in schema public to role rolex_ov;

grant usage on warehouse compute_wh to role rolex_ov;

grant usage on procedure output_message(VARCHAR) to role rolex_ov;



CREATE OR REPLACE PROCEDURE return_greater(num_1 INTEGER, num_2 INTEGER)
RETURNS INTEGER NOT NULL
LANGUAGE SQL
AS
$$
BEGIN
  IF (num_1 > num_2) THEN
    RETURN num_1;
  ELSE
    RETURN num_2;
  END IF;
END;
$$
;

-- calling 

CALL return_greater(10, 3);

desc procedure RETURN_GREATER(INT,INT);

grant usage on procedure RETURN_GREATER(INT,INT) to role rolex_ov;

CREATE PROCEDURE TEST_PROC (a timestamp_ntz(3))
RETURNS timestamp_ntz(3)
AS
$$
BEGIN
    RETURN A;
END;

$$;

call  TEST_PROC(123);

desc procedure test_proc(timestamp_ntz(3));

SHOW GRANTS TO ROLE ROLEX_OV;

SHOW GRANTS TO USER NITIN;


##################################


use role orgadmin;

use database aniket;

SHOW ACCOUNTS;



show users;
---Run this command from your primary account which has orgadmin role ***----
ALTER ACCOUNT BI_DMART_NEW SET IS_ORG_ADMIN = TRUE;


grant usage on warehouse compute_wh to role orgadmin;

grant operate on warehouse compute_wh to role orgadmin;

grant modify on warehouse compute_wh to role orgadmin;

alter warehouse compute_wh resume;

show databases;

Create account BI_Dmart_new
admin_name = admin
Admin_password = 'Baburao@171088'
First_name = Aniket
last_name = Raut
Email = 'aniketgoly1710@gmail.com'
Edition = enterprise
Region = AWS_EU_CENTRAL_1;



Create account maxwell
admin_name = admin1
Admin_password = 'Baburao@171088'
First_name = Aniket
last_name = Raut
Email = 'aniketgolu1710@gmail.com'
Edition =standard
Region = AWS_EU_CENTRAL_1;


Create account testing_demo
admin_name = admin
Admin_password = 'Baburao@171088'
First_name = Aniket
last_name = Raut
Email = 'aniketgoly1710@gmail.com'
Edition = enterprise
Region = AWS_EU_CENTRAL_1;

Show accounts;


alter warehouse COMPUTE_WH resume;

USE SECONDARY ROLES ALL;

USE SECONDARY ROLES NONE;



GRANT ROLE orgadmin TO USER ADMIN1;


---Run this command from your primary account which has orgadmin role ***----
ALTER ACCOUNT BI_DMART_NEW SET IS_ORG_ADMIN = TRUE;

---- Now from newly created acoount run below command with org_name.account_name----
ALTER ACCOUNT tynfujl.maxwell SET IS_ORG_ADMIN = TRUE;

show grants to role sysadmin;



select current_version();




select * from snowflake.account_usage.query_history where database_name = 'ANIKET' and user_name = 'BIOGEN' ;


select * from snowflake.account_usage.login_history;


###############################



create or replace database aniket;
use database aniket;
use schema public;

show parameters like 'SAML_IDENTITY_PROVIDER';
------ Sub-Domain (copy link from account name bottom) ------
https://zt15488.ap-southeast-1.snowflakecomputing.com 
TYNFUJL.VG36281

alter account set saml_identity_provider = '{
"certificate": "MIIDqDCCApCgAwIBAgIGAZGAYNUsMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJVUzETMBEG A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU MBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEcMBoGCSqGSIb3DQEJ ARYNaW5mb0Bva3RhLmNvbTAeFw0yNDA4MjMxNzU0MTVaFw0zNDA4MjMxNzU1MTVaMIGUMQswCQYD VQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsG A1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEc MBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC ggEBALQQbb7U0q568YRlVSD+3nDani8fa9aEQG0ciATJt0x86v8BnIVxIaqKhQQOyBlgQkGIlo1B 9oXCGYR6Wuu7+7+RLPco7kmYc/W/tNbTYvo+gHzHg8b65O0DGC30CcXNPrOJ7P/NOVp4AknCSkcZ b/kwl5piQ64/AnrCetiJBZMtkFGzYy3XAZFBwAnbKhGmek61GKtqh6/g9w6KZqV/GUsk/NsP/++d VDoW8VUAmWl5YZx/ZUagMpPFCNZ+ZQHkKFsGgpdJlvRFTFIZR+2HcSz+C1bmADuVtxGn80hM2nJs 3EEkCDWLCxW6agt7eXZ9JFrLgwMDLzoPehv8bzx/xa8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEA mEahNijSfgNiQluICQ/fyqI6ou9V8rUCVQpdNw18o/FuFtEFgoVXxNeLlIX/i2xOzoRiDuh2ZypA QeVnI+hziSx4osYPoaxMlOIc5OKQaMS3lsH+8TknX4VbNYyAxnYfZEtpRjnx0yC1xrys+bpyPpSC rEiXhbeFOLni5AG00ZJUY0+rn3TMqAYEV73f+sO3MUFHwoOhJ1GfCCXtdzQRlXWgmGwUo1AWPJYs 7D+WDHlEICHPTLSRA5nj6smhSAg1c4s0+V4hE2iWc7OYRxQm1P/AuxmNQy/0knbcNhiyHsbaM8Nl PVpVywS/u79tgTcc723ssrdI0B49bdc8LnwQNQ==",
"issuer": "http://www.okta.com/exkj6y2cf0NW0lsHd5d7",
"ssourl": "https://dev-20248129.okta.com/app/snowflake/exkj6y2cf0NW0lsHd5d7/sso/saml",
"type": "OKTA",
"label": "OKTASingleSignOn"
}';

ALTER ACCOUNT SET saml_identity_provider = '{
  "certificate": "MIIDqDCCApCgAwIBAgIGAZGAYNUsMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJVUzETMBEG A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU MBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEcMBoGCSqGSIb3DQEJ ARYNaW5mb0Bva3RhLmNvbTAeFw0yNDA4MjMxNzU0MTVaFw0zNDA4MjMxNzU1MTVaMIGUMQswCQYD VQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsG A1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEc MBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC ggEBALQQbb7U0q568YRlVSD+3nDani8fa9aEQG0ciATJt0x86v8BnIVxIaqKhQQOyBlgQkGIlo1B 9oXCGYR6Wuu7+7+RLPco7kmYc/W/tNbTYvo+gHzHg8b65O0DGC30CcXNPrOJ7P/NOVp4AknCSkcZ b/kwl5piQ64/AnrCetiJBZMtkFGzYy3XAZFBwAnbKhGmek61GKtqh6/g9w6KZqV/GUsk/NsP/++d VDoW8VUAmWl5YZx/ZUagMpPFCNZ+ZQHkKFsGgpdJlvRFTFIZR+2HcSz+C1bmADuVtxGn80hM2nJs 3EEkCDWLCxW6agt7eXZ9JFrLgwMDLzoPehv8bzx/xa8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEA mEahNijSfgNiQluICQ/fyqI6ou9V8rUCVQpdNw18o/FuFtEFgoVXxNeLlIX/i2xOzoRiDuh2ZypA QeVnI+hziSx4osYPoaxMlOIc5OKQaMS3lsH+8TknX4VbNYyAxnYfZEtpRjnx0yC1xrys+bpyPpSC rEiXhbeFOLni5AG00ZJUY0+rn3TMqAYEV73f+sO3MUFHwoOhJ1GfCCXtdzQRlXWgmGwUo1AWPJYs 7D+WDHlEICHPTLSRA5nj6smhSAg1c4s0+V4hE2iWc7OYRxQm1P/AuxmNQy/0knbcNhiyHsbaM8Nl PVpVywS/u79tgTcc723ssrdI0B49bdc8LnwQNQ==",
  "issuer": "http://www.okta.com/exkj6y2cf0NW0lsHd5d7",
  "ssourl": "https://dev-20248129.okta.com/app/snowflake/exkj6y2cf0NW0lsHd5d7/sso/saml",
  "type": "OKTA",
  "label": "OKTASingleSignOn"
}';

CREATE SECURITY INTEGRATION okta_saml_integration
TYPE = saml2
ENABLED = TRUE
SAML2_ISSUER = 'http://www.okta.com/exkj6y2cf0NW0lsHd5d7'
SAML2_SSO_URL = 'https://dev-20248129.okta.com/app/snowflake/exkj6y2cf0NW0lsHd5d7/sso/saml'
SAML2_PROVIDER = 'OKTA'
SAML2_X509_CERT = 'MIIDqDCCApCgAwIBAgIGAZGAYNUsMA0GCSqGSIb3DQEBCwUAMIGUMQswCQYDVQQGEwJVUzETMBEG A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU MBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEcMBoGCSqGSIb3DQEJ ARYNaW5mb0Bva3RhLmNvbTAeFw0yNDA4MjMxNzU0MTVaFw0zNDA4MjMxNzU1MTVaMIGUMQswCQYD VQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsG A1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFTATBgNVBAMMDGRldi0yMDI0ODEyOTEc MBoGCSqGSIb3DQEJARYNaW5mb0Bva3RhLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC ggEBALQQbb7U0q568YRlVSD+3nDani8fa9aEQG0ciATJt0x86v8BnIVxIaqKhQQOyBlgQkGIlo1B 9oXCGYR6Wuu7+7+RLPco7kmYc/W/tNbTYvo+gHzHg8b65O0DGC30CcXNPrOJ7P/NOVp4AknCSkcZ b/kwl5piQ64/AnrCetiJBZMtkFGzYy3XAZFBwAnbKhGmek61GKtqh6/g9w6KZqV/GUsk/NsP/++d VDoW8VUAmWl5YZx/ZUagMpPFCNZ+ZQHkKFsGgpdJlvRFTFIZR+2HcSz+C1bmADuVtxGn80hM2nJs 3EEkCDWLCxW6agt7eXZ9JFrLgwMDLzoPehv8bzx/xa8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEA mEahNijSfgNiQluICQ/fyqI6ou9V8rUCVQpdNw18o/FuFtEFgoVXxNeLlIX/i2xOzoRiDuh2ZypA QeVnI+hziSx4osYPoaxMlOIc5OKQaMS3lsH+8TknX4VbNYyAxnYfZEtpRjnx0yC1xrys+bpyPpSC rEiXhbeFOLni5AG00ZJUY0+rn3TMqAYEV73f+sO3MUFHwoOhJ1GfCCXtdzQRlXWgmGwUo1AWPJYs 7D+WDHlEICHPTLSRA5nj6smhSAg1c4s0+V4hE2iWc7OYRxQm1P/AuxmNQy/0knbcNhiyHsbaM8Nl PVpVywS/u79tgTcc723ssrdI0B49bdc8LnwQNQ=='
SAML2_SP_INITIATED_LOGIN_PAGE_LABEL = 'OKTA SSO'
SAML2_ENABLE_SP_INITIATED = TRUE;

show SECURITY INTEGRATIONS;

drop SECURITY INTEGRATION okta_saml_integration;

ALTER SECURITY INTEGRATION okta_saml_integration 
SET saml2_snowflake_acs_url = 'https://zt15488.ap-southeast-1.snowflakecomputing.com/fed/login';

ALTER SECURITY INTEGRATION okta_saml_integration 
SET saml2_snowflake_issuer_url = 'https://zt15488.ap-southeast-1.snowflakecomputing.com';


--https://zt15488.ap-southeast-1.snowflakecomputing.com
--TYNFUJL.VG36281

SHOW USERS;



ALTER USER BIOGEN SET LOGIN_NAME='snowflakestudy24@gmail.com';
ALTER USER BIOGEN SET LOGIN_NAME='BIOGEN';

ALTER ACCOUNT SET SSO_LOGIN_Page = TRUE;

https://dev-20248129.okta.com/app/snowflake/exkj7uuvbl90F413e5d7/sso/saml

http://www.okta.com/exkj7uuvbl90F413e5d7

http://www.okta.com/exkj7wa2bsdCnUo9u5d7

use role accountadmin;
alter security integration OKTAINTEGRATION 
set saml2_sso_url = 'https://dev-20248129.okta.com/app/snowflake/exkj7utf6nrffEWmT5d7/sso/saml';

drop SECURITY INTEGRATION OKTAINTEGRATION;

show SECURITY INTEGRATIONS;

CREATE or replace SECURITY INTEGRATION OKTAINTEGRATION
    TYPE = SAML2
    ENABLED = TRUE 
    SAML2_ISSUER = 'http://www.okta.com/exki5q50gtbo5rwM5697'
    SAML2_SSO_URL = 'https://trial-9032350.okta.com/app/snowflake/exki5q50gtbo5rwM5697/sso/saml'
    SAML2_PROVIDER = OKTA
    SAML2_X509_CERT = 'MIIDqjCCApKgAwIBAgIGAZGNqvbDMA0GCSqGSIb3DQEBCwUAMIGVMQswCQYDVQQGEwJVUzETMBEGA1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEUMBIGA1UECwwLU1NPUHJvdmlkZXIxFjAUBgNVBAMMDXRyaWFsLTkwMzIzNTAxHDAaBgkqhkiG9w0BCQEWDWluZm9Ab2t0YS5jb20wHhcNMjQwODI2MDc1MDE3WhcNMzQwODI2MDc1MTE3WjCBlTELMAkGA1UEBhMCVVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNVBAoMBE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRYwFAYDVQQDDA10cmlhbC05MDMyMzUwMRwwGgYJKoZIhvcNAQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq1QnQcpF3kcn3zCweWX7oTRTVlyClxHJc82+o+BVl6XudTgD3Rsp3ApEvb2ZjgUF7wWHuSAWrdBnAronzfxumndCzjEpNqV6UcUjlzXuoMiVSF0uliE51ixGa8O4kHKHs3xFydfmSclgFlZuCpdlstUWTtWGxgKHEM8RLZ0wyqaMkfMuTsxJpO2Pf8N16QrjXMDrI+2Wu+URgDTJUEmKH3UtJbc/KvT/UZY2wRNyk2cYySiqOGctwwlSFuN+IJO1vYp1NVLngFmv00PERQQLse+o7pM4got9VZwqrFbzcpBc35dbgm+JLfokPF86C/2I8kWF57p9Ngl8v6TiMO6SWQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAMwkIBFF10gchL4381Ja88rb9YMgTvya8xyOHY194V6Vx9J9eWOd79wSDNODXqew0xnseAuo3nwThWTk88NhNLTwj9nm4FeavDQLeOdE7AdMI8D4FKUIBjldXpYLmnx+90E6vt5ioEhe25OLbr/jTk3ttLh301LpzaRIZX8/mXfTpznK4xdnV2FiqdVm+yCKMUwb3ydAPAFvtHoqz7CAzOweKNIaC91psRx3QcLUrfCca9Rndg2n3/QME5R/ALLa/dFa1AGiR+GSYtXQcEpeEVYeeS8xSOCfB77XU7/jqM0ZqpDbqBS8OwbucuXiNsVGSJ/cmf2LEjN82XZWAQLbt7'
    SAML2_SP_INITIATED_LOGIN_PAGE_LABEL = 'OKTA SSO'
    SAML2_ENABLE_SP_INITIATED = TRUE;


show SECURITY INTEGRATIONS;



use role accountadmin;

alter security integration OKTAINTEGRATION 
set saml2_snowflake_acs_url = 'https://tynfujl-vg36281.snowflakecomputing.com/fed/login';

alter security integration OKTAINTEGRATION 
set saml2_snowflake_issuer_url ='https://tynfujl-vg36281.snowflakecomputing.com';

show users;


ALTER USER BIOGEN SET LOGIN_NAME='aniket.raut@bahwancybertek.com';

ALTER USER BIOGEN SET LOGIN_NAME= 'snowflakestudy24@gmail.com';

ALTER USER BIOGEN SET LOGIN_NAME= 'aniketraut0722@gmail.com';



ALTER USER BIOGEN UNSET LOGIN_NAME;

ALTER USER BIOGEN SET LOGIN_NAME='BIOGEN';


show SECURITY INTEGRATIONS;

desc SECURITY INTEGRATION OKTAINTEGRATION ;
desc security integration oktaintegration;

SHOW PARAMETERS LIKE '%SAML%';
        
select * from SNOWFLAKE.ACCOUNT_USAGE.LOGIN_HISTORY;

SHOW ORGANIZATION ACCOUNTS;

select * from SNOWFLAKE.ACCOUNT_USAGE.ACCESS_HISTORY;

use role orgadmin;

ALTER ACCOUNT BI_DMART_NEW SET IS_ORG_ADMIN = TRUE;

SHOW  ACCOUNTS;



show users;


XvEJL44c

CREATE USER Undertaker
  PASSWORD = 'Zxcvbnm@1234$'
  MUST_CHANGE_PASSWORD = FALSE
  COMMENT = 'Description of the user';

  alter user undertaker set email = 'aniket3606@gmail.com';

  alter user undertaker unset email;


ALTER USER Undertaker SET LOGIN_NAME= 'aniket3606@gmail.com';

CREATE or replace USER SambhajiRaje
  PASSWORD = 'Sambhaji@123'
  MUST_CHANGE_PASSWORD = FALSE
  COMMENT = 'Description of the user';

show users;

alter user SambhajiRaje set email = 'Sambhaji.bhise333@gmail.com';

alter user SambhajiRaje set LOGIN_NAME= 'Sambhaji.bhise333@gmail.com';

CREATE or replace USER nitin
  PASSWORD = 'Nitin@123'
  MUST_CHANGE_PASSWORD = FALSE
  COMMENT = 'Description of the user';

drop user sam;

show users;


ALTER USER BIOGEN SET USER_NAME = 'Lenovo';
