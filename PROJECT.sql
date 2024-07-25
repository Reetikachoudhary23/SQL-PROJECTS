-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
create database Astrology;
use Astrology;
create table info(name varchar(30), id int,city varchar(10),age int)
select * from info;
insert into info values("nitriti","1", "Doon", "28");

drop database inclas02;
use inclas02;
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------






# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.
use inclas02;
select distinct *from cricket_1;
select distinct* from cricket_2;
select count(*) as common_count
from cricket_1
where exists( select 1
from cricket_2
where cricket_1.player_id= cricket_2.player_id);
  select player, count(*)
  from cricket_1 a
  join cricket_2 b
  on player_id.a=player_id.b;
  
 
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select* from cricket_1 where runs> 50;
# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select* from cricket_1 where player_name like 'y%v';

select player_name from cricket_1 where player_name like 'y%v' ;
#Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 select * from cricket_1 where player_name not like '%t';
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
alter table cric_combined add column PC_ratio float;
update cric_combined set pc_ratio= popularity/charisma;
select*from cric_combined;
# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
select * from cric_combined order by pc_ratio desc limit 5;
# Q7 Write a MySQL query to find the player_ID and the name of the player that contains the character “D”

select player_name,player_id from cric_combined where player_name like '%d%';
# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
select player_id, pc_ratio from cric_combined where pc_ratio between 0.12 and 0.25;
-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
 select player_id, player_name from new_cricket where charisma is null;
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
 select coalesce( charisma,0) as charisma_imputed from new_cricket;
 ##or
 select ifnull(charisma,0)as charisma_imputed from new_cricket;
# Q11. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
 select player_id,substr(player_id,3)from new_cricket;
# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select player_id,player_name from new_cricket where charisma> 25;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
select floor(monthlyservicecharges), ceiling(totalamount) from churn1
where  paymentmethod ='electronic check';
# Q14. Rename the table churn1 to “Churn_Details”.
alter table churn1 rename to Churn_details;

# Q15. Write a query to create a display a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
select totalamount+ monthlyservicecharges as new_amount from churn_details;
# Q16. Rename column new_Amount to Amount.
 alter table churn_details
 add column new_amount int;
change column new_amount amount;
 select*from churn_details;
 
# Q17. Drop the column “Amount” from the table “Churn_Details”.
alter table churn_details
drop  column amount;
# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerID, Internet_Connection and gender 
from Churn_Details 
where internet_connection=1;

# Q19. Find the records where the tenure is 6x, where x is any number.
select tenure 
from churn_details
where tenure like '6_';

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
select player_name
from cric_combined
order by UPPER(Player_name);


SELECT Player_name
from cric_combined;
