CREATE DEFINER=`root`@`localhost` PROCEDURE `VALIDATION`()
BEGIN


DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM test_tbl INTO n;
SET i=0;
WHILE i<n DO 
  SELECT user_average_stars, business_stars, user_stars  INTO @AA,  @BB, @CC
  FROM test_tbl LIMIT i,1;
  
  select star-@CC AS DIFF into @diff from temp where  USER_AVG=@AA AND BUS_AVG=@BB;
  SET i = i + 1;
  insert into difference(diff)
  values (@diff);
END WHILE;


select (num/denom)*100 as Accuracy from
(SELECT count(*) as denom FROM DIFFERENCE) as t1, 
(select count(*) as num from difference where diff=0) as t2;
End