CREATE DEFINER=`root`@`localhost` PROCEDURE `RunBeforeValidation`()
BEGIN
drop table if exists difference;
create table difference(
   diff     int );
END