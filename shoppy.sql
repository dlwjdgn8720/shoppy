use shoppy;
select database();
show tables;
select * from information_schema.views where table_schema = 'shoppy';
select * from member;
select * from product;
desc product;

-- 상품 전체 조회
select  pid,
        concat('images/', image) as image
from product;        

-- product + product_detailinfo 테이블 조인
-- "detailInfo" :{"title_en" : title_en,...}
-- json_array(pd.title_en, pd.title_ko) as testArray
select  p.pid,
		p.name,
        p.price,
        p.info,
        p.rate,
        concat('images/', p.image) as image,
        p.img_list as imgList,
        json_object("title_en", pd.title_en,
					"title_ko", pd.title_ko,
					"list", pd.list) as detailInfo		
	from product p, product_detailinfo pd 
    where p.pid = pd.pid and p.pid = 5;

show tables;
select * from product_detailinfo;

-- qna 정보 조회
select 	qid,
		title,
        content,
		is_complete as isComplete,
		is_lock as isLock,
        id,
        pid,
        cdate
from product_qna 
where pid = 1;

select  rid,
		title,
        description,
        list
from product_return;

select * from member order by mdate desc;





