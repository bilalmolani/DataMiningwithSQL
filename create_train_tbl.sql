CREATE DEFINER=`root`@`localhost` PROCEDURE `create_train_tbl`(in dt1 date, in dt2 date)
BEGIN
drop table if exists train_tbl;
#create view user_rev_bus as

create table train_tbl as(
select T1.user_id, T1.name,user_average_stars,T1.business_id, business.name as business_name, user_stars, business.stars as business_stars from (select user.user_id, user.name, round(user.average_stars)as user_average_stars, review.business_id, review.stars as user_stars
from user
right join review
on user.user_id=review.user_id
#where (user.user_id= "gVmUR8rqUFdbSeZbsg6z_w" or user.user_id="VcmSgvslHAhqWoEn16wjjw" or user.user_id="-8nmj3B-tfY_vFiimtBOsw" )
where user.yelping_since >= dt1 and user.yelping_since < dt2

)
as T1
inner join business
on T1.business_id=business.business_id)
;



END