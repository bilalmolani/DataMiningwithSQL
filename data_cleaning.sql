CREATE DEFINER=`root`@`localhost` PROCEDURE `data_cleaning`()
BEGIN

##### Constraint- Primary Key and Foreign Key #####



ALTER TABLE `user` ADD PRIMARY KEY (`user_id`);
 
ALTER TABLE `business` ADD PRIMARY KEY (`business_id`);

ALTER TABLE `review` ADD PRIMARY KEY (`review_id`);





SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `user` ADD FOREIGN KEY (`user_id`) REFERENCES `review` (`user_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

ALTER TABLE `business` ADD FOREIGN KEY (`business_id`) REFERENCES `review` (`business_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE ;
  
  
  SET FOREIGN_KEY_CHECKS=1;
  
  
##### Constraint- Primary Key and Foreign Key #####
 
 
##### Query to verify self-consistency #####

 -- Query to verify self-consistency of the field business_id in the relation review
(SELECT review.review_id
   FROM review
     LEFT JOIN `business`
       ON review.business_id= `business`.`business_id`
   WHERE `business`.`business_id` IS NULL
  );
  
  
 -- Query to verify self-consistency of the field user_id in the relation review 
  (SELECT review.review_id
   FROM review
     LEFT JOIN `business`
       ON review.business_id= `business`.`business_id`
   WHERE `business`.`business_id` IS NULL
  );
  
  (SELECT review.review_id
   FROM review
     LEFT JOIN `user`
       ON review.user_id= `user`.`user_id`
   WHERE `user`.`user_id` IS NULL
  );
  
  
##### Query to verify self-consistency #####
  
##### Secondary Indexes #####


ALTER TABLE `review` ADD INDEX `reviewind` (`review_id`) USING BTREE; 
ALTER TABLE `user` ADD INDEX `yelpsince` (`yelping_since`) USING BTREE;
ALTER TABLE `review` ADD index  (`business_id`);

##### Secondary Indexes #####


##### SANITY CHECKS #####

-- SANITY CHECK ON TABLE USER  TO YEAR OF YELPING_SINCE OF USER ACCOUNT
SELECT user_id, yelping_since FROM user WHERE YEAR(yelping_since) < 2004;
SELECT user_id, yelping_since FROM user WHERE YEAR(yelping_since) > 2018;



-- SANITY CHECK ON REVIEW RELATION IN REGARDS TO YEAR OF CREATION OF USER ACCOUNT/START REVIEWING
alter table review add index date (date) using btree;
SELECT user_id FROM review WHERE YEAR(date) < 2004;
SELECT user_id FROM review WHERE YEAR(date) > 2018;


ALTER TABLE `review` ADD INDEX `rv_user` (`date`,`user_id`) USING BTREE;
ALTER TABLE `user` ADD INDEX `yelpsince_user` (`yelping_since`,`user_id`) USING BTREE;
create view  tempSan as select user_id, min(YEAR(date)) AS earliestyear from review group by user_id order by user_id;
SELECT tempSan.user_id FROM tempSan INNER JOIN user as abc on tempSan.user_id=abc.user_id where tempSan.earliestyear<YEAR(yelping_since);

-- COMPARING AVERAGE STAR OF BUSINESS ACCORDING TO BUSINESS REALTION WITH THAT OF REVIEW RELATION AFTER GROUPING STARS OF EACH REVIEW BY BUSINESS_ID
ALTER TABLE `business` ADD INDEX `business_id_stars` (`user_id`,`stars`) USING BTREE;
ALTER TABLE `review` ADD INDEX `review_business_stars` (`business_id`,`stars`) USING BTREE;
select business.business_id, business.stars as old_stars, new_stars from business inner join (select r.business_id, avg(r.stars) as new_stars from review as r group by business_id) as t1
on business.business_id=t1.business_id
where (abs(new_stars-business.stars))>0.5;




-- COMPARING AVERAGE STAR OF USER ACCORDING TO USER REALTION WITH THAT OF REVIEW RELATION AFTER GROUPING STARS OF EACH REVIEW BY USER_ID
ALTER TABLE `user` ADD INDEX `user_average_stars` (`user_id`,`average_stars`) USING BTREE;
ALTER TABLE `review` ADD INDEX `review_user_stars` (`user_id`,`stars`) USING BTREE;
select user.user_id, user.average_stars as old_stars, new_stars from user inner join (select r.user_id, avg(r.stars) as new_stars from review as r group by user_id) as t1
on user.user_id=t1.user_id
where (abs(new_stars-user.average_stars))>0.5;



-- Comparison between total review_count from user table with that from grouping reviews from review table with respect to user_id

alter table `user` add index `user_id_review_count` (`user_id`,`review_count`) USING BTREE;
create view CountFromUSER AS SELECT user_id as user_review_count, count(user_id) as countperrev from review group by user_id;
select user_id,review_count, countperrev from user inner join CountFromUSER on user_id=user_review_count where review_count<countperrev;
select count(user_id) from user inner join CountFromUSER on user_id=user_review_count where review_count<countperrev;

##### SANITY CHECKS #####

-- DATA Cleaning

START TRANSACTION;
SET autocommit=0;


-- Removing User which appears to be yelping before 2004 (yelp data doesn't exists before 2004) or after 2018 (future date)
delete FROM user WHERE YEAR(yelping_since) < 2004;
delete FROM user WHERE YEAR(yelping_since) > 2018;

delete FROM review WHERE YEAR(date) < 2004;
delete FROM review WHERE YEAR(date) > 2018;

-- deleting those reviews from review relation for which either user or business doesn't exist in user relation and business relation, respectively

delete review from review inner join
(select review.business_id from review
left join business on review.business_id=business.id where business.id is null) as t1
on review.business_id=t1.business_id;

delete review from review  inner join
(select review.user_id from review
left join user on review.user_id=user.user_id where user.user_id is null) as t1
on review.user_id=t1.user_id;

-- delete those users whose total review_count appears to be lesser than there total reviews in review relation.

delete user from user inner join 
(select t2.user_id from user as usr
     inner join 
     ( select user_id, count(*) as sum from review group by user_id) as t2
on usr.user_id=t2.user_id where t2.sum > usr.review_count) as t3
on user.user_id = t3.user_id;

-- DATA Cleaning
END