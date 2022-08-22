CREATE DEFINER=`root`@`localhost` PROCEDURE `StoreProcedure`()
BEGIN
select supp.supp_id, supp.supp_name , rati.rat_ratstars,
case 
when rati.rat_ratstars = 5 then 'Excellence Service'
when rati.rat_ratstars > 4 then 'Good Service'
when rati.rat_ratstars > 2 then 'Avergae Service'
else 'Poor Service'
END as table1 from supplier supp
inner join supplier_pricing supr on supp.supp_id = supr.supp_id
inner join `order` ord on supr.pricing_id = ord.pricing_id
inner join rating rati on rati.ord_id = ord.ord_id;
END