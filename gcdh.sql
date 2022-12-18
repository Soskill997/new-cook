/*
 Navicat Premium Data Transfer

 Source Server         : myConnection
 Source Server Type    : MySQL
 Source Server Version : 50067
 Source Host           : localhost:3306
 Source Schema         : gcdh

 Target Server Type    : MySQL
 Target Server Version : 50067
 File Encoding         : 65001

 Date: 17/12/2022 21:42:50
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员账户',
  `admin_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `admin_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员电话',
  `admin_email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员邮箱',
  `admin_real_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `admin_token` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员令牌',
  PRIMARY KEY USING BTREE (`admin_id`),
  UNIQUE INDEX `admin_id` USING BTREE(`admin_id`),
  UNIQUE INDEX `admin_name` USING BTREE(`admin_name`),
  UNIQUE INDEX `admin_token` USING BTREE(`admin_token`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '仅表示商品在该购物车中的ID',
  `user_id` int(11) NOT NULL COMMENT '表示该商品隶属于哪个用户',
  `food_id` int(11) NULL DEFAULT NULL COMMENT '表示实际代表食物的ID',
  `count` int(11) NOT NULL DEFAULT 1 COMMENT '数量',
  PRIMARY KEY USING BTREE (`id`),
  UNIQUE INDEX `id` USING BTREE(`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `food_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '食物id',
  `food_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '食物名',
  `admin_id` int(10) NULL DEFAULT NULL COMMENT '哪位管理员添加',
  `price` double(7, 2) NULL DEFAULT NULL COMMENT '价格',
  `inventory` int(9) NULL DEFAULT NULL COMMENT '库存',
  `product_date` datetime NULL DEFAULT NULL COMMENT '生产日期',
  `shelf_life` int(4) NULL DEFAULT NULL COMMENT '保质期',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` bit(1) NOT NULL DEFAULT 00000001 COMMENT '是否还有库存或商品是否下架：0为不可用状态，1为可用状态',
  `sale` tinyint(4) NULL DEFAULT 100 COMMENT '折扣状态',
  `imgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  PRIMARY KEY USING BTREE (`food_id`),
  UNIQUE INDEX `food_id` USING BTREE(`food_id`),
  UNIQUE INDEX `food_name` USING BTREE(`food_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `consumption` decimal(10, 0) NULL DEFAULT NULL COMMENT '订单金额',
  `products` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单内容',
  `user_real_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地址',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `stateCode` int(11) NULL DEFAULT NULL COMMENT '订单状态,0未支付，1已支付未发货，2已发货，3已收货，4退货中, 5已退货',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY USING BTREE (`order_id`),
  UNIQUE INDEX `id` USING BTREE(`order_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `phone_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `is_VIP` bit(1) NOT NULL DEFAULT 00000000 COMMENT '0：不是会员；1：是会员',
  `status` bit(1) NULL DEFAULT NULL COMMENT '0：被ban了，不可用；1：状态可用',
  PRIMARY KEY USING BTREE (`user_id`),
  UNIQUE INDEX `id` USING BTREE(`user_id`),
  UNIQUE INDEX `username` USING BTREE(`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
