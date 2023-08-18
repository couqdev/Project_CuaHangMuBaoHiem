/*
 Navicat Premium Data Transfer

 Source Server         : host
 Source Server Type    : MariaDB
 Source Server Version : 100427 (10.4.27-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : helmetshop

 Target Server Type    : MariaDB
 Target Server Version : 100427 (10.4.27-MariaDB)
 File Encoding         : 65001

 Date: 14/06/2023 23:03:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners`  (
  `id_banner` int(11) NULL DEFAULT NULL,
  `img` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `content` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES (1, 'img/slideshow_1_600x.jpg', '1', 0.02, 'Nhanh tay đặt hàng');
INSERT INTO `banners` VALUES (2, 'img/1011890.jpg', '1', 0.08, 'Số lượng có hạn');

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id_customer` int(11) NULL DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NULL DEFAULT NULL,
  `status` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_transport` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `received_date` date NULL DEFAULT NULL,
  `fee` int(11) NULL DEFAULT NULL,
  `total_cost` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (3, 3, '2023-06-14', 'Đã nhận', 'Xã Yên Bồng - Huyện Lạc Thủy - Hòa Bình', '0389647802', '7176197afe8e4759bab8f39d00062bc3', '2023-06-18', 69000, 1769000);
INSERT INTO `bills` VALUES (25, 4, '2023-06-14', 'Đang gửi', 'Xã Kan Hồ - Huyện Mường Tè - Lai Châu', '0389647802', '04045d5ddd1f4bfe959caeca8649058d', '2023-06-18', 69000, 833400);
INSERT INTO `bills` VALUES (25, 5, '2023-06-14', 'Đã nhận', 'Xã Kan Hồ - Huyện Mường Tè - Lai Châu', '0389647802', '8cea97cf401044afb5a5cda380539bb7', '2023-06-18', 69000, 833400);
INSERT INTO `bills` VALUES (25, 6, '2023-06-14', 'Đang gửi', 'Xã Yên Bồng - Huyện Lạc Thủy - Hòa Bình', '0389647802', 'a32be30f9ef94d5aa5885c8137927fae', '2023-06-18', 69000, 1769000);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id_customer` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `star` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `display` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (2, 1, 'Tạm', 2, '2023-01-03', 1, 1);
INSERT INTO `comments` VALUES (2, 3, 'Cũng được', 3, '2023-01-08', 2, 1);
INSERT INTO `comments` VALUES (1, 2, 'Cũng ok', 3, '2023-01-03', 3, 1);
INSERT INTO `comments` VALUES (3, 2, 'Ổn', 4, '2023-01-08', 4, 1);
INSERT INTO `comments` VALUES (2, 11, 'Đẹp', 4, '2023-03-17', 126, 1);

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_contact`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of contacts
-- ----------------------------
INSERT INTO `contacts` VALUES (1, 'Trần Đặng Quốc', 'trandangquoc@gmail.com', 'Chất lượng sản phẩm', 'Sản phẩm ổn', '2023-01-02');
INSERT INTO `contacts` VALUES (2, 'Nguyễn Minh Đức', 'minhduc@gmail.com', 'Màu sắc sản phẩm', 'Màu khác với trên trang web', '2023-01-02');
INSERT INTO `contacts` VALUES (3, 'Trần Duy Nhân', 'duynhan@gmail.com', 'Sản phẩm', 'Sản phẩm hợp với giá tiền', '2022-12-13');
INSERT INTO `contacts` VALUES (4, 'Trần Đặng Quốc', 'trandangquoc271202@gmail.com', 'Sản phẩm', 'Sản phẩm hơi đắt', '2022-12-29');
INSERT INTO `contacts` VALUES (5, 'Trần Đặng Quốc', 'trandangquoc271202@gmail.com', 'Kiểm tra sản phẩm', 'Sản phẩm hơi kém chất lượng', '2023-01-01');
INSERT INTO `contacts` VALUES (6, 'Thanh Xuân', 'xuanaco@gmail.com', 'Chăm sóc khách hàng', 'Nhân viên hơi thiếu lịch sự', '2023-01-02');
INSERT INTO `contacts` VALUES (7, 'Tạ thanh Nhả', 'nhamonhon@gmail.com', 'Giá thành sản phẩm', 'Sản phẩm hợp túi tiền', '2023-01-02');
INSERT INTO `contacts` VALUES (8, 'Trần Lê Bụng Bự', 'heomap@gmai.com', 'Sản phẩm chất lượng cao', 'Đánh giá cao sản phẩm', '2023-01-04');
INSERT INTO `contacts` VALUES (9, 'Jeny', '20130376@st.hcmuaf.edu.vn', 'Liên hệ hợp tác', 'Công ty A muốn hợp tác với cửa hàng', '2023-01-05');
INSERT INTO `contacts` VALUES (10, 'Trần Đặng Quốc', 'trandangquoc271202@gmail.com', 'Kiểm tra sản phẩm', 'Đánh giá cao sản phẩm', '2023-01-05');
INSERT INTO `contacts` VALUES (11, 'Đỗ Đức Tài', 'trandangquoc271202@gmail.com', 'Liên hệ hợp tác', 'Bạn muốn hợp tác làm ăn với tôi không', '2023-01-05');
INSERT INTO `contacts` VALUES (12, 'Trần Đặng Quốc', '20130376@st.hcmuaf.edu.vn', 'Sản phẩm chất lượng cao', 'Good !', '2023-01-05');
INSERT INTO `contacts` VALUES (13, 'Trần Đặng Quốc', '20130376@st.hcmuaf.edu.vn', 'Sản phẩm chất lượng cao', 'Not Bad', '2023-01-05');
INSERT INTO `contacts` VALUES (14, 'Trần Đặng Quốc', 'trandangquoc271202@gmail.com', 'Lien he hop tac', 'chao ban', '2023-03-25');
INSERT INTO `contacts` VALUES (15, 'Trần Đặng Quốc', '20130376@st.hcmuaf.edu.vn', 'Lien he hop tac', 'Chào cửa hàng', '2023-04-16');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` int(11) NULL DEFAULT NULL,
  `active` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` date NULL DEFAULT NULL,
  `countLock` int(11) NULL DEFAULT NULL,
  `typeAccount` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'Nguyễn Minh Đức', '20130233@st.hcmuaf.edu.vn', '01235746813', 'huyện Hoài Ân, tỉnh Bình Định', 'dadmin', 'e10adc3949ba59abbe56e057f20f883e', 0, '1', '2023-01-06', 0, 0);
INSERT INTO `customers` VALUES (2, 'Trần Duy Nhân', '20130346@st.hcmuaf.edu.vn', '09845317563', 'tỉnh Quảng Bình', 'nadmin', 'e10adc3949ba59abbe56e057f20f883e', 1, '1', '2023-01-04', 1, 0);
INSERT INTO `customers` VALUES (3, 'Trần Đặng Quốc', '20130376@st.hcmuaf.edu.vn', '01875246328', 'huyện An Nhơn, tỉnh Bình Định', 'qadmin', 'e10adc3949ba59abbe56e057f20f883e', 0, '1', '2023-01-07', 0, 0);
INSERT INTO `customers` VALUES (4, 'Nguyễn Văn A', 'iam@gmail.com', '01325846985', 'tỉnh Quảng Bình', 'tdn', 'd5773a5bd6df69e407fe820bc9aad3c4', 0, '1', '2023-01-08', 1, 0);
INSERT INTO `customers` VALUES (23, 'Trần Đặng Quốc', 'trandangquoc271202@gmail.com', '03812365405', 'tỉnh Cà Mau', 'trandangquoc271202@gmail.com', '5ee76f27fbf05b055936b2b764a2a669', 0, '1', '2023-03-04', 0, 1);
INSERT INTO `customers` VALUES (24, 'N.M.Đức', 'dtest@gmail.com', '01235486586', 'TP Hồ Chí Minh', 'ducuser', 'd6a9a933c8aafc51e55ac0662b6e4d4a', 1, '1', '2023-06-14', 0, 0);
INSERT INTO `customers` VALUES (25, 'Đặng Quốc Trần', 'trandangquoc2712@gmail.com', '', '', '104738908913076708697', '3360e63dfb1b5c1b9947dca4a2283b77', 0, '1', '2023-06-14', 0, 2);

-- ----------------------------
-- Table structure for detail_bills
-- ----------------------------
DROP TABLE IF EXISTS `detail_bills`;
CREATE TABLE `detail_bills`  (
  `id_bill` int(11) NULL DEFAULT NULL,
  `id_dp` int(11) NULL DEFAULT NULL,
  `quantitySold` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_bills
-- ----------------------------
INSERT INTO `detail_bills` VALUES (3, 103, 1, 1700000);
INSERT INTO `detail_bills` VALUES (4, 92, 1, 764400);
INSERT INTO `detail_bills` VALUES (5, 92, 1, 764400);
INSERT INTO `detail_bills` VALUES (6, 103, 1, 1700000);

-- ----------------------------
-- Table structure for detail_products
-- ----------------------------
DROP TABLE IF EXISTS `detail_products`;
CREATE TABLE `detail_products`  (
  `id_dp` int(11) NOT NULL,
  `id_product` int(11) NULL DEFAULT NULL,
  `size` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `color` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_dp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_products
-- ----------------------------
INSERT INTO `detail_products` VALUES (1, 1, 'M', 'xám', 2);
INSERT INTO `detail_products` VALUES (2, 1, 'L', 'cam', 0);
INSERT INTO `detail_products` VALUES (3, 1, 'M', 'đen', 0);
INSERT INTO `detail_products` VALUES (4, 10, 'X', 'đen', 20);
INSERT INTO `detail_products` VALUES (5, 11, 'L', 'cam', 12);
INSERT INTO `detail_products` VALUES (6, 11, 'L', 'vàng', 3);
INSERT INTO `detail_products` VALUES (7, 11, 'L', 'đen', 4);
INSERT INTO `detail_products` VALUES (8, 11, 'L', 'trắng', 5);
INSERT INTO `detail_products` VALUES (9, 11, 'X', 'vàng', 6);
INSERT INTO `detail_products` VALUES (10, 11, 'M', 'trắng', 7);
INSERT INTO `detail_products` VALUES (11, 11, 'M', 'đen', 8);
INSERT INTO `detail_products` VALUES (12, 12, 'L', 'đen', 11);
INSERT INTO `detail_products` VALUES (13, 12, 'M', 'đen', 5);
INSERT INTO `detail_products` VALUES (14, 13, 'L', 'đen', 22);
INSERT INTO `detail_products` VALUES (15, 13, 'L', 'xám', 11);
INSERT INTO `detail_products` VALUES (16, 13, 'M', 'đen', 3);
INSERT INTO `detail_products` VALUES (17, 13, 'M', 'xám', 5);
INSERT INTO `detail_products` VALUES (18, 14, 'M', 'đen', 4);
INSERT INTO `detail_products` VALUES (19, 14, 'M', 'xám', 5);
INSERT INTO `detail_products` VALUES (20, 14, 'M', 'xanh', 6);
INSERT INTO `detail_products` VALUES (21, 14, 'M', 'nâu', 7);
INSERT INTO `detail_products` VALUES (22, 15, 'L', 'hồng', 23);
INSERT INTO `detail_products` VALUES (23, 15, 'L', 'tím', 4);
INSERT INTO `detail_products` VALUES (24, 15, 'X', 'sữa', 1);
INSERT INTO `detail_products` VALUES (25, 15, 'X', 'đen', 2);
INSERT INTO `detail_products` VALUES (26, 15, 'XL', 'nâu', 1);
INSERT INTO `detail_products` VALUES (27, 15, 'M', 'xanh', 2);
INSERT INTO `detail_products` VALUES (28, 15, 'M', 'trắng', 12);
INSERT INTO `detail_products` VALUES (29, 15, 'L', 'nhám', 1);
INSERT INTO `detail_products` VALUES (30, 15, 'M', 'hồng', 21);
INSERT INTO `detail_products` VALUES (31, 16, 'M', 'đen', 23);
INSERT INTO `detail_products` VALUES (32, 16, 'L', 'đen', 23);
INSERT INTO `detail_products` VALUES (33, 17, 'M', 'lam', 23);
INSERT INTO `detail_products` VALUES (34, 17, 'L', 'cam', 23);
INSERT INTO `detail_products` VALUES (35, 17, 'L', 'xanh', 23);
INSERT INTO `detail_products` VALUES (36, 17, 'XL', 'xám', 23);
INSERT INTO `detail_products` VALUES (37, 17, 'M', 'đỏ', 23);
INSERT INTO `detail_products` VALUES (38, 18, 'M', 'đỏ', 3);
INSERT INTO `detail_products` VALUES (39, 18, 'M', 'vàng', 4);
INSERT INTO `detail_products` VALUES (40, 18, 'L', 'lam', 5);
INSERT INTO `detail_products` VALUES (41, 18, 'M', 'cam', 5);
INSERT INTO `detail_products` VALUES (42, 18, 'M', 'đen', 6);
INSERT INTO `detail_products` VALUES (43, 19, 'M', 'đen', 4);
INSERT INTO `detail_products` VALUES (44, 19, 'L', 'đen', 5);
INSERT INTO `detail_products` VALUES (45, 19, 'XL', 'đen', 6);
INSERT INTO `detail_products` VALUES (46, 19, 'X', 'đen', 7);
INSERT INTO `detail_products` VALUES (47, 2, 'S', 'đen', 8);
INSERT INTO `detail_products` VALUES (48, 20, 'L', 'đen', 3);
INSERT INTO `detail_products` VALUES (49, 20, 'M', 'đen', 4);
INSERT INTO `detail_products` VALUES (50, 21, 'M', 'đen', 5);
INSERT INTO `detail_products` VALUES (51, 21, 'L', 'đen', 6);
INSERT INTO `detail_products` VALUES (52, 21, 'XL', 'đen', 2);
INSERT INTO `detail_products` VALUES (53, 22, 'M', 'đen', 5);
INSERT INTO `detail_products` VALUES (54, 22, 'XL', 'đen', 5);
INSERT INTO `detail_products` VALUES (55, 23, 'X', 'đen', 5);
INSERT INTO `detail_products` VALUES (56, 23, 'M', 'đen', 12);
INSERT INTO `detail_products` VALUES (57, 23, 'L', 'đen', 11);
INSERT INTO `detail_products` VALUES (58, 23, 'XL', 'đen', 7);
INSERT INTO `detail_products` VALUES (59, 24, 'M', 'xám', 4);
INSERT INTO `detail_products` VALUES (60, 24, 'L', 'xám', 3);
INSERT INTO `detail_products` VALUES (61, 24, 'X', 'xám', 2);
INSERT INTO `detail_products` VALUES (62, 24, 'XL', 'xám', 3);
INSERT INTO `detail_products` VALUES (63, 25, 'M', 'xanh', 2);
INSERT INTO `detail_products` VALUES (64, 25, 'X', 'đỏ', 4);
INSERT INTO `detail_products` VALUES (65, 25, 'XL', 'vàng', 2);
INSERT INTO `detail_products` VALUES (66, 26, 'M', 'xanh', 3);
INSERT INTO `detail_products` VALUES (67, 26, 'L', 'đen', 5);
INSERT INTO `detail_products` VALUES (68, 26, 'M', 'trắng', 4);
INSERT INTO `detail_products` VALUES (69, 26, 'L', 'xám', 6);
INSERT INTO `detail_products` VALUES (70, 26, 'XL', 'xám', 7);
INSERT INTO `detail_products` VALUES (71, 27, 'M', 'đen', 5);
INSERT INTO `detail_products` VALUES (72, 27, 'M', 'xanh', 6);
INSERT INTO `detail_products` VALUES (73, 27, 'L', 'trắng', 7);
INSERT INTO `detail_products` VALUES (74, 27, 'M', 'đen', 8);
INSERT INTO `detail_products` VALUES (75, 27, 'L', 'đen', 20);
INSERT INTO `detail_products` VALUES (76, 28, 'M', 'trắng', 6);
INSERT INTO `detail_products` VALUES (77, 28, 'L', 'đen', 6);
INSERT INTO `detail_products` VALUES (78, 28, 'M', 'xám', 7);
INSERT INTO `detail_products` VALUES (79, 29, 'M', 'xám', 1);
INSERT INTO `detail_products` VALUES (80, 29, 'XL', 'xám', 3);
INSERT INTO `detail_products` VALUES (81, 29, 'L', 'xám', 11);
INSERT INTO `detail_products` VALUES (82, 3, 'S', 'cam', 8);
INSERT INTO `detail_products` VALUES (83, 30, 'M', 'đỏ', 32);
INSERT INTO `detail_products` VALUES (84, 30, 'X', 'đỏ', 3);
INSERT INTO `detail_products` VALUES (85, 30, 'XL', 'đỏ', 43);
INSERT INTO `detail_products` VALUES (86, 31, 'L', 'đen', 22);
INSERT INTO `detail_products` VALUES (87, 31, 'M', 'trắng', 3);
INSERT INTO `detail_products` VALUES (88, 32, 'M', 'đen', 22);
INSERT INTO `detail_products` VALUES (89, 32, 'L', 'đen', 22);
INSERT INTO `detail_products` VALUES (90, 32, 'XL', 'đen', 22);
INSERT INTO `detail_products` VALUES (91, 33, 'M', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (92, 33, 'M', 'xám', 32);
INSERT INTO `detail_products` VALUES (93, 33, 'L', 'đỏ', 44);
INSERT INTO `detail_products` VALUES (94, 33, 'L', 'xám', 1);
INSERT INTO `detail_products` VALUES (95, 34, 'M', 'đen', 23);
INSERT INTO `detail_products` VALUES (96, 34, 'L', 'đen', 56);
INSERT INTO `detail_products` VALUES (97, 35, 'M', 'đen', 21);
INSERT INTO `detail_products` VALUES (98, 35, 'XL', 'đen', 12);
INSERT INTO `detail_products` VALUES (99, 36, 'X', 'đỏ', 1);
INSERT INTO `detail_products` VALUES (100, 36, 'L', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (101, 37, 'L', 'đen', 12);
INSERT INTO `detail_products` VALUES (102, 37, 'M', 'đen', 12);
INSERT INTO `detail_products` VALUES (103, 38, 'L', 'đen', 1);
INSERT INTO `detail_products` VALUES (104, 38, 'M', 'đen', 2);
INSERT INTO `detail_products` VALUES (105, 39, 'XL', 'đen', 1);
INSERT INTO `detail_products` VALUES (106, 39, 'S', 'đen', 2);
INSERT INTO `detail_products` VALUES (107, 39, 'X', 'đen', 1);
INSERT INTO `detail_products` VALUES (108, 4, 'S', 'Trắng', 9);
INSERT INTO `detail_products` VALUES (109, 40, 'M', 'đỏ', 3);
INSERT INTO `detail_products` VALUES (110, 40, 'L', 'xám', 4);
INSERT INTO `detail_products` VALUES (111, 40, 'X', 'trắng', 5);
INSERT INTO `detail_products` VALUES (112, 40, 'L', 'xanh', 4);
INSERT INTO `detail_products` VALUES (113, 40, 'M', 'trắng', 4);
INSERT INTO `detail_products` VALUES (114, 41, 'M', 'lam', 6);
INSERT INTO `detail_products` VALUES (115, 41, 'L', 'lam', 6);
INSERT INTO `detail_products` VALUES (116, 41, 'XL', 'lam', 6);
INSERT INTO `detail_products` VALUES (117, 42, 'L', 'đen', 8);
INSERT INTO `detail_products` VALUES (118, 42, 'M', 'đen', 8);
INSERT INTO `detail_products` VALUES (119, 43, 'M', 'vàng', 8);
INSERT INTO `detail_products` VALUES (120, 43, 'L', 'trắng', 8);
INSERT INTO `detail_products` VALUES (121, 43, 'X', 'đỏ', 8);
INSERT INTO `detail_products` VALUES (122, 43, 'XL', 'đen', 8);
INSERT INTO `detail_products` VALUES (123, 43, 'L', 'xám', 8);
INSERT INTO `detail_products` VALUES (124, 43, 'L', 'nhám', 8);
INSERT INTO `detail_products` VALUES (125, 44, 'L', 'nâu', 7);
INSERT INTO `detail_products` VALUES (126, 44, 'XL', 'nâu', 7);
INSERT INTO `detail_products` VALUES (127, 45, 'L', 'đỏ', 7);
INSERT INTO `detail_products` VALUES (128, 45, 'L', 'hồng', 7);
INSERT INTO `detail_products` VALUES (129, 45, 'L', 'lam', 7);
INSERT INTO `detail_products` VALUES (130, 45, 'L', 'xám', 8);
INSERT INTO `detail_products` VALUES (131, 45, 'XL', 'nâu', 8);
INSERT INTO `detail_products` VALUES (132, 45, 'XL', 'cam', 8);
INSERT INTO `detail_products` VALUES (133, 45, 'XL', 'xanh', 8);
INSERT INTO `detail_products` VALUES (134, 46, 'XL', 'hồng', 8);
INSERT INTO `detail_products` VALUES (135, 46, 'XL', 'vàng', 8);
INSERT INTO `detail_products` VALUES (136, 46, 'XL', 'kem', 8);
INSERT INTO `detail_products` VALUES (137, 46, 'L', 'cam', 5);
INSERT INTO `detail_products` VALUES (138, 46, 'L', 'đỏ', 5);
INSERT INTO `detail_products` VALUES (139, 46, 'L', 'xám', 5);
INSERT INTO `detail_products` VALUES (140, 46, 'M', 'trắng', 5);
INSERT INTO `detail_products` VALUES (141, 46, 'S', 'lam', 4);
INSERT INTO `detail_products` VALUES (142, 46, 'L', 'đen', 4);
INSERT INTO `detail_products` VALUES (143, 47, 'L', 'xám', 8);
INSERT INTO `detail_products` VALUES (144, 47, 'M', 'đỏ', 8);
INSERT INTO `detail_products` VALUES (145, 47, 'L', 'đen', 8);
INSERT INTO `detail_products` VALUES (146, 47, 'L', 'lam', 8);
INSERT INTO `detail_products` VALUES (147, 48, 'M', 'đỏ', 14);
INSERT INTO `detail_products` VALUES (148, 48, 'M', 'cam', 14);
INSERT INTO `detail_products` VALUES (149, 48, 'M', 'xám', 14);
INSERT INTO `detail_products` VALUES (150, 48, 'L', 'nâu', 14);
INSERT INTO `detail_products` VALUES (151, 48, 'L', 'lam', 14);
INSERT INTO `detail_products` VALUES (152, 48, 'X', 'trắng', 14);
INSERT INTO `detail_products` VALUES (153, 49, 'L', 'tím', 20);
INSERT INTO `detail_products` VALUES (154, 49, 'M', 'đen', 20);
INSERT INTO `detail_products` VALUES (155, 49, 'L', 'trắng', 20);
INSERT INTO `detail_products` VALUES (156, 5, 'L', 'cam', 9);
INSERT INTO `detail_products` VALUES (157, 50, 'L', 'hồng', 14);
INSERT INTO `detail_products` VALUES (158, 50, 'L', 'vàng', 14);
INSERT INTO `detail_products` VALUES (159, 50, 'L', 'xám', 14);
INSERT INTO `detail_products` VALUES (160, 50, 'M', 'lam', 14);
INSERT INTO `detail_products` VALUES (161, 51, 'L', 'xanh', 31);
INSERT INTO `detail_products` VALUES (162, 51, 'M', 'lam', 31);
INSERT INTO `detail_products` VALUES (163, 51, 'M', 'đỏ', 31);
INSERT INTO `detail_products` VALUES (164, 51, 'L', 'cam', 31);
INSERT INTO `detail_products` VALUES (165, 51, 'L', 'hồng', 31);
INSERT INTO `detail_products` VALUES (166, 52, 'L', 'xanh', 17);
INSERT INTO `detail_products` VALUES (167, 52, 'L', 'cam', 17);
INSERT INTO `detail_products` VALUES (168, 52, 'L', 'đỏ', 17);
INSERT INTO `detail_products` VALUES (169, 52, 'M', 'hồng', 17);
INSERT INTO `detail_products` VALUES (170, 52, 'M', 'lam', 17);
INSERT INTO `detail_products` VALUES (171, 52, 'M', 'vàng', 17);
INSERT INTO `detail_products` VALUES (172, 53, 'L', 'xanh', 15);
INSERT INTO `detail_products` VALUES (173, 53, 'L', 'vàng', 15);
INSERT INTO `detail_products` VALUES (174, 53, 'XL', 'đỏ', 15);
INSERT INTO `detail_products` VALUES (175, 53, 'X', 'cam', 15);
INSERT INTO `detail_products` VALUES (176, 53, 'S', 'cam', 15);
INSERT INTO `detail_products` VALUES (177, 54, 'M', 'cam', 12);
INSERT INTO `detail_products` VALUES (178, 54, 'M', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (179, 54, 'L', 'lam', 12);
INSERT INTO `detail_products` VALUES (180, 54, 'L', 'xanh', 12);
INSERT INTO `detail_products` VALUES (181, 55, 'M', 'vàng', 12);
INSERT INTO `detail_products` VALUES (182, 55, 'M', 'lam', 3);
INSERT INTO `detail_products` VALUES (183, 55, 'L', 'hồng', 3);
INSERT INTO `detail_products` VALUES (184, 55, 'L', 'cam', 1);
INSERT INTO `detail_products` VALUES (185, 56, 'M', 'xanh', 8);
INSERT INTO `detail_products` VALUES (186, 56, 'L', 'xanh', 7);
INSERT INTO `detail_products` VALUES (187, 57, 'M', 'xanh', 3);
INSERT INTO `detail_products` VALUES (188, 57, 'XL', 'xanh', 2);
INSERT INTO `detail_products` VALUES (189, 58, 'M', 'vàng', 1);
INSERT INTO `detail_products` VALUES (190, 58, 'L', 'vàng', 3);
INSERT INTO `detail_products` VALUES (191, 59, 'M', 'hồng', 1);
INSERT INTO `detail_products` VALUES (192, 59, 'S', 'hồng', 5);
INSERT INTO `detail_products` VALUES (193, 6, 'M', 'đen', 3);
INSERT INTO `detail_products` VALUES (194, 6, 'X', 'đen', 15);
INSERT INTO `detail_products` VALUES (195, 6, 'L', 'đen', 20);
INSERT INTO `detail_products` VALUES (196, 7, 'L', 'đen', 2);
INSERT INTO `detail_products` VALUES (197, 7, 'X', 'đen', 5);
INSERT INTO `detail_products` VALUES (198, 8, 'XL', 'đen', 83);
INSERT INTO `detail_products` VALUES (199, 8, 'L', 'đen', 2);
INSERT INTO `detail_products` VALUES (200, 8, 'M', 'đen', 3);
INSERT INTO `detail_products` VALUES (201, 9, 'X', 'đen', 22);
INSERT INTO `detail_products` VALUES (202, 9, 'M', 'đen', 31);
INSERT INTO `detail_products` VALUES (203, 9, 'L', 'đen', 1);
INSERT INTO `detail_products` VALUES (204, 9, 'S', 'đen', 2);
INSERT INTO `detail_products` VALUES (205, 62, 'M', 'đen', 13);
INSERT INTO `detail_products` VALUES (206, 65, '2', 'cam', 1);
INSERT INTO `detail_products` VALUES (207, 66, '2', 'cam', 2);
INSERT INTO `detail_products` VALUES (208, 67, 'M', 'đỏ', 5);
INSERT INTO `detail_products` VALUES (209, 67, 'M', 'xanh', 19);
INSERT INTO `detail_products` VALUES (210, 67, 'L', 'trắng', 3);
INSERT INTO `detail_products` VALUES (211, 68, 'L', 'đen', 10);
INSERT INTO `detail_products` VALUES (212, 68, 'L', 'trắng', 11);
INSERT INTO `detail_products` VALUES (213, 69, 'M', 'hồng', 20);
INSERT INTO `detail_products` VALUES (214, 69, 'L', 'đen', 21);
INSERT INTO `detail_products` VALUES (215, 69, 'L', 'xanh', 2);
INSERT INTO `detail_products` VALUES (216, 70, 'L', 'đen', 10);
INSERT INTO `detail_products` VALUES (217, 71, 'M', 'đen', 20);
INSERT INTO `detail_products` VALUES (218, 71, 'M', 'đỏ', 11);
INSERT INTO `detail_products` VALUES (219, 71, 'M', 'xanh', 39);
INSERT INTO `detail_products` VALUES (220, 72, 'L', 'đen', 29);
INSERT INTO `detail_products` VALUES (221, 72, 'L', 'xám', 32);
INSERT INTO `detail_products` VALUES (222, 72, 'M', 'nhám', 12);
INSERT INTO `detail_products` VALUES (223, 73, 'L', 'đen', 11);
INSERT INTO `detail_products` VALUES (224, 73, 'L', 'cam', 2);
INSERT INTO `detail_products` VALUES (225, 73, 'M', 'xám', 4);
INSERT INTO `detail_products` VALUES (226, 74, 'L', 'vàng', 5);
INSERT INTO `detail_products` VALUES (227, 74, 'M', 'cam', 22);
INSERT INTO `detail_products` VALUES (228, 74, 'M', 'đen', 33);
INSERT INTO `detail_products` VALUES (229, 75, 'M', 'đen', 12);
INSERT INTO `detail_products` VALUES (230, 75, 'L', 'hồng', 32);
INSERT INTO `detail_products` VALUES (231, 75, 'L', 'xám', 8);
INSERT INTO `detail_products` VALUES (232, 76, 'M', 'đen', 32);
INSERT INTO `detail_products` VALUES (233, 76, 'M', 'đỏ', 2);
INSERT INTO `detail_products` VALUES (234, 76, 'M', 'trắng', 23);
INSERT INTO `detail_products` VALUES (235, 77, 'L', 'xanh', 32);
INSERT INTO `detail_products` VALUES (236, 77, 'L', 'đen', 3);
INSERT INTO `detail_products` VALUES (237, 77, 'L', 'xám', 54);
INSERT INTO `detail_products` VALUES (238, 78, 'L', 'xanh', 21);
INSERT INTO `detail_products` VALUES (239, 79, 'M', 'đen', 32);
INSERT INTO `detail_products` VALUES (240, 79, 'L', 'vàng', 2);
INSERT INTO `detail_products` VALUES (241, 79, 'M', 'đỏ', 3);
INSERT INTO `detail_products` VALUES (242, 80, 'M', 'xanh', 4);
INSERT INTO `detail_products` VALUES (243, 80, 'M', 'xám', 21);
INSERT INTO `detail_products` VALUES (244, 80, 'L', 'đen', 21);
INSERT INTO `detail_products` VALUES (245, 81, 'M', 'xanh', 3);
INSERT INTO `detail_products` VALUES (246, 81, 'L', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (247, 81, 'M', 'trắng', 32);
INSERT INTO `detail_products` VALUES (248, 82, 'L', 'xanh', 2);
INSERT INTO `detail_products` VALUES (249, 82, 'L', 'đen', 34);
INSERT INTO `detail_products` VALUES (250, 82, 'L', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (251, 83, 'M', 'cam', 3);
INSERT INTO `detail_products` VALUES (252, 83, 'L', 'xanh', 23);
INSERT INTO `detail_products` VALUES (253, 84, 'L', 'cam', 1);
INSERT INTO `detail_products` VALUES (254, 84, 'L', 'xanh', 32);
INSERT INTO `detail_products` VALUES (255, 84, 'M', 'đen', 21);
INSERT INTO `detail_products` VALUES (256, 85, 'L', 'trắng', 12);
INSERT INTO `detail_products` VALUES (257, 85, 'M', 'cam', 21);
INSERT INTO `detail_products` VALUES (258, 85, 'M', 'đen', 5);
INSERT INTO `detail_products` VALUES (259, 86, 'L', 'đen', 10);
INSERT INTO `detail_products` VALUES (260, 86, 'L', 'xanh', 11);
INSERT INTO `detail_products` VALUES (261, 87, 'L', 'cam', 21);
INSERT INTO `detail_products` VALUES (262, 87, 'M', 'đỏ', 12);
INSERT INTO `detail_products` VALUES (263, 87, 'M', 'hồng', 11);
INSERT INTO `detail_products` VALUES (264, 88, 'L', 'đen', 32);
INSERT INTO `detail_products` VALUES (265, 88, 'L', 'đỏ', 21);
INSERT INTO `detail_products` VALUES (266, 88, 'L', 'xanh', 21);
INSERT INTO `detail_products` VALUES (267, 89, 'M', 'xám', 2);
INSERT INTO `detail_products` VALUES (268, 89, 'M', 'trắng', 3);
INSERT INTO `detail_products` VALUES (269, 90, 'L', 'đỏ', 21);
INSERT INTO `detail_products` VALUES (270, 90, 'L', 'xám', 21);
INSERT INTO `detail_products` VALUES (271, 91, 'M', 'đen', 2);
INSERT INTO `detail_products` VALUES (272, 91, 'L', 'hồng', 4);
INSERT INTO `detail_products` VALUES (273, 91, 'L', 'xanh', 32);
INSERT INTO `detail_products` VALUES (274, 92, 'M', 'xanh lục', 21);
INSERT INTO `detail_products` VALUES (275, 92, 'L', 'xanh dương', 1);
INSERT INTO `detail_products` VALUES (276, 92, 'M', 'đen', 21);
INSERT INTO `detail_products` VALUES (277, 93, 'L', 'đen', 12);
INSERT INTO `detail_products` VALUES (278, 93, 'M', 'xám', 32);
INSERT INTO `detail_products` VALUES (279, 93, 'L', 'trắng', 11);
INSERT INTO `detail_products` VALUES (280, 94, 'L', 'đen', 23);
INSERT INTO `detail_products` VALUES (281, 94, 'M', 'đỏ', 21);
INSERT INTO `detail_products` VALUES (282, 94, 'M', 'xanh', 21);
INSERT INTO `detail_products` VALUES (283, 95, 'L', 'xanh', 12);
INSERT INTO `detail_products` VALUES (284, 95, 'M', 'xám', 12);
INSERT INTO `detail_products` VALUES (285, 95, 'L', 'trắng', 1);
INSERT INTO `detail_products` VALUES (286, 96, 'L', 'đen', 3);
INSERT INTO `detail_products` VALUES (287, 96, 'L', 'lục', 23);
INSERT INTO `detail_products` VALUES (288, 96, 'M', 'lam', 23);
INSERT INTO `detail_products` VALUES (289, 97, 'M', 'lam', 2);
INSERT INTO `detail_products` VALUES (290, 98, 'L', 'hồng', 4);
INSERT INTO `detail_products` VALUES (291, 99, 'L', 'lam', 12);
INSERT INTO `detail_products` VALUES (292, 100, 'M', 'xanh', 32);
INSERT INTO `detail_products` VALUES (293, 100, 'L', 'đen', 4);

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id_img` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NULL DEFAULT NULL,
  `link_image` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_img`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 442 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (1, 1, 'img/pk01-xam.jpg', '1');
INSERT INTO `images` VALUES (2, 1, 'img/pk01-cam.jpg', '1');
INSERT INTO `images` VALUES (3, 1, 'img/pk01-den-nham.jpg', '1');
INSERT INTO `images` VALUES (4, 10, 'img/5.jpg', '1');
INSERT INTO `images` VALUES (5, 11, 'img/61.jpg', '1');
INSERT INTO `images` VALUES (6, 11, 'img/62.jpg', '1');
INSERT INTO `images` VALUES (7, 11, 'img/63.jpg', '1');
INSERT INTO `images` VALUES (8, 11, 'img/64.jpg', '1');
INSERT INTO `images` VALUES (9, 12, 'img/71.jpg', '1');
INSERT INTO `images` VALUES (10, 12, 'img/72.jpg', '1');
INSERT INTO `images` VALUES (11, 13, 'img/81.png', '1');
INSERT INTO `images` VALUES (12, 13, 'img/82.png', '1');
INSERT INTO `images` VALUES (13, 14, 'img/91.jpg', '1');
INSERT INTO `images` VALUES (14, 14, 'img/92.jpg', '1');
INSERT INTO `images` VALUES (15, 14, 'img/93.jpg', '1');
INSERT INTO `images` VALUES (16, 14, 'img/94.jpg', '1');
INSERT INTO `images` VALUES (17, 15, 'img/101.jpg', '1');
INSERT INTO `images` VALUES (18, 15, 'img/102.jpg', '1');
INSERT INTO `images` VALUES (19, 15, 'img/103.jpg', '1');
INSERT INTO `images` VALUES (20, 15, 'img/104.jpg', '1');
INSERT INTO `images` VALUES (21, 15, 'img/105.jpg', '1');
INSERT INTO `images` VALUES (22, 15, 'img/106.jpg', '1');
INSERT INTO `images` VALUES (23, 15, 'img/107.jpg', '1');
INSERT INTO `images` VALUES (24, 15, 'img/108.jpg', '1');
INSERT INTO `images` VALUES (25, 15, 'img/109.jpg', '1');
INSERT INTO `images` VALUES (26, 16, 'img/11.jpg', '1');
INSERT INTO `images` VALUES (27, 17, 'img/121.jpg', '1');
INSERT INTO `images` VALUES (28, 17, 'img/122.jpg', '1');
INSERT INTO `images` VALUES (29, 17, 'img/123.jpg', '1');
INSERT INTO `images` VALUES (30, 17, 'img/124.jpg', '1');
INSERT INTO `images` VALUES (31, 17, 'img/125.jpg', '1');
INSERT INTO `images` VALUES (32, 18, 'img/131.jpg', '1');
INSERT INTO `images` VALUES (33, 18, 'img/132.jpg', '1');
INSERT INTO `images` VALUES (34, 18, 'img/133.jpg', '1');
INSERT INTO `images` VALUES (35, 18, 'img/134.jpg', '1');
INSERT INTO `images` VALUES (36, 18, 'img/135.jpg', '1');
INSERT INTO `images` VALUES (37, 18, 'img/136.jpg', '1');
INSERT INTO `images` VALUES (38, 19, 'img/141.png', '1');
INSERT INTO `images` VALUES (39, 19, 'img/142.png', '1');
INSERT INTO `images` VALUES (40, 19, 'img/143.png', '1');
INSERT INTO `images` VALUES (41, 19, 'img/144.png', '1');
INSERT INTO `images` VALUES (42, 2, 'img/p16-den.jpg', '1');
INSERT INTO `images` VALUES (43, 2, 'img/p16-den-nham_2.jpg', '1');
INSERT INTO `images` VALUES (44, 20, 'img/15.jpg', '1');
INSERT INTO `images` VALUES (45, 21, 'img/161.jpg', '1');
INSERT INTO `images` VALUES (46, 21, 'img/162.jpg', '1');
INSERT INTO `images` VALUES (47, 21, 'img/163.jpg', '1');
INSERT INTO `images` VALUES (48, 21, 'img/164.jpg', '1');
INSERT INTO `images` VALUES (49, 21, 'img/165.jpg', '1');
INSERT INTO `images` VALUES (50, 22, 'img/171.png', '1');
INSERT INTO `images` VALUES (51, 22, 'img/172.png', '1');
INSERT INTO `images` VALUES (52, 22, 'img/173.png', '1');
INSERT INTO `images` VALUES (53, 22, 'img/174.png', '1');
INSERT INTO `images` VALUES (54, 23, 'img/181.jpg', '1');
INSERT INTO `images` VALUES (55, 23, 'img/182.png', '1');
INSERT INTO `images` VALUES (56, 23, 'img/183.png', '1');
INSERT INTO `images` VALUES (57, 23, 'img/184.png', '1');
INSERT INTO `images` VALUES (58, 23, 'img/185.png', '1');
INSERT INTO `images` VALUES (59, 23, 'img/186.png', '1');
INSERT INTO `images` VALUES (60, 23, 'img/187.png', '1');
INSERT INTO `images` VALUES (61, 23, 'img/188.jpg', '1');
INSERT INTO `images` VALUES (62, 24, 'img/191.jpg', '1');
INSERT INTO `images` VALUES (63, 24, 'img/192.jpg', '1');
INSERT INTO `images` VALUES (64, 24, 'img/193.jpg', '1');
INSERT INTO `images` VALUES (65, 24, 'img/194.jpg', '1');
INSERT INTO `images` VALUES (66, 24, 'img/195.jpg', '1');
INSERT INTO `images` VALUES (67, 24, 'img/196.jpg', '1');
INSERT INTO `images` VALUES (68, 25, 'img/201.jpg', '1');
INSERT INTO `images` VALUES (69, 25, 'img/202.jpg', '1');
INSERT INTO `images` VALUES (70, 25, 'img/203.jpg', '1');
INSERT INTO `images` VALUES (71, 25, 'img/204.jpg', '1');
INSERT INTO `images` VALUES (72, 25, 'img/205.jpg', '1');
INSERT INTO `images` VALUES (73, 26, 'img/211.jpg', '1');
INSERT INTO `images` VALUES (74, 26, 'img/212.jpg', '1');
INSERT INTO `images` VALUES (75, 26, 'img/213.jpg', '1');
INSERT INTO `images` VALUES (76, 26, 'img/214.jpg', '1');
INSERT INTO `images` VALUES (77, 26, 'img/215.jpg', '1');
INSERT INTO `images` VALUES (78, 27, 'img/221.jpg', '1');
INSERT INTO `images` VALUES (79, 27, 'img/222.jpg', '1');
INSERT INTO `images` VALUES (80, 27, 'img/223.jpg', '1');
INSERT INTO `images` VALUES (81, 27, 'img/224.jpg', '1');
INSERT INTO `images` VALUES (82, 27, 'img/225.jpg', '1');
INSERT INTO `images` VALUES (83, 27, 'img/226.jpg', '1');
INSERT INTO `images` VALUES (84, 28, 'img/231.png', '1');
INSERT INTO `images` VALUES (85, 28, 'img/232.png', '1');
INSERT INTO `images` VALUES (86, 28, 'img/233.png', '1');
INSERT INTO `images` VALUES (87, 29, 'img/241.jpg', '1');
INSERT INTO `images` VALUES (88, 29, 'img/242.jpg', '1');
INSERT INTO `images` VALUES (89, 29, 'img/243.jpg', '1');
INSERT INTO `images` VALUES (90, 29, 'img/244.jpg', '1');
INSERT INTO `images` VALUES (91, 3, 'img/falcon.png', '1');
INSERT INTO `images` VALUES (92, 3, 'img/falcon_2.png', '1');
INSERT INTO `images` VALUES (93, 30, 'img/251.jpg', '1');
INSERT INTO `images` VALUES (94, 30, 'img/252.jpg', '1');
INSERT INTO `images` VALUES (95, 30, 'img/253.jpg', '1');
INSERT INTO `images` VALUES (96, 30, 'img/254.jpg', '1');
INSERT INTO `images` VALUES (97, 31, 'img/261.jpg', '1');
INSERT INTO `images` VALUES (98, 31, 'img/262.jpg', '1');
INSERT INTO `images` VALUES (99, 32, 'img/271.jpg', '1');
INSERT INTO `images` VALUES (100, 32, 'img/272.jpg', '1');
INSERT INTO `images` VALUES (101, 32, 'img/273.jpg', '1');
INSERT INTO `images` VALUES (102, 32, 'img/274.jpg', '1');
INSERT INTO `images` VALUES (103, 32, 'img/275.jpg', '1');
INSERT INTO `images` VALUES (104, 33, 'img/281.jpg', '1');
INSERT INTO `images` VALUES (105, 33, 'img/282.jpg', '1');
INSERT INTO `images` VALUES (106, 34, 'img/29.png', '1');
INSERT INTO `images` VALUES (107, 35, 'img/30.png', '1');
INSERT INTO `images` VALUES (108, 36, 'img/31.jpg', '1');
INSERT INTO `images` VALUES (109, 37, 'img/32.jpg', '1');
INSERT INTO `images` VALUES (110, 38, 'img/33.jpg', '1');
INSERT INTO `images` VALUES (111, 39, 'img/34.png', '1');
INSERT INTO `images` VALUES (112, 4, 'img/11538e70cec90bc275b7dced84aecc21.jfif', '1');
INSERT INTO `images` VALUES (113, 40, 'img/falcon_2.png', '1');
INSERT INTO `images` VALUES (114, 5, 'img/sg-11134201-22110-gb5qgrokhyjvd2.jfif', '1');
INSERT INTO `images` VALUES (115, 6, 'img/1.jpg', '1');
INSERT INTO `images` VALUES (116, 7, 'img/21.jpg', '1');
INSERT INTO `images` VALUES (117, 7, 'img/22.png', '1');
INSERT INTO `images` VALUES (118, 8, 'img/3.jpg', '1');
INSERT INTO `images` VALUES (119, 9, 'img/41.png', '1');
INSERT INTO `images` VALUES (120, 9, 'img/42.png', '1');
INSERT INTO `images` VALUES (121, 9, 'img/43.png', '1');
INSERT INTO `images` VALUES (122, 9, 'img/44.png', '1');
INSERT INTO `images` VALUES (123, 87, 'img/Non-nua-dau-sunda-135D-3.jpg', '1');
INSERT INTO `images` VALUES (124, 41, 'img/3S382H-Nham-Den-1.jpg', '1');
INSERT INTO `images` VALUES (125, 41, 'img/3S382H-Nham-Xanh-1.jpg', '1');
INSERT INTO `images` VALUES (126, 41, 'img/3S382H-Nham-Xanh-3-768x768.jpg', '1');
INSERT INTO `images` VALUES (127, 41, 'img/3S382H-Nham-Xanh-4-768x768.jpg', '1');
INSERT INTO `images` VALUES (128, 41, 'img/3S382H-Nham-Xanh-5-768x768.jpg', '1');
INSERT INTO `images` VALUES (129, 41, 'img/3S382H-Nham-Xanh-6-768x768.jpg', '1');
INSERT INTO `images` VALUES (130, 42, 'img/5e59e49bffcdc07522c8fbfd0ecf6e5b-768x768.jpg', '1');
INSERT INTO `images` VALUES (131, 42, 'img/bb47aaa907e0491da66d58fd52fd3f00.jpg', '1');
INSERT INTO `images` VALUES (132, 43, 'img/b5w1kq_MG_8633.jpg', '1');
INSERT INTO `images` VALUES (133, 43, 'img/nb4pQX_MG_8638.jpg', '1');
INSERT INTO `images` VALUES (134, 43, 'img/Nj2XlL_MG_8639.jpg', '1');
INSERT INTO `images` VALUES (135, 43, 'img/of3MY8_MG_8636.jpg', '1');
INSERT INTO `images` VALUES (136, 43, 'img/y5cqFR_MG_8637.jpg', '1');
INSERT INTO `images` VALUES (137, 44, 'img/non-gau-nau-2.jpg', '1');
INSERT INTO `images` VALUES (138, 44, 'img/non-gau-nau-1.jpg', '1');
INSERT INTO `images` VALUES (139, 44, 'img/non-gau-nau-3.jpg', '1');
INSERT INTO `images` VALUES (140, 44, 'img/non-gau-nau-4.jpg', '1');
INSERT INTO `images` VALUES (141, 45, 'img/ada40b655d0a47c4dd0e2c18f9320fc1.jpg_720x720q80.jpg', '1');
INSERT INTO `images` VALUES (142, 45, 'img/napoli-189-size-m-mu-bao-hiem-tre-em-3-4-co-kinh-3-300x300.jpg', '1');
INSERT INTO `images` VALUES (143, 46, 'img/non-bao-hiem-3-4-gia-re-napoly-14-768x768.jpg', '1');
INSERT INTO `images` VALUES (144, 46, 'img/non-bao-hiem-3-4-gia-re-napoly-15-768x768.jpg', '1');
INSERT INTO `images` VALUES (145, 46, 'img/non-bao-hiem-3-4-gia-re-napoly-17-768x768.jpg', '1');
INSERT INTO `images` VALUES (146, 46, 'img/non-bao-hiem-3-4-gia-re-napoly-24-768x768.jpg', '1');
INSERT INTO `images` VALUES (147, 47, 'img/non-bao-hiem-andes-size-lon-kinh-dau-8-768x768.jpg', '1');
INSERT INTO `images` VALUES (148, 47, 'img/non-bao-hiem-andes-size-lon-kinh-dau-25-768x768.jpg', '1');
INSERT INTO `images` VALUES (149, 47, 'img/non-bao-hiem-andes-size-lon-kinh-dau-27-768x768.jpg', '1');
INSERT INTO `images` VALUES (150, 48, 'img/non-grs-a780k-nho-gon-1-768x768.jpg', '1');
INSERT INTO `images` VALUES (151, 48, 'img/non-grs-a780k-nho-gon-4-768x768.jpg', '1');
INSERT INTO `images` VALUES (152, 48, 'img/non-grs-a780k-nho-gon-8-768x768.jpg', '1');
INSERT INTO `images` VALUES (153, 49, 'img/non-grs-a649-kinh-1-768x768.jpg', '1');
INSERT INTO `images` VALUES (154, 49, 'img/non-grs-a649-kinh-10-768x768.jpg', '1');
INSERT INTO `images` VALUES (155, 49, 'img/non-grs-a649-kinh-12-768x768.jpg', '1');
INSERT INTO `images` VALUES (156, 50, 'img/non-bao-hiem-con-vit-1.jpg', '1');
INSERT INTO `images` VALUES (157, 51, 'img/non-tre-em-basecamp-1.jpg', '1');
INSERT INTO `images` VALUES (158, 51, 'img/non-tre-em-basecamp-2.jpg', '1');
INSERT INTO `images` VALUES (159, 51, 'img/non-tre-em-basecamp-3.jpg', '1');
INSERT INTO `images` VALUES (160, 51, 'img/non-tre-em-basecamp-4.jpg', '1');
INSERT INTO `images` VALUES (312, 52, 'img/non-xe-dap-JC-20-1.jpg', '1');
INSERT INTO `images` VALUES (313, 52, 'img/non-xe-dap-JC-20-2.jpg', '1');
INSERT INTO `images` VALUES (314, 52, 'img/non-xe-dap-JC-20-3.jpg', '1');
INSERT INTO `images` VALUES (315, 52, 'img/non-xe-dap-JC-20-4.jpg', '1');
INSERT INTO `images` VALUES (316, 53, 'img/non-xe-dap-tre-em-kiho-1.jpg', '1');
INSERT INTO `images` VALUES (317, 53, 'img/non-xe-dap-tre-em-kiho-2.jpg', '1');
INSERT INTO `images` VALUES (318, 53, 'img/non-xe-dap-tre-em-kiho-3.jpg', '1');
INSERT INTO `images` VALUES (319, 53, 'img/non-xe-dap-tre-em-kiho-4.jpg', '1');
INSERT INTO `images` VALUES (320, 54, 'img/non-xe-dap-tre-em-fornix-nm17.png', '1');
INSERT INTO `images` VALUES (321, 54, 'img/non-xe-dap-tre-em-fornix-nm17-2-1.jpg', '1');
INSERT INTO `images` VALUES (322, 54, 'img/non-xe-dap-tre-em-fornix-nm17-3-1.jpg', '1');
INSERT INTO `images` VALUES (323, 54, 'img/non-xe-dap-tre-em-fornix-nm17-4-1.jpg', '1');
INSERT INTO `images` VALUES (324, 55, 'img/mu-bao-hiem-cho-be-tap-di-mau-cam-1.jpg', '1');
INSERT INTO `images` VALUES (325, 55, 'img/mu-bao-hiem-cho-be-tap-di-mau-hong-1.jpg', '1');
INSERT INTO `images` VALUES (326, 55, 'img/mu-bao-hiem-cho-be-tap-di-mau-vang-1-1.jpg', '1');
INSERT INTO `images` VALUES (327, 55, 'img/mu-bao-hiem-cho-be-tap-di-mau-xanh-duong-1.jpg', '1');
INSERT INTO `images` VALUES (328, 56, 'img/non-bao-hiem-pikachu-full-dau-2.jpg', '1');
INSERT INTO `images` VALUES (329, 57, 'img/mu-bao-hiem-chim-canh-cut-6-768x768.jpg', '1');
INSERT INTO `images` VALUES (330, 58, 'img/non-bao-hiem-tre-em-3-4-doremon-co-tai-mau-hong-1.jpg', '1');
INSERT INTO `images` VALUES (331, 58, 'img/non-bao-hiem-tre-em-3-4-do-re-mon-co-tai-mau-trang-3.jpg', '1');
INSERT INTO `images` VALUES (332, 58, 'img/non-bao-hiem-tre-em-3-4-doremon-co-tai-mau-vang-4.jpg', '1');
INSERT INTO `images` VALUES (333, 58, 'img/non-bao-hiem-tre-em-3-4-doremon-co-tai-xanh-den-4.jpg', '1');
INSERT INTO `images` VALUES (334, 59, 'img/non-trum-dau-meo-tai-hong-2.jpg', '1');
INSERT INTO `images` VALUES (335, 65, 'img/non-trum-dau-GRS-a388-kinh-mat-2.jpg', '1');
INSERT INTO `images` VALUES (336, 65, 'img/non-trum-dau-GRS-a388-kinh-mat-11-768x768.jpg', '1');
INSERT INTO `images` VALUES (337, 65, 'img/non-trum-dau-GRS-a388-kinh-mat-12.jpg', '1');
INSERT INTO `images` VALUES (338, 65, 'img/non-trum-dau-GRS-a388-kinh-mat-13.jpg', '1');
INSERT INTO `images` VALUES (339, 65, 'img/non-trum-dau-GRS-a388-kinh-mat-14-768x768.jpg', '1');
INSERT INTO `images` VALUES (340, 66, 'img/Yohe-935-SV-xam-xi-mang.jpg', '1');
INSERT INTO `images` VALUES (341, 67, 'img/non-3-4-KYT-venom-1.jpg', '1');
INSERT INTO `images` VALUES (342, 67, 'img/non-3-4-KYT-venom-2.jpg', '1');
INSERT INTO `images` VALUES (343, 68, 'img/mu-3-4-royal-m787-1.jpg', '1');
INSERT INTO `images` VALUES (344, 68, 'img/mu-3-4-royal-m787-2.jpg', '1');
INSERT INTO `images` VALUES (345, 68, 'img/mu-3-4-royal-m787-3.jpg', '1');
INSERT INTO `images` VALUES (346, 69, 'img/mu-3-4-ls2-of603-infinity-soi-thuy-tinh.jpg', '1');
INSERT INTO `images` VALUES (347, 70, 'img/4SNrqJ_MG_9657.jpg', '1');
INSERT INTO `images` VALUES (348, 70, 'img/lANmFe_MG_9655.jpg', '1');
INSERT INTO `images` VALUES (349, 70, 'img/qKPAJv_MG_9659.jpg', '1');
INSERT INTO `images` VALUES (350, 71, 'img/Untitled-design-3-768x768.jpg', '1');
INSERT INTO `images` VALUES (351, 71, 'img/z3944091032531_073e53f6c2ecd558f831a4c3fc414a5d-768x768.jpg', '1');
INSERT INTO `images` VALUES (352, 71, 'img/z3944091055448_66b197f8a95ce7f8e1c51ad2da31b1ee-768x768.jpg', '1');
INSERT INTO `images` VALUES (353, 71, 'img/z3944091061859_ed49b68244e32cd493505803e22a468f-768x768.jpg', '1');
INSERT INTO `images` VALUES (354, 72, 'img/mu-3-4-smooth-carbon-1.jpg', '1');
INSERT INTO `images` VALUES (355, 72, 'img/mu-3-4-smooth-carbon-2.jpg', '1');
INSERT INTO `images` VALUES (356, 72, 'img/mu-3-4-smooth-carbon-3.jpg', '1');
INSERT INTO `images` VALUES (357, 73, 'img/mu-3-4-ego-e5-den-nham-1.jpg', '1');
INSERT INTO `images` VALUES (358, 73, 'img/mu-3-4-ego-e5-den-nham-2.jpg', '1');
INSERT INTO `images` VALUES (359, 73, 'img/mu-3-4-ego-e5-den-nham-3.jpg', '1');
INSERT INTO `images` VALUES (360, 74, 'img/mu-3-4-zeus-205-2-1.jpg', '1');
INSERT INTO `images` VALUES (361, 74, 'img/mu-3-4-zeus-205-2-2.jpg', '1');
INSERT INTO `images` VALUES (362, 74, 'img/mu-3-4-zeus-205-2-3.jpg', '1');
INSERT INTO `images` VALUES (363, 75, 'img/mu-3-4-napoli-n189-1.jpg', '1');
INSERT INTO `images` VALUES (364, 75, 'img/mu-3-4-napoli-n189-2.jpg', '1');
INSERT INTO `images` VALUES (365, 75, 'img/mu-3-4-napoli-n189-3.jpg', '1');
INSERT INTO `images` VALUES (366, 76, 'img/mu-3-4-zeus-613b-xam-1.jpg', '1');
INSERT INTO `images` VALUES (367, 76, 'img/mu-3-4-zeus-613b-xam-2.jpg', '1');
INSERT INTO `images` VALUES (368, 76, 'img/mu-3-4-zeus-613b-xam-3.jpg', '1');
INSERT INTO `images` VALUES (369, 77, 'img/mu-lat-ham-yohe-935sv-1.jpg', '1');
INSERT INTO `images` VALUES (370, 77, 'img/mu-lat-ham-yohe-935sv-2.jpg', '1');
INSERT INTO `images` VALUES (371, 78, 'img/mu-fullface-kyt-tt-course-leopard-1.jpg', '1');
INSERT INTO `images` VALUES (372, 78, 'img/mu-fullface-kyt-tt-course-leopard-2.jpg', '1');
INSERT INTO `images` VALUES (373, 78, 'img/mu-fullface-kyt-tt-course-leopard-3.jpg', '1');
INSERT INTO `images` VALUES (374, 79, 'img/mu-lat-ham-ego-e-9-den-da-quang-1.jpg', '1');
INSERT INTO `images` VALUES (375, 79, 'img/mu-lat-ham-ego-e-9-den-da-quang-2.jpg', '1');
INSERT INTO `images` VALUES (376, 79, 'img/mu-lat-ham-ego-e-9-den-da-quang-3.jpg', '1');
INSERT INTO `images` VALUES (377, 79, 'img/mu-lat-ham-ego-e-9-den-da-quang-4.jpg', '1');
INSERT INTO `images` VALUES (378, 80, 'img/mu-fullface-sunda-823-den-cam-vang-1.jpg', '1');
INSERT INTO `images` VALUES (379, 80, 'img/mu-fullface-sunda-823-den-cam-vang-2.jpg', '1');
INSERT INTO `images` VALUES (380, 80, 'img/mu-fullface-sunda-823-den-cam-vang-3.jpg', '1');
INSERT INTO `images` VALUES (381, 80, 'img/mu-fullface-sunda-823-den-cam-vang-4.jpg', '1');
INSERT INTO `images` VALUES (382, 81, 'img/mu-fullface-torc-t18-do-xanh-1.jpg', '1');
INSERT INTO `images` VALUES (383, 81, 'img/mu-fullface-torc-t18-do-xanh-2.jpg', '1');
INSERT INTO `images` VALUES (384, 81, 'img/mu-fullface-torc-t18-do-xanh-3.jpg', '1');
INSERT INTO `images` VALUES (385, 81, 'img/mu-fullface-torc-t18-do-xanh-4.jpg', '1');
INSERT INTO `images` VALUES (386, 82, 'img/mu-fullface-yohe-978-plus-srt-den-nham-2-1.jpg', '1');
INSERT INTO `images` VALUES (387, 82, 'img/mu-fullface-yohe-978-plus-srt-den-nham-2-2.jpg', '1');
INSERT INTO `images` VALUES (388, 82, 'img/mu-fullface-yohe-978-plus-srt-den-nham-2-3.jpg', '1');
INSERT INTO `images` VALUES (389, 82, 'img/mu-fullface-yohe-978-plus-srt-den-nham-2-4.jpg', '1');
INSERT INTO `images` VALUES (390, 83, 'img/mu-fullface-sunda-821-den-bong-1.jpg', '1');
INSERT INTO `images` VALUES (391, 83, 'img/mu-fullface-sunda-821-den-bong-2.jpg', '1');
INSERT INTO `images` VALUES (392, 83, 'img/mu-fullface-sunda-821-den-bong-3.jpg', '1');
INSERT INTO `images` VALUES (393, 83, 'img/mu-fullface-sunda-821-den-bong-4.jpg', '1');
INSERT INTO `images` VALUES (394, 84, 'img/mu-fullface-royal-m266-tem-plasma-1.jpg', '1');
INSERT INTO `images` VALUES (395, 84, 'img/mu-fullface-royal-m266-tem-plasma-2.jpg', '1');
INSERT INTO `images` VALUES (396, 84, 'img/mu-fullface-royal-m266-tem-plasma-3.jpg', '1');
INSERT INTO `images` VALUES (397, 84, 'img/mu-fullface-royal-m266-tem-plasma-4.jpg', '1');
INSERT INTO `images` VALUES (398, 85, 'img/mu-fullface-royal-m2661.jpg', '1');
INSERT INTO `images` VALUES (399, 85, 'img/mu-fullface-royal-m2662.jpg', '1');
INSERT INTO `images` VALUES (400, 85, 'img/mu-fullface-royal-m2663.jpg', '1');
INSERT INTO `images` VALUES (401, 85, 'img/mu-fullface-royal-m2664.jpg', '1');
INSERT INTO `images` VALUES (402, 86, 'img/mu-fullfac-ls2-of606-drifter-1.jpg', '1');
INSERT INTO `images` VALUES (403, 86, 'img/mu-fullfac-ls2-of606-drifter-2.jpg', '1');
INSERT INTO `images` VALUES (404, 86, 'img/mu-fullfac-ls2-of606-drifter-3.jpg', '1');
INSERT INTO `images` VALUES (405, 86, 'img/mu-fullfac-ls2-of606-drifter-4.jpg', '1');
INSERT INTO `images` VALUES (406, 88, 'img/mu-nua-dau-royal-m153k-do-nham-.jpg', '1');
INSERT INTO `images` VALUES (407, 88, 'img/mu-nua-dau-royal-m153k-do-nham-1.jpg', '1');
INSERT INTO `images` VALUES (408, 88, 'img/mu-nua-dau-royal-m153k-do-nham-2.jpg', '1');
INSERT INTO `images` VALUES (409, 89, 'img/non-xe-dap-royal-md15-trang-1.jpg', '1');
INSERT INTO `images` VALUES (410, 89, 'img/non-xe-dap-royal-md15-trang-2.jpg', '1');
INSERT INTO `images` VALUES (411, 89, 'img/non-xe-dap-royal-md15-trang-3.jpg', '1');
INSERT INTO `images` VALUES (412, 90, 'img/mu-nua-dau-royal-md16-xam-to-ong-1.jpg', '1');
INSERT INTO `images` VALUES (413, 90, 'img/mu-nua-dau-royal-md16-xam-to-ong-2.jpg', '1');
INSERT INTO `images` VALUES (414, 91, 'img/mu-nua-dau-royal-m156-den-nham-1.jpg', '1');
INSERT INTO `images` VALUES (415, 91, 'img/mu-nua-dau-royal-m156-den-nham-2.jpg', '1');
INSERT INTO `images` VALUES (416, 91, 'img/mu-nua-dau-royal-m156-den-nham-3.jpg', '1');
INSERT INTO `images` VALUES (417, 92, 'img/mu-nua-dau-asia-mt-106k-reu-nham-1.jpg', '1');
INSERT INTO `images` VALUES (418, 92, 'img/mu-nua-dau-asia-mt-106k-reu-nham-2.jpg', '1');
INSERT INTO `images` VALUES (419, 92, 'img/mu-nua-dau-asia-mt-106k-reu-nham-3.jpg', '1');
INSERT INTO `images` VALUES (420, 93, 'img/mu-nua-dau-dau-torc-t-55-den-bong-1.jpg', '1');
INSERT INTO `images` VALUES (421, 93, 'img/mu-nua-dau-dau-torc-t-55-den-bong-2.jpg', '1');
INSERT INTO `images` VALUES (422, 93, 'img/mu-nua-dau-dau-torc-t-55-den-bong-3.jpg', '1');
INSERT INTO `images` VALUES (423, 93, 'img/mu-nua-dau-dau-torc-t-55-den-bong-4.jpg', '1');
INSERT INTO `images` VALUES (424, 94, 'img/mu-nua-dau-asia-mt-139-do-nham-1.jpg', '1');
INSERT INTO `images` VALUES (425, 94, 'img/mu-nua-dau-asia-mt-139-do-nham-2.jpg', '1');
INSERT INTO `images` VALUES (426, 94, 'img/mu-nua-dau-asia-mt-139-do-nham-3.jpg', '1');
INSERT INTO `images` VALUES (427, 95, 'img/2356.jpg', '1');
INSERT INTO `images` VALUES (428, 95, 'img/12345.jpg', '1');
INSERT INTO `images` VALUES (429, 96, 'img/mu-1-2-napoli-s46-kinh-dau-1.jpg', '1');
INSERT INTO `images` VALUES (430, 96, 'img/mu-1-2-napoli-s46-kinh-dau-2.jpg', '1');
INSERT INTO `images` VALUES (431, 96, 'img/mu-1-2-napoli-s46-kinh-dau-3.jpg', '1');
INSERT INTO `images` VALUES (432, 96, 'img/mu-1-2-napoli-s46-kinh-dau-4.jpg', '1');
INSERT INTO `images` VALUES (433, 97, 'img/mu-1-2-andes-139-kinh-dau-xanh-nham-1.jpg', '1');
INSERT INTO `images` VALUES (434, 98, 'img/mu-1-2-andes-139-kinh-dau-xanh-nham-2.jpg', '1');
INSERT INTO `images` VALUES (435, 99, 'img/mu-1-2-andes-126-kinh-xanh-tem-nham.jpg', '1');
INSERT INTO `images` VALUES (436, 100, 'img/mu-1-2-andes-haly-den-tem-ride-1.jpg', '1');
INSERT INTO `images` VALUES (437, 100, 'img/mu-1-2-andes-haly-den-tem-ride-2.jpg', '1');
INSERT INTO `images` VALUES (438, 100, 'img/mu-1-2-andes-haly-den-tem-ride-3.jpg', '1');

-- ----------------------------
-- Table structure for importproducts
-- ----------------------------
DROP TABLE IF EXISTS `importproducts`;
CREATE TABLE `importproducts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(255) NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of importproducts
-- ----------------------------
INSERT INTO `importproducts` VALUES (1, 1, 'M', 'xám', '2', 630000.00, NULL);
INSERT INTO `importproducts` VALUES (2, 1, 'L', 'cam', '0', 630000.00, NULL);
INSERT INTO `importproducts` VALUES (3, 1, 'M', 'đen', '0', 630000.00, NULL);
INSERT INTO `importproducts` VALUES (4, 10, 'X', 'đen', '20', 500000.00, NULL);
INSERT INTO `importproducts` VALUES (5, 11, 'L', 'cam', '12', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (6, 11, 'L', 'vàng', '3', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (7, 11, 'L', 'đen', '4', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (8, 11, 'L', 'trắng', '5', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (9, 11, 'X', 'vàng', '6', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (10, 11, 'M', 'trắng', '7', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (11, 11, 'M', 'đen', '8', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (12, 12, 'L', 'đen', '11', 1000000.00, NULL);
INSERT INTO `importproducts` VALUES (13, 12, 'M', 'đen', '5', 1000000.00, NULL);
INSERT INTO `importproducts` VALUES (14, 13, 'L', 'đen', '22', 1550000.00, NULL);
INSERT INTO `importproducts` VALUES (15, 13, 'L', 'xám', '11', 1550000.00, NULL);
INSERT INTO `importproducts` VALUES (16, 13, 'M', 'đen', '3', 1550000.00, NULL);
INSERT INTO `importproducts` VALUES (17, 13, 'M', 'xám', '5', 1550000.00, NULL);
INSERT INTO `importproducts` VALUES (18, 14, 'M', 'đen', '4', 340000.00, NULL);
INSERT INTO `importproducts` VALUES (19, 14, 'M', 'xám', '5', 340000.00, NULL);
INSERT INTO `importproducts` VALUES (20, 14, 'M', 'xanh', '6', 340000.00, NULL);
INSERT INTO `importproducts` VALUES (21, 14, 'M', 'nâu', '7', 340000.00, NULL);
INSERT INTO `importproducts` VALUES (22, 15, 'L', 'hồng', '23', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (23, 15, 'L', 'tím', '4', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (24, 15, 'X', 'sữa', '1', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (25, 15, 'X', 'đen', '2', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (26, 15, 'XL', 'nâu', '1', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (27, 15, 'M', 'xanh', '2', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (28, 15, 'M', 'trắng', '12', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (29, 15, 'L', 'nhám', '1', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (30, 15, 'M', 'hồng', '21', 310000.00, NULL);
INSERT INTO `importproducts` VALUES (31, 16, 'M', 'đen', '23', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (32, 16, 'L', 'đen', '23', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (33, 17, 'M', 'lam', '23', 430000.00, NULL);
INSERT INTO `importproducts` VALUES (34, 17, 'L', 'cam', '23', 430000.00, NULL);
INSERT INTO `importproducts` VALUES (35, 17, 'L', 'xanh', '23', 430000.00, NULL);
INSERT INTO `importproducts` VALUES (36, 17, 'XL', 'xám', '23', 430000.00, NULL);
INSERT INTO `importproducts` VALUES (37, 17, 'M', 'đỏ', '23', 430000.00, NULL);
INSERT INTO `importproducts` VALUES (38, 18, 'M', 'đỏ', '3', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (39, 18, 'M', 'vàng', '4', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (40, 18, 'L', 'lam', '5', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (41, 18, 'M', 'cam', '5', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (42, 18, 'M', 'đen', '6', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (43, 19, 'M', 'đen', '4', 5300000.00, NULL);
INSERT INTO `importproducts` VALUES (44, 19, 'L', 'đen', '5', 5300000.00, NULL);
INSERT INTO `importproducts` VALUES (45, 19, 'XL', 'đen', '6', 5300000.00, NULL);
INSERT INTO `importproducts` VALUES (46, 19, 'X', 'đen', '7', 5300000.00, NULL);
INSERT INTO `importproducts` VALUES (47, 2, 'S', 'đen', '8', 1100000.00, NULL);
INSERT INTO `importproducts` VALUES (48, 20, 'L', 'đen', '3', 730000.00, NULL);
INSERT INTO `importproducts` VALUES (49, 20, 'M', 'đen', '4', 730000.00, NULL);
INSERT INTO `importproducts` VALUES (50, 21, 'M', 'đen', '5', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (51, 21, 'L', 'đen', '6', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (52, 21, 'XL', 'đen', '2', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (53, 22, 'M', 'đen', '5', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (54, 22, 'XL', 'đen', '5', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (55, 23, 'X', 'đen', '5', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (56, 23, 'M', 'đen', '12', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (57, 23, 'L', 'đen', '11', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (58, 23, 'XL', 'đen', '7', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (59, 24, 'M', 'xám', '4', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (60, 24, 'L', 'xám', '3', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (61, 24, 'X', 'xám', '2', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (62, 24, 'XL', 'xám', '3', 6200000.00, NULL);
INSERT INTO `importproducts` VALUES (63, 25, 'M', 'xanh', '2', 950000.00, NULL);
INSERT INTO `importproducts` VALUES (64, 25, 'X', 'đỏ', '4', 950000.00, NULL);
INSERT INTO `importproducts` VALUES (65, 25, 'XL', 'vàng', '2', 950000.00, NULL);
INSERT INTO `importproducts` VALUES (66, 26, 'M', 'xanh', '3', 1180000.00, NULL);
INSERT INTO `importproducts` VALUES (67, 26, 'L', 'đen', '5', 1180000.00, NULL);
INSERT INTO `importproducts` VALUES (68, 26, 'M', 'trắng', '4', 1180000.00, NULL);
INSERT INTO `importproducts` VALUES (69, 26, 'L', 'xám', '6', 1180000.00, NULL);
INSERT INTO `importproducts` VALUES (70, 26, 'XL', 'xám', '7', 1180000.00, NULL);
INSERT INTO `importproducts` VALUES (71, 27, 'M', 'đen', '5', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (72, 27, 'M', 'xanh', '6', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (73, 27, 'L', 'trắng', '7', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (74, 27, 'M', 'đen', '8', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (75, 27, 'L', 'đen', '20', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (76, 28, 'M', 'trắng', '6', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (77, 28, 'L', 'đen', '6', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (78, 28, 'M', 'xám', '7', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (79, 29, 'M', 'xám', '1', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (80, 29, 'XL', 'xám', '3', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (81, 29, 'L', 'xám', '11', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (82, 3, 'S', 'cam', '8', 590000.00, NULL);
INSERT INTO `importproducts` VALUES (83, 30, 'M', 'đỏ', '32', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (84, 30, 'X', 'đỏ', '3', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (85, 30, 'XL', 'đỏ', '43', 6000000.00, NULL);
INSERT INTO `importproducts` VALUES (86, 31, 'L', 'đen', '22', 820000.00, NULL);
INSERT INTO `importproducts` VALUES (87, 31, 'M', 'trắng', '3', 820000.00, NULL);
INSERT INTO `importproducts` VALUES (88, 32, 'M', 'đen', '22', 880000.00, NULL);
INSERT INTO `importproducts` VALUES (89, 32, 'L', 'đen', '22', 880000.00, NULL);
INSERT INTO `importproducts` VALUES (90, 32, 'XL', 'đen', '22', 880000.00, NULL);
INSERT INTO `importproducts` VALUES (91, 33, 'M', 'đỏ', '12', 780000.00, NULL);
INSERT INTO `importproducts` VALUES (92, 33, 'M', 'xám', '32', 780000.00, NULL);
INSERT INTO `importproducts` VALUES (93, 33, 'L', 'đỏ', '44', 780000.00, NULL);
INSERT INTO `importproducts` VALUES (94, 33, 'L', 'xám', '1', 780000.00, NULL);
INSERT INTO `importproducts` VALUES (95, 34, 'M', 'đen', '23', 2900000.00, NULL);
INSERT INTO `importproducts` VALUES (96, 34, 'L', 'đen', '56', 2900000.00, NULL);
INSERT INTO `importproducts` VALUES (97, 35, 'M', 'đen', '21', 1900000.00, NULL);
INSERT INTO `importproducts` VALUES (98, 35, 'XL', 'đen', '12', 1900000.00, NULL);
INSERT INTO `importproducts` VALUES (99, 36, 'X', 'đỏ', '1', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (100, 36, 'L', 'đỏ', '12', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (101, 37, 'L', 'đen', '12', 750000.00, NULL);
INSERT INTO `importproducts` VALUES (102, 37, 'M', 'đen', '12', 750000.00, NULL);
INSERT INTO `importproducts` VALUES (103, 38, 'L', 'đen', '1', 1700000.00, NULL);
INSERT INTO `importproducts` VALUES (104, 38, 'M', 'đen', '2', 1700000.00, NULL);
INSERT INTO `importproducts` VALUES (105, 39, 'XL', 'đen', '1', 900000.00, NULL);
INSERT INTO `importproducts` VALUES (106, 39, 'S', 'đen', '2', 900000.00, NULL);
INSERT INTO `importproducts` VALUES (107, 39, 'X', 'đen', '1', 900000.00, NULL);
INSERT INTO `importproducts` VALUES (108, 4, 'S', 'Trắng', '9', 245700.00, NULL);
INSERT INTO `importproducts` VALUES (109, 40, 'M', 'đỏ', '3', 1200000.00, NULL);
INSERT INTO `importproducts` VALUES (110, 40, 'L', 'xám', '4', 1200000.00, NULL);
INSERT INTO `importproducts` VALUES (111, 40, 'X', 'trắng', '5', 1200000.00, NULL);
INSERT INTO `importproducts` VALUES (112, 40, 'L', 'xanh', '4', 1200000.00, NULL);
INSERT INTO `importproducts` VALUES (113, 40, 'M', 'trắng', '4', 1200000.00, NULL);
INSERT INTO `importproducts` VALUES (114, 41, 'M', 'lam', '6', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (115, 41, 'L', 'lam', '6', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (116, 41, 'XL', 'lam', '6', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (117, 42, 'L', 'đen', '8', 350000.00, NULL);
INSERT INTO `importproducts` VALUES (118, 42, 'M', 'đen', '8', 350000.00, NULL);
INSERT INTO `importproducts` VALUES (119, 43, 'M', 'vàng', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (120, 43, 'L', 'trắng', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (121, 43, 'X', 'đỏ', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (122, 43, 'XL', 'đen', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (123, 43, 'L', 'xám', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (124, 43, 'L', 'nhám', '8', 650000.00, NULL);
INSERT INTO `importproducts` VALUES (125, 44, 'L', 'nâu', '7', 270000.00, NULL);
INSERT INTO `importproducts` VALUES (126, 44, 'XL', 'nâu', '7', 270000.00, NULL);
INSERT INTO `importproducts` VALUES (127, 45, 'L', 'đỏ', '7', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (128, 45, 'L', 'hồng', '7', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (129, 45, 'L', 'lam', '7', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (130, 45, 'L', 'xám', '8', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (131, 45, 'XL', 'nâu', '8', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (132, 45, 'XL', 'cam', '8', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (133, 45, 'XL', 'xanh', '8', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (134, 46, 'XL', 'hồng', '8', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (135, 46, 'XL', 'vàng', '8', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (136, 46, 'XL', 'kem', '8', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (137, 46, 'L', 'cam', '5', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (138, 46, 'L', 'đỏ', '5', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (139, 46, 'L', 'xám', '5', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (140, 46, 'M', 'trắng', '5', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (141, 46, 'S', 'lam', '4', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (142, 46, 'L', 'đen', '4', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (143, 47, 'L', 'xám', '8', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (144, 47, 'M', 'đỏ', '8', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (145, 47, 'L', 'đen', '8', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (146, 47, 'L', 'lam', '8', 580000.00, NULL);
INSERT INTO `importproducts` VALUES (147, 48, 'M', 'đỏ', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (148, 48, 'M', 'cam', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (149, 48, 'M', 'xám', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (150, 48, 'L', 'nâu', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (151, 48, 'L', 'lam', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (152, 48, 'X', 'trắng', '14', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (153, 49, 'L', 'tím', '20', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (154, 49, 'M', 'đen', '20', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (155, 49, 'L', 'trắng', '20', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (156, 5, 'L', 'cam', '9', 209000.00, NULL);
INSERT INTO `importproducts` VALUES (157, 50, 'L', 'hồng', '14', 200000.00, NULL);
INSERT INTO `importproducts` VALUES (158, 50, 'L', 'vàng', '14', 200000.00, NULL);
INSERT INTO `importproducts` VALUES (159, 50, 'L', 'xám', '14', 200000.00, NULL);
INSERT INTO `importproducts` VALUES (160, 50, 'M', 'lam', '14', 200000.00, NULL);
INSERT INTO `importproducts` VALUES (161, 51, 'L', 'xanh', '31', 280000.00, NULL);
INSERT INTO `importproducts` VALUES (162, 51, 'M', 'lam', '31', 280000.00, NULL);
INSERT INTO `importproducts` VALUES (163, 51, 'M', 'đỏ', '31', 280000.00, NULL);
INSERT INTO `importproducts` VALUES (164, 51, 'L', 'cam', '31', 280000.00, NULL);
INSERT INTO `importproducts` VALUES (165, 51, 'L', 'hồng', '31', 280000.00, NULL);
INSERT INTO `importproducts` VALUES (166, 52, 'L', 'xanh', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (167, 52, 'L', 'cam', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (168, 52, 'L', 'đỏ', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (169, 52, 'M', 'hồng', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (170, 52, 'M', 'lam', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (171, 52, 'M', 'vàng', '17', 260000.00, NULL);
INSERT INTO `importproducts` VALUES (172, 53, 'L', 'xanh', '15', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (173, 53, 'L', 'vàng', '15', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (174, 53, 'XL', 'đỏ', '15', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (175, 53, 'X', 'cam', '15', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (176, 53, 'S', 'cam', '15', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (177, 54, 'M', 'cam', '12', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (178, 54, 'M', 'đỏ', '12', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (179, 54, 'L', 'lam', '12', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (180, 54, 'L', 'xanh', '12', 290000.00, NULL);
INSERT INTO `importproducts` VALUES (181, 55, 'M', 'vàng', '12', 165000.00, NULL);
INSERT INTO `importproducts` VALUES (182, 55, 'M', 'lam', '3', 165000.00, NULL);
INSERT INTO `importproducts` VALUES (183, 55, 'L', 'hồng', '3', 165000.00, NULL);
INSERT INTO `importproducts` VALUES (184, 55, 'L', 'cam', '1', 165000.00, NULL);
INSERT INTO `importproducts` VALUES (185, 56, 'M', 'xanh', '8', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (186, 56, 'L', 'xanh', '7', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (187, 57, 'M', 'xanh', '3', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (188, 57, 'XL', 'xanh', '2', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (189, 58, 'M', 'vàng', '1', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (190, 58, 'L', 'vàng', '3', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (191, 59, 'M', 'hồng', '1', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (192, 59, 'S', 'hồng', '5', 250000.00, NULL);
INSERT INTO `importproducts` VALUES (193, 6, 'M', 'đen', '3', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (194, 6, 'X', 'đen', '15', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (195, 6, 'L', 'đen', '20', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (196, 7, 'L', 'đen', '2', 620000.00, NULL);
INSERT INTO `importproducts` VALUES (197, 7, 'X', 'đen', '5', 620000.00, NULL);
INSERT INTO `importproducts` VALUES (198, 8, 'XL', 'đen', '83', 730000.00, NULL);
INSERT INTO `importproducts` VALUES (199, 8, 'L', 'đen', '2', 730000.00, NULL);
INSERT INTO `importproducts` VALUES (200, 8, 'M', 'đen', '3', 730000.00, NULL);
INSERT INTO `importproducts` VALUES (201, 9, 'X', 'đen', '22', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (202, 9, 'M', 'đen', '31', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (203, 9, 'L', 'đen', '1', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (204, 9, 'S', 'đen', '2', 680000.00, NULL);
INSERT INTO `importproducts` VALUES (205, 62, 'M', 'đen', '13', 0.00, NULL);
INSERT INTO `importproducts` VALUES (206, 65, '2', 'cam', '1', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (207, 66, '2', 'cam', '2', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (208, 67, 'M', 'đỏ', '5', 1050000.00, NULL);
INSERT INTO `importproducts` VALUES (209, 67, 'M', 'xanh', '19', 1050000.00, NULL);
INSERT INTO `importproducts` VALUES (210, 67, 'L', 'trắng', '3', 1050000.00, NULL);
INSERT INTO `importproducts` VALUES (211, 68, 'L', 'đen', '10', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (212, 68, 'L', 'trắng', '11', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (213, 69, 'M', 'hồng', '20', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (214, 69, 'L', 'đen', '21', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (215, 69, 'L', 'xanh', '2', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (216, 70, 'L', 'đen', '10', 450000.00, NULL);
INSERT INTO `importproducts` VALUES (217, 71, 'M', 'đen', '20', 2160000.00, NULL);
INSERT INTO `importproducts` VALUES (218, 71, 'M', 'đỏ', '11', 2160000.00, NULL);
INSERT INTO `importproducts` VALUES (219, 71, 'M', 'xanh', '39', 2160000.00, NULL);
INSERT INTO `importproducts` VALUES (220, 72, 'L', 'đen', '29', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (221, 72, 'L', 'xám', '32', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (222, 72, 'M', 'nhám', '12', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (223, 73, 'L', 'đen', '11', 1080000.00, NULL);
INSERT INTO `importproducts` VALUES (224, 73, 'L', 'cam', '2', 1080000.00, NULL);
INSERT INTO `importproducts` VALUES (225, 73, 'M', 'xám', '4', 1080000.00, NULL);
INSERT INTO `importproducts` VALUES (226, 74, 'L', 'vàng', '5', 1300000.00, NULL);
INSERT INTO `importproducts` VALUES (227, 74, 'M', 'cam', '22', 1300000.00, NULL);
INSERT INTO `importproducts` VALUES (228, 74, 'M', 'đen', '33', 1300000.00, NULL);
INSERT INTO `importproducts` VALUES (229, 75, 'M', 'đen', '12', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (230, 75, 'L', 'hồng', '32', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (231, 75, 'L', 'xám', '8', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (232, 76, 'M', 'đen', '32', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (233, 76, 'M', 'đỏ', '2', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (234, 76, 'M', 'trắng', '23', 1500000.00, NULL);
INSERT INTO `importproducts` VALUES (235, 77, 'L', 'xanh', '32', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (236, 77, 'L', 'đen', '3', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (237, 77, 'L', 'xám', '54', 2400000.00, NULL);
INSERT INTO `importproducts` VALUES (238, 78, 'L', 'xanh', '21', 2800000.00, NULL);
INSERT INTO `importproducts` VALUES (239, 79, 'M', 'đen', '32', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (240, 79, 'L', 'vàng', '2', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (241, 79, 'M', 'đỏ', '3', 980000.00, NULL);
INSERT INTO `importproducts` VALUES (242, 80, 'M', 'xanh', '4', 850000.00, NULL);
INSERT INTO `importproducts` VALUES (243, 80, 'M', 'xám', '21', 850000.00, NULL);
INSERT INTO `importproducts` VALUES (244, 80, 'L', 'đen', '21', 850000.00, NULL);
INSERT INTO `importproducts` VALUES (245, 81, 'M', 'xanh', '3', 1770000.00, NULL);
INSERT INTO `importproducts` VALUES (246, 81, 'L', 'đỏ', '12', 1770000.00, NULL);
INSERT INTO `importproducts` VALUES (247, 81, 'M', 'trắng', '32', 1770000.00, NULL);
INSERT INTO `importproducts` VALUES (248, 82, 'L', 'xanh', '2', 1400000.00, NULL);
INSERT INTO `importproducts` VALUES (249, 82, 'L', 'đen', '34', 1400000.00, NULL);
INSERT INTO `importproducts` VALUES (250, 82, 'L', 'đỏ', '12', 1400000.00, NULL);
INSERT INTO `importproducts` VALUES (251, 83, 'M', 'cam', '3', 700000.00, NULL);
INSERT INTO `importproducts` VALUES (252, 83, 'L', 'xanh', '23', 700000.00, NULL);
INSERT INTO `importproducts` VALUES (253, 84, 'L', 'cam', '1', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (254, 84, 'L', 'xanh', '32', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (255, 84, 'M', 'đen', '21', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (256, 85, 'L', 'trắng', '12', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (257, 85, 'M', 'cam', '21', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (258, 85, 'M', 'đen', '5', 570000.00, NULL);
INSERT INTO `importproducts` VALUES (259, 86, 'L', 'đen', '10', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (260, 86, 'L', 'xanh', '11', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (261, 87, 'L', 'cam', '21', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (262, 87, 'M', 'đỏ', '12', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (263, 87, 'M', 'hồng', '11', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (264, 88, 'L', 'đen', '32', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (265, 88, 'L', 'đỏ', '21', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (266, 88, 'L', 'xanh', '21', 460000.00, NULL);
INSERT INTO `importproducts` VALUES (267, 89, 'M', 'xám', '2', 550000.00, NULL);
INSERT INTO `importproducts` VALUES (268, 89, 'M', 'trắng', '3', 550000.00, NULL);
INSERT INTO `importproducts` VALUES (269, 90, 'L', 'đỏ', '21', 550000.00, NULL);
INSERT INTO `importproducts` VALUES (270, 90, 'L', 'xám', '21', 550000.00, NULL);
INSERT INTO `importproducts` VALUES (271, 91, 'M', 'đen', '2', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (272, 91, 'L', 'hồng', '4', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (273, 91, 'L', 'xanh', '32', 400000.00, NULL);
INSERT INTO `importproducts` VALUES (274, 92, 'M', 'xanh lục', '21', 330000.00, NULL);
INSERT INTO `importproducts` VALUES (275, 92, 'L', 'xanh dương', '1', 330000.00, NULL);
INSERT INTO `importproducts` VALUES (276, 92, 'M', 'đen', '21', 330000.00, NULL);
INSERT INTO `importproducts` VALUES (277, 93, 'L', 'đen', '12', 990000.00, NULL);
INSERT INTO `importproducts` VALUES (278, 93, 'M', 'xám', '32', 990000.00, NULL);
INSERT INTO `importproducts` VALUES (279, 93, 'L', 'trắng', '11', 990000.00, NULL);
INSERT INTO `importproducts` VALUES (280, 94, 'L', 'đen', '23', 380000.00, NULL);
INSERT INTO `importproducts` VALUES (281, 94, 'M', 'đỏ', '21', 380000.00, NULL);
INSERT INTO `importproducts` VALUES (282, 94, 'M', 'xanh', '21', 380000.00, NULL);
INSERT INTO `importproducts` VALUES (283, 95, 'L', 'xanh', '12', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (284, 95, 'M', 'xám', '12', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (285, 95, 'L', 'trắng', '1', 3500000.00, NULL);
INSERT INTO `importproducts` VALUES (286, 96, 'L', 'đen', '3', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (287, 96, 'L', 'lục', '23', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (288, 96, 'M', 'lam', '23', 390000.00, NULL);
INSERT INTO `importproducts` VALUES (289, 97, 'M', 'lam', '2', 450000.00, NULL);
INSERT INTO `importproducts` VALUES (290, 98, 'L', 'hồng', '4', 440000.00, NULL);
INSERT INTO `importproducts` VALUES (291, 99, 'L', 'lam', '12', 490000.00, NULL);
INSERT INTO `importproducts` VALUES (292, 100, 'M', 'xanh', '32', 270000.00, NULL);
INSERT INTO `importproducts` VALUES (293, 100, 'L', 'đen', '4', 270000.00, NULL);

-- ----------------------------
-- Table structure for logos
-- ----------------------------
DROP TABLE IF EXISTS `logos`;
CREATE TABLE `logos`  (
  `id_logo` int(11) NOT NULL,
  `img` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_logo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logos
-- ----------------------------
INSERT INTO `logos` VALUES (1, 'img/agv.png', '1', 'AGV');
INSERT INTO `logos` VALUES (2, 'img/arai.png', '1', 'ARAI');
INSERT INTO `logos` VALUES (3, 'img/hjc.png', '1', 'HJC');
INSERT INTO `logos` VALUES (4, 'img/shark.png', '1', 'SHARK');
INSERT INTO `logos` VALUES (5, 'img/poc.png', '1', 'POC');
INSERT INTO `logos` VALUES (6, 'img/kyt.jpg', '1', 'KYT');
INSERT INTO `logos` VALUES (7, 'img/reu.png', '1', 'REU');
INSERT INTO `logos` VALUES (8, 'img/smk.png', '1', 'SMK');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` tinyint(4) NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createAt` datetime NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 795 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (1, 0, 'anh0212', '', 'ct', '2023-05-26 17:16:31', 0);
INSERT INTO `logs` VALUES (2, 0, 'dmanager', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dmanager', '2023-05-26 17:16:40', 0);
INSERT INTO `logs` VALUES (3, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 17:17:04', 0);
INSERT INTO `logs` VALUES (4, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 17:23:47', 0);
INSERT INTO `logs` VALUES (5, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 17:38:11', 0);
INSERT INTO `logs` VALUES (6, 0, 'dadmin', 'AUTH EDIT BILL', 'EDIT BILL 1 AT: Username - dadmin', '2023-05-26 17:38:21', 0);
INSERT INTO `logs` VALUES (7, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 17:40:25', 0);
INSERT INTO `logs` VALUES (8, 0, 'dadmin', 'AUTH EDIT BILL', 'EDIT BILL 7 AT: Username - dadmin', '2023-05-26 17:40:35', 0);
INSERT INTO `logs` VALUES (9, 0, 'dadmin', 'AUTH EDIT CUSTOMER', 'EDIT CUSTOMER null AT: Username - dadmin', '2023-05-26 17:40:53', 0);
INSERT INTO `logs` VALUES (10, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 17:51:44', 0);
INSERT INTO `logs` VALUES (11, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:02:59', 0);
INSERT INTO `logs` VALUES (12, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:05:58', 0);
INSERT INTO `logs` VALUES (13, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:09:50', 0);
INSERT INTO `logs` VALUES (14, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:16:07', 0);
INSERT INTO `logs` VALUES (15, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:17:06', 0);
INSERT INTO `logs` VALUES (16, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:20:44', 0);
INSERT INTO `logs` VALUES (17, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:23:32', 0);
INSERT INTO `logs` VALUES (18, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:25:08', 0);
INSERT INTO `logs` VALUES (19, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:25:47', 0);
INSERT INTO `logs` VALUES (20, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:27:52', 0);
INSERT INTO `logs` VALUES (21, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:32:29', 0);
INSERT INTO `logs` VALUES (22, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:33:06', 0);
INSERT INTO `logs` VALUES (23, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:33:42', 0);
INSERT INTO `logs` VALUES (24, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:34:44', 0);
INSERT INTO `logs` VALUES (25, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:35:42', 0);
INSERT INTO `logs` VALUES (26, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:37:11', 0);
INSERT INTO `logs` VALUES (27, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-05-26 18:37:28', 0);
INSERT INTO `logs` VALUES (28, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-05-26 18:37:36', 0);
INSERT INTO `logs` VALUES (29, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón 3/4 đầu EGO E5 kính âm AT: Username - dadmin', '2023-05-26 18:37:50', 0);
INSERT INTO `logs` VALUES (30, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-05-26 18:37:50', 0);
INSERT INTO `logs` VALUES (31, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón 3/4 đầu EGO E5 kính âm AT: Username - dadmin', '2023-05-26 18:37:53', 0);
INSERT INTO `logs` VALUES (32, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-05-26 18:37:53', 0);
INSERT INTO `logs` VALUES (33, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:40:08', 0);
INSERT INTO `logs` VALUES (34, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 3 AT: Username - dadmin', '2023-05-26 18:40:28', 0);
INSERT INTO `logs` VALUES (35, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:41:04', 0);
INSERT INTO `logs` VALUES (36, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:14', 0);
INSERT INTO `logs` VALUES (37, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:16', 0);
INSERT INTO `logs` VALUES (38, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:17', 0);
INSERT INTO `logs` VALUES (39, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:17', 0);
INSERT INTO `logs` VALUES (40, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:17', 0);
INSERT INTO `logs` VALUES (41, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:18', 0);
INSERT INTO `logs` VALUES (42, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:18', 0);
INSERT INTO `logs` VALUES (43, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:18', 0);
INSERT INTO `logs` VALUES (44, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:18', 0);
INSERT INTO `logs` VALUES (45, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (46, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (47, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (48, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (49, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (50, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:19', 0);
INSERT INTO `logs` VALUES (51, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:20', 0);
INSERT INTO `logs` VALUES (52, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:20', 0);
INSERT INTO `logs` VALUES (53, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:20', 0);
INSERT INTO `logs` VALUES (54, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:21', 0);
INSERT INTO `logs` VALUES (55, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:21', 0);
INSERT INTO `logs` VALUES (56, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:21', 0);
INSERT INTO `logs` VALUES (57, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:21', 0);
INSERT INTO `logs` VALUES (58, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:21', 0);
INSERT INTO `logs` VALUES (59, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:22', 0);
INSERT INTO `logs` VALUES (60, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:22', 0);
INSERT INTO `logs` VALUES (61, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:22', 0);
INSERT INTO `logs` VALUES (62, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:22', 0);
INSERT INTO `logs` VALUES (63, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:22', 0);
INSERT INTO `logs` VALUES (64, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:23', 0);
INSERT INTO `logs` VALUES (65, 0, 'dadmin', 'AUTH DELETE BILL', 'DELETE BILL 12 AT: Username - dadmin', '2023-05-26 18:41:23', 0);
INSERT INTO `logs` VALUES (66, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:41:47', 0);
INSERT INTO `logs` VALUES (67, 0, 'dadmin', 'AUTH EDIT CUSTOMER', 'EDIT CUSTOMER null AT: Username - dadmin', '2023-05-26 18:41:53', 0);
INSERT INTO `logs` VALUES (68, 0, 'dadmin', 'AUTH EDIT BILL', 'EDIT BILL 2 AT: Username - dadmin', '2023-05-26 18:42:12', 0);
INSERT INTO `logs` VALUES (69, 0, 'dadmin', 'AUTH EDIT CUSTOMER', 'EDIT CUSTOMER null AT: Username - dadmin', '2023-05-26 18:42:16', 0);
INSERT INTO `logs` VALUES (70, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:44:01', 0);
INSERT INTO `logs` VALUES (71, 0, 'dadmin', 'AUTH EDIT CUSTOMER', 'EDIT CUSTOMER null AT: Username - dadmin', '2023-05-26 18:44:09', 0);
INSERT INTO `logs` VALUES (72, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:46:57', 0);
INSERT INTO `logs` VALUES (73, 0, 'dadmin', 'AUTH EDIT CUSTOMER', 'EDIT CUSTOMER null AT: Username - dadmin', '2023-05-26 18:47:04', 0);
INSERT INTO `logs` VALUES (74, 0, 'dadmin', 'AUTH REMOVE BANNER', 'REMOVE BANNER AT: Username - dadmin', '2023-05-26 18:48:03', 0);
INSERT INTO `logs` VALUES (75, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:51:30', 0);
INSERT INTO `logs` VALUES (76, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:52:50', 0);
INSERT INTO `logs` VALUES (77, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:54:53', 0);
INSERT INTO `logs` VALUES (78, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 18:56:02', 0);
INSERT INTO `logs` VALUES (79, 0, NULL, 'AUTHFilter', 'FILTER PRODUCT BY[Ljava.lang.String;@264a7af4,[Ljava.lang.String;@70d036bdSUCCESS: Username - null', '2023-05-26 19:23:31', 0);
INSERT INTO `logs` VALUES (80, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 22:41:25', 0);
INSERT INTO `logs` VALUES (81, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 23:15:35', 0);
INSERT INTO `logs` VALUES (82, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 23:28:00', 0);
INSERT INTO `logs` VALUES (83, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 23:39:46', 0);
INSERT INTO `logs` VALUES (84, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 23:44:06', 0);
INSERT INTO `logs` VALUES (85, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-26 23:54:51', 0);
INSERT INTO `logs` VALUES (86, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:01:12', 0);
INSERT INTO `logs` VALUES (87, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:02:45', 0);
INSERT INTO `logs` VALUES (88, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:03:53', 0);
INSERT INTO `logs` VALUES (89, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:04:31', 0);
INSERT INTO `logs` VALUES (90, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:05:38', 0);
INSERT INTO `logs` VALUES (91, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:07:07', 0);
INSERT INTO `logs` VALUES (92, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:07:57', 0);
INSERT INTO `logs` VALUES (93, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:09:08', 0);
INSERT INTO `logs` VALUES (94, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:10:11', 0);
INSERT INTO `logs` VALUES (95, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:27:11', 0);
INSERT INTO `logs` VALUES (96, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 00:28:33', 0);
INSERT INTO `logs` VALUES (97, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:19:52', 0);
INSERT INTO `logs` VALUES (98, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:22:49', 0);
INSERT INTO `logs` VALUES (99, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:23:59', 0);
INSERT INTO `logs` VALUES (100, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:28:58', 0);
INSERT INTO `logs` VALUES (101, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:35:04', 0);
INSERT INTO `logs` VALUES (102, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:37:09', 0);
INSERT INTO `logs` VALUES (103, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:40:49', 0);
INSERT INTO `logs` VALUES (104, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 01:43:14', 0);
INSERT INTO `logs` VALUES (105, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 15:18:01', 0);
INSERT INTO `logs` VALUES (106, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 15:28:05', 0);
INSERT INTO `logs` VALUES (107, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 16:03:38', 0);
INSERT INTO `logs` VALUES (108, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-05-27 17:40:34', 0);
INSERT INTO `logs` VALUES (109, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-07 16:05:01', 0);
INSERT INTO `logs` VALUES (110, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-07 16:05:09', 0);
INSERT INTO `logs` VALUES (111, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-07 16:05:57', 0);
INSERT INTO `logs` VALUES (112, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-12 22:53:36', 0);
INSERT INTO `logs` VALUES (113, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:54:17', 0);
INSERT INTO `logs` VALUES (114, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:55:08', 0);
INSERT INTO `logs` VALUES (115, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón Andes 3S382H AT: Username - dadmin', '2023-06-12 22:55:16', 0);
INSERT INTO `logs` VALUES (116, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:55:16', 0);
INSERT INTO `logs` VALUES (117, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:55:34', 0);
INSERT INTO `logs` VALUES (118, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:55:49', 0);
INSERT INTO `logs` VALUES (119, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:55:58', 0);
INSERT INTO `logs` VALUES (120, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:56:07', 0);
INSERT INTO `logs` VALUES (121, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 22:56:19', 0);
INSERT INTO `logs` VALUES (122, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:03:50', 0);
INSERT INTO `logs` VALUES (123, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm Asia M168 AT: Username - dadmin', '2023-06-12 23:04:05', 0);
INSERT INTO `logs` VALUES (124, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:04:05', 0);
INSERT INTO `logs` VALUES (125, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:04:19', 0);
INSERT INTO `logs` VALUES (126, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:04:29', 0);
INSERT INTO `logs` VALUES (127, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:04:44', 0);
INSERT INTO `logs` VALUES (128, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Royal M139 kính âm AT: Username - dadmin', '2023-06-12 23:08:33', 0);
INSERT INTO `logs` VALUES (129, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:08:33', 0);
INSERT INTO `logs` VALUES (130, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:08:50', 0);
INSERT INTO `logs` VALUES (131, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Royal M139 kính âm AT: Username - dadmin', '2023-06-12 23:08:53', 0);
INSERT INTO `logs` VALUES (132, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:08:53', 0);
INSERT INTO `logs` VALUES (133, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:09:06', 0);
INSERT INTO `logs` VALUES (134, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:10:02', 0);
INSERT INTO `logs` VALUES (135, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:10:09', 0);
INSERT INTO `logs` VALUES (136, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:10:15', 0);
INSERT INTO `logs` VALUES (137, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:10:22', 0);
INSERT INTO `logs` VALUES (138, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón gấu nâu 3/4 AT: Username - dadmin', '2023-06-12 23:10:53', 0);
INSERT INTO `logs` VALUES (139, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:10:53', 0);
INSERT INTO `logs` VALUES (140, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:12:17', 0);
INSERT INTO `logs` VALUES (141, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:12:23', 0);
INSERT INTO `logs` VALUES (142, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:12:28', 0);
INSERT INTO `logs` VALUES (143, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:12:34', 0);
INSERT INTO `logs` VALUES (144, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:12:40', 0);
INSERT INTO `logs` VALUES (145, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Napoli 189 Size M Nón bảo hiểm 3/4 AT: Username - dadmin', '2023-06-12 23:23:55', 0);
INSERT INTO `logs` VALUES (146, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:23:55', 0);
INSERT INTO `logs` VALUES (147, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:24:10', 0);
INSERT INTO `logs` VALUES (148, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:24:15', 0);
INSERT INTO `logs` VALUES (149, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Napoli 189 Size M Nón bảo hiểm 3/4 AT: Username - dadmin', '2023-06-12 23:24:34', 0);
INSERT INTO `logs` VALUES (150, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:24:34', 0);
INSERT INTO `logs` VALUES (151, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:26:10', 0);
INSERT INTO `logs` VALUES (152, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón Napoli SH 3/4 AT: Username - dadmin', '2023-06-12 23:26:46', 0);
INSERT INTO `logs` VALUES (153, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:26:46', 0);
INSERT INTO `logs` VALUES (154, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:28:56', 0);
INSERT INTO `logs` VALUES (155, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:29:08', 0);
INSERT INTO `logs` VALUES (156, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:29:14', 0);
INSERT INTO `logs` VALUES (157, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:29:27', 0);
INSERT INTO `logs` VALUES (158, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-12 23:29:38', 0);
INSERT INTO `logs` VALUES (159, 0, 'dadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - dadmin', '2023-06-12 23:32:05', 0);
INSERT INTO `logs` VALUES (160, 0, 'dadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - dadmin', '2023-06-13 00:00:25', 0);
INSERT INTO `logs` VALUES (161, 0, 'dadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - dadmin', '2023-06-13 00:02:14', 0);
INSERT INTO `logs` VALUES (162, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:03:38', 0);
INSERT INTO `logs` VALUES (163, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Andes 3S219L AT: Username - dadmin', '2023-06-13 00:03:44', 0);
INSERT INTO `logs` VALUES (164, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:03:44', 0);
INSERT INTO `logs` VALUES (165, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:03:54', 0);
INSERT INTO `logs` VALUES (166, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:04:01', 0);
INSERT INTO `logs` VALUES (167, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:04:06', 0);
INSERT INTO `logs` VALUES (168, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:04:16', 0);
INSERT INTO `logs` VALUES (169, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm GRS 780 Kính AT: Username - dadmin', '2023-06-13 00:05:41', 0);
INSERT INTO `logs` VALUES (170, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:05:41', 0);
INSERT INTO `logs` VALUES (171, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm GRS 780 Kính AT: Username - dadmin', '2023-06-13 00:05:45', 0);
INSERT INTO `logs` VALUES (172, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:05:45', 0);
INSERT INTO `logs` VALUES (173, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:06:02', 0);
INSERT INTO `logs` VALUES (174, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:06:08', 0);
INSERT INTO `logs` VALUES (175, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-13 00:06:14', 0);
INSERT INTO `logs` VALUES (176, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 00:06:31', 0);
INSERT INTO `logs` VALUES (177, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:07:58', 0);
INSERT INTO `logs` VALUES (178, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:09:39', 0);
INSERT INTO `logs` VALUES (179, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:14:20', 0);
INSERT INTO `logs` VALUES (180, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:29:46', 0);
INSERT INTO `logs` VALUES (181, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:30:59', 0);
INSERT INTO `logs` VALUES (182, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 00:31:32', 0);
INSERT INTO `logs` VALUES (183, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 00:35:08', 0);
INSERT INTO `logs` VALUES (184, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:44:51', 0);
INSERT INTO `logs` VALUES (185, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:44:58', 0);
INSERT INTO `logs` VALUES (186, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:47:51', 0);
INSERT INTO `logs` VALUES (187, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:49:17', 0);
INSERT INTO `logs` VALUES (188, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:50:08', 0);
INSERT INTO `logs` VALUES (189, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:50:59', 0);
INSERT INTO `logs` VALUES (190, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:51:47', 0);
INSERT INTO `logs` VALUES (191, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 00:52:35', 0);
INSERT INTO `logs` VALUES (192, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:54:46', 0);
INSERT INTO `logs` VALUES (193, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón 3/4 GRS 649 kính  AT: Username - dadmin', '2023-06-14 00:55:56', 0);
INSERT INTO `logs` VALUES (194, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:55:56', 0);
INSERT INTO `logs` VALUES (195, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:56:04', 0);
INSERT INTO `logs` VALUES (196, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:57:23', 0);
INSERT INTO `logs` VALUES (197, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 00:58:31', 0);
INSERT INTO `logs` VALUES (198, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 00:58:39', 0);
INSERT INTO `logs` VALUES (199, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 01:06:35', 0);
INSERT INTO `logs` VALUES (200, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:06:46', 0);
INSERT INTO `logs` VALUES (201, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:06:52', 0);
INSERT INTO `logs` VALUES (202, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 01:07:15', 0);
INSERT INTO `logs` VALUES (203, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 01:07:20', 0);
INSERT INTO `logs` VALUES (204, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:07:28', 0);
INSERT INTO `logs` VALUES (205, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 01:10:54', 0);
INSERT INTO `logs` VALUES (206, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:11:06', 0);
INSERT INTO `logs` VALUES (207, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:15:28', 0);
INSERT INTO `logs` VALUES (208, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:15:31', 0);
INSERT INTO `logs` VALUES (209, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:15:33', 0);
INSERT INTO `logs` VALUES (210, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 01:16:21', 0);
INSERT INTO `logs` VALUES (211, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:16:29', 0);
INSERT INTO `logs` VALUES (212, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:17:01', 0);
INSERT INTO `logs` VALUES (213, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 01:17:59', 0);
INSERT INTO `logs` VALUES (214, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:18:05', 0);
INSERT INTO `logs` VALUES (215, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:18:08', 0);
INSERT INTO `logs` VALUES (216, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:18:40', 0);
INSERT INTO `logs` VALUES (217, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:19:13', 0);
INSERT INTO `logs` VALUES (218, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:19:30', 0);
INSERT INTO `logs` VALUES (219, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:22:02', 0);
INSERT INTO `logs` VALUES (220, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:22:24', 0);
INSERT INTO `logs` VALUES (221, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:22:29', 0);
INSERT INTO `logs` VALUES (222, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:22:38', 0);
INSERT INTO `logs` VALUES (223, 0, 'ducuser', 'AUTH ', '', '2023-06-14 01:22:43', 0);
INSERT INTO `logs` VALUES (224, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 01:24:21', 0);
INSERT INTO `logs` VALUES (225, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 01:25:49', 0);
INSERT INTO `logs` VALUES (226, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 01:25:57', 0);
INSERT INTO `logs` VALUES (227, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:15:31', 0);
INSERT INTO `logs` VALUES (228, 0, 'ducuser', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - ducuser', '2023-06-14 02:18:09', 0);
INSERT INTO `logs` VALUES (229, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 02:18:14', 0);
INSERT INTO `logs` VALUES (230, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 02:18:29', 0);
INSERT INTO `logs` VALUES (231, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:18:37', 0);
INSERT INTO `logs` VALUES (232, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:19:37', 0);
INSERT INTO `logs` VALUES (233, 0, 'ducuser', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - ducuser', '2023-06-14 02:19:43', 0);
INSERT INTO `logs` VALUES (234, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 02:19:48', 0);
INSERT INTO `logs` VALUES (235, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 02:20:40', 0);
INSERT INTO `logs` VALUES (236, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:20:46', 0);
INSERT INTO `logs` VALUES (237, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 02:22:46', 0);
INSERT INTO `logs` VALUES (238, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 02:22:53', 0);
INSERT INTO `logs` VALUES (239, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:23:03', 0);
INSERT INTO `logs` VALUES (240, 0, 'ducuser', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - ducuser', '2023-06-14 02:24:26', 0);
INSERT INTO `logs` VALUES (241, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:24:35', 0);
INSERT INTO `logs` VALUES (242, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:37:24', 0);
INSERT INTO `logs` VALUES (243, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 02:38:16', 0);
INSERT INTO `logs` VALUES (244, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:46:31', 0);
INSERT INTO `logs` VALUES (245, 0, 'ducuser', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - ducuser', '2023-06-14 02:46:46', 0);
INSERT INTO `logs` VALUES (246, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 02:46:50', 0);
INSERT INTO `logs` VALUES (247, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:51:17', 0);
INSERT INTO `logs` VALUES (248, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:52:52', 0);
INSERT INTO `logs` VALUES (249, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:54:45', 0);
INSERT INTO `logs` VALUES (250, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 02:55:58', 0);
INSERT INTO `logs` VALUES (251, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 03:05:50', 0);
INSERT INTO `logs` VALUES (252, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:05:57', 0);
INSERT INTO `logs` VALUES (253, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:07:13', 0);
INSERT INTO `logs` VALUES (254, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 03:08:09', 0);
INSERT INTO `logs` VALUES (255, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:08:15', 0);
INSERT INTO `logs` VALUES (256, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:09:07', 0);
INSERT INTO `logs` VALUES (257, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:14:09', 0);
INSERT INTO `logs` VALUES (258, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 03:14:19', 0);
INSERT INTO `logs` VALUES (259, 0, 'dadmin', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - dadmin', '2023-06-14 03:14:33', 0);
INSERT INTO `logs` VALUES (260, 0, 'ducuser', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - ducuser', '2023-06-14 03:14:44', 0);
INSERT INTO `logs` VALUES (261, 0, 'ducuser', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - ducuser', '2023-06-14 03:14:54', 0);
INSERT INTO `logs` VALUES (262, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 14:40:45', 0);
INSERT INTO `logs` VALUES (263, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:40:59', 0);
INSERT INTO `logs` VALUES (264, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm con vịt AT: Username - dadmin', '2023-06-14 14:41:16', 0);
INSERT INTO `logs` VALUES (265, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:41:16', 0);
INSERT INTO `logs` VALUES (266, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:41:49', 0);
INSERT INTO `logs` VALUES (267, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:47:04', 0);
INSERT INTO `logs` VALUES (268, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:47:12', 0);
INSERT INTO `logs` VALUES (269, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón xe đạp trẻ em Basecamp 666 AT: Username - dadmin', '2023-06-14 14:47:34', 0);
INSERT INTO `logs` VALUES (270, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:47:34', 0);
INSERT INTO `logs` VALUES (271, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:48:45', 0);
INSERT INTO `logs` VALUES (272, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón xe đạp trẻ em JC 20 AT: Username - dadmin', '2023-06-14 14:49:14', 0);
INSERT INTO `logs` VALUES (273, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:49:14', 0);
INSERT INTO `logs` VALUES (274, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:51:43', 0);
INSERT INTO `logs` VALUES (275, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:51:50', 0);
INSERT INTO `logs` VALUES (276, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:51:57', 0);
INSERT INTO `logs` VALUES (277, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:52:03', 0);
INSERT INTO `logs` VALUES (278, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:53:30', 0);
INSERT INTO `logs` VALUES (279, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón xe đạp trẻ em Kiho AT: Username - dadmin', '2023-06-14 14:54:19', 0);
INSERT INTO `logs` VALUES (280, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:54:19', 0);
INSERT INTO `logs` VALUES (281, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:55:53', 0);
INSERT INTO `logs` VALUES (282, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:55:59', 0);
INSERT INTO `logs` VALUES (283, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:56:06', 0);
INSERT INTO `logs` VALUES (284, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:56:12', 0);
INSERT INTO `logs` VALUES (285, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:58:19', 0);
INSERT INTO `logs` VALUES (286, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón xe đạp trẻ em Fornix NM17 AT: Username - dadmin', '2023-06-14 14:59:28', 0);
INSERT INTO `logs` VALUES (287, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:59:28', 0);
INSERT INTO `logs` VALUES (288, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:59:36', 0);
INSERT INTO `logs` VALUES (289, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:59:46', 0);
INSERT INTO `logs` VALUES (290, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:59:53', 0);
INSERT INTO `logs` VALUES (291, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 14:59:57', 0);
INSERT INTO `logs` VALUES (292, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:01:01', 0);
INSERT INTO `logs` VALUES (293, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm cho bé hãng Little Angle AT: Username - dadmin', '2023-06-14 15:01:46', 0);
INSERT INTO `logs` VALUES (294, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:01:46', 0);
INSERT INTO `logs` VALUES (295, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:01:53', 0);
INSERT INTO `logs` VALUES (296, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:01:58', 0);
INSERT INTO `logs` VALUES (297, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:02:04', 0);
INSERT INTO `logs` VALUES (298, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:02:08', 0);
INSERT INTO `logs` VALUES (299, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:02:47', 0);
INSERT INTO `logs` VALUES (300, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm Pikachu AT: Username - dadmin', '2023-06-14 15:03:26', 0);
INSERT INTO `logs` VALUES (301, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:03:26', 0);
INSERT INTO `logs` VALUES (302, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:03:39', 0);
INSERT INTO `logs` VALUES (303, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:04:01', 0);
INSERT INTO `logs` VALUES (304, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm chim cánh cụt AT: Username - dadmin', '2023-06-14 15:04:31', 0);
INSERT INTO `logs` VALUES (305, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:04:31', 0);
INSERT INTO `logs` VALUES (306, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:04:46', 0);
INSERT INTO `logs` VALUES (307, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:05:10', 0);
INSERT INTO `logs` VALUES (308, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm đôrêmon AT: Username - dadmin', '2023-06-14 15:06:08', 0);
INSERT INTO `logs` VALUES (309, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:08', 0);
INSERT INTO `logs` VALUES (310, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:14', 0);
INSERT INTO `logs` VALUES (311, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:19', 0);
INSERT INTO `logs` VALUES (312, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:23', 0);
INSERT INTO `logs` VALUES (313, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:28', 0);
INSERT INTO `logs` VALUES (314, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:06:59', 0);
INSERT INTO `logs` VALUES (315, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm Hello Kitty AT: Username - dadmin', '2023-06-14 15:07:25', 0);
INSERT INTO `logs` VALUES (316, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:07:25', 0);
INSERT INTO `logs` VALUES (317, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:07:30', 0);
INSERT INTO `logs` VALUES (318, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:07:49', 0);
INSERT INTO `logs` VALUES (319, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón trùm đầu kính ẩn chống nắng GRS 388K AT: Username - dadmin', '2023-06-14 15:09:17', 0);
INSERT INTO `logs` VALUES (320, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:09:17', 0);
INSERT INTO `logs` VALUES (321, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:09:53', 0);
INSERT INTO `logs` VALUES (322, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:09:59', 0);
INSERT INTO `logs` VALUES (323, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:10:04', 0);
INSERT INTO `logs` VALUES (324, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:10:08', 0);
INSERT INTO `logs` VALUES (325, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:10:14', 0);
INSERT INTO `logs` VALUES (326, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:10:35', 0);
INSERT INTO `logs` VALUES (327, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Yohe 935 SV Xám Xi Măng Bóng-Nón fullface 2 kính AT: Username - dadmin', '2023-06-14 15:12:11', 0);
INSERT INTO `logs` VALUES (328, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:12:11', 0);
INSERT INTO `logs` VALUES (329, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Yohe 935 SV Xám Xi Măng Bóng-Nón fullface 2 kính AT: Username - dadmin', '2023-06-14 15:12:22', 0);
INSERT INTO `logs` VALUES (330, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:12:22', 0);
INSERT INTO `logs` VALUES (331, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:13:18', 0);
INSERT INTO `logs` VALUES (332, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:13:40', 0);
INSERT INTO `logs` VALUES (333, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 KLT Venom AT: Username - dadmin', '2023-06-14 15:14:24', 0);
INSERT INTO `logs` VALUES (334, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:14:24', 0);
INSERT INTO `logs` VALUES (335, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:15:26', 0);
INSERT INTO `logs` VALUES (336, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:15:32', 0);
INSERT INTO `logs` VALUES (337, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:01', 0);
INSERT INTO `logs` VALUES (338, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 KLT Venom AT: Username - dadmin', '2023-06-14 15:16:08', 0);
INSERT INTO `logs` VALUES (339, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:08', 0);
INSERT INTO `logs` VALUES (340, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:17', 0);
INSERT INTO `logs` VALUES (341, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:24', 0);
INSERT INTO `logs` VALUES (342, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 KLT Venom AT: Username - dadmin', '2023-06-14 15:16:27', 0);
INSERT INTO `logs` VALUES (343, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:27', 0);
INSERT INTO `logs` VALUES (344, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:16:38', 0);
INSERT INTO `logs` VALUES (345, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 ROYCE M787 AT: Username - dadmin', '2023-06-14 15:19:36', 0);
INSERT INTO `logs` VALUES (346, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:19:36', 0);
INSERT INTO `logs` VALUES (347, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:19:44', 0);
INSERT INTO `logs` VALUES (348, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:19:51', 0);
INSERT INTO `logs` VALUES (349, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:19:57', 0);
INSERT INTO `logs` VALUES (350, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:20:13', 0);
INSERT INTO `logs` VALUES (351, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 LS2 OF603 INFINITY sợi thủy tinh AT: Username - dadmin', '2023-06-14 15:21:01', 0);
INSERT INTO `logs` VALUES (352, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:21:01', 0);
INSERT INTO `logs` VALUES (353, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:21:47', 0);
INSERT INTO `logs` VALUES (354, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:22:08', 0);
INSERT INTO `logs` VALUES (355, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ 3/4 ROYAL M134C AT: Username - dadmin', '2023-06-14 15:23:09', 0);
INSERT INTO `logs` VALUES (356, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:23:09', 0);
INSERT INTO `logs` VALUES (357, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:23:14', 0);
INSERT INTO `logs` VALUES (358, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:23:20', 0);
INSERT INTO `logs` VALUES (359, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:23:25', 0);
INSERT INTO `logs` VALUES (360, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:23:33', 0);
INSERT INTO `logs` VALUES (361, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:24:48', 0);
INSERT INTO `logs` VALUES (362, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:24:53', 0);
INSERT INTO `logs` VALUES (363, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:25:01', 0);
INSERT INTO `logs` VALUES (364, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:25:06', 0);
INSERT INTO `logs` VALUES (365, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:27:06', 0);
INSERT INTO `logs` VALUES (366, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 3/4 SMOOTH CARBON AT: Username - dadmin', '2023-06-14 15:36:56', 0);
INSERT INTO `logs` VALUES (367, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:36:56', 0);
INSERT INTO `logs` VALUES (368, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:37:02', 0);
INSERT INTO `logs` VALUES (369, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:37:07', 0);
INSERT INTO `logs` VALUES (370, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:37:13', 0);
INSERT INTO `logs` VALUES (371, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:37:57', 0);
INSERT INTO `logs` VALUES (372, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 3/4 EGO E5 ĐEN NHÁM AT: Username - dadmin', '2023-06-14 15:46:39', 0);
INSERT INTO `logs` VALUES (373, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:46:39', 0);
INSERT INTO `logs` VALUES (374, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:46:45', 0);
INSERT INTO `logs` VALUES (375, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:46:49', 0);
INSERT INTO `logs` VALUES (376, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:46:57', 0);
INSERT INTO `logs` VALUES (377, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:55:53', 0);
INSERT INTO `logs` VALUES (378, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 3/4 ZEUS 205 CAMO XÁM AT: Username - dadmin', '2023-06-14 15:57:11', 0);
INSERT INTO `logs` VALUES (379, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:57:11', 0);
INSERT INTO `logs` VALUES (380, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:57:16', 0);
INSERT INTO `logs` VALUES (381, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:57:20', 0);
INSERT INTO `logs` VALUES (382, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:57:24', 0);
INSERT INTO `logs` VALUES (383, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:58:17', 0);
INSERT INTO `logs` VALUES (384, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 3/4 NAPOLI N189 AT: Username - dadmin', '2023-06-14 15:59:43', 0);
INSERT INTO `logs` VALUES (385, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:59:43', 0);
INSERT INTO `logs` VALUES (386, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:59:50', 0);
INSERT INTO `logs` VALUES (387, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:59:55', 0);
INSERT INTO `logs` VALUES (388, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 15:59:59', 0);
INSERT INTO `logs` VALUES (389, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:02:45', 0);
INSERT INTO `logs` VALUES (390, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 3/4 ZEUS 613B XÁM AT: Username - dadmin', '2023-06-14 16:04:06', 0);
INSERT INTO `logs` VALUES (391, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:04:06', 0);
INSERT INTO `logs` VALUES (392, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:04:13', 0);
INSERT INTO `logs` VALUES (393, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:04:21', 0);
INSERT INTO `logs` VALUES (394, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:04:25', 0);
INSERT INTO `logs` VALUES (395, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:05:10', 0);
INSERT INTO `logs` VALUES (396, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ LẬT HÀM YOHE 935SV AT: Username - dadmin', '2023-06-14 16:06:35', 0);
INSERT INTO `logs` VALUES (397, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:06:35', 0);
INSERT INTO `logs` VALUES (398, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:06:48', 0);
INSERT INTO `logs` VALUES (399, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:06:56', 0);
INSERT INTO `logs` VALUES (400, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:12:37', 0);
INSERT INTO `logs` VALUES (401, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE KYT TT-COURSE LEOPARD AT: Username - dadmin', '2023-06-14 16:13:59', 0);
INSERT INTO `logs` VALUES (402, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:13:59', 0);
INSERT INTO `logs` VALUES (403, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:05', 0);
INSERT INTO `logs` VALUES (404, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:10', 0);
INSERT INTO `logs` VALUES (405, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:14', 0);
INSERT INTO `logs` VALUES (406, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:32', 0);
INSERT INTO `logs` VALUES (407, 0, 'dadmin', 'AUTH UPDATE IMAGE', 'UPDATE IMAGE AT: Username - dadmin', '2023-06-14 16:14:36', 0);
INSERT INTO `logs` VALUES (408, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:36', 0);
INSERT INTO `logs` VALUES (409, 0, 'dadmin', 'AUTH UPDATE IMAGE', 'UPDATE IMAGE AT: Username - dadmin', '2023-06-14 16:14:54', 0);
INSERT INTO `logs` VALUES (410, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:14:54', 0);
INSERT INTO `logs` VALUES (411, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE KYT TT-COURSE LEOPARD AT: Username - dadmin', '2023-06-14 16:15:05', 0);
INSERT INTO `logs` VALUES (412, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:15:05', 0);
INSERT INTO `logs` VALUES (413, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:15:39', 0);
INSERT INTO `logs` VALUES (414, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ LẬT HÀM EGO E-9 AT: Username - dadmin', '2023-06-14 16:23:51', 0);
INSERT INTO `logs` VALUES (415, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:23:51', 0);
INSERT INTO `logs` VALUES (416, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:23:57', 0);
INSERT INTO `logs` VALUES (417, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:24:02', 0);
INSERT INTO `logs` VALUES (418, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:24:07', 0);
INSERT INTO `logs` VALUES (419, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:24:14', 0);
INSERT INTO `logs` VALUES (420, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:24:47', 0);
INSERT INTO `logs` VALUES (421, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE SUNDA 823 AT: Username - dadmin', '2023-06-14 16:28:46', 0);
INSERT INTO `logs` VALUES (422, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:28:46', 0);
INSERT INTO `logs` VALUES (423, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:28:56', 0);
INSERT INTO `logs` VALUES (424, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:29:02', 0);
INSERT INTO `logs` VALUES (425, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:29:06', 0);
INSERT INTO `logs` VALUES (426, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:29:11', 0);
INSERT INTO `logs` VALUES (427, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:29:50', 0);
INSERT INTO `logs` VALUES (428, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE TORC T18 AT: Username - dadmin', '2023-06-14 16:32:00', 0);
INSERT INTO `logs` VALUES (429, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:32:00', 0);
INSERT INTO `logs` VALUES (430, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE TORC T18 AT: Username - dadmin', '2023-06-14 16:35:00', 0);
INSERT INTO `logs` VALUES (431, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:35:00', 0);
INSERT INTO `logs` VALUES (432, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:35:06', 0);
INSERT INTO `logs` VALUES (433, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:35:11', 0);
INSERT INTO `logs` VALUES (434, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:35:15', 0);
INSERT INTO `logs` VALUES (435, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:35:22', 0);
INSERT INTO `logs` VALUES (436, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:36:01', 0);
INSERT INTO `logs` VALUES (437, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE YOHE 978 PLUS SRT AT: Username - dadmin', '2023-06-14 16:36:25', 0);
INSERT INTO `logs` VALUES (438, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:36:25', 0);
INSERT INTO `logs` VALUES (439, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:37:52', 0);
INSERT INTO `logs` VALUES (440, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:37:56', 0);
INSERT INTO `logs` VALUES (441, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:38:00', 0);
INSERT INTO `logs` VALUES (442, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:38:05', 0);
INSERT INTO `logs` VALUES (443, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:38:44', 0);
INSERT INTO `logs` VALUES (444, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE SUNDA 821 AT: Username - dadmin', '2023-06-14 16:40:25', 0);
INSERT INTO `logs` VALUES (445, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:40:25', 0);
INSERT INTO `logs` VALUES (446, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:40:32', 0);
INSERT INTO `logs` VALUES (447, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:40:37', 0);
INSERT INTO `logs` VALUES (448, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:40:41', 0);
INSERT INTO `logs` VALUES (449, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:40:45', 0);
INSERT INTO `logs` VALUES (450, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:41:04', 0);
INSERT INTO `logs` VALUES (451, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:42:33', 0);
INSERT INTO `logs` VALUES (452, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:42:37', 0);
INSERT INTO `logs` VALUES (453, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:42:42', 0);
INSERT INTO `logs` VALUES (454, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:42:46', 0);
INSERT INTO `logs` VALUES (455, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE ROYAL M266 TEM PLASMA AT: Username - dadmin', '2023-06-14 16:43:09', 0);
INSERT INTO `logs` VALUES (456, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:43:09', 0);
INSERT INTO `logs` VALUES (457, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:43:21', 0);
INSERT INTO `logs` VALUES (458, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE ROYAL M266 TEM DRAGON BOY AT: Username - dadmin', '2023-06-14 16:43:47', 0);
INSERT INTO `logs` VALUES (459, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:43:47', 0);
INSERT INTO `logs` VALUES (460, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:47:39', 0);
INSERT INTO `logs` VALUES (461, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:47:43', 0);
INSERT INTO `logs` VALUES (462, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:47:47', 0);
INSERT INTO `logs` VALUES (463, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:47:51', 0);
INSERT INTO `logs` VALUES (464, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:48:01', 0);
INSERT INTO `logs` VALUES (465, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ FULLFACE LS2 OF606 DRIFTER AT: Username - dadmin', '2023-06-14 16:49:26', 0);
INSERT INTO `logs` VALUES (466, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:49:26', 0);
INSERT INTO `logs` VALUES (467, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:49:32', 0);
INSERT INTO `logs` VALUES (468, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:49:37', 0);
INSERT INTO `logs` VALUES (469, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:49:41', 0);
INSERT INTO `logs` VALUES (470, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:49:46', 0);
INSERT INTO `logs` VALUES (471, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:50:05', 0);
INSERT INTO `logs` VALUES (472, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ROYAL M153K AT: Username - dadmin', '2023-06-14 16:50:27', 0);
INSERT INTO `logs` VALUES (473, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:50:27', 0);
INSERT INTO `logs` VALUES (474, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:51:35', 0);
INSERT INTO `logs` VALUES (475, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:51:39', 0);
INSERT INTO `logs` VALUES (476, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:51:45', 0);
INSERT INTO `logs` VALUES (477, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:51:54', 0);
INSERT INTO `logs` VALUES (478, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT NÓN XE ĐẠP ROYAL MD15 AT: Username - dadmin', '2023-06-14 16:53:06', 0);
INSERT INTO `logs` VALUES (479, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:53:06', 0);
INSERT INTO `logs` VALUES (480, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:53:11', 0);
INSERT INTO `logs` VALUES (481, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:53:16', 0);
INSERT INTO `logs` VALUES (482, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:53:20', 0);
INSERT INTO `logs` VALUES (483, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:53:43', 0);
INSERT INTO `logs` VALUES (484, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT NÓN XE ĐẠP ROYAL MD16 AT: Username - dadmin', '2023-06-14 16:54:29', 0);
INSERT INTO `logs` VALUES (485, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:54:29', 0);
INSERT INTO `logs` VALUES (486, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:54:40', 0);
INSERT INTO `logs` VALUES (487, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:54:44', 0);
INSERT INTO `logs` VALUES (488, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:55:02', 0);
INSERT INTO `logs` VALUES (489, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ROYAL M156 AT: Username - dadmin', '2023-06-14 16:57:45', 0);
INSERT INTO `logs` VALUES (490, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:57:45', 0);
INSERT INTO `logs` VALUES (491, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ROYAL M156 AT: Username - dadmin', '2023-06-14 16:57:53', 0);
INSERT INTO `logs` VALUES (492, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:57:53', 0);
INSERT INTO `logs` VALUES (493, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:57:58', 0);
INSERT INTO `logs` VALUES (494, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:58:03', 0);
INSERT INTO `logs` VALUES (495, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:58:13', 0);
INSERT INTO `logs` VALUES (496, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:58:32', 0);
INSERT INTO `logs` VALUES (497, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ASIA MT-106K AT: Username - dadmin', '2023-06-14 16:59:42', 0);
INSERT INTO `logs` VALUES (498, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:59:42', 0);
INSERT INTO `logs` VALUES (499, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:59:47', 0);
INSERT INTO `logs` VALUES (500, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:59:51', 0);
INSERT INTO `logs` VALUES (501, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 16:59:55', 0);
INSERT INTO `logs` VALUES (502, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:00:14', 0);
INSERT INTO `logs` VALUES (503, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ĐẦU TORC T-55 AT: Username - dadmin', '2023-06-14 17:01:31', 0);
INSERT INTO `logs` VALUES (504, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:01:31', 0);
INSERT INTO `logs` VALUES (505, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:01:40', 0);
INSERT INTO `logs` VALUES (506, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:01:44', 0);
INSERT INTO `logs` VALUES (507, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:01:48', 0);
INSERT INTO `logs` VALUES (508, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:01:51', 0);
INSERT INTO `logs` VALUES (509, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:02:08', 0);
INSERT INTO `logs` VALUES (510, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU ASIA MT-139 AT: Username - dadmin', '2023-06-14 17:03:18', 0);
INSERT INTO `logs` VALUES (511, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:03:18', 0);
INSERT INTO `logs` VALUES (512, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:03:23', 0);
INSERT INTO `logs` VALUES (513, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:03:28', 0);
INSERT INTO `logs` VALUES (514, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:03:32', 0);
INSERT INTO `logs` VALUES (515, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:03:59', 0);
INSERT INTO `logs` VALUES (516, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:05:17', 0);
INSERT INTO `logs` VALUES (517, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU SUNDA 135D AT: Username - dadmin', '2023-06-14 17:06:13', 0);
INSERT INTO `logs` VALUES (518, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:06:13', 0);
INSERT INTO `logs` VALUES (519, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:06:19', 0);
INSERT INTO `logs` VALUES (520, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:06:23', 0);
INSERT INTO `logs` VALUES (521, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:06:41', 0);
INSERT INTO `logs` VALUES (522, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU NAPOLI S46 KÍNH DẤU AT: Username - dadmin', '2023-06-14 17:08:02', 0);
INSERT INTO `logs` VALUES (523, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:02', 0);
INSERT INTO `logs` VALUES (524, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:08', 0);
INSERT INTO `logs` VALUES (525, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:12', 0);
INSERT INTO `logs` VALUES (526, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:16', 0);
INSERT INTO `logs` VALUES (527, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:20', 0);
INSERT INTO `logs` VALUES (528, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:08:39', 0);
INSERT INTO `logs` VALUES (529, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 1/2 ANDES 139 KÍNH DẤU AT: Username - dadmin', '2023-06-14 17:09:46', 0);
INSERT INTO `logs` VALUES (530, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:09:46', 0);
INSERT INTO `logs` VALUES (531, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:09:52', 0);
INSERT INTO `logs` VALUES (532, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:10:19', 0);
INSERT INTO `logs` VALUES (533, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:11:02', 0);
INSERT INTO `logs` VALUES (534, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ NỬA ĐẦU SUNDA 136D AT: Username - dadmin', '2023-06-14 17:11:08', 0);
INSERT INTO `logs` VALUES (535, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:11:08', 0);
INSERT INTO `logs` VALUES (536, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:11:20', 0);
INSERT INTO `logs` VALUES (537, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 1/2 ANDES 256 KÍNH DẤU AT: Username - dadmin', '2023-06-14 17:11:28', 0);
INSERT INTO `logs` VALUES (538, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:11:28', 0);
INSERT INTO `logs` VALUES (539, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:12:24', 0);
INSERT INTO `logs` VALUES (540, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 1/2 ANDES 256 KÍNH DẤU AT: Username - dadmin', '2023-06-14 17:12:32', 0);
INSERT INTO `logs` VALUES (541, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:12:32', 0);
INSERT INTO `logs` VALUES (542, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:12:38', 0);
INSERT INTO `logs` VALUES (543, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:12:56', 0);
INSERT INTO `logs` VALUES (544, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 1/2 ANDES 126 KÍNH AT: Username - dadmin', '2023-06-14 17:13:37', 0);
INSERT INTO `logs` VALUES (545, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:13:37', 0);
INSERT INTO `logs` VALUES (546, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:13:42', 0);
INSERT INTO `logs` VALUES (547, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:13:56', 0);
INSERT INTO `logs` VALUES (548, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT MŨ 1/2 ANDES HALY  AT: Username - dadmin', '2023-06-14 17:15:28', 0);
INSERT INTO `logs` VALUES (549, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:15:28', 0);
INSERT INTO `logs` VALUES (550, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:15:33', 0);
INSERT INTO `logs` VALUES (551, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:15:37', 0);
INSERT INTO `logs` VALUES (552, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:15:41', 0);
INSERT INTO `logs` VALUES (553, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:20:07', 0);
INSERT INTO `logs` VALUES (554, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:20:16', 0);
INSERT INTO `logs` VALUES (555, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT HP 03B tai mèo cute AT: Username - dadmin', '2023-06-14 17:20:19', 0);
INSERT INTO `logs` VALUES (556, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:20:19', 0);
INSERT INTO `logs` VALUES (557, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:20:31', 0);
INSERT INTO `logs` VALUES (558, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm 1/2 SRT 01 AT: Username - dadmin', '2023-06-14 17:21:23', 0);
INSERT INTO `logs` VALUES (559, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:21:23', 0);
INSERT INTO `logs` VALUES (560, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:21:32', 0);
INSERT INTO `logs` VALUES (561, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Royal M136 Nón FullFace AT: Username - dadmin', '2023-06-14 17:21:57', 0);
INSERT INTO `logs` VALUES (562, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:21:57', 0);
INSERT INTO `logs` VALUES (563, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:23:50', 0);
INSERT INTO `logs` VALUES (564, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Royal M179 Fullface Lật Hàm AT: Username - dadmin', '2023-06-14 17:24:08', 0);
INSERT INTO `logs` VALUES (565, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:24:08', 0);
INSERT INTO `logs` VALUES (566, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:24:16', 0);
INSERT INTO `logs` VALUES (567, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm Royal H01 AT: Username - dadmin', '2023-06-14 17:24:31', 0);
INSERT INTO `logs` VALUES (568, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:24:31', 0);
INSERT INTO `logs` VALUES (569, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:24:38', 0);
INSERT INTO `logs` VALUES (570, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:25:17', 0);
INSERT INTO `logs` VALUES (571, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón Royal M138B AT: Username - dadmin', '2023-06-14 17:25:29', 0);
INSERT INTO `logs` VALUES (572, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:25:29', 0);
INSERT INTO `logs` VALUES (573, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:25:37', 0);
INSERT INTO `logs` VALUES (574, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ phượt 3/4 Bulldog Bravo AT: Username - dadmin', '2023-06-14 17:25:57', 0);
INSERT INTO `logs` VALUES (575, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:25:57', 0);
INSERT INTO `logs` VALUES (576, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:26:09', 0);
INSERT INTO `logs` VALUES (577, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ phượt 3/4 Bulldog Bravo AT: Username - dadmin', '2023-06-14 17:27:07', 0);
INSERT INTO `logs` VALUES (578, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:27:07', 0);
INSERT INTO `logs` VALUES (579, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 17:36:48', 0);
INSERT INTO `logs` VALUES (580, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 17:38:51', 0);
INSERT INTO `logs` VALUES (581, 0, 'dadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - dadmin', '2023-06-14 17:40:20', 0);
INSERT INTO `logs` VALUES (582, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:40:36', 0);
INSERT INTO `logs` VALUES (583, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:40:40', 0);
INSERT INTO `logs` VALUES (584, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón 3/4 Bulldog POM AT: Username - dadmin', '2023-06-14 17:41:19', 0);
INSERT INTO `logs` VALUES (585, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:41:19', 0);
INSERT INTO `logs` VALUES (586, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:41:27', 0);
INSERT INTO `logs` VALUES (587, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT NÓN POC PK01 AT: Username - dadmin', '2023-06-14 17:41:56', 0);
INSERT INTO `logs` VALUES (588, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:41:56', 0);
INSERT INTO `logs` VALUES (589, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:42:08', 0);
INSERT INTO `logs` VALUES (590, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT NÓN POC P16 AT: Username - dadmin', '2023-06-14 17:42:32', 0);
INSERT INTO `logs` VALUES (591, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:42:32', 0);
INSERT INTO `logs` VALUES (592, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:42:38', 0);
INSERT INTO `logs` VALUES (593, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:43:00', 0);
INSERT INTO `logs` VALUES (594, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Bulldog Beagle AT: Username - dadmin', '2023-06-14 17:43:28', 0);
INSERT INTO `logs` VALUES (595, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:43:28', 0);
INSERT INTO `logs` VALUES (596, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:43:36', 0);
INSERT INTO `logs` VALUES (597, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Bulldog Beagle 2 chính hãng AT: Username - dadmin', '2023-06-14 17:43:58', 0);
INSERT INTO `logs` VALUES (598, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:43:58', 0);
INSERT INTO `logs` VALUES (599, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:44:10', 0);
INSERT INTO `logs` VALUES (600, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT GRS A737K- Mũ bảo hiểm AT: Username - dadmin', '2023-06-14 17:44:49', 0);
INSERT INTO `logs` VALUES (601, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:44:49', 0);
INSERT INTO `logs` VALUES (602, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:45:29', 0);
INSERT INTO `logs` VALUES (603, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT GRS A33K – Nón bảo hiểm AT: Username - dadmin', '2023-06-14 17:45:52', 0);
INSERT INTO `logs` VALUES (604, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:45:52', 0);
INSERT INTO `logs` VALUES (605, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:45:59', 0);
INSERT INTO `logs` VALUES (606, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface LS2 FF353 AT: Username - dadmin', '2023-06-14 17:46:20', 0);
INSERT INTO `logs` VALUES (607, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:46:20', 0);
INSERT INTO `logs` VALUES (608, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:46:26', 0);
INSERT INTO `logs` VALUES (609, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT AGU A138 tem 46 nón phượt AT: Username - dadmin', '2023-06-14 17:46:43', 0);
INSERT INTO `logs` VALUES (610, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:46:43', 0);
INSERT INTO `logs` VALUES (611, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:46:49', 0);
INSERT INTO `logs` VALUES (612, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm có cằm GRS 801K AT: Username - dadmin', '2023-06-14 17:47:10', 0);
INSERT INTO `logs` VALUES (613, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:47:10', 0);
INSERT INTO `logs` VALUES (614, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:47:18', 0);
INSERT INTO `logs` VALUES (615, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF327 Challenger AT: Username - dadmin', '2023-06-14 17:47:48', 0);
INSERT INTO `logs` VALUES (616, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:47:48', 0);
INSERT INTO `logs` VALUES (617, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:47:51', 0);
INSERT INTO `logs` VALUES (618, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón bảo hiểm Royal H01 AT: Username - dadmin', '2023-06-14 17:48:15', 0);
INSERT INTO `logs` VALUES (619, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:48:15', 0);
INSERT INTO `logs` VALUES (620, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:48:20', 0);
INSERT INTO `logs` VALUES (621, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF353 Rapid Đen Tem Xám AT: Username - dadmin', '2023-06-14 17:48:46', 0);
INSERT INTO `logs` VALUES (622, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:48:46', 0);
INSERT INTO `logs` VALUES (623, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:49:02', 0);
INSERT INTO `logs` VALUES (624, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF900 Valiant II Cooper AT: Username - dadmin', '2023-06-14 17:49:31', 0);
INSERT INTO `logs` VALUES (625, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:49:31', 0);
INSERT INTO `logs` VALUES (626, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:49:37', 0);
INSERT INTO `logs` VALUES (627, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF900 Valiant II Solid AT: Username - dadmin', '2023-06-14 17:50:19', 0);
INSERT INTO `logs` VALUES (628, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:50:19', 0);
INSERT INTO `logs` VALUES (629, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:50:24', 0);
INSERT INTO `logs` VALUES (630, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF900 Valiant II Orbit AT: Username - dadmin', '2023-06-14 17:50:50', 0);
INSERT INTO `logs` VALUES (631, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:50:50', 0);
INSERT INTO `logs` VALUES (632, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:50:55', 0);
INSERT INTO `logs` VALUES (633, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface ROC 03 hai kính AT: Username - dadmin', '2023-06-14 17:51:39', 0);
INSERT INTO `logs` VALUES (634, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:51:39', 0);
INSERT INTO `logs` VALUES (635, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:51:45', 0);
INSERT INTO `logs` VALUES (636, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón 3/4 đầu EGO E5 kính âm AT: Username - dadmin', '2023-06-14 17:52:11', 0);
INSERT INTO `logs` VALUES (637, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 17:52:11', 0);
INSERT INTO `logs` VALUES (638, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:01:01', 0);
INSERT INTO `logs` VALUES (639, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Yohe 981-Nón fullface 2 kính AT: Username - dadmin', '2023-06-14 18:03:03', 0);
INSERT INTO `logs` VALUES (640, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:03:03', 0);
INSERT INTO `logs` VALUES (641, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:03:11', 0);
INSERT INTO `logs` VALUES (642, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón lật hàm EGO E9 2 kính AT: Username - dadmin', '2023-06-14 18:03:52', 0);
INSERT INTO `logs` VALUES (643, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:03:52', 0);
INSERT INTO `logs` VALUES (644, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:05:13', 0);
INSERT INTO `logs` VALUES (645, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT LS2 FF327 Challenger Flex AT: Username - dadmin', '2023-06-14 18:05:36', 0);
INSERT INTO `logs` VALUES (646, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:05:36', 0);
INSERT INTO `logs` VALUES (647, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:05:47', 0);
INSERT INTO `logs` VALUES (648, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ fullface LS2 FF327 AT: Username - dadmin', '2023-06-14 18:06:06', 0);
INSERT INTO `logs` VALUES (649, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:06:06', 0);
INSERT INTO `logs` VALUES (650, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:06:13', 0);
INSERT INTO `logs` VALUES (651, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface ROC 01-Nón lật AT: Username - dadmin', '2023-06-14 18:06:59', 0);
INSERT INTO `logs` VALUES (652, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:06:59', 0);
INSERT INTO `logs` VALUES (653, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:07:04', 0);
INSERT INTO `logs` VALUES (654, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface 2 kính EGO E6 AT: Username - dadmin', '2023-06-14 18:07:22', 0);
INSERT INTO `logs` VALUES (655, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:07:22', 0);
INSERT INTO `logs` VALUES (656, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:07:28', 0);
INSERT INTO `logs` VALUES (657, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface EGO E7 AT: Username - dadmin', '2023-06-14 18:07:51', 0);
INSERT INTO `logs` VALUES (658, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:07:51', 0);
INSERT INTO `logs` VALUES (659, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:07:59', 0);
INSERT INTO `logs` VALUES (660, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm LS2 FF800 STORM AT: Username - dadmin', '2023-06-14 18:08:28', 0);
INSERT INTO `logs` VALUES (661, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:08:28', 0);
INSERT INTO `logs` VALUES (662, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:08:31', 0);
INSERT INTO `logs` VALUES (663, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ Fullface LS2 Stream FF320 AT: Username - dadmin', '2023-06-14 18:08:53', 0);
INSERT INTO `logs` VALUES (664, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:08:53', 0);
INSERT INTO `logs` VALUES (665, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:08:59', 0);
INSERT INTO `logs` VALUES (666, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface AGU A138 RACING AT: Username - dadmin', '2023-06-14 18:09:26', 0);
INSERT INTO `logs` VALUES (667, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:09:26', 0);
INSERT INTO `logs` VALUES (668, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:09:33', 0);
INSERT INTO `logs` VALUES (669, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface giá rẻ EGO E-8 AT: Username - dadmin', '2023-06-14 18:10:48', 0);
INSERT INTO `logs` VALUES (670, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:10:48', 0);
INSERT INTO `logs` VALUES (671, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:10:52', 0);
INSERT INTO `logs` VALUES (672, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:10:58', 0);
INSERT INTO `logs` VALUES (673, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface Yohe 938 lật hàm AT: Username - dadmin', '2023-06-14 18:11:25', 0);
INSERT INTO `logs` VALUES (674, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:11:25', 0);
INSERT INTO `logs` VALUES (675, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:11:30', 0);
INSERT INTO `logs` VALUES (676, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón fullface cao cấp GRS 639 AT: Username - dadmin', '2023-06-14 18:11:48', 0);
INSERT INTO `logs` VALUES (677, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:11:48', 0);
INSERT INTO `logs` VALUES (678, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:12:10', 0);
INSERT INTO `logs` VALUES (679, 0, 'dadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Yohe 878 nón bảo hiểm 3/4 AT: Username - dadmin', '2023-06-14 18:12:32', 0);
INSERT INTO `logs` VALUES (680, 0, 'dadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - dadmin', '2023-06-14 18:12:32', 0);
INSERT INTO `logs` VALUES (681, 0, 'ashq', 'AUTH ', '', '2023-06-14 20:21:39', 0);
INSERT INTO `logs` VALUES (682, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:21:57', 0);
INSERT INTO `logs` VALUES (683, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:22:02', 0);
INSERT INTO `logs` VALUES (684, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:22:05', 0);
INSERT INTO `logs` VALUES (685, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:23:13', 0);
INSERT INTO `logs` VALUES (686, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:25:04', 0);
INSERT INTO `logs` VALUES (687, 0, 'qadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm 1/2 SRT 01 AT: Username - qadmin', '2023-06-14 20:25:15', 0);
INSERT INTO `logs` VALUES (688, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:25:15', 0);
INSERT INTO `logs` VALUES (689, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 20:26:11', 0);
INSERT INTO `logs` VALUES (690, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:26:24', 0);
INSERT INTO `logs` VALUES (691, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:34:30', 0);
INSERT INTO `logs` VALUES (692, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:38:32', 0);
INSERT INTO `logs` VALUES (693, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:39:33', 0);
INSERT INTO `logs` VALUES (694, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:39:36', 0);
INSERT INTO `logs` VALUES (695, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:39:51', 0);
INSERT INTO `logs` VALUES (696, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:43:55', 0);
INSERT INTO `logs` VALUES (697, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:43:59', 0);
INSERT INTO `logs` VALUES (698, 0, 'qadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT HP 03B tai mèo cute AT: Username - qadmin', '2023-06-14 20:44:00', 0);
INSERT INTO `logs` VALUES (699, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:00', 0);
INSERT INTO `logs` VALUES (700, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:06', 0);
INSERT INTO `logs` VALUES (701, 0, 'qadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ phượt 3/4 Bulldog Bravo AT: Username - qadmin', '2023-06-14 20:44:11', 0);
INSERT INTO `logs` VALUES (702, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:11', 0);
INSERT INTO `logs` VALUES (703, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:16', 0);
INSERT INTO `logs` VALUES (704, 0, 'qadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Mũ bảo hiểm 1/2 SRT 01 AT: Username - qadmin', '2023-06-14 20:44:18', 0);
INSERT INTO `logs` VALUES (705, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:18', 0);
INSERT INTO `logs` VALUES (706, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:24', 0);
INSERT INTO `logs` VALUES (707, 0, 'qadmin', 'AUTH UPDATE PRODUCT', 'UPDATE PRODUCT Nón trùm đầu kính ẩn chống nắng GRS 388K AT: Username - qadmin', '2023-06-14 20:44:33', 0);
INSERT INTO `logs` VALUES (708, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:44:33', 0);
INSERT INTO `logs` VALUES (709, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:45:05', 0);
INSERT INTO `logs` VALUES (710, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:45:50', 0);
INSERT INTO `logs` VALUES (711, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:45:55', 0);
INSERT INTO `logs` VALUES (712, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:53:38', 0);
INSERT INTO `logs` VALUES (713, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 20:58:07', 0);
INSERT INTO `logs` VALUES (714, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:58:14', 0);
INSERT INTO `logs` VALUES (715, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:58:37', 0);
INSERT INTO `logs` VALUES (716, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:58:47', 0);
INSERT INTO `logs` VALUES (717, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:59:16', 0);
INSERT INTO `logs` VALUES (718, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 20:59:28', 0);
INSERT INTO `logs` VALUES (719, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:05:10', 0);
INSERT INTO `logs` VALUES (720, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:05:15', 0);
INSERT INTO `logs` VALUES (721, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:05:21', 0);
INSERT INTO `logs` VALUES (722, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:05:31', 0);
INSERT INTO `logs` VALUES (723, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:05:41', 0);
INSERT INTO `logs` VALUES (724, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:05:58', 0);
INSERT INTO `logs` VALUES (725, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:06:08', 0);
INSERT INTO `logs` VALUES (726, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:07:23', 0);
INSERT INTO `logs` VALUES (727, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:07:32', 0);
INSERT INTO `logs` VALUES (728, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:07:40', 0);
INSERT INTO `logs` VALUES (729, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:07:42', 0);
INSERT INTO `logs` VALUES (730, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:07:50', 0);
INSERT INTO `logs` VALUES (731, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:07:51', 0);
INSERT INTO `logs` VALUES (732, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:08:25', 0);
INSERT INTO `logs` VALUES (733, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:11:18', 0);
INSERT INTO `logs` VALUES (734, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:12:46', 0);
INSERT INTO `logs` VALUES (735, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:12:52', 0);
INSERT INTO `logs` VALUES (736, 0, 'qadmin', 'AUTH UPDATE IMAGE', 'UPDATE IMAGE AT: Username - qadmin', '2023-06-14 21:12:59', 0);
INSERT INTO `logs` VALUES (737, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:12:59', 0);
INSERT INTO `logs` VALUES (738, 0, 'qadmin', 'AUTH UPDATE IMAGE', 'UPDATE IMAGE AT: Username - qadmin', '2023-06-14 21:13:03', 0);
INSERT INTO `logs` VALUES (739, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:13:03', 0);
INSERT INTO `logs` VALUES (740, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:15:15', 0);
INSERT INTO `logs` VALUES (741, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:16:24', 0);
INSERT INTO `logs` VALUES (742, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:16:31', 0);
INSERT INTO `logs` VALUES (743, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:16:35', 0);
INSERT INTO `logs` VALUES (744, 0, 'qadmin', 'AUTH UPDATE IMAGE', 'UPDATE IMAGE AT: Username - qadmin', '2023-06-14 21:16:47', 0);
INSERT INTO `logs` VALUES (745, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:16:47', 0);
INSERT INTO `logs` VALUES (746, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:16:53', 0);
INSERT INTO `logs` VALUES (747, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:18:38', 0);
INSERT INTO `logs` VALUES (748, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:18:44', 0);
INSERT INTO `logs` VALUES (749, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:18:47', 0);
INSERT INTO `logs` VALUES (750, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:18:50', 0);
INSERT INTO `logs` VALUES (751, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:18:52', 0);
INSERT INTO `logs` VALUES (752, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 21:20:39', 0);
INSERT INTO `logs` VALUES (753, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:20:46', 0);
INSERT INTO `logs` VALUES (754, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:20:57', 0);
INSERT INTO `logs` VALUES (755, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:21:00', 0);
INSERT INTO `logs` VALUES (756, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 21:42:24', 0);
INSERT INTO `logs` VALUES (757, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:25:37', 0);
INSERT INTO `logs` VALUES (758, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 22:25:43', 0);
INSERT INTO `logs` VALUES (759, 0, 'qadmin', 'AUTH EDIT PRODUCT', 'EDIT PRODUCT null AT: Username - qadmin', '2023-06-14 22:26:03', 0);
INSERT INTO `logs` VALUES (760, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:28:10', 0);
INSERT INTO `logs` VALUES (761, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:28:13', 0);
INSERT INTO `logs` VALUES (762, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:28:14', 0);
INSERT INTO `logs` VALUES (763, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:29:16', 0);
INSERT INTO `logs` VALUES (764, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:29:19', 0);
INSERT INTO `logs` VALUES (765, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:29:19', 0);
INSERT INTO `logs` VALUES (766, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:34:05', 0);
INSERT INTO `logs` VALUES (767, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:34:46', 0);
INSERT INTO `logs` VALUES (768, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:34:50', 0);
INSERT INTO `logs` VALUES (769, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:34:50', 0);
INSERT INTO `logs` VALUES (770, 0, NULL, 'AUTH VIEW', 'VIEW PRODUCT null: Username - null', '2023-06-14 22:38:01', 0);
INSERT INTO `logs` VALUES (771, 0, NULL, 'AUTH ', '', '2023-06-14 22:38:03', 0);
INSERT INTO `logs` VALUES (772, 0, NULL, 'AUTH VIEW', 'VIEW PRODUCT null: Username - null', '2023-06-14 22:38:04', 0);
INSERT INTO `logs` VALUES (773, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:38:43', 0);
INSERT INTO `logs` VALUES (774, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:44:52', 0);
INSERT INTO `logs` VALUES (775, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:44:56', 0);
INSERT INTO `logs` VALUES (776, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:44:58', 0);
INSERT INTO `logs` VALUES (777, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:44:58', 0);
INSERT INTO `logs` VALUES (778, 0, NULL, 'AUTH VIEW', 'VIEW PRODUCT null: Username - null', '2023-06-14 22:50:10', 0);
INSERT INTO `logs` VALUES (779, 0, NULL, 'AUTH ', '', '2023-06-14 22:50:13', 0);
INSERT INTO `logs` VALUES (780, 0, NULL, 'AUTH VIEW', 'VIEW PRODUCT null: Username - null', '2023-06-14 22:50:13', 0);
INSERT INTO `logs` VALUES (781, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:52:51', 0);
INSERT INTO `logs` VALUES (782, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:52:54', 0);
INSERT INTO `logs` VALUES (783, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:52:56', 0);
INSERT INTO `logs` VALUES (784, 0, 'qadmin', 'AUTH VIEW', 'VIEW PRODUCT null: Username - qadmin', '2023-06-14 22:52:57', 0);
INSERT INTO `logs` VALUES (785, 0, 'qadmin', 'AUTH ', '', '2023-06-14 22:53:11', 0);
INSERT INTO `logs` VALUES (786, 0, '104738908913076708697', 'AUTH VIEW', 'VIEW PRODUCT null: Username - 104738908913076708697', '2023-06-14 22:54:48', 0);
INSERT INTO `logs` VALUES (787, 0, '104738908913076708697', 'AUTH ', '', '2023-06-14 22:54:50', 0);
INSERT INTO `logs` VALUES (788, 0, '104738908913076708697', 'AUTH VIEW', 'VIEW PRODUCT null: Username - 104738908913076708697', '2023-06-14 22:54:50', 0);
INSERT INTO `logs` VALUES (789, 0, NULL, 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - null', '2023-06-14 22:56:42', 0);
INSERT INTO `logs` VALUES (790, 0, '104738908913076708697', 'AUTH VIEW', 'VIEW PRODUCT null: Username - 104738908913076708697', '2023-06-14 22:56:52', 0);
INSERT INTO `logs` VALUES (791, 0, '104738908913076708697', 'AUTH ', '', '2023-06-14 22:56:56', 0);
INSERT INTO `logs` VALUES (792, 0, '104738908913076708697', 'AUTH VIEW', 'VIEW PRODUCT null: Username - 104738908913076708697', '2023-06-14 22:56:56', 0);
INSERT INTO `logs` VALUES (793, 0, '104738908913076708697', 'AUTH LOGOUT', 'LOGOUT SUCCESS: Username - 104738908913076708697', '2023-06-14 22:57:49', 0);
INSERT INTO `logs` VALUES (794, 0, 'qadmin', 'AUTH LOGIN', 'LOGIN SUCCESS: Username - qadmin', '2023-06-14 22:57:54', 0);

-- ----------------------------
-- Table structure for manager_permissions
-- ----------------------------
DROP TABLE IF EXISTS `manager_permissions`;
CREATE TABLE `manager_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission` int(11) NULL DEFAULT NULL,
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow` int(11) NULL DEFAULT NULL,
  `link_page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 543 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager_permissions
-- ----------------------------
INSERT INTO `manager_permissions` VALUES (1, 3, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/forms.jsp', 'CREATE');
INSERT INTO `manager_permissions` VALUES (2, 3, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/Remove', 'DELETE');
INSERT INTO `manager_permissions` VALUES (3, 3, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/ManageProduct', 'VIEW');
INSERT INTO `manager_permissions` VALUES (4, 3, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/DetailProduct', 'EDIT');
INSERT INTO `manager_permissions` VALUES (5, 2, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/forms.jsp', 'CREATE');
INSERT INTO `manager_permissions` VALUES (6, 2, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/Remove', 'DELETE');
INSERT INTO `manager_permissions` VALUES (7, 2, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/ManageProduct', 'VIEW');
INSERT INTO `manager_permissions` VALUES (8, 2, 'quản lý sản phẩm', 0, '/Project_CuaHangMuBaoHiem_war/DetailProduct', 'EDIT');
INSERT INTO `manager_permissions` VALUES (9, 1, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/forms.jsp', 'CREATE');
INSERT INTO `manager_permissions` VALUES (10, 1, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/Remove', 'DELETE');
INSERT INTO `manager_permissions` VALUES (11, 1, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/ManageProduct', 'VIEW');
INSERT INTO `manager_permissions` VALUES (12, 1, 'quản lý sản phẩm', 1, '/Project_CuaHangMuBaoHiem_war/DetailProduct', 'EDIT');
INSERT INTO `manager_permissions` VALUES (13, 3, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/delete-bill', 'DELETE');
INSERT INTO `manager_permissions` VALUES (14, 3, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/list-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (15, 3, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/form-fix-bill', 'EDIT');
INSERT INTO `manager_permissions` VALUES (16, 2, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/delete-bill', 'DELETE');
INSERT INTO `manager_permissions` VALUES (17, 2, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/list-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (18, 2, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/form-fix-bill', 'EDIT');
INSERT INTO `manager_permissions` VALUES (19, 1, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/delete-bill', 'DELETE');
INSERT INTO `manager_permissions` VALUES (20, 1, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/list-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (21, 1, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/form-fix-bill', 'EDIT');
INSERT INTO `manager_permissions` VALUES (22, 3, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/delete-customer', 'DELETE');
INSERT INTO `manager_permissions` VALUES (23, 3, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/list-customer', 'VIEW');
INSERT INTO `manager_permissions` VALUES (24, 3, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/detail-customer', 'EDIT');
INSERT INTO `manager_permissions` VALUES (25, 2, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/delete-customer', 'DELETE');
INSERT INTO `manager_permissions` VALUES (26, 2, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/list-customer', 'VIEW');
INSERT INTO `manager_permissions` VALUES (27, 2, 'quản lý khách hàng', 0, '/Project_CuaHangMuBaoHiem_war/detail-customer', 'EDIT');
INSERT INTO `manager_permissions` VALUES (28, 1, 'quản lý khách hàng', 1, '/Project_CuaHangMuBaoHiem_war/delete-customer', 'DELETE');
INSERT INTO `manager_permissions` VALUES (29, 1, 'quản lý khách hàng', 1, '/Project_CuaHangMuBaoHiem_war/list-customer', 'VIEW');
INSERT INTO `manager_permissions` VALUES (30, 1, 'quản lý khách hàng', 1, '/Project_CuaHangMuBaoHiem_war/detail-customer', 'EDIT');
INSERT INTO `manager_permissions` VALUES (31, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadSlideShow', 'CREATE');
INSERT INTO `manager_permissions` VALUES (32, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveSlideShow', 'DELETE');
INSERT INTO `manager_permissions` VALUES (33, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/ManageHome', 'VIEW');
INSERT INTO `manager_permissions` VALUES (34, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UpdateAllowSlideShow', 'EDIT');
INSERT INTO `manager_permissions` VALUES (35, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadSlideShow', 'CREATE');
INSERT INTO `manager_permissions` VALUES (36, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveSlideShow', 'DELETE');
INSERT INTO `manager_permissions` VALUES (37, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/ManageHome', 'VIEW');
INSERT INTO `manager_permissions` VALUES (38, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UpdateAllowSlideShow', 'EDIT');
INSERT INTO `manager_permissions` VALUES (39, 1, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadSlideShow', 'CREATE');
INSERT INTO `manager_permissions` VALUES (40, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/RemoveSlideShow', 'DELETE');
INSERT INTO `manager_permissions` VALUES (41, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/ManageHome', 'VIEW');
INSERT INTO `manager_permissions` VALUES (42, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/UpdateAllowSlideShow', 'EDIT');
INSERT INTO `manager_permissions` VALUES (43, 3, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/list-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (44, 3, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/change-display-comment', 'EDIT');
INSERT INTO `manager_permissions` VALUES (45, 2, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/list-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (46, 2, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/change-display-comment', 'EDIT');
INSERT INTO `manager_permissions` VALUES (47, 1, 'quản lý bình luận', 1, '/Project_CuaHangMuBaoHiem_war/list-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (48, 1, 'quản lý bình luận', 1, '/Project_CuaHangMuBaoHiem_war/change-display-comment', 'EDIT');
INSERT INTO `manager_permissions` VALUES (49, 3, 'quản lý nhập hàng', 0, '/Project_CuaHangMuBaoHiem_war/ManageImport', 'VIEW');
INSERT INTO `manager_permissions` VALUES (50, 2, 'quản lý nhập hàng', 1, '/Project_CuaHangMuBaoHiem_war/ManageImport', 'VIEW');
INSERT INTO `manager_permissions` VALUES (51, 1, 'quản lý nhập hàng', 1, '/Project_CuaHangMuBaoHiem_war/ManageImport', 'VIEW');
INSERT INTO `manager_permissions` VALUES (52, 3, 'quản lý hàng tồn kho', 0, '/Project_CuaHangMuBaoHiem_war/CheckInventory', 'VIEW');
INSERT INTO `manager_permissions` VALUES (53, 2, 'quản lý hàng tồn kho', 1, '/Project_CuaHangMuBaoHiem_war/CheckInventory', 'VIEW');
INSERT INTO `manager_permissions` VALUES (54, 1, 'quản lý hàng tồn kho', 1, '/Project_CuaHangMuBaoHiem_war/CheckInventory', 'VIEW');
INSERT INTO `manager_permissions` VALUES (55, 3, 'quản lý liên hệ', 0, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'VIEW');
INSERT INTO `manager_permissions` VALUES (56, 2, 'quản lý liên hệ', 1, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'VIEW');
INSERT INTO `manager_permissions` VALUES (57, 1, 'quản lý liên hệ', 1, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'VIEW');
INSERT INTO `manager_permissions` VALUES (58, 3, 'quản lý liên hệ', 0, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'DELETE');
INSERT INTO `manager_permissions` VALUES (59, 2, 'quản lý liên hệ', 0, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'DELETE');
INSERT INTO `manager_permissions` VALUES (60, 1, 'quản lý liên hệ', 1, '/Project_CuaHangMuBaoHiem_war/ManageContact', 'DELETE');
INSERT INTO `manager_permissions` VALUES (141, 3, 'quản lý hóa đơn', 0, '/Project_CuaHangMuBaoHiem_war/detail-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (171, 2, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/detail-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (201, 1, 'quản lý hóa đơn', 1, '/Project_CuaHangMuBaoHiem_war/detail-bill', 'VIEW');
INSERT INTO `manager_permissions` VALUES (311, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadBanner', 'CREATE');
INSERT INTO `manager_permissions` VALUES (312, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadLogo', 'CREATE');
INSERT INTO `manager_permissions` VALUES (321, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveBanner', 'DELETE');
INSERT INTO `manager_permissions` VALUES (322, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveLogo', 'DELETE');
INSERT INTO `manager_permissions` VALUES (341, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UpdateBanner', 'EDIT');
INSERT INTO `manager_permissions` VALUES (342, 3, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UpdateLogo', 'EDIT');
INSERT INTO `manager_permissions` VALUES (351, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadBanner', 'CREATE');
INSERT INTO `manager_permissions` VALUES (352, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadLogo', 'CREATE');
INSERT INTO `manager_permissions` VALUES (361, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveBanner', 'DELETE');
INSERT INTO `manager_permissions` VALUES (362, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/RemoveLogo', 'DELETE');
INSERT INTO `manager_permissions` VALUES (381, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UpdateBanner', 'EDIT');
INSERT INTO `manager_permissions` VALUES (382, 2, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadLogo', 'EDIT');
INSERT INTO `manager_permissions` VALUES (391, 1, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadBanner', 'CREATE');
INSERT INTO `manager_permissions` VALUES (392, 1, 'quản lý trang chủ', 0, '/Project_CuaHangMuBaoHiem_war/UploadLogo', 'CREATE');
INSERT INTO `manager_permissions` VALUES (401, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/RemoveBanner', 'DELETE');
INSERT INTO `manager_permissions` VALUES (402, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/RemoveLogo', 'DELETE');
INSERT INTO `manager_permissions` VALUES (421, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/UpdateBanner', 'EDIT');
INSERT INTO `manager_permissions` VALUES (422, 1, 'quản lý trang chủ', 1, '/Project_CuaHangMuBaoHiem_war/UploadLogo', 'EDIT');
INSERT INTO `manager_permissions` VALUES (431, 3, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/detail-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (451, 2, 'quản lý bình luận', 0, '/Project_CuaHangMuBaoHiem_war/detail-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (471, 1, 'quản lý bình luận', 1, '/Project_CuaHangMuBaoHiem_war/detail-comment', 'VIEW');
INSERT INTO `manager_permissions` VALUES (491, 3, 'quản lý nhập hàng', 0, 'Project_CuaHangMuBaoHiem_war/ImportDetail', 'VIEW');
INSERT INTO `manager_permissions` VALUES (501, 2, 'quản lý nhập hàng', 1, 'Project_CuaHangMuBaoHiem_war/ImportDetail', 'VIEW');
INSERT INTO `manager_permissions` VALUES (511, 1, 'quản lý nhập hàng', 1, 'Project_CuaHangMuBaoHiem_war/ImportDetail', 'VIEW');
INSERT INTO `manager_permissions` VALUES (521, 3, 'quản lý hàng tồn kho', 0, '/Project_CuaHangMuBaoHiem_war/InventoryDetail', 'VIEW');
INSERT INTO `manager_permissions` VALUES (531, 2, 'quản lý hàng tồn kho', 1, '/Project_CuaHangMuBaoHiem_war/InventoryDetail', 'VIEW');
INSERT INTO `manager_permissions` VALUES (541, 1, 'quản lý hàng tồn kho', 1, '/Project_CuaHangMuBaoHiem_war/InventoryDetail', 'VIEW');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `brand` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `discount` double NULL DEFAULT NULL,
  `decrispe` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'NÓN POC PK01', 630000, 'POC', 'NUADAU', 0, 'Ngày nay, nhu cầu trang bị một chiếc nón bảo hiểm cho trẻ ngày càng trở nên phổ biến và được nhiều bố mẹ quan tâm hơn. Nón không chỉ bảo vệ trẻ khỏi chấn thương trong quá trình vui chơi mà còn đem đến diện mạo thật ngầu và đáng yêu, đúng với lứa tuổi của trẻ. Hiểu được điều đó, Biker Sài Gòn xin được giới thiệu cho các bố mẹ mẫu nón thể thao trẻ em Poc PK01 vừa được hãng cho ra mắt năm 2022.', '2022-12-14');
INSERT INTO `products` VALUES (2, 'NÓN POC P16', 1100000, 'POC', 'NUADAU', 0, 'POC P16 là dòng nón xe đạp chất lượng cao, nhập khẩu Fullbox có mặt tại Việt Nam năm 2022. Sản phẩm được thiết kế nguyên khối, cùng màu tem Titan sang trọng, mang lại sự khác biệt so với các phiên bản nón POC trước đây.', '2022-12-14');
INSERT INTO `products` VALUES (3, 'NÓN BẢO HIỂM FALCON F05', 590000, 'FALCON', 'NUADAU', 0, 'Đúng như tên gọi Nón Poc Falcon F05 được thiết kế có lưỡi trai cách điệu bằng vải phía trước có thể tháo rời được. Form nón gọn nhẹ phù hợp cho cả người lớn và trẻ em.', '2022-12-14');
INSERT INTO `products` VALUES (4, 'HP 03B tai mèo cute', 245700, 'HP', 'NUADAU', 0, 'Mũ bảo hiểm nữa đầu HP03 gắn thêm phụ kiện siêu dễ thương , tai thỏ , kính phi công.\r\n- Mũ bảo hiểm Hpro HP03 sản phẩm đạt chuẩn an toàn dành cho người đi xe mô tô, xe gắn máy được sản xuất bởi Công Ty Kỹ Thuật Thương Mại Trần Linh. HP', '2022-12-14');
INSERT INTO `products` VALUES (5, 'Mũ bảo hiểm 1/2 SRT 01', 209000, 'SRT', 'NUADAU', 0.01, 'Sản phẩm Mũ bảo hiểm 1/2 đầu kèm kính Phi Công THÔNG TIN CHI TIẾT\r\nMũ bảo hiểm nửa đầu lồng ép nhiệt – kèm kính phi công\r\n\r\n– Thương hiệu: SRT – Xuất xứ: Việt Nam\r\n\r\n– Chất liệu vỏ: Nhựa ABS nguyên sinh chống chịu lực va chạm mạnh.\r\n\r\n– Chất liệu mút xốp: EPS chịu lực cao. Lớp mút xốp dày dặn êm ái, thoải mái khi sử dụng\r\n\r\n– Thiết kế form nón theo phong cách hiện đại.\r\n\r\n– Dây khóa chắc chắn, dễ dàng điều chỉnh. Màu sắc nổi bật, thời trang, chóng bong tróc\r\n\r\n– Nước sơn: được sơn bằng công nghệ hiện đại, tạo bề mặt sáng, bóng, nhẵn mịn, không ngã màu.\r\n\r\n– Dây chuyền sản xuất khép kín, công nghệ sản xuất tiên tiến, máy CNC, máy ép nhựa nhập khẩu từ Nhật Bản.\r\n\r\n– Được kiểm định độ bền và chất lượng kĩ lưỡng trước khi xuất xưởng.\r\n\r\n– Sản phẩm có quai đeo chắc chắn, có thể kết hợp với kính đeo quai sau chống chói, chống tia UV\r\n\r\n– Mũ có lớp vải lót bằng chất liệu đặc biệt, có khả năng kháng khuẩn và chống ẩm, giúp giữ cho mũ luôn sạch và da đầu bạn luôn khoẻ mạnh\r\n\r\n– Mũ bảo hiểm mang tông màu đen trơn, phù hợp cho cả nam lẫn nữ\r\n\r\n– Kiểu dáng hợp thời trang, dễ dàng cho bạn trong việc phối trang phục đi làm, đi học hay đi chơi', '2022-12-14');
INSERT INTO `products` VALUES (6, 'Royal M136 Nón FullFace', 490000, 'Royal', 'FULLFACE', 0, 'Với những người mới chọn mua cho mình một chiếc mũ bảo hiểm fullface, chọn được một chiếc mũ bảo hiểm tốt, đảm bảo an toàn, đẹp, giá cả phải chăng...giữa rất nhiều thương hiệu mũ bảo hiểm hiện nay luôn là một câu hỏi khó. Tuy nhiên, trên thị trường vẫn có một vài thương hiệu luôn mang lại niềm tin, sự an tâm và hài lòng tuyệt đối cho khách hàng. Một trong những sản phẩm đó là mũ bảo hiểm fullface Royal M136. Là một trong những mũ bảo hiểm fullface phổ biến nhất thị trường hiện nay, M136 chứa trong mình nhiều giá trị để mang lại những giá trị hoàn hảo cho người sở hữu.\r\n\r\nM136 là một chiếc mũ bảo hiểm fullface chuẩn mực.', '2023-01-09');
INSERT INTO `products` VALUES (7, 'Royal M179 Fullface Lật Hàm', 620000, 'Royal', 'FULLFACE', 0, 'Nón bảo hiểm Royal M179 do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.', '2023-01-09');
INSERT INTO `products` VALUES (8, 'Nón bảo hiểm Royal H01', 730000, 'Royal', 'FULLFACE', 0.08, 'Nón bảo hiểm Royal H1 do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.', '2023-01-09');
INSERT INTO `products` VALUES (9, 'Nón Royal M138B', 680000, 'Royal', 'FULLFACE', 0.08, 'Mũ bảo hiểm Royal M138B do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.', '2023-01-09');
INSERT INTO `products` VALUES (10, 'Mũ phượt 3/4 Bulldog Bravo', 500000, 'BullDog', '3/4', 0.05, 'Mũ bảo hiểm Bulldog Bravo phiên bản đầu tiên ra mắt rất thành công trong năm 2017 sản phẩm được người dùng đón nhận nồng nhiệt và hàng luôn trong tình trạng “Cháy” bởi giá thành rẻ đi đôi với chất lượng. Đây cũng là mẫu tầm giá rẻ mà hãng đã cho ra đời đáp ứng nhu cầu của người dùng.', '2023-01-09');
INSERT INTO `products` VALUES (11, 'Nón 3/4 Bulldog POM', 1100000, 'BullDog', '3/4', 0.08, 'Sau mẫu Bulldog Beagle ra mắt vào quý 3 năm 2019, thương hiệu Bulldog tiếp tục ra mắt mẫu Bulldog Pom vào quý 4 năm 2019.\r\n\r\nVẫn là lớp lót mũ màu nâu quen thuộc, thêm sự lựa chọn là lót đen huyền bí, cùng với thiết kế mới, form mũ gọn nhẹ, Bulldog Pom hứa hẹn sẽ đem lại vẻ ngoài cá tính và thời trang, phù hợp với mọi lứa tuổi.', '2023-01-09');
INSERT INTO `products` VALUES (12, 'Bulldog Beagle', 1000000, 'BullDog', '3/4', 0.08, 'Nón 3/4 Bulldog Beagle 2 Đen Nhám là phiên bản thứ 2 được hãng Bulldog cho ra mắt vào đầu năm 2022 với thiết kế vẻ bề ngoài không có gì quá khác so với phiên bản Beagle 1 cũ tuy nhiên hãng đã tiếp thu và cải tiến ở phần size có thêm size XXL, so với đời trước form nón có kích cỡ thoải mái hơn, dễ đội hơn cho người sử dụng. Ngoài ra nón còn được làm bằng lót da cao cấp hơn so với mã cũ.', '2023-01-09');
INSERT INTO `products` VALUES (13, 'Bulldog Beagle 2 chính hãng', 1550000, 'BullDog', '3/4', 0.08, 'Bulldog Beagle 2 là phiên bản mới của dòng Beagle, là dòng nón bảo hiểm 3/4 kính âm được hỗ trợ vòng đầu XXL, phù hợp với những ai có size đầu to.', '2023-01-09');
INSERT INTO `products` VALUES (14, 'GRS A737K- Mũ bảo hiểm', 340000, 'GRS', 'NUADAU', 0.08, 'Thiết kế cứng cáp chắc chắn là điểm mạnh của mũ bảo hiểm GRS A737K, cùng với đó là thiết kế với kính chắn gió rất tiện dụng.Mũ có thiết kế phù hợp với việc sử dụng để chạy xe máy trong nội thành hay chạy xe máy với quãng đường không quá xa.', '2023-01-09');
INSERT INTO `products` VALUES (15, 'GRS A33K – Nón bảo hiểm', 310000, 'GRS', 'NUADAU', 0.08, 'Nón bảo hiểm GRS A33k nửa đầu là mẫu nón quen thuộc khi ra đường của người tiêu dùng Việt. Thời tiết nóng ẩm, nắng gắt mưa nhiều thì không thì thoải mái bằng chiếc nón bảo hiểm có kính nửa đầu gọn nhẹ, linh hoạt.', '2023-01-09');
INSERT INTO `products` VALUES (16, 'Nón fullface LS2 FF353', 1500000, 'LS2', 'FULLFACE', 0.08, 'LS2 RAPID FF353 cung cấp cho bạn khả năng bảo vệ cấp cao với kiểu dáng đơn giản nhưng hiện đại. Nằm trong bộ sưu tập của thương hiệu LS2, dòng LS2 FF353 kết hợp giữa công nghệ HPTT, hỗn hợp ABS với 3 lớp vỏ bảo vệ. Chính những điểm nhấn đặc biệt này trong thiết kế mà sản phẩm có kết cấu bảo vệ tối ưu nhưng khối lượng vẫn rất nhẹ.', '2023-01-09');
INSERT INTO `products` VALUES (17, 'AGU A138 tem 46 nón phượt', 430000, 'AGU', 'FULLFACE', 0, 'Nón trùm đầu AGU A138 tem 46 được nhiều bạn trẻ yêu thích. Giá mềm, dễ thay đổi cho phù hợp “gu” tiêu dùng mới. Các mẫu nón bảo hiểm fullface giá rẻ giúp nhiều bạn trẻ tiếp cận chuỗi sản phẩm này hơn. Đặc biệt khi trào lưu sở hữu xe phân khối lớn ngày càng cao.', '2023-01-09');
INSERT INTO `products` VALUES (18, 'Mũ bảo hiểm có cằm GRS 801K', 580000, 'GRS', 'FULLFACE', 0, 'Mũ bảo hiểm có cằm GRS 801K là dòng mũ phượt đẹp giá rẻ. Thiết kế gọn mang ưu điểm thoải mái và an toàn cho người dùng bởi các chi tiết sau\r\n\r\nNhựa ABS nguyên sinh chịu lực tốt\r\nGóc nhìn lớn giúp người dùng quan sát rộng.\r\nThông gió bằng 3 lỗ thoáng khí, nắp đậy các lỗ thông gió đẹp, hợp với thiết kế.\r\nLót thắm hút mồ hôi, có thể tháo giặt.\r\nKính có tầm nhìn rõ, không nhức mắt, làm bằng PC có màu trà chống chói, hạn chế trầy, vỡ.\r\nThể tích bên trong mũ rộng rãi, không gây gò bó.', '2023-01-09');
INSERT INTO `products` VALUES (19, 'LS2 FF327 Challenger', 5300000, 'LS2', 'FULLFACE', 0, 'FullFace LS2 FF327 Challenger là một chiếc nón fullface 2 kính mới nhất từ hãng LS2, được thiết kế bởi các kĩ sư Tây Ban Nha cho giải đua MotoGP, Moto2 & Moto3.', '2023-01-09');
INSERT INTO `products` VALUES (20, 'Nón bảo hiểm Royal H01', 730000, 'Royal', 'FULLFACE', 0, 'Nón bảo hiểm Royal H1 do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.\r\n\r\nĐẶC ĐIỂM ROYAL H1:\r\n\r\nVỏ bằng nhựa ABS nguyên sinh - là loại nhựa tinh khiết chưa qua sử dụng, được sử dụng cho các sản phẩm tiêu chuẩn an toàn cao vỏ thiết bị y tế, dược phẩm, vỏ máy bay.... có độ bền cao và chịu va đập tốt.\r\nPhần đệm lót bên trong nón còn có lớp vải kháng khuẩn, chống ẩm, rất tốt cho việc bảo vệ chiếc nón khỏi mùi hôi, ẩm mốc\r\nVẻ đẹp huyền bí, sang trọng với những hoạ tiết độc đáo. ', '2023-01-09');
INSERT INTO `products` VALUES (21, 'LS2 FF353 Rapid Đen Tem Xám', 1500000, 'LS2', 'FULLFACE', 0, 'LS2 FF353 Rapid đen tem xám mang cá tính phong trần, cực kì hợp phong cách biker trẻ hiện nay, đây là một trong những mẫu tem đắt hàng nhất của dòng nón LS2 FF353 Rapid này.', '2023-01-09');
INSERT INTO `products` VALUES (22, 'LS2 FF900 Valiant II Cooper', 6200000, 'LS2', 'FULLFACE', 0, 'LS2 FF900 Valiant II Cooper trắng xanh là mẫu tem mới của hãng được nhiều biker yệu thích bởi sự hài hòa mang đến cho người dùng.\r\n\r\nLS2 FF900 Valiant II Cooper Trắng Xanh- Màu nón fullface năng động cá tính\r\nCác dòng nón fullface thường có gam màu đậm, đặc biệt là nền đen vì biker di chuyển nhiều, dễ bám bụi khiến sản phẩm mau dơ. Tuy nhiên, bộ tem trắng xanh tỷ lệ hợp lí trên nền đen khiến dòng nón LS2 FF900 Valiant II Cooper hài hòa hơn.', '2023-01-09');
INSERT INTO `products` VALUES (23, 'LS2 FF900 Valiant II Solid', 6200000, 'LS2', 'FULLFACE', 0, 'Ra đời vào năm 1990, với sự nỗ lực không ngừng nghiên cứu và phát triển các sản phẩm chất lượng cho các giải đua, LS2 Helmets đã trở thành một thương hiệu nón uy tín của Tây Ban Nha. Ra mắt thị trường Việt Nam với các dòng mũ bảo hiểm, hiện nay LS2 Helmets ngày càng mang đến thị trường đồ bảo hộ những sản phẩm chất lượng, đạt tiêu chuẩn an toàn cao như Mũ bảo hiểm, găng tay, đồ báo hộ, phụ kiện,…\r\n\r\n\r\n', '2023-01-09');
INSERT INTO `products` VALUES (24, 'LS2 FF900 Valiant II Orbit', 6200000, 'LS2', 'FULLFACE', 0, 'LS2 FF900 Valiant II là dòng mũ lật hàm linh hoạt nhất trên thị trường hiện nay. Các kĩ sư LS2 đã phổ biến hóa khái niệm lật hàm 180o thay vì chỉ 90o như các mũ trước đây. Một thiết kế mới dựa trên phiên bản cũ kết hợp với cơ chế hoạt động độc đáo đã tạo nên LS2 FF900 Valiant II, chiếc mũ nhỏ gọn, nhẹ nhất so với các mũ cùng phân khúc trên thị trường hiện nay.', '2023-01-09');
INSERT INTO `products` VALUES (25, 'Nón fullface ROC 03 hai kính', 950000, 'ROC', 'FULLFACE', 0.02, 'Thương hiệu: ROC\r\nThiết kế: Fullface thể thao 2 kính.\r\nVỏ nhựa ABS nguyên sinh có độ bền cao và chịu va đập.\r\nXốp mũ là xốp EPS nguyên sinh, xốp được nén với mật độ cao, độ cứng vững rất tốt.\r\nHệ thống thoáng khí: thông minh gồm lẫy gió trước, lẫy gió đỉnh đầu và khe gió sau. giúp không khí lưu thông tốt\r\nKính: 2 kính bao gồm 1 kính trong suốt bên ngoài chắn gió bụi, 1 kính râm ẩn bên trong sử dụng với điều kiện ánh sáng mạnh, nắng gắt.\r\nPhần đệm lót bên trong nón còn có lớp vải chống ẩm, êm, thoáng khí, kháng khuẩn, tháo rời vệ sinh dễ dàng.', '2023-01-09');
INSERT INTO `products` VALUES (26, 'Nón 3/4 đầu EGO E5 kính âm', 1180000, 'EGO', '3/4', 0.02, 'Nón phượt EGO E5 thiết kế thông minh có phụ kiện bảo hộ tăng cường như Mặt Nạ và Kính Chắn Gió, giúp nón chuyển từ 3/4 đang fullface một cách linh hoạt. Thiết kế năng động, trẻ trung khiến nón 3/4 EGO E5 rất đáng trải nghiệm cho các bạn trẻ.', '2023-01-09');
INSERT INTO `products` VALUES (27, 'Yohe 981-Nón fullface 2 kính', 1500000, 'Yohe', 'FULLFACE', 0.02, 'Hebi hoàn toàn tự tin khẳng định Yohe 981 là chiếc mũ fullface 2 kính có độ kín gió bậc nhất ở tầm giá dưới 2tr. Xét về độ kín mưa không bị lọt nước vào thì nó còn vượt trội hơn hẳn các dòng nón khác đắt tiền hơn như (LS2 FF800 Storm hoặc kể cả AGV K3SV). Do kết cấu hình thể ron cao su viền kín của nón này rất khoa học, không làm đọng nước ở giữa nên nước không tràn vào trong kín như 2 mẫu nón kia.\r\n\r\nĐây là mẫu nón 2 kính đạt chuẩn an toàn châu Âu mà khối lượng siêu nhẹ chỉ 1.440g. Hebi liệt kê khối lượng một số dòng mũ 2 kính khác cũng đạt chuẩn châu Âu như LS2 FF800 size L 1.620g, AGV K3SV size L 1.650g, KYT NFR size L 1.640g...', '2023-05-29');
INSERT INTO `products` VALUES (28, 'Nón lật hàm EGO E9 2 kính', 980000, 'EGO', 'FULLFACE', 0.02, 'Một sản phẩm mới ra mắt gần đây trong quý 2/2019 tiếp nối đàn anh EGO trước, EGO E9 cho khả năng lật hàm và hình dáng thiết kế cũng đã được thay đổi để phù hợp cho người dùng việt. Chiếc mũ được xuất xưởng tại nhà máy mà các ông lớn đang gia công như MT Helmets, Probiker tại thị trường châu á.', '2023-05-21');
INSERT INTO `products` VALUES (29, 'LS2 FF327 Challenger Flex', 6000000, 'LS2', 'FULLFACE', 0.02, 'Đặt yếu tố an toàn và tối ưu lên hàng đầu, FF327 có lớp vỏ bằng SỢI THỦY TINH đạt chuẩn an toàn ECE 22.05 với trọng lượng tầm 1.4kg.\r\n\r\nKính chắn gió tích hợp khả năng gắn miếng Pinlock Max Vision & Tear_OFF, cùng tính năng chống UV. Vật liệu làm kính bằng Polycarbonate đạt chuẩn quang học cao nhất \"A Class\".\r\n\r\nHệ thống bật mở kính đi nắng bên trong nhanh chóng và tiện cùng khóa kính chắn gió ở vị trí trung tâm mũi giúp người đội dễ dàng thao tác bằng 1 tay.\r\n\r\nHệ thống thông gió đa khe ở đỉnh nón, cằm nón và thoát gió ở phần đuôi giúp trải nghiệm thoải mái tối đa.\r\n\r\nKhóa nón là khóa lẫy thuận tiện cho người đội đóng mở dễ dàng và chắc chắn.', '2023-05-21');
INSERT INTO `products` VALUES (30, 'Mũ fullface LS2 FF327', 6000000, 'LS2', 'FULLFACE', 0.02, 'Đặt yếu tố an toàn và tối ưu lên hàng đầu, FF327 có lớp vỏ bằng SỢI THỦY TINH đạt chuẩn an toàn ECE 22.05 với trọng lượng tầm 1.4kg.\r\n\r\nKính chắn gió tích hợp khả năng gắn miếng Pinlock Max Vision & Tear_OFF, cùng tính năng chống UV. Vật liệu làm kính bằng Polycarbonate đạt chuẩn quang học cao nhất \"A Class\".\r\n\r\nHệ thống bật mở kính đi nắng bên trong nhanh chóng và tiện cùng khóa kính chắn gió ở vị trí trung tâm mũi giúp người đội dễ dàng thao tác bằng 1 tay.\r\n\r\nHệ thống thông gió đa khe ở đỉnh nón, cằm nón và thoát gió ở phần đuôi giúp trải nghiệm thoải mái tối đa.\r\n\r\nKhóa nón là khóa lẫy thuận tiện cho người đội đóng mở dễ dàng và chắc chắn.', '2023-05-28');
INSERT INTO `products` VALUES (31, 'Nón fullface ROC 01-Nón lật', 820000, 'ROC', 'FULLFACE', 0.02, 'Bạn đang tìm một chiếc mũ fullface đẹp nhưng ngân sách có hạn. Điều khiến bạn đau đầu là nếu mũ fullface đẹp giá rẻ thì chất lượng và độ an toàn thấp. Vì hầu hết các nhà sản xuất đều có cố tình hy sinh vẻ ngoài, đảm bảo độ an toàn cho sản phẩm giá thấp (Vì nếu vừa đẹp vừa rẻ thì vừa an toàn thì làm sao bán được các sản phẩm cao cấp). Do đó   ROC R01 Fullface ra đời đã đảm bảo sự hài hòa giữa nét đẹp - an toàn - giá hợp lý.\r\n\r\nKhông có mô tả ảnh.\r\n\r\nMũ ROC RO1 về thiết kế kiểu dáng rất đẹp và khoa học.về độ an toàn cũng rất cao vì mũ làm bằng nhựa ABS nguyên sinh và lớp hấp thu lực EPS rất dày đảm bảo độ an toàn cao , vải lót khử mùi tự nhiên, thêm tấm đệm giúp kín gió..', '2023-05-28');
INSERT INTO `products` VALUES (32, 'Nón fullface 2 kính EGO E6', 880000, 'EGO', 'FULLFACE', 0.02, 'Nón fullface 2 kính EGO E6 nằm trong loạt nón trùm đầu giá rẻ cho biker vừa chuyển từ nón nửa đầu sang dòng nón phượt này. Các góc cạnh từ trước ra sau tăng thêm sức hút mạnh mẽ, đậm chất phượt.', '2023-05-28');
INSERT INTO `products` VALUES (33, 'Nón fullface EGO E7', 780000, 'EGO', 'FULLFACE', 0.02, 'Là dòng sản phẩm được thiết kế theo nhu cầu của đa số người Việt. Mẫu nón fullface có những ưu điểm sau\r\n\r\nNhẹ: EGO E7 tinh giảm diện tích theo size đầu người Việt, giảm các phụ kiện không cần thiết giúp nón nhẹ hơn.\r\nAn toàn: Chất tiêu chí an toàn của sản phẩm vẫn đảm bảo theo tiêu chuẩn lưu thông như nhựa ABS.\r\nThiết kế: Đây là ưu điểm mạnh của EGO E7 – mạnh mẽ, cứng cáp, cá tính.\r\nGiá rẻ: giá thành so với chất lượng và ưu diểm của nón là tương xứng.\r\nHệ thống thông khí khoa học, giúp không khi lưu thông liên tục, giữ đầu người đội luôn thoáng mát.\r\nKính chất liệu polycarbonate cao cấp chịu nhiệt, chịu lực cao, tầm nhìn rõ, trong suốt. Kính chắn gió bao phủ rộng, hạn chế tối đa tác động của gió, mưa, bụi, đất đá và côn trùng…\r\nHàng được nhập khẩu chính ngạch và có tem kiểm định bởi cục quản lý đo lường chất lượng Việt Nam, đạt chuẩn an toàn Việt Nam. Sản phẩm được bảo hành chính hãng 1 năm và có đầy đủ phụ kiện để bảo hành thay thế.\r\nMút lót có thể tháo rời, dễ dàng vệ sinh, giặt khi cần.\r\nKhóa lẫy micro lock thao tác nhanh, chịu được lực kéo lên đến 60kg.', '2023-05-28');
INSERT INTO `products` VALUES (34, 'Mũ bảo hiểm LS2 FF800 STORM', 2900000, 'LS2', 'FULLFACE', 0.02, 'Mũ bảo hiểm LS2 FF800 Storm là mũ fullface thuộc phân khúc tầm trung, cạnh tranh trực tiếp với các sản phẩm ngoại nhập khác như Yohe, Royal… nên có giá thành rất cạnh tranh. Sức hút từ dòng sản phẩm có xuất xứ châu Âu và các tiện ích không thua kém các mũ bảo hiểm đắt giá khá quả là một sự thú vị cần trải nghiệm.', '2023-05-28');
INSERT INTO `products` VALUES (35, 'Mũ Fullface LS2 Stream FF320', 1900000, 'LS2', 'FULLFACE', 0, 'Mũ bảo hiểm LS2 Stream FF320 cao cấp  được trang bị vỏ lớp EPS tăng mức bảo vệ tối ưu cho người dùng. Phần đệm chất lượng cao đem lại sự thoải mái. Chi tiết các lớp vỏ được gia công chính xác nhờ công nghệ cắt laser 3D cao cấp.\r\n\r\nKhác với mũ fullface bình thường, chất liệu KPA làm nên vỏ mũ là sự kết hợp của polycarbonate, vật liệu nhiệt dẻo và các vật liệu bổ sung theo công thức đặc biệt của LS2.\r\n\r\nKPA (Kinetic Polymer Alloy) với tính chất dẻo và siêu nhẹ cùng khả năng chịu lực cao và phân tán lực rất tốt. Công thức đặc biệt này đáp ứng được các yêu cầu của cả 2 tiêu chuẩn ECE 22.05 và DOT.', '2023-05-28');
INSERT INTO `products` VALUES (36, 'Nón fullface AGU A138 RACING', 390000, 'AGU', 'FULLFACE', 0, 'Trọng lượng 1.1kg, nhựa ABS rắn chắc, đảm bảo độ bảo vệ.\r\n-Lớp sơn bóng chống trầy cao. Màu tem sáng, bắt mắt.\r\n-Nón có 2 khe đón khí phía trước và 2 lỗ thoát khí phía sau- hình thành hệ thống lưu thông khí bên trong giúp nón thoáng mát.\r\n-Size L: phù hợp vòng đầu từ 55cm-58cm.\r\n-Tem kiểm định: tem DOT, tem QUATEST 2\r\n-Phụ kiện kính bảo hộ màu trà chống chói. Có thể thay thế, tháo lắp dễ dàng.\r\n-Lớp lót bên trong êm, chất liệu thoáng mát, kháng khuẩn chống ẩm, rất tốt cho việc bảo vệ nón khỏi mùi hôi và ẩm mốc.\r\n-Bảo hành tại shop 365.', '2023-05-28');
INSERT INTO `products` VALUES (37, 'Nón fullface giá rẻ EGO E-8', 750000, 'EGO', 'FULLFACE', 0, 'Nón fullface giá rẻ EGO E-8 gây chú ý trên thị trường bởi giá thành chỉ bằng một nửa so với các dòng sản phẩm cùng loại.\r\nĐối với các bạn yêu thích nón fulface mà ngân sách hạn hẹp thì EGO E-8 là khởi đầu “nhẹ nhàng”.', '2023-05-28');
INSERT INTO `products` VALUES (38, 'Nón fullface Yohe 938 lật hàm', 1700000, 'Yohe', 'FULLFACE', 0, 'Cầm một chiếc nón fullface Yohe 938 chính hãng trong tay, cảm nhận đầu tiên là sự chắc chắn. Dù bạn bật mở hàm, kính bảo hộ, chốt thông gió ….bao nhiêu lần thì cũng không lỏng hoặc lờn khớp nối. Đây chính là ưu điểm tuyệt đối mà nón giá rẻ không có được.', '2023-05-28');
INSERT INTO `products` VALUES (39, 'Nón fullface cao cấp GRS 639', 900000, 'GRS', 'FULLFACE', 0, 'Nón fullface cao cấp GRS 639 có kích thước tương đối gọn hơn so với các dòng ngoại nhập  khác được trang bị 2 KÍNH (1 chống nắng giấu bên trong và 1 kính bảo hộ bên ngoài) có thể bật mở dễ dàng. Thiết kế lật hàm của GRS 639 cực ngầu rất phù hợp khi bạn chạy các dòng xe tay côn phân khối lớn. Ưu điểm mạnh mẽ trong thiết kế của 639 rất được các phượt thủ ưa chuộng.', '2023-05-28');
INSERT INTO `products` VALUES (40, 'Yohe 878 nón bảo hiểm 3/4', 1200000, 'Yohe', '3/4', 0.02, 'Tuy không có nhiều sự khác biệt giữa hai mẫu mũ Yohe 881 và Yohe 878 nhưng Yohe Helmets lại tiếp tục giới thiệu dòng mũ bảo hiểm Yohe 878 3/4 2 kính vào đầu năm 2018. Tuy có những điểm tương đồng nhưng Yohe 878 có giá cả phải chăng hơn Yohe 881.\r\n\r\nYohe 878 có đặc điểm gì?\r\n\r\nNón Yohe 878 thể thao đuôi nhọn thể thao và kiểu dáng góc cạnh mạnh mẽ.\r\nVỏ mũ vẫn được làm bằng nhựa ABS nguyên sinh chắc chắn.\r\nNón có hai lớp kính bảo hộ để bạn dễ dàng sử dụng vào ban ngày và ban đêm.\r\nDây đeo nón có móc cài chắc chắn, dễ dàng tháo ra.\r\nBên trong mũ khá mềm và có thể tháo rời đơn giản để giặt.\r\nCác bộ phận phụ kiện thay thế đơn giản.', '2023-01-09');
INSERT INTO `products` VALUES (41, 'Nón Andes 3S382H', 680000, 'Andes', '3/4', 0, 'Mũ bảo hiểm 3/4 có kính Andes 3S382H là một dòng sản phẩm mới vừa được Andes tung ra trong tháng 02/2020. Với kính chắn gió dài, che chắn toàn bộ khuôn mặt, mũ bảo hiểm Andes 3S382H xứng đáng là một trong những chiếc nón huyền thoại cho các tín đồ phượt đường xa.', '2023-01-09');
INSERT INTO `products` VALUES (42, 'Nón bảo hiểm Asia M168', 350000, 'Asia', '3/4', 0.01, '– Với thiết kế nón bảo hiểm 3/4 có kính ưu việt với độ che chắn lớn gần hết đầu, đem lại cảm giác an toàn, yên tâm cho người sử dụng khi đi đường.\r\n\r\n– Sản xuất từ nhựa ABS nguyên sinh chưa qua sử dụng có khả năng chịu lực va chạm cực lớn. Kèm theo đó là phần vỏ nón trơn cứng, khi va chạm giúp lực được tán đều ra mọi hướng, giúp giảm thiểu thương tổn vùng đầu do lực tập trung tác động.', '2023-01-09');
INSERT INTO `products` VALUES (43, 'Royal M139 kính âm', 650000, 'Royal', '3/4', 0, 'Bạn đang tìm một chiếc mũ bảo hiểm đa dụng, phong cách, cá tính, sang trọng và an toàn để bảo vệ bản thân trên mọi cung đường? Mũ bảo hiểm Royal M139 Tem V10 kính âm chính là sự lựa chọn hoàn hảo dành cho bạn.', '2023-01-09');
INSERT INTO `products` VALUES (44, 'Nón gấu nâu 3/4', 270000, 'DH', '3/4', 0.03, 'Nón bảo hiểm tai gấu đang là xu hướng yêu thích của giới trẻ. Đôi tai được làm từ chùm lông đáng yêu luôn mê hoặc những bạn gái ngọt ngào muốn mua tặng bạn trai của mình. Đây là mẫu nón bảo hiểm 3/4 đầu gấu nâu hot nhất tháng qua.', '2023-01-09');
INSERT INTO `products` VALUES (45, 'Napoli 189 Size M Nón bảo hiểm 3/4', 440000, 'Napoli', '3/4', 0, 'Napoli 189 size M phù hợp cho bé từ 5-10 tuổi với số đo vòng đầu 50-54cm, dòng nón bảo hiểm 3/4 kính âm trẻ em hot nhất hiện nay với các gam màu đẹp, sáng, khiến trẻ yêu thích.', '2023-01-09');
INSERT INTO `products` VALUES (46, 'Nón Napoli SH 3/4', 290000, 'Napoli', '3/4', 0.2, 'Nón Napoli SH là dòng nón phượt 3/4 đầu mang thiết kế dạng tròn cổ điển nhưng khoác lên mình những gam màu đa dạng, thởi trang. Bạn có thể gắng thêm kính bảo hiểm fullface chắn gió, bụi, mưa gió tốt.', '2023-01-09');
INSERT INTO `products` VALUES (47, 'Andes 3S219L', 580000, 'Andes', '3/4', 0, 'Andes 3S219L big size cho nam giới đẹp, có kính âm bảo vệ mắt, trải nghiệm thoải mái rộng rãi.', '2023-01-09');
INSERT INTO `products` VALUES (48, 'Nón bảo hiểm GRS 780 Kính', 460000, 'GRS', '3/4', 0, 'Nón bảo hiểm GRS 780 Kính chuyên dành cho người có size đầu nhỏ từ 54-56cm. Người có size đầu lớn hơn vẫn dùng được nhưng thiết kế của nón khá đặc biệt. Thân nón chỉ vừa che qua mang tai thay vì kéo dài đến tận cằm.', '2023-01-09');
INSERT INTO `products` VALUES (49, 'Nón 3/4 GRS 649 kính ', 490000, 'GRS', '3/4', 0.1, 'Nón GRS 649 kiểu 3/4 đầu che chắn hầu hết vùng đầu nên độ an toàn cao. Nón là trang bị không thể thiếu khi khi đi xa trên đường cao tốc như về quê, du lịch phượt. Thời gian đội lâu làm bạn ngán ngẩm mặc dù bạn vẫn biết dòng nón full đầu sẽ giúp bạn an toàn hơn. Do đó, để thoải mái khi đi xa, bạn nên mua nón bảo hiểm GRS 649K', '2023-01-09');
INSERT INTO `products` VALUES (50, 'Nón bảo hiểm con vịt', 200000, 'Xpro', 'CHILDREN', 0.1, 'Nón bảo hiểm con vịt nửa đầu vàng với cặp mỏ màu cam đang trở thành một trong những mẫu nón thú 3D hot nhất hiện nay. Cái mỏ vịt màu cam bằng cao su mềm giúp sản phẩm cực kì sinh động, rất phù hợp với các bé.', '2022-12-14');
INSERT INTO `products` VALUES (51, 'Nón xe đạp trẻ em Basecamp 666', 280000, 'Basecamp 666', 'CHILDREN', 0.1, 'Nón xe đạp nhỏ gọn Basecamp 666 phù hợp cho trẻ em và người có size đầu nhỏ. Thiết kế nón bo tròn ôm đầu, dễ sử dụng, giá thành rẻ.', '2022-12-14');
INSERT INTO `products` VALUES (52, 'Nón xe đạp trẻ em JC 20', 260000, 'JC20', 'CHILDREN', 0, 'Nón xe đạp trẻ em JC 20 liên tục cháy hàng vì màu sắc và hình ảnh quá dễ thương, làm các bé say mê ngay trong cái nhìn đầu tiên.', '2022-12-14');
INSERT INTO `products` VALUES (53, 'Nón xe đạp trẻ em Kiho', 250000, 'Kiho', 'CHILDREN', 0, 'Nón xe đạp trẻ em Kiho có thiết kế nguyên khối chắc chắn, trọng lượng siêu nhẹ, siêu mát. Hệ thống thoáng khí 11 lỗ bố trí trên nón giúp trẻ dễ chịu không ra mồ hôi. Lớp nhựa PC phủ ngoài được sơn nhiều hình ảnh bắt mắt dễ thương thu hút trẻ.', '2022-12-14');
INSERT INTO `products` VALUES (54, 'Nón xe đạp trẻ em Fornix NM17', 290000, 'Fornix', 'CHILDREN', 0, 'Nón xe đạp trẻ em Fornix NM17 nhập khẩu chính hãng chuyên phục vụ các bé từ 3-10 tuổi. Sản phẩm có thiết kế thon, nhỏ rất phù hợp với các bé gái.', '2022-12-14');
INSERT INTO `products` VALUES (55, 'Mũ bảo hiểm cho bé hãng Little Angle', 165000, 'LittleAngel', 'CHILDREN', 0, 'Mũ bảo hiểm cho bé tập đi, bò bảo vệ an toàn vùng đầu còn non yếu của bé. Đối với nhà có sàn gạch, gỗ, xi măng cứng thì bạn nên trang bị loại mũ cho bé để yên tâm hơn khi bé vui chơi, tập di chuyển mỗi ngày.', '2022-12-14');
INSERT INTO `products` VALUES (56, 'Nón bảo hiểm Pikachu', 250000, 'LittleAngel', 'CHILDREN', 0, 'Nón bảo hiểm Pikachu 3/4 đầu là món quà đặc biệt cho các fan hâm mộ Pokemon. Mọi biểu cảm đáng yêu đều được khắc họa rõ nét trên sản phẩm nón bảo hiểm hình thú này.', '2022-12-14');
INSERT INTO `products` VALUES (57, 'Mũ bảo hiểm chim cánh cụt', 250000, 'LittleAngel', 'CHILDREN', 0, 'Mũ bảo hiểm hình thú cho bé thuộc thương hiệu Xì Trum đã được kiểm định chất lượng nên đây là một sản phẩm an toàn. Bạn yên tâm không sợ hàng giả trôi nổi như trên các sàn TMĐT…', '2022-12-14');
INSERT INTO `products` VALUES (58, 'Nón bảo hiểm đôrêmon', 250000, 'LittleAngel', 'CHILDREN', 0, 'Nón bảo hiểm trẻ em 3/4 đôrêmon nhỏ gọn, dễ thương được nhiều trẻ em mê mệt. Nón gọn nhẹ chính hãng Đức Huy, có thể lắp kính bảo hộ chống bụi và mưa cho trẻ.', '2022-12-14');
INSERT INTO `products` VALUES (59, 'Nón bảo hiểm Hello Kitty', 250000, 'LittleAngel', 'CHILDREN', 0, 'Khi nhắc đến nón bảo hiểm tai mèo, chắc chắn không chiếc nón nào dễ thương bằng nón mèo hồng Hello Kitty quá nổi tiếng. Cô mèo không hề có miệng nhưng ai cũng có thể cảm nhận nụ cười tươi tắn.', '2022-12-14');
INSERT INTO `products` VALUES (65, 'Nón trùm đầu kính ẩn chống nắng GRS 388K', 490000, 'GRS', '3/4', 0.04, 'Kính râm không chỉ bảo vệ mắt của bạn khỏi tia cực tím độc hại, giúp tầm nhìn ổn định khi lái xe mà còn là một phụ kiện thời trang trên đường rất phổ biến từ xưa đến nay. Trong điều kiện nắng nhiều như nước ta thì kính râm thật sự cần thiết bởi khói bụi và tia cực tím rất nguy hại cho bạn. Bên cạnh dòng nón nửa đầu GRS 966, thì chiếc kính râm bảo hộ đã được tích hợp vào nón 3/4 đầu như GRS A388 giúp sản phẩm này trở thành chiếc nón bảo hộ đẹp, tiện dụng và vô cùng cá tính.', '2023-05-13');
INSERT INTO `products` VALUES (66, 'Yohe 935 SV Xám Xi Măng Bóng-Nón fullface 2 kính', 2400000, 'Yohe', 'FULLFACE', 0.1, 'Sản phẩm chất lượng cao', '2023-05-13');
INSERT INTO `products` VALUES (67, 'Mũ 3/4 KLT Venom', 1050000, 'KLT', '3/4', 0, 'Thương hiệu Malaysia| Chất liệu nhựa nhiệt dẻo|Mút xốp EPS| Size M L XL| Bảo hành 12 tháng chốt kính, dây khóa| Cân nặng 1000gr', '2022-12-14');
INSERT INTO `products` VALUES (68, 'Mũ 3/4 ROYCE M787', 390000, 'ROYCE', '3/4', 0, 'Royce Helmet là thương hiệu mới nhất của Á Châu Group, tiền thân là công ty MAFA VN – Nhà sản xuất mũ bảo hiểm rất có uy tín tại Việt Nam sở hữu hàng loạt thương hiệu mũ bảo hiểm phổ biến hàng đầu hiện nay như Royal, ROC, Asia… Mang đầy đủ tính năng và có khuôn nón như người anh Royal M787 và ROC 06 nhưng Royce M787 đang nhắm vào phân khúc thấp hơn nên có giá rẻ chỉ bằng một nửa.', '2022-12-14');
INSERT INTO `products` VALUES (69, 'Mũ 3/4 LS2 OF603 INFINITY sợi thủy tinh', 390000, 'ROYCE', '3/4', 0, 'LS2 OF603 INFINITY là mũ bảo hiểm 3/4 được sản xuất từ sợi thủy tinh mang lại cảm giác nhẹn nhàng và thoải mái nhất cho người sử dụng. Hơn thế nữa LS2 OF603 INFINITY còn cung cấp đầy đủ tất cả các yếu tố mà một chiếc mũ 3/4 cần có.', '2022-12-14');
INSERT INTO `products` VALUES (70, 'Mũ 3/4 ROYAL M134C', 450000, 'ROYAL', '3/4', 0, 'Mũ bảo hiểm Royal M134C do công ty Mafa sản xuất. Thương hiệu nón Royal ra đời năm 2008 do ông Mai Văn Thuận sáng lập. Với mục tiêu sản xuất ra những chiếc nón chất lượng nhất, đáp ứng nhu cầu ngày càng cao không chỉ của người dùng ở Việt Nam và cả ở thị trường thế giới.', '2022-12-14');
INSERT INTO `products` VALUES (71, 'Mũ 3/4 KYT NFJ MASIA', 2160000, 'KYT', '3/4', 0, 'KYT NFJ MASIA là mũ bảo hiểm fullface một kính của KYT Helmet – Thương hiệu mũ bảo hiểm của Malaysia có văn phòng nghiên cứu phát triển và thiết kế đặt tại Ý. Với kiểu dáng quyến rũ và cực chất KYT TT-Course ra đời để mang lại hiệu suất tốt nhất dành cho di chuyển trên quảng đường dài với tốc độ cao. Vì lẽ đó TT-Course là lựa chọn của rất nhiều tay đua xe motor và các phượt thủ tại Việt Nam.', '2022-12-14');
INSERT INTO `products` VALUES (72, 'MŨ 3/4 SMOOTH CARBON', 2400000, 'SMOOTH', '3/4', 0, 'Mũ 3/4 Smooth Carbon được sản xuất bởi Heshan HP Factory, nhà máy sản xuất mũ bảo hiểm chuyên gia công cho các thương hiệu hàng đầu thế giới. Được làm từ sợi Carbon giúp nón có khối lượng siêu nhẹ, chỉ khoảng 500Gram nhưng nón lại có độ bền và độ đàn hồi tốt hơn rất nhiều so với các loại nón làm từ nhựa ABS khác.', '2022-12-14');
INSERT INTO `products` VALUES (73, 'MŨ 3/4 EGO E5 ĐEN NHÁM', 1080000, 'EGO', '3/4', 0, 'Là dòng sản phẩm mới nhất của thương hiệu EGO ra mắt dịp cuối năm 2021. Thương hiệu EGO được xây dựng với tiêu chí sản phẩm an toàn chất lượng, mẫu mã trẻ trung, thời trang và đặc biệt giá cả bình dân, dễ tiếp cận với đại đa số người dùng tại Việt Nam.', '2022-12-14');
INSERT INTO `products` VALUES (74, 'MŨ 3/4 ZEUS 205 CAMO XÁM', 1300000, 'ZEUS', '3/4', 0, 'Zeus 205 Camo Xám đến từ một thương hiệu trứ danh từ Đài Loan, chiếc mũ bảo hiểm mang trong mình tất cả những gì tinh túy nhất của hãng với thiết kế đẳng cấp cùng công nghệ tiên tiến nhất.', '2022-12-14');
INSERT INTO `products` VALUES (75, 'MŨ 3/4 NAPOLI N189', 400000, 'NAPOLI', '3/4', 0, 'Thiết kế theo lối cổ điển, tích hợp với kính âm mang tới sự khác biệt, tiện lợi', '2022-12-14');
INSERT INTO `products` VALUES (76, 'MŨ 3/4 ZEUS 613B XÁM', 1500000, 'ZEUS', '3/4', 0, 'Zeus 613B Xám được sản xuất bởi công ty Long Huei, nhà sản xuất có hơn 30 năm kinh nghiệm trong nghành mũ bảo hiểm có trụ sở chính tại Đài Loan. Với các thương hiệu rất có uy tín trên thế giới cũng như tại Việt Nam như là: Andes, Zeus, Sunda, Zealot…', '2022-12-14');
INSERT INTO `products` VALUES (77, 'MŨ LẬT HÀM YOHE 935SV', 2400000, 'YOHE', 'FULLFACE', 0, 'Mũ lật hàm Yohe 935SV là dòng mũ bảo hiểm fullface khá cơ động với kiểu dáng thể thao. Có nhiều màu tem phù hợp với từng dòng xe. Yohe 935SV là sản phẩm mũ lật hàm vừa được ra mắt của YOHE Helmet. Được sản xuất từ những công nghệ tiên tiến nhất của hãng nên mũ Yohe 935SV có nhiều đặc điểm cải tiến, trong đó có phần viền được gỡ bỏ giúp trọng lượng nón nhẹ hơn, nhưng chất lượng và tính thẩm mĩ còn tốt hơn trước.', '2022-12-14');
INSERT INTO `products` VALUES (78, 'MŨ FULLFACE KYT TT-COURSE LEOPARD', 2800000, 'KYT', 'FULLFACE', 0, 'KYT TT-Course là mũ bảo hiểm fullface một kính của KYT Helmet – Thương hiệu mũ bảo hiểm của Malaysia có văn phòng nghiên cứu phát triển và thiết kế đặt tại Ý. Với kiểu dáng quyến rũ và cực chất KYT TT-Course ra đời để mang lại hiệu suất tốt nhất dành cho di chuyển trên quảng đường dài với tốc độ cao. Vì lẽ đó TT-Course là lựa chọn của rất nhiều tay đua xe motor và các phượt thủ tại Việt Nam.', '2022-12-14');
INSERT INTO `products` VALUES (79, 'MŨ LẬT HÀM EGO E-9', 980000, 'EGO', 'FULLFACE', 0, 'Mũ Lật hàm EGO E9, chiếc mũ fullface với đầy đủ các tính năng mà người dùng trông đợi, khả năng tùy biến cao cùng kiểu dáng thể thao chuẩn mực và độ an toàn đã được chứng nhận bởi  QUATEST 3 VN. Trong cùng một phân khúc sẽ khó có thể tìm được sản phẩm nào sáng giá hơn EGO E9.', '2022-12-14');
INSERT INTO `products` VALUES (80, 'MŨ FULLFACE SUNDA 823', 850000, 'SUNDA', 'FULLFACE', 0, 'Sunda là thương hiệu đã quá quen thuộc đối với hầu hết người dùng tại Việt Nam. Hãng cũng vừa tung ra thị trường sản phẩm mới thuộc phân khúc tầm trung là Sunda 823 Xám Nhám. Với mức giá vô cùng dễ tiếp cận, bạn đã có ngay cho mình một chiếc mũ fullface đúng chuẩn, với hai kính chắn, ngoại hình hầm hố và vô số tính năng đáng giá mà hãng đã hào phóng  trang bị trên chiếc mũ bảo hiểm này.', '2022-12-14');
INSERT INTO `products` VALUES (81, 'MŨ FULLFACE TORC T18', 1770000, 'TORC của Mỹ', 'FULLFACE', 0, 'Torc T18 Đỏ Xanh là dòng mũ bảo hiểm fullface hai kính đến từ thương hiệu TORC (USA). Với ngoại hình đậm chất thể thao, màu sắc đa dạng, phong phú đang rất được anh em Biker săn đón. Bên cạnh đó, Torc T18 còn được đảm bảo về độ tin cậy khi đáp ứng các tiêu chuẩn của DOT và ECE R22-05 (Các tiêu chuẩn dành riêng cho thị trương US-UK). TORC T18 xứng đáng là mũ bảo hiểm fulface hai kính đáng được sở hữu nhất trong phân khúc dưới 2 triệu đồng.', '2022-12-14');
INSERT INTO `products` VALUES (82, 'MŨ FULLFACE YOHE 978 PLUS SRT', 1400000, 'YOHE', 'FULLFACE', 0, 'Với kinh nghiệm dày dặn của mình trong nghành mũ bảo hiểm, Yohe đã liên tục cho ra mắt những dòng mũ bảo hiểm fullface chất lượng vượt trội. Một trong số đó là Yohe 978 Plus, chiếc mũ fullface mang trong mình những gì tinh túy đặc trưng nhất đến từ hãng từ kiểu dáng thể thao đầy cá tính đến những trang bị và tính năng đáng giá.', '2022-12-14');
INSERT INTO `products` VALUES (83, 'MŨ FULLFACE SUNDA 821', 700000, 'SUNDA', 'FULLFACE', 0, 'SUNDA 821 đen bóng là mũ bảo hiểm fullface một kính mới nhất tới từ thương hiệu Sunda của Đài Loan. Thời trang, cá tính, bền bỉ và an toàn… là những gì bạn sẽ nhận được khi sở hữu, cùng với đó là một mức giá không tưởng.', '2022-12-14');
INSERT INTO `products` VALUES (84, 'MŨ FULLFACE ROYAL M266 TEM PLASMA', 570000, '	ROYAL', 'FULLFACE', 0, 'Mũ bảo hiểm Fullface Royal M266 2 Kính là sản phẩm của Royal Helmet – Thương hiệu cao cấp của Á Châu Group, nhà sản xuất mũ bảo hiểm hàng đầu Việt Nam với hơn 10 năm kinh nghiệm.', '2022-12-14');
INSERT INTO `products` VALUES (85, 'MŨ FULLFACE ROYAL M266 TEM DRAGON BOY', 570000, 'SUNDA', 'FULLFACE', 0, 'Mũ bảo hiểm Fullface Royal M266 2 Kính là sản phẩm của Royal Helmet – Thương hiệu cao cấp của Á Châu Group, nhà sản xuất mũ bảo hiểm hàng đầu Việt Nam với hơn 10 năm kinh nghiệm.', '2022-12-14');
INSERT INTO `products` VALUES (86, 'MŨ FULLFACE LS2 OF606 DRIFTER', 3500000, 'LS2', 'FULLFACE', 0, 'LS OF606 DRIFTER là concept mới nhất của LS2 Helmet, nhà sản xuất mũ bảo hiểm rất có trụ sở đặt tại Tây Ban Nha.\r\n\r\nLS OF606 DRIFTER với thiết kế độc đáo có thể tùy biến từ mũ bảo hiểm 3/4 thành fullface. Thích hợp sử dụng để đi tour đường dài hoặc đi trong thành phố.', '2022-12-14');
INSERT INTO `products` VALUES (87, 'MŨ NỬA ĐẦU SUNDA 135D', 3500000, '	SUNDA', 'NUADAU', 0, 'SUNDA 135D đen bóng là mũ bảo hiểm fullface một kính mới nhất tới từ thương hiệu Sunda của Đài Loan. Thời trang, cá tính, bền bỉ và an toàn… là những gì bạn sẽ nhận được khi sở hữu, cùng với đó là một mức giá không tưởng.', '2022-12-14');
INSERT INTO `products` VALUES (88, 'MŨ NỬA ĐẦU ROYAL M153K', 460000, '	Royal', 'NUADAU', 0, 'Mũ bảo hiểm Royal M153K siêu phẩm mũ bảo hiểm 1/2 đầu mới nhất của Royal Helmet\r\n\r\n– Royal Helmet vừa cho ra mắt dòng mũ bảo hiểm 1/2 với nhiều tính năng làm nức lòng người sử dụng\r\n\r\n– Giữ nguyên những đặc điểm“đẳng cấp” làm nên thương hiệu Royal, Royal 153LT vẫn biết làm nổi bật mình với hệ thống thông gió “xịn sò” thiết kế nổi bật với các đường nét góc cạnh, tinh tế được tính toán cẩn thận.', '2022-12-14');
INSERT INTO `products` VALUES (89, 'NÓN XE ĐẠP ROYAL MD15', 550000, '	Royal', 'NUADAU', 0, 'Royal MD15 trắng là dòng nón xe đạp chất lượng của thương hiệu Royal. Royal MD15 vừa ra mắt giữa năm nay (2022) nhưng rất thu hút sự quan tâm của khách hàng. Đây là mẫu nón xe đạp đơn giản, gọn nhẹ, có mái che phía trước thích hợp với mọi người.', '2022-12-14');
INSERT INTO `products` VALUES (90, 'NÓN XE ĐẠP ROYAL MD16', 550000, '	Royal', 'NUADAU', 0, 'Nón xe đạp Royal MD16 xám tổ ong là thiết kế đơn giản, gọn nhé. Đặc biệt kiểu dáng giống POC 01 90%, POC 01 có giá tới 750,000vnđ còn nón Royal MD16 chỉ 550,000vnđ rẻ hơn 200.000 vnđ. Lỗ thông gió được thiết kế kiểu dáng khí động học mang lại cảm giác thông thoáng, thoải mái và giảm lực cản tối đa khi di chuyển.', '2022-12-14');
INSERT INTO `products` VALUES (91, 'MŨ NỬA ĐẦU ROYAL M156', 400000, 'Royal', 'NUADAU', 0, 'Mũ bảo hiểm Royal M156K siêu phẩm mũ bảo hiểm 1/2 đầu mới nhất của Royal Helmet', '2022-12-14');
INSERT INTO `products` VALUES (92, 'MŨ NỬA ĐẦU ASIA MT-106K', 330000, 'ASIA', 'NUADAU', 0, 'ASIA MT-106K được sản xuất bởi công ty Á Châu. Nón thích hợp với những người yêu thích sự gọn nhẹ, thuận tiện cho những chuyến đi ngắn hay di chuyển trong đô thị', '2022-12-14');
INSERT INTO `products` VALUES (93, 'MŨ NỬA ĐẦU ĐẦU TORC T-55', 990000, 'TORC', 'NUADAU', 0, 'Mũ bảo hiểm 1/2 đầu Torc T-55 Đen Bóng là sản phẩm thuộc phân khúc cao cấp đến từ thương hiệu TORC của Mỹ. Với kiểu dáng nhẹ nhàng, thanh thoát cùng độ an toàn, tin cậy. Torc T-55 sẽ rất thích hợp với những ai yêu thích sự gọn nhẹ và thường xuyên di chuyển trên những quãng đường nội thành.', '2022-12-14');
INSERT INTO `products` VALUES (94, 'MŨ NỬA ĐẦU ASIA MT-139', 380000, 'ASIA', 'NUADAU', 0, 'Nón bảo hiểm 1/2 đầu Asia MT 139 Đỏ nhám được trang bị kính âm tiện lợi cùng với thiết kế năng động và trẻ trung được nhiều người ưa chuộng bởi sự gọn nhẹ vô cùng thuận tiện khi di chuyển trong những quãng đường ngắn hoặc đô thị.', '2022-12-14');
INSERT INTO `products` VALUES (95, 'MŨ NỬA ĐẦU SUNDA 136D', 3500000, 'SUNDA', 'NUADAU', 0, 'Công ty TNHH Longhuei với bề dày kinh nghiệm  gần 30 năm trong ngành nón, cơ sở hạ tầng hiện đại, quy trình kiểm nghiệm đạt chuẩn quốc tế. Hãng đã cho ra mắt nón bảo hiểm nửa đầu Sunda 135D Xám Xi Măng, với mong muốn đáp ứng mọi kì vọng cho những khách hàng đang tìm cho mình một chiêc mũ bảo hiểm an toàn, tiện dụng.', '2022-12-14');
INSERT INTO `products` VALUES (96, 'MŨ NỬA ĐẦU NAPOLI S46 KÍNH DẤU', 390000, 'NAPOLI', 'NUADAU', 0, 'Mũ bảo hiểm Napoli 1/2 Napoli  được làm từ chất liệu ABS nguyên sinh với trọng lượng vô cùng nhẹ nhưng vẫn đảm bảo sự an toàn, bền bỉ.', '2022-12-14');
INSERT INTO `products` VALUES (97, 'MŨ 1/2 ANDES 139 KÍNH DẤU', 450000, 'Andes', 'NUADAU', 0, 'Mũ 1/2 đầu Andes 3s-139 Kính dấu là sản phẩm mới nhất của Andes, bán chạy nhất trong năm 2018.', '2022-12-14');
INSERT INTO `products` VALUES (98, 'MŨ 1/2 ANDES 256 KÍNH DẤU', 440000, 'Andes', 'NUADAU', 0, 'Mũ 1/2 đầu Andes 3s-256 Kính dấu là sản phẩm mới nhất của Andes, bán chạy nhất trong năm 2018.', '2022-12-14');
INSERT INTO `products` VALUES (99, 'MŨ 1/2 ANDES 126 KÍNH', 490000, 'Andes', 'NUADAU', 0, 'Mũ 1/2 đầu Andes 3s-126 Kính là thiết kế mới nhất của Andes với lót trong tháo rời 100%.', '2022-12-14');
INSERT INTO `products` VALUES (100, 'MŨ 1/2 ANDES HALY ', 270000, 'Andes', 'NUADAU', 0, 'Mũ 1/2 đầu Andes 3s- Haly, thiết kế mới nhất của Andes với lót trong tháo rời 100%.', '2022-12-14');

-- ----------------------------
-- Table structure for slideshows
-- ----------------------------
DROP TABLE IF EXISTS `slideshows`;
CREATE TABLE `slideshows`  (
  `id_slideshow` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `allow` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_slideshow`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slideshows
-- ----------------------------
INSERT INTO `slideshows` VALUES (1, 'img/slideshow_4.jpg', '1');
INSERT INTO `slideshows` VALUES (2, 'img/MB-1.jpg', '1');
INSERT INTO `slideshows` VALUES (3, 'img/Slideshow_33_1000x1000.jpg', '1');
INSERT INTO `slideshows` VALUES (4, 'img/slideshow_1_600x.jpg', '0');

-- ----------------------------
-- Table structure for star_votes
-- ----------------------------
DROP TABLE IF EXISTS `star_votes`;
CREATE TABLE `star_votes`  (
  `id_product` int(11) NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `star` double NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of star_votes
-- ----------------------------
INSERT INTO `star_votes` VALUES (1, 6, 3.5);
INSERT INTO `star_votes` VALUES (2, 7, 4);
INSERT INTO `star_votes` VALUES (3, 4, 2);
INSERT INTO `star_votes` VALUES (4, 1, 4);
INSERT INTO `star_votes` VALUES (5, 3, 1);
INSERT INTO `star_votes` VALUES (6, 2, 1);
INSERT INTO `star_votes` VALUES (7, 44, 1);
INSERT INTO `star_votes` VALUES (8, 3, 1);
INSERT INTO `star_votes` VALUES (9, 4, 2);
INSERT INTO `star_votes` VALUES (10, 4, 3);
INSERT INTO `star_votes` VALUES (11, 4, 5);
INSERT INTO `star_votes` VALUES (12, 8, 2);
INSERT INTO `star_votes` VALUES (13, 4, 4);
INSERT INTO `star_votes` VALUES (14, 4, 5);
INSERT INTO `star_votes` VALUES (15, 4, 3);
INSERT INTO `star_votes` VALUES (16, 4, 2);
INSERT INTO `star_votes` VALUES (17, 4, 1);
INSERT INTO `star_votes` VALUES (18, 4, 0);
INSERT INTO `star_votes` VALUES (19, 4, 0);
INSERT INTO `star_votes` VALUES (20, 4, 3);
INSERT INTO `star_votes` VALUES (21, 4, 0);
INSERT INTO `star_votes` VALUES (22, 4, 2);
INSERT INTO `star_votes` VALUES (23, 60, 5);
INSERT INTO `star_votes` VALUES (24, 4, 2);
INSERT INTO `star_votes` VALUES (25, 4, 4);
INSERT INTO `star_votes` VALUES (26, 4, 3);
INSERT INTO `star_votes` VALUES (27, 4, 5);
INSERT INTO `star_votes` VALUES (28, 4, 5);
INSERT INTO `star_votes` VALUES (29, 3, 5);
INSERT INTO `star_votes` VALUES (30, 45, 5);
INSERT INTO `star_votes` VALUES (31, 2, 5);
INSERT INTO `star_votes` VALUES (32, 3, 5);
INSERT INTO `star_votes` VALUES (33, 4, 5);
INSERT INTO `star_votes` VALUES (34, 12, 4);
INSERT INTO `star_votes` VALUES (35, 32, 3);
INSERT INTO `star_votes` VALUES (36, 43, 5);
INSERT INTO `star_votes` VALUES (37, 6, 1);
INSERT INTO `star_votes` VALUES (38, 5, 2);
INSERT INTO `star_votes` VALUES (39, 67, 5);
INSERT INTO `star_votes` VALUES (40, 6, 4);
INSERT INTO `star_votes` VALUES (41, 7, 4);
INSERT INTO `star_votes` VALUES (42, 4, 2);
INSERT INTO `star_votes` VALUES (43, 1, 4);
INSERT INTO `star_votes` VALUES (44, 3, 1);
INSERT INTO `star_votes` VALUES (45, 2, 1);
INSERT INTO `star_votes` VALUES (46, 44, 1);
INSERT INTO `star_votes` VALUES (47, 3, 1);
INSERT INTO `star_votes` VALUES (48, 4, 2);
INSERT INTO `star_votes` VALUES (49, 4, 3);
INSERT INTO `star_votes` VALUES (50, 4, 5);
INSERT INTO `star_votes` VALUES (51, 8, 2);
INSERT INTO `star_votes` VALUES (52, 4, 4);
INSERT INTO `star_votes` VALUES (53, 4, 5);
INSERT INTO `star_votes` VALUES (54, 4, 3);
INSERT INTO `star_votes` VALUES (55, 4, 2);
INSERT INTO `star_votes` VALUES (56, 4, 1);
INSERT INTO `star_votes` VALUES (57, 4, 0);
INSERT INTO `star_votes` VALUES (58, 4, 0);
INSERT INTO `star_votes` VALUES (59, 4, 3);
INSERT INTO `star_votes` VALUES (60, 4, 0);
INSERT INTO `star_votes` VALUES (61, 4, 2);
INSERT INTO `star_votes` VALUES (62, 60, 5);
INSERT INTO `star_votes` VALUES (63, 4, 2);
INSERT INTO `star_votes` VALUES (64, 4, 4);
INSERT INTO `star_votes` VALUES (65, 4, 3);
INSERT INTO `star_votes` VALUES (66, 4, 5);
INSERT INTO `star_votes` VALUES (67, 4, 5);
INSERT INTO `star_votes` VALUES (68, 3, 5);
INSERT INTO `star_votes` VALUES (69, 45, 5);
INSERT INTO `star_votes` VALUES (70, 2, 5);
INSERT INTO `star_votes` VALUES (71, 3, 5);
INSERT INTO `star_votes` VALUES (72, 4, 5);
INSERT INTO `star_votes` VALUES (73, 12, 4);
INSERT INTO `star_votes` VALUES (74, 32, 3);
INSERT INTO `star_votes` VALUES (75, 43, 5);
INSERT INTO `star_votes` VALUES (76, 6, 1);
INSERT INTO `star_votes` VALUES (77, 5, 2);
INSERT INTO `star_votes` VALUES (78, 67, 5);
INSERT INTO `star_votes` VALUES (79, 7, 5);
INSERT INTO `star_votes` VALUES (80, 10, 3);
INSERT INTO `star_votes` VALUES (81, 20, 4);
INSERT INTO `star_votes` VALUES (82, 15, 2);
INSERT INTO `star_votes` VALUES (83, 50, 1);
INSERT INTO `star_votes` VALUES (84, 30, 4);
INSERT INTO `star_votes` VALUES (85, 40, 3);
INSERT INTO `star_votes` VALUES (86, 10, 5);
INSERT INTO `star_votes` VALUES (87, 3, 5);
INSERT INTO `star_votes` VALUES (88, 8, 3);
INSERT INTO `star_votes` VALUES (89, 7, 2);
INSERT INTO `star_votes` VALUES (90, 49, 2.5);
INSERT INTO `star_votes` VALUES (91, 30, 1);
INSERT INTO `star_votes` VALUES (92, 50, 4);
INSERT INTO `star_votes` VALUES (93, 12, 5);
INSERT INTO `star_votes` VALUES (94, 14, 3);
INSERT INTO `star_votes` VALUES (95, 26, 3);
INSERT INTO `star_votes` VALUES (96, 33, 1);
INSERT INTO `star_votes` VALUES (97, 53, 3.5);
INSERT INTO `star_votes` VALUES (98, 12, 2);
INSERT INTO `star_votes` VALUES (99, 13, 5);
INSERT INTO `star_votes` VALUES (100, 69, 4);

SET FOREIGN_KEY_CHECKS = 1;