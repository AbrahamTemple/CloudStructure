/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : db_goods

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2020-12-26 14:11:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `price` int(10) DEFAULT NULL COMMENT '价格',
  `content` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '东北饺子', '48', '东北饺子', '101.jpg');
INSERT INTO `goods` VALUES ('3', '红烧肉', '88', '红烧肉', '102.jpg');
INSERT INTO `goods` VALUES ('4', '兰州拉面', '16', '兰州拉面', '103.jpg');
INSERT INTO `goods` VALUES ('5', '蒸糕', '20', '蒸糕', '104.jpg');
INSERT INTO `goods` VALUES ('6', '辣子鸡', '20', '辣子鸡', '105.jpg');
INSERT INTO `goods` VALUES ('7', '牛肉面', '18', '牛肉面', '106.jpg');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `role` int(11) DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '张三', '0');
INSERT INTO `users` VALUES ('13', 'u1', '123', '李四', '1');
INSERT INTO `users` VALUES ('14', 'u2', '123', '王五', '1');
