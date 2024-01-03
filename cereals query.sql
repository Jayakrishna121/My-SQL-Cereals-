drop database if exists ceraeals;
use cereals;
select * from cereals_data;


##Add index name fast on name
 create index name on cereals_data (protein);


#2. Describe the schema of table

describe cereals_data;
#3. Create view name as see where users can not see type column [first run then create view]

select * from cereals_data;
create view see as (select name,mfr,calories,protein,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_data);
select * from see;


#4. Rename the view as saw
rename table see to saw;
#5. Count how many are cold cereals
 
 select type , count(type) from cereals_data  group by type having  type = 'C';
#6. Count how many cereals are kept in shelf 3
select * from (select shelf,count(shelf) as cereals_self  from cereals_data group by shelf) as t where t.shelf=3;
#7. Arrange the table from high to low according to ratings
select * from cereals_data order by ratings desc;
#8. Suggest some column/s which can be Primary key
 select * from cereals_data;
#9. Find average of calories of hot cereal and cold cereal in one query
select type , avg(calories) from cereals_data group by type ; 

#10. Add new column as HL_Calories where more than average calories shou HIGH and less than average calories should be categorized as LOW
alter table cereals_data add column HL_calories int;
alter table cereals_data modify column HL_calories varchar(10);
select round(avg(calories)) from cereals_data;
update cereals_data set HL_calories = case when calories >='107' then 'High' else 'Low' end;
select * from cereals_data;
#11. List only those cereals whose name begins with B

select * from cereals_data where name like'b%';
#12. List only those cereals whose name begins with F
select * from cereals_data where name like'f%';
#13. List only those cereals whose name ends with s
select * from cereals_data where name like'%s';
#14. Select only those records which are HIGH in column HL calories and n jeevan.raj@imarticus.com [save/name your file as your first name_cereal
select * from cereals_data where HL_calories = 'high';
#15. Find maximum of ratings
select max(rating) from cereals_data;
#16. Find average ratings of those were High and Low calories
select calories,avg(calories) average_ratings from cereals_data where average_ratings='high' and 'low';
#17. Craete two examples of Sub Queries of your choice and give explanatio itself with remarks by using #

#18. Remove column fat
alter table cereals_data drop column fat;
#19. Count records for each manufacturer [mfr]
select mfr, count(mfr) from cereals_data group by mfr ;
#20. Select name, calories and ratings only

select  name, calories, rating from cereals_data;