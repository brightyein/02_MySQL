-- union


SELECT
	menu_code
	,menu_name
    ,menu_price
    ,category_code
    ,orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION
 SELECT
	menu_code
	,menu_name
    ,menu_price
    ,category_code
    ,orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;
 
 
 SELECT
	menu_code
	,menu_name
    ,menu_price
    ,category_code
    ,orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION ALL
 SELECT
	menu_code
	,menu_name
    ,menu_price
    ,category_code
    ,orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;
 
 
 
 