-- xóa file cũ nếu tồn tại, tạo lại
Drop DATABASE IF EXISTS BE_bt_sql_food_basic;
CREATE DATABASE BE_bt_sql_food_basic;

-- users PK *************************************
CREATE table users(
	user_id int PRIMARY key auto_increment,
	full_name VARCHAR(250),
	email VARCHAR(250),
	password VARCHAR(250)
	)
INSERT into users(full_name,email,password) VALUES
	('Nguyễn Văn A', 'nguyenvana@example.com', 'pass789'),
	('Trần Thị B', 'tranthib@example.com', 'passwordXYZ'),
	('Lê Hoàng C', 'lehoangc@example.com', 'secure123'),
	('Phạm Thị D', 'phamthid@example.com', 'pass432'),
	('Ngô Văn E', 'ngovane@example.com', 'mypassword'),
	('Trần Thị F', 'tranthif@example.com', 'letmein123'),
	('Nguyễn Văn G', 'nguyenvang@example.com', 'newpass789'),
	('Trần Thị H', 'tranthih@example.com', 'newpasswordXYZ'),
	('Lê Hoàng I', 'lehoangi@example.com', 'newsecure123'),
	('Phạm Thị K', 'phamthik@example.com', 'newpass432');
	
select * from users;

-- restaurant PK ****************************************
CREATE TABLE restaurant (
	res_id int PRIMARY key auto_increment,
	res_name VARCHAR(250),
	image VARCHAR(250),
	decs VARCHAR(250)
	)

INSERT into restaurant (res_name,image,decs) VALUES
	('Nhà Hàng Ánh Dương', 'anh_duong.jpg', 'Nhà hàng sang trọng với không gian thoáng đãng và menu đa dạng.'),
	('Nhà Hàng Sông Hồng', 'song_hong.jpg', 'Trải nghiệm ẩm thực Việt tại nhà hàng bên bờ sông Hồng.'),
	('Nhà Hàng Nước Mắt', 'nuoc_mat.jpg', 'Một không gian ấm cúng với các món ăn ngon từ đủ loại hải sản.'),
	('Nhà Hàng Đêm Đen', 'dem_den.jpg', 'Khám phá thế giới ẩm thực trong không gian tối màu và mysterious.'),
	('Nhà Hàng Phố Cổ', 'pho_co.jpg', 'Hòa mình trong hương vị truyền thống tại nhà hàng ở trung tâm phố cổ.'),
	('Nhà Hàng Lịch Sử', 'lich_su.jpg', 'Hòa mình vào không khí của quá khứ tại nhà hàng nằm ở trung tâm Phố Cổ.');

select * from restaurant;

-- like_res FK ****************************
CREATE table like_res(
	user_id int,
	FOREIGN key(user_id) REFERENCES users(user_id),
	res_id int,
	FOREIGN key(res_id) REFERENCES restaurant(res_id),
	date_like date
	)
INSERT INTO like_res (user_id, res_id, date_like) VALUES
	(1, 5, '2023-01-15'),
	(1, 6, '2023-02-20'),
	(1, 1, '2023-03-25'),
	(2, 5, '2023-04-10'),
	(3, 5, '2023-05-18'),
	(2, 1, '2023-06-01'),
	(3, 2, '2023-06-05'),
	(6, 5, '2023-06-10'),
	(7, 6, '2023-06-15'),
	(8, 1, '2023-06-20');

select * from like_res



-- rate_res FK *********************
CREATE table rate_res(
	user_id int,
	FOREIGN key(user_id) REFERENCES users(user_id),
	res_id int,
	FOREIGN key(res_id) REFERENCES restaurant(res_id),
	amount int,
	date_rate date
	)
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 3, 10, '2023-01-15'),
(2, 1, 7, '2023-02-20'),
(3, 5, 3, '2023-03-10'),
(4, 2, 1, '2023-04-05'),
(5, 4, 5, '2023-05-12');
select * from rate_res

-- food ************************
CREATE TABLE food(
	food_id int PRIMARY key auto_increment,
	food_name VARCHAR(250),
	image VARCHAR(250),
	price FLOAT,
	decs VARCHAR(250),
	type_id int,
	FOREIGN key(type_id) REFERENCES food_type(type_id)
	)
INSERT into food(food_name,image,price,decs,type_id) VALUES	
	('Phở', 'pho.jpg', 5.99, 'Một món ăn truyền thống của Việt Nam.', 1),
    ('Bún chả', 'bun_cha.jpg', 6.99, 'Món ăn ngon nổi tiếng của Hà Nội.', 1),
    ('Bánh mì', 'banh_mi.jpg', 3.99, 'Bánh mì Việt Nam thơm ngon và độc đáo.', 1),
    ('Gỏi cuốn', 'goi_cuon.jpg', 4.99, 'Một món ăn khai vị và dễ ăn.', 1),
    ('Cơm niêu', 'com_nieu.jpg', 7.99, 'Cơm hấp thơm phức và ngon miệng.', 2),
    ('Bánh xèo', 'banh_xeo.jpg', 5.99, 'Bánh xèo giòn tan và thơm ngon.', 1),
    ('Cà phê sữa đá', 'ca_phe_sua_da.jpg', 2.99, 'Đồ uống phổ biến và thơm ngon.', 3),
    ('Bánh tráng trộn', 'banh_trang_tron.jpg', 3.99, 'Một loại đồ ăn vặt phổ biến.', 1),
    ('Hủ tiếu', 'hu_tieu.jpg', 6.99, 'Một món súp ngon và bổ dưỡng.', 2),
    ('Nước mía', 'nuoc_mia.jpg', 1.99, 'Nước ép từ cây mía tươi ngon.', 3),
    ('Bún riêu', 'bun_rieu.jpg', 5.99, 'Một món ăn độc đáo với nước dùng từ cua.', 2),
    ('Bánh canh', 'banh_canh.jpg', 6.99, 'Một loại bánh canh ngon miệng.', 2),
    ('Chè', 'che.jpg', 4.99, 'Đồ dessert truyền thống của Việt Nam.', 3),
    ('Bánh bao', 'banh_bao.jpg', 3.99, 'Bánh bao nhân thịt hấp thơm ngon.', 1),
    ('Lẩu', 'lau.jpg', 8.99, 'Một món ăn phổ biến dùng cùng gia đình hoặc bạn bè.', 2);
select * from food

-- order *********************
CREATE TABLE orders(
	user_id int,
	FOREIGN key(user_id) REFERENCES users(user_id),
	food_id int,
	FOREIGN key(food_id) REFERENCES food(food_id),
	amount int,
	code VARCHAR(255),
	arr_sub_id VARCHAR(250)
	)
INSERT INTO orders (user_id, food_id, amount, code, arr_sub_id) VALUES
    (1, 1, 2, 'ORDER123', 'SUB123'),
    (2, 3, 1, 'ORDER456', 'SUB456'),
    (3, 5, 3, 'ORDER789', 'SUB789'),
    (4, 2, 2, 'ORDERABC', 'SUBABC'),
    (5, 4, 1, 'ORDERDEF', 'SUBDEF'),
    (1, 7, 2, 'ORDERGHI', 'SUBGHI'),
    (3, 6, 1, 'ORDERJKL', 'SUBJKL'),
    (1, 8, 3, 'ORDERMNO', 'SUBMNO'),
    (7, 10, 2, 'ORDERPQR', 'SUBPQR'),
    (9, 9, 1, 'ORDERSUV', 'SUBSUV');	
select * from orders
-- food_type ***************
CREATE table food_type(
	type_id int PRIMARY key auto_increment,
	type_name VARCHAR(250)
	)
INSERT INTO food_type (type_name) VALUES
    ('Mì Quảng'),
    ('Phở'),
    ('Bún'),
    ('Bánh Mì'),
    ('Cơm'),
    ('Hủ Tiếu'),
    ('Bánh Xèo'),
    ('Gỏi Cuốn'),
    ('Chè'),
    ('Lẩu');
select * from food_type

-- phần giải ********************
	-- 1.Tìm 5 người đã like nhà hàng nhiều nhất
		-- inner join
SELECT u.user_id, u.full_name, COUNT(lr.res_id) AS total_likes FROM users AS u
INNER JOIN like_res AS lr
ON lr.user_id = u.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_likes DESC
LIMIT 5;

		-- left join -> TỐN GIỮ LIỆU HƠN SO VS BÀI NÀY
SELECT u.user_id, u.full_name, COUNT(lr.res_id) AS total_likes FROM users AS u
LEFT JOIN like_res AS lr 
ON lr.user_id = u.user_id
GROUP BY u.user_id , u.full_name
ORDER BY total_likeS DESC
LIMIT 5;

	-- 2.Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT r.res_id , r.res_name, COUNT(lr.res_id) AS total_like FROM restaurant as r
LEFT JOIN like_res AS lr ON r.res_id = lr.res_id	
GROUP BY r.res_id 
ORDER BY total_like DESC
LIMIT 2
	-- 3.tìm người đã đặt hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(o.user_id) AS total_orders FROM users as u 
INNER JOIN orders AS o ON u.user_id = o.user_id
GROUP BY u.full_name, u.user_id
ORDER by total_orders DESC
LIMIT 1
	-- 4.tìm người dùng không hoạt động trong hệ thống ( không đặt hàng, không like, không đánh giá nhà hàng)
		-- left join
SELECT u.user_id, u.full_name, o.user_id AS dat_hang, lr.user_id AS luot_thich, rr.user_id AS so_lan_danh_gia FROM users AS u
LEFT JOIN orders AS o ON u.user_id = o.user_id
LEFT JOIN like_res AS lr ON u.user_id = lr.user_id
LEFT JOIN rate_res AS rr ON u.user_id = rr.user_id
WHERE o.user_id is NULL && lr.user_id is NULL && rr.user_id  is NULL

		-- EXISTS
SELECT u.user_id, u.full_name FROM users AS u 
WHERE NOT EXISTS (
	SELECT * FROM like_res AS lr WHERE u.user_id = lr.user_id
	)
AND NOT EXISTS(
	SELECT * FROM rate_res AS rr WHERE u.user_id = rr.user_id
	)
AND NOT EXISTS(
	SELECT * FROM orders AS o WHERE u.user_id = o.user_id
	)







