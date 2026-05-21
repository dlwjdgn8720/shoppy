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

-- 중복된 아이디 체크
select * from member;
select count(id) from member where id = 'test222';

select * from cart
	where pid = 1 and id = 'test' and size = 'XS';

select * from cart
	where id = 'test'
	order by cdate desc;

select sum(qty) as qty from cart where id = 'test';
show tables;

select * from view_cartlist where id = 'test';
select * from information_schema.views
	where table_schema = 'shoppy';

select  `m`.`id` AS `id`,
		`m`.`name` AS `mname`,
        `m`.`phone` AS `phone`,
        `m`.`email` AS `email`,
        `p`.`pid` AS `pid`,
        `p`.`name` AS `name`,
        `p`.`info` AS `info`,
        `p`.`image` AS `image`,
        `p`.`price` AS `price`,
        `c`.`size` AS `size`,
        `c`.`qty` AS `qty`,
        `c`.`cid` AS `cid`,
        `t`.`total_price` AS `total_price` 
        from (((`shoppy`.`member` `m` join `shoppy`.`product` `p`) 
        join `shoppy`.`cart` `c`) 
        join (select `c`.`id` AS `id`,sum((`c`.`qty` * `p`.`price`)) AS `total_price` 
				from (`shoppy`.`cart` `c` 
                join `shoppy`.`product` `p` on((`c`.`pid` = `p`.`pid`))) 
                group by `c`.`id`) `t`) 
                where ((`m`.`id` = `c`.`id`) and (`p`.`pid` = `c`.`pid`) and (`c`.`id` = `t`.`id`));
    select * from cart;














