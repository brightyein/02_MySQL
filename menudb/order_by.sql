-- order by 정렬하는 기능

SELECT
	menu_code,
    menu_name,
    menu_price
FROM tbl_menu
ORDER BY menu_price ASC;

SELECT
	menu_code,
    menu_name,
    menu_price
  FROM tbl_menu
ORDER BY menu_price DESC;

SELECT
	menu_code,
    menu_name,
    menu_pRice
    FROM tbl_menu
ORDER BY
	menu_price DESC,
	menu_name ASC;
    
    SELECT
	menu_code,
	menu_price,
    menu_code * menu_price
  FROM tbl_menu
ORDER BY menu_code * menu_price DESC;

SELECT
	menu_code,
	menu_price,
    (menu_code * menu_price) AS multi
  FROM tbl_menu
ORDER BY multi DESC;

SELECT field('a','a','b','c');

SELECT
	menu_name,
	orderable_status
  from tbl_menu
ORDER BY field(orderable_status, 'N','Y');

SELECT
	category_code,
    category_name,
    ref_category_code
  from tbl_category
ORDER BY
	ref_category_code DESC;