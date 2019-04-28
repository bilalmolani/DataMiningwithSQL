CREATE DEFINER=`root`@`localhost` PROCEDURE `NaiveBayesResult`(IN U varchar(255), IN B varchar(255))
BEGIN
    select round(user.average_stars) as user_avg_stars into @user_a_star from user where user_id=U;
    select round(stars) as bus_avg_stars into @bus_a_star from business where business_id=B;
   	SET @P1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=0) as T1, (select count(1) as y from train_tbl) as T2);
    SET @P2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=0 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    
    SET @P3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=0 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
	
    
	SET @PA1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=1) as T1, (select count(1) as y from train_tbl) as T2);
    SET @PA2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=1 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    SET @PA3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=1 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
    
   SET @PB1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=2) as T1, (select count(1) as y from train_tbl) as T2);
    SET @PB2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=2 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    SET @PB3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=2 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
    SET @PC1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=3) as T1, (select count(1) as y from train_tbl) as T2);
    SET @PC2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=3 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    SET @PC3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=3 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
    SET @PD1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=4) as T1, (select count(1) as y from train_tbl) as T2);
    SET @PD2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=4 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    SET @PD3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=4 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
    SET @PE1 :=(select x/y from (select count(1) as x from train_tbl where user_stars=5) as T1, (select count(1) as y from train_tbl) as T2);
    SET @PE2 :=(select x/y from (select count(1) as x from train_tbl where user_stars=5 and business_id=@bus_a_star) as T1, (select count(1) as y from train_tbl where business_id=@bus_a_star)
    as T2);
    
    SET @PE3 :=(select x/y from (select count(1) as x from train_tbl where user_stars=5 and user_average_stars=@user_a_star) as T1, (select count(1) as y from train_tbl where user_average_stars=@user_a_star) as T2);
	
    
    
    SELECT ROUND(@P1*@P2*@P3,3) AS ZERO into @zero;
    SELECT ROUND(@PA1*@PA2*@PA3,3) AS ONE into @one;
    SELECT ROUND(@PB1*@PB2*@PB3,3) AS TWO into @two;
    SELECT ROUND(@PC1*@PC2*@PC3,3) AS THREE into @three;
    SELECT ROUND(@PD1*@PD2*@PD3,3) AS FOUR into @four;
    SELECT ROUND(@PE1*@PE2*@PE3,3) AS FIVE into @five;
     -- select  @one,@two, @three, @four,@five;
    drop table if exists MAXI;
    create table MAXI(
   val     float  not null
  ,stars      int not null
	);
    insert into MAXI(val,stars)
	values (@one,1),(@two,2),(@three,3),(@four,4),(@five,5);
    
    select max(val) as maximum into @a from MAXI;
    
    
    select stars from MAXI where val=@a;
    
END