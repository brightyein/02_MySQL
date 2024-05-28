-- 서브쿼리

SELECT  -- 메인쿼리
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
 WHERE category_code = (
	SELECT  -- 서브쿼리
		category_code
	  FROM tbl_menu
	 WHERE menu_name = '민트미역국');
     
     
     
 -- max() 제일 큰 값 호출
 SELECT max(menu_price) FROM tbl_menu;
 
 
 SELECT
	MAX(count)
  FROM(
		SELECT
			count(*) AS 'count'
		  FROM tbl_menu
		GROUP BY category_code
	) AS countMenu;
    

-- 평균 가격보다 높은 가격의 메뉴들 조회하기
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
  FROM tbl_menu
 WHERE menu_price > (
				SELECT
					avg(menu_price)
				  FROM tbl_menu
		);






 
 	
 
 
 