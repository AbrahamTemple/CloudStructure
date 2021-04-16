/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : user-center

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-12-27 20:26:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `shop` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '店铺',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` double(10,2) DEFAULT NULL COMMENT '价格',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '介绍',
  `distributionFee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '配送费',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上架时间',
  `product_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '生产时间',
  `manufactor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '厂家',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='商品';

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('2', 'wfwq', 'fewf', 'ewfw', '213.00', 'ewfew', '324', '2020-12-27 02:56:12', '2020-12-27 02:56:12', 'fwef', 'fwef');
INSERT INTO `food` VALUES ('3', 'fwe', 'fwef', 'fwe', '324.00', 'wfdefdwq', '3244', '2020-12-27 03:01:36', '2020-12-14 00:00:00', 'dwqd', 'dqwdwq');
INSERT INTO `food` VALUES ('5', 'dqwe', 'daws', 'dwq', '423.00', 'fewf', '423', '2020-12-27 16:01:33', '2020-12-15 00:00:00', 'dwed', 'fewfw43');
INSERT INTO `food` VALUES ('8', 'fwe4fr', 'fwe', '234', '423542.00', '2', '423', '2020-12-27 18:38:57', '2020-12-15 00:00:00', '324325', '32423324');
INSERT INTO `food` VALUES ('9', '343g', '35', '345', '345.00', '345', '5345', '2020-12-27 19:22:02', '2020-12-15 00:00:00', '3242', '324');
INSERT INTO `food` VALUES ('10', 'wer', 'rwe', 'wer', '4234423.00', 'serf', '34234', '2020-12-27 19:33:54', '2020-12-15 00:00:00', '23432', '34');
INSERT INTO `food` VALUES ('11', 'ewf', 'fwefew', 'fewf', '45.00', 'greg', '2', '2020-12-27 20:09:56', '2020-12-15 00:00:00', 'wefewfew', 'fwefwef');

-- ----------------------------
-- Table structure for haha
-- ----------------------------
DROP TABLE IF EXISTS `haha`;
CREATE TABLE `haha` (
  `id` int(11) NOT NULL,
  `haha` varchar(255) DEFAULT NULL,
  `vv` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of haha
-- ----------------------------
INSERT INTO `haha` VALUES ('1', '22', '33', null, null);

-- ----------------------------
-- Table structure for myorder
-- ----------------------------
DROP TABLE IF EXISTS `myorder`;
CREATE TABLE `myorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `order_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `price` double DEFAULT '0' COMMENT '总价',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人',
  `consignee_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货人电话',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未完成',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '细节',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of myorder
-- ----------------------------
INSERT INTO `myorder` VALUES ('5', '0506ee00-f109-4c2b-9bb0-dcf9d2955f85', '2020-12-27 17:49:30', '4244578', 'admin', '18888888888', '完成', '{\"fwe\":4,\"ewfw\":2,\"dwq\":3}');
INSERT INTO `myorder` VALUES ('6', '325', '2020-11-15 00:00:00', '101553', '3453', '3453', '完成', '{}');
INSERT INTO `myorder` VALUES ('8', '5dada6d7-3eb4-41b1-91f6-aed23ca42409', '2020-12-27 19:50:45', '9320220', 'admin', '18888888888', '完成', '{\"\":1,\"fewf\":3,\"234\":3,\"345\":2,\"wer\":2,\"fwe\":2,\"dwq\":4}');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `css` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `tenant_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2', '12', '用户管理', '#!user', 'system/user.html', null, 'layui-icon-friends', '2', '2017-11-17 16:56:59', '2018-09-19 11:26:14', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('3', '12', '角色管理', '#!role', 'system/role.html', null, 'layui-icon-user', '3', '2017-11-17 16:56:59', '2019-01-14 15:34:40', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('4', '12', '菜单管理', '#!menus', 'system/menus.html', null, 'layui-icon-menu-fill', '4', '2017-11-17 16:56:59', '2018-09-03 02:23:47', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('9', '37', '文件中心', '#!files', 'files/files.html', null, 'layui-icon-file', '3', '2017-11-17 16:56:59', '2019-01-17 20:18:44', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('10', '37', '文档中心', '#!swagger', 'http://127.0.0.1:9900/swagger-ui.html', null, 'layui-icon-app', '4', '2017-11-17 16:56:59', '2019-01-17 20:18:48', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('11', '12', '我的信息', '#!myInfo', 'system/myInfo.html', null, 'layui-icon-login-qq', '10', '2017-11-17 16:56:59', '2018-09-02 06:12:24', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('12', '-1', '认证管理', 'javascript:;', '', null, 'layui-icon-set', '1', '2017-11-17 16:56:59', '2018-12-13 15:02:49', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('35', '12', '应用管理', '#!app', 'attestation/app.html', null, 'layui-icon-link', '5', '2017-11-17 16:56:59', '2019-01-14 15:35:15', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('37', '-1', '系统管理', 'javascript:;', '', null, 'layui-icon-set', '2', '2018-08-25 10:41:58', '2019-01-23 14:01:58', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('62', '63', '应用监控', '#!admin', 'http://127.0.0.1:6500/#/wallboard', null, 'layui-icon-chart-screen', '4', '2019-01-08 15:32:19', '2019-01-17 20:22:44', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('63', '-1', '系统监控', 'javascript:;', '', null, 'layui-icon-set', '2', '2019-01-10 18:35:05', '2019-01-10 18:35:05', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('64', '63', '系统日志', '#!sysLog', 'log/sysLog.html', null, 'layui-icon-file-b', '1', '2019-01-10 18:35:55', '2019-01-12 00:27:20', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('65', '37', '代码生成器', '#!generator', 'generator/list.html', null, 'layui-icon-template', '2', '2019-01-14 00:47:36', '2019-01-23 14:06:31', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('66', '63', '慢查询SQL', '#!slowQueryLog', 'log/slowQueryLog.html', null, 'layui-icon-snowflake', '2', '2019-01-16 12:00:27', '2019-01-16 15:32:31', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('67', '-1', '任务管理', '#!job', 'http://127.0.0.1:8081/', null, 'layui-icon-date', '3', '2019-01-17 20:18:22', '2019-01-23 14:01:53', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('68', '63', '应用吞吐量监控', '#!sentinel', 'http://127.0.0.1:6999', null, 'layui-icon-chart', '5', '2019-01-22 16:31:55', '2019-01-22 16:34:03', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('69', '37', '配置中心', '#!nacos', 'http://127.0.0.1:8848/nacos', null, 'layui-icon-tabs', '1', '2019-01-23 14:06:10', '2019-01-23 14:06:10', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('70', '63', 'APM监控', '#!apm', 'http://127.0.0.1:8080', null, 'layui-icon-engine', '6', '2019-02-27 10:31:55', '2019-02-27 10:31:55', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('71', '-1', '搜索管理', 'javascript:;', '', null, 'layui-icon-set', '3', '2018-08-25 10:41:58', '2019-01-23 15:07:07', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('72', '71', '索引管理', '#!index', 'search/index_manager.html', null, 'layui-icon-template', '1', '2019-01-10 18:35:55', '2019-01-12 00:27:20', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('73', '71', '用户搜索', '#!userSearch', 'search/user_search.html', null, 'layui-icon-user', '2', '2019-01-10 18:35:55', '2019-01-12 00:27:20', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('74', '12', 'Token管理', '#!tokens', 'system/tokens.html', null, 'layui-icon-unlink', '6', '2019-07-11 16:56:59', '2019-07-11 16:56:59', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('75', '2', '用户列表', '/api-user/users', 'user-list', 'GET', null, '1', '2019-07-29 16:56:59', '2019-07-29 16:56:59', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('76', '2', '查询用户角色', '/api-user/roles', 'user-roles', 'GET', null, '2', '2019-07-29 16:56:59', '2019-07-29 16:56:59', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('77', '2', '用户添加', '/api-user/users/saveOrUpdate', 'user-btn-add', 'POST', null, '3', '2019-07-29 16:56:59', '2019-07-29 16:56:59', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('78', '2', '用户导出', '/api-user/users/export', 'user-btn-export', 'POST', null, '4', '2019-07-29 16:56:59', '2019-07-29 16:56:59', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('79', '2', '用户导入', '/api-user/users/import', 'user-btn-import', 'POST', null, '5', '2019-07-29 16:56:59', '2019-07-29 16:56:59', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('82', '-1', '支付管理', '#!pay', '', null, null, '3', '2019-08-06 20:02:13', '2019-08-06 20:02:13', '1', '0', 'zlt');
INSERT INTO `sys_menu` VALUES ('83', '-1', '交易管理', '#!trading', '', null, null, '4', '2019-08-06 20:02:13', '2019-08-06 20:02:13', '1', '0', 'zlt');
INSERT INTO `sys_menu` VALUES ('85', '63', '审计日志', '#!auditLog', 'log/auditLog.html', null, 'layui-icon-file-b', '3', '2020-02-04 12:00:27', '2020-02-04 15:32:31', '1', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('87', '3', '所有角色', '/api-user/allRoles', 'role-list', 'GET', '', '7', '2020-06-17 00:01:34', '2020-06-17 00:01:53', '2', '0', 'webApp');
INSERT INTO `sys_menu` VALUES ('88', '-1', '外卖', 'javascript:;', '', '', 'layui-icon-set', '5', '2020-12-27 01:51:15', '2020-12-27 01:54:57', '1', '0', '');
INSERT INTO `sys_menu` VALUES ('89', '88', '商品', '#!good', 'good/good.html', '', 'layui-icon-set', '6', '2020-12-27 01:52:53', '2020-12-27 02:00:08', '1', '0', '');
INSERT INTO `sys_menu` VALUES ('90', '88', '订单', '#!order', 'order/order.html', '', 'layui-icon-set', '8', '2020-12-27 15:26:58', '2020-12-27 15:26:58', '1', '0', '');
INSERT INTO `sys_menu` VALUES ('91', '89', '商品列表', '/api-user/d', 'good-list', 'GET', '', '1', '2020-12-27 15:54:09', '2020-12-27 15:54:09', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('92', '89', '添加商品', '/api-user/d', 'good-add', 'POST', '', '2', '2020-12-27 15:54:55', '2020-12-27 15:54:55', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('93', '89', '删除商品', '/api-user/d/{id}', 'good-delete', 'DELETE', '', '3', '2020-12-27 15:55:33', '2020-12-27 15:55:33', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('94', '90', '订单列表', '/api-user/er', 'order-list', 'GET', '', '1', '2020-12-27 15:58:24', '2020-12-27 15:58:24', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('95', '90', '添加订单', '/api-user/er', 'order-add', 'POST', '', '2', '2020-12-27 15:58:51', '2020-12-27 19:13:50', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('96', '90', '删除订单', '/api-user/er/{id}', 'oeder-delete', 'DELETE', '', '3', '2020-12-27 15:59:23', '2020-12-27 19:13:57', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('97', '89', '点餐', '/api-user/d/diancan', 'diancan', 'GET', '', '6', '2020-12-27 18:48:18', '2020-12-27 18:48:18', '2', '0', '');
INSERT INTO `sys_menu` VALUES ('98', '90', '确定订单', '/api-user/er/finish', '', 'GET', '', '6', '2020-12-27 19:47:10', '2020-12-27 19:47:10', '2', '0', '');

-- ----------------------------
-- Table structure for sys_myaddr
-- ----------------------------
DROP TABLE IF EXISTS `sys_myaddr`;
CREATE TABLE `sys_myaddr` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_myaddr
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色code',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `tenant_id` varchar(32) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', 'ADMIN', '管理员', '2017-11-17 16:56:59', '2018-09-19 09:39:10', 'webApp');
INSERT INTO `sys_role` VALUES ('11', 'user', '点餐用户', '2020-12-27 15:46:59', '2020-12-27 18:50:15', '');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '35');
INSERT INTO `sys_role_menu` VALUES ('1', '37');
INSERT INTO `sys_role_menu` VALUES ('1', '69');
INSERT INTO `sys_role_menu` VALUES ('1', '74');
INSERT INTO `sys_role_menu` VALUES ('1', '75');
INSERT INTO `sys_role_menu` VALUES ('1', '76');
INSERT INTO `sys_role_menu` VALUES ('1', '77');
INSERT INTO `sys_role_menu` VALUES ('1', '78');
INSERT INTO `sys_role_menu` VALUES ('1', '79');
INSERT INTO `sys_role_menu` VALUES ('1', '87');
INSERT INTO `sys_role_menu` VALUES ('1', '88');
INSERT INTO `sys_role_menu` VALUES ('1', '89');
INSERT INTO `sys_role_menu` VALUES ('1', '90');
INSERT INTO `sys_role_menu` VALUES ('1', '91');
INSERT INTO `sys_role_menu` VALUES ('1', '92');
INSERT INTO `sys_role_menu` VALUES ('1', '93');
INSERT INTO `sys_role_menu` VALUES ('1', '94');
INSERT INTO `sys_role_menu` VALUES ('1', '95');
INSERT INTO `sys_role_menu` VALUES ('1', '96');
INSERT INTO `sys_role_menu` VALUES ('1', '97');
INSERT INTO `sys_role_menu` VALUES ('1', '98');
INSERT INTO `sys_role_menu` VALUES ('11', '88');
INSERT INTO `sys_role_menu` VALUES ('11', '89');
INSERT INTO `sys_role_menu` VALUES ('11', '90');
INSERT INTO `sys_role_menu` VALUES ('11', '91');
INSERT INTO `sys_role_menu` VALUES ('11', '94');
INSERT INTO `sys_role_menu` VALUES ('11', '96');
INSERT INTO `sys_role_menu` VALUES ('11', '97');

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES ('1', '1');
INSERT INTO `sys_role_user` VALUES ('2', '11');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `head_img_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`),
  KEY `idx_mobile` (`mobile`),
  KEY `idx_open_id` (`open_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$TJkwVdlpbHKnV45.nBxbgeFHmQRmyWlshg94lFu2rKxVtT2OMniDO', '管理员', 'http://pkqtmn0p1.bkt.clouddn.com/头像.png', '18888888888', '0', '1', 'APP', '2017-11-17 16:56:59', '2019-01-08 17:05:47', 'ENGJ', '123', '0');
INSERT INTO `sys_user` VALUES ('2', 'user', '$2a$10$8pFYxNif/mb.Rb8I9Cr5UuAeeukOKInotNE51RnaB2ZAif8rZHIEq', '点餐用户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '18888888887', '0', '1', 'fewf', '2017-11-17 16:56:59', '2020-12-27 18:50:27', 'ENGJ', null, '0');
INSERT INTO `sys_user` VALUES ('3', 'test', '$2a$10$Q/pycwlCbBqyXnGQx42nQeMbjlVaTyP2/f9yW6rsTx5z3ZW4Ysn1u', '测试账户', 'http://payo7kq4i.bkt.clouddn.com/QQ%E5%9B%BE%E7%89%8720180819191900.jpg', '13851539156', '0', '0', 'APP', '2017-11-17 16:56:59', '2020-06-17 00:15:51', 'ENGJ', null, '1');
INSERT INTO `sys_user` VALUES ('4', '1', '$2a$10$9vLdwXBZaAPy/hmzEDf.M.YbrsKWGG21nqWq17/EwWPBi65GDivLa', '11', null, '13530151800', '1', '1', 'APP', '2018-09-07 14:20:51', '2018-11-15 01:45:36', 'YCC', null, '1');
INSERT INTO `sys_user` VALUES ('5', '12', '$2a$10$cgRGZ0uuIAoKuwBoTWmz7eJzP4RUEr688VlnpZ4BTCz2RZEt0jrIe', '12', null, '17587132062', '0', '1', 'APP', '2018-09-08 04:52:25', '2018-09-16 01:48:00', 'YCC', null, '1');
INSERT INTO `sys_user` VALUES ('6', 'abc1', '$2a$10$pzvn4TfBh2oFZJbtagovFe56ZTUlTaawPnx0Yz2PeqGex0xbddAGu', 'abc', null, '12345678901', '0', '1', 'APP', '2018-09-11 08:02:25', '2018-09-14 06:49:54', 'YCC', null, '1');
INSERT INTO `sys_user` VALUES ('7', '234', '$2a$10$FxFvGGSi2RCe4lm5V.G0Feq6szh5ArMz.8Mzm08zQlkA.VgE9GFbm', 'ddd', null, '13245678906', '0', '1', 'APP', '2018-09-19 01:33:54', '2018-09-19 01:33:54', 'JFSC', null, '1');
INSERT INTO `sys_user` VALUES ('8', 'tester', '$2a$10$VUfknatgKIoZJYDLIesrrO5Vg8Djw5ON2oDWeXyC24TZ6Ca/TWiye', 'tester', null, '12345678901', '0', '1', 'APP', '2018-09-19 04:52:01', '2018-11-16 22:12:04', 'JFSC', null, '1');
INSERT INTO `sys_user` VALUES ('9', '11111111111111111111', '$2a$10$DNaUDpCHKZI0V9w.R3wBaeD/gGOQDYjgC5fhju7bQLfIkqsZV61pi', 'cute', 'http://payo7kq4i.bkt.clouddn.com/C:\\Users\\GAOY91\\Pictures\\79f0f736afc37931a921fd59e3c4b74543a91170.jpg', '15599999991', '1', '1', 'APP', '2018-09-19 04:57:39', null, 'JFSC', null, '1');
INSERT INTO `sys_user` VALUES ('10', 'test001', '123456', 'test001', null, '11111111', '0', '1', 'BACKEND', '2018-09-12 13:50:57', '2019-01-07 13:04:18', null, null, '1');
INSERT INTO `sys_user` VALUES ('11', 'test002', '123456', 'test002', null, '22222222', '0', '1', 'BACKEND', '2018-09-11 08:02:25', '2018-09-14 06:49:54', null, null, '1');
INSERT INTO `sys_user` VALUES ('12', '123', '$2a$10$PgngbC9pQWDT.ZG37fvV6e8Zi0C3mQOVMJJE35.XQULnppSEWhyPK', '12', null, '1', '0', '1', 'BACKEND', '2019-01-19 13:44:02', '2019-01-19 13:44:02', null, null, '1');
INSERT INTO `sys_user` VALUES ('27', 'aa', '$2a$10$6Bep2/F25RgIQuLMrtDwgejwBNIqt/bra/OECoMdSEqCvrKI0Z0m6', 'asd', null, '13588024002', '0', '1', 'BACKEND', '2020-06-17 00:11:46', '2020-06-17 00:11:46', null, null, '1');
INSERT INTO `sys_user` VALUES ('28', 'majie', '$2a$10$0emdRFN7nSjmFmWa3A2mUeif6LaPU/u.TWHenCuP70hUGkjsA5k22', 'majie', null, '13588024002', '0', '1', 'BACKEND', '2020-06-17 00:18:58', '2020-06-17 00:18:58', null, null, '1');
INSERT INTO `sys_user` VALUES ('29', 'my', '$2a$10$bAK32DtG7KOaPtIy8VJv/uDX2K2UXC9zjpJDNxT.Px7CbC3Ie.Q7m', 'my', null, '13588024002', '0', '1', 'BACKEND', '2020-06-17 00:26:17', '2020-06-17 00:26:17', null, null, '1');
INSERT INTO `sys_user` VALUES ('30', 'wrw', '$2a$10$soeBWXOnvKkKVd2pgBs0GOp84HtxNP/uoSMfW23r42klp1LthXqcK', 'rw3', null, '13588024004', '0', '1', 'BACKEND', '2020-12-27 15:37:19', '2020-12-27 15:37:19', null, null, '1');
INSERT INTO `sys_user` VALUES ('31', 'dqwd', '$2a$10$/BNFnwW32Xp9UBepi0mnmeKFKJBEY9qrUIYoj5Ld4Zc3as4rQGobK', 'dqwd', null, '13588024006', '0', '1', 'BACKEND', '2020-12-27 15:49:10', '2020-12-27 15:49:10', null, null, '1');
