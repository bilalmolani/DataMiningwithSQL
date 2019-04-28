CREATE DEFINER=`root`@`localhost` PROCEDURE `DecisionTree_train`()
BEGIN
select one, two, three, four, five into  @one5, @two5, @three5, @four5, @five5 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=5
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=5
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=5
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=5
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=5
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;


select one, two, three, four, five into  @one45, @two45, @three45, @four45, @five45 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=4.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=4.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=4.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=4.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=4.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one4, @two4, @three4, @four4, @five4 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=4
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=4
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=4
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=4
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=4
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one35, @two35, @three35, @four35, @five35 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=3.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=3.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=3.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=3.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=3.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one3, @two3, @three3, @four3, @five3 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=3
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=3
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=3
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=3
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=3
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one25, @two25, @three25, @four25, @five25 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=2.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=2.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=2.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=2.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=2.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one2, @two2, @three2, @four2, @five2 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=2
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=2
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=2
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=2
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=2
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one15, @two15, @three15, @four15, @five15 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=1.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=1.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=1.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=1.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=1.5
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select one, two, three, four, five into  @one1, @two1, @three1, @four1, @five1 from

(select user_stars as one from (select count(*) as majority,user_stars from train_tbl where user_average_stars=1 and business_stars=1
group by user_stars
order by majority desc limit 0,1
) as t11) as t1,
(select user_stars as two  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=2 and business_stars=1
group by user_stars
order by majority desc limit 0,1
) as t11) as t2,
(select user_stars as three  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=3 and business_stars=1
group by user_stars
order by majority desc limit 0,1
) as t11) as t3,
(select user_stars as four  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=4 and business_stars=1
group by user_stars
order by majority desc limit 0,1
) as t11) as t4,
(select user_stars as five  from (select count(*) as majority,user_stars from train_tbl where user_average_stars=5 and business_stars=1
group by user_stars
order by majority desc limit 0,1
) as t11) as t5;

select  @one5,  @two5 ,  @three5 , @four5,  @five5;
-- select  @one45,  @two45 ,  @three45 , @four45,  @five45;
-- select  @one4,  @two4 ,  @three4 , @four4,  @five4;
-- select @one35, @two35, @three35, @four35, @five35;
-- select @one3, @two3, @three3, @four3, @five3;
-- select @one25, @two25, @three25, @four25, @five25;
-- select @one2, @two2, @three2, @four2, @five2;
-- select @one15, @two15, @three15, @four15, @five15;
-- select @one1, @two1, @three1, @four1, @five1;


drop table if exists temp;
create table temp(
   ID          int auto_increment,
   USER_AVG     int  not null
  ,BUS_AVG      float not null
  ,star     int ,
   primary key (ID)
);

insert into temp(USER_AVG,BUS_AVG,star)
values (1, 1,@one1),
(2, 1,@two1),
(3, 1,@three1),
(4, 1,@four1),
(5, 1,@five1),
(1, 2,@one2),
(2, 2,@two2),
(3, 2,@three2),
(4, 2,@four2),
(5, 2,@five2),
(1, 3,@one3),
(2, 3,@two3),
(3, 3,@three3),
(4, 3,@four3),
(5, 3,@five3),
(1, 4,@one4),
(2, 4,@two4),
(3, 4,@three4),
(4, 4,@four4),
(5, 4,@five4),
(1, 5,1),
(2, 5,2),
(3, 5,5),
(4, 5,5),
(5, 5,5),
(1, 1.5,@one15),
(2, 1.5,@two15),
(3, 1.5,@three15),
(4, 1.5,@four15),
(5, 1.5,@five15),
(1, 2.5,@one25),
(2, 2.5,@two25),
(3, 2.5,@three25),
(4, 2.5,@four25),
(5, 2.5,@five25),
(1, 3.5,@one35),
(2, 3.5,@two35),
(3, 3.5,@three35),
(4, 3.5,@four35),
(5, 3.5,@five35),
(1, 4.5,@one45),
(2, 4.5,@two45),
(3, 4.5,@three45),
(4, 4.5,@four45),
(5, 4.5,@five45)
;

-- select * from temp;


END