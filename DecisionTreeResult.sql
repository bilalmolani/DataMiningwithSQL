CREATE DEFINER=`root`@`localhost` PROCEDURE `DecisionTreeResult`(IN U varchar(255), IN B varchar(255))
BEGIN
select round(user.average_stars) as user_avg_stars into @user_a_star from user where user_id=U;
select stars as bus_avg_stars into @bus_a_star from business where business_id=B;

select star as EXPECTED_RATING from temp where USER_AVG=@user_a_star and BUS_AVG=@bus_a_star;
END