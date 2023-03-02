create DATABASE world_population;   

create table population(County_Code int,County_Name varchar(30),Year int,Race_Code int,	Race_Name varchar(30),Gender varchar(30),Age int,Population int);

alter table population modify column Race_Name varchar(100);

alter table population rename column county_name to country_name;

load data infile
"E:/CA_DRU_proj_2010-2060.csv"
into table population
fields enclosed by '"' terminated by ','
lines terminated by '\n'
ignore 1 rows;

/* you may face this error: Error Code: 2013. Lost connection to MySQL server during query
--to solve this issue go to edit >> preferences >> SQL editor >> MySQL session and change 
connection read time out to 600 and connection time out to 60 */

select * from population
	