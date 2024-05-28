-- join  두 개 이상의 테이블을 결합하는데 사용

-- AS

SELECT
	menu_code AS 'code',
    menu_name AS name,
    menu_price 'price'
  FROM tbl_menu
ORDER BY price;

SELECT
	a.category_code,
    a.menu_name
  FROM tbl_menu AS a
 ORDER BY
	a.category_code,
    a.menu_name;
    

-- inner join (교집합 반환)
SELECT
	a.menu_name,
    b.category_name
  FROM tbl_menu a
  JOIN tbl_category b ON a.category_code = b.category_code;
  
  select * from tbl_category;
  select * from tbl_menu;
  
  select 
	a.category_name,
    b.menu_name 
  from tbl_category a
  join tbl_menu b on a.category_code = b.category_code;
  
  
SELECT
	b.menu_name,
    a.category_name
  FROM tbl_menu b
INNER JOIN tbl_category a USING (category_code);

-- left join
SELECT
	a.category_name,
    b.menu_name
  FROM tbl_category a 
LEFT JOIN tbl_menu b ON a.category_code = b.category_code;

-- right join 
SELECT
	a.category_name,
    b.menu_name
  FROM tbl_category a 
RIGHT JOIN tbl_menu b ON a.category_code = b.category_code;








