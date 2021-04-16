/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : oauth-center

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2020-12-27 20:26:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用标识',
  `resource_ids` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源限定串(逗号分割)',
  `client_secret` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用密钥(bcyt) 加密',
  `client_secret_str` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '应用密钥(明文)',
  `scope` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '范围',
  `authorized_grant_types` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '5种oauth授权方式(authorization_code,password,refresh_token,client_credentials)',
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '回调地址 ',
  `authorities` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'access_token有效期',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT 'refresh_token有效期',
  `additional_information` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '{}' COMMENT '{}',
  `autoapprove` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'true' COMMENT '是否自动授权 是-true',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `client_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '应用名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('1', 'webApp', null, '$2a$10$06msMGYRH8nrm4iVnKFNKOoddB8wOwymVhbUzw/d3ZixD7Nq8ot72', 'webApp', 'app', 'authorization_code,password,refresh_token,client_credentials,implicit,password_code,openId,mobile_password', null, null, '3600', null, '{}', 'true', null, null, 'pc端');
INSERT INTO `oauth_client_details` VALUES ('2', 'app', null, '$2a$10$i3F515wEDiB4Gvj9ym9Prui0dasRttEUQ9ink4Wpgb4zEDCAlV8zO', 'app', 'app', 'authorization_code,password,refresh_token', 'http://127.0.0.1:8081/callback.html', null, '3600', null, '{}', 'true', null, null, '移动端');
INSERT INTO `oauth_client_details` VALUES ('3', 'zlt', null, '$2a$10$/o.wuORzVcXaezmYVzwYMuoY7qeWXBALwQmkskXD/7C6rqfCyPrna', 'zlt', 'all', 'authorization_code,password,refresh_token,client_credentials', 'http://127.0.0.1:8080/singleLogin', null, '3600', '28800', '{}', 'true', '2018-12-27 00:50:30', '2018-12-27 00:50:30', '第三方应用');
