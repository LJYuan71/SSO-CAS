/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cas_test

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-08 14:13:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(16) DEFAULT NULL COMMENT '是否激活：1激活；0已删除',
  `remark` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'query', '1', '查询');
INSERT INTO `t_permission` VALUES ('2', 'add', '1', '添加');
INSERT INTO `t_permission` VALUES ('3', 'del', '1', '删除');
INSERT INTO `t_permission` VALUES ('4', 'list', '1', '列表');
INSERT INTO `t_permission` VALUES ('5', 'model:list', '1', '列表');
INSERT INTO `t_permission` VALUES ('6', 'model:add', '1', '添加');
INSERT INTO `t_permission` VALUES ('7', 'model:del', '1', '删除');
INSERT INTO `t_permission` VALUES ('8', 'model:query', '1', '查询');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `remark` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '1', '管理员');
INSERT INTO `t_role` VALUES ('2', 'user', '1', '用户');
INSERT INTO `t_role` VALUES ('3', 'manager', '1', '经理');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_permission_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1', '1', '2016-08-22 11:42:44');
INSERT INTO `t_role_permission` VALUES ('2', '1', '2', null);
INSERT INTO `t_role_permission` VALUES ('3', '1', '3', null);
INSERT INTO `t_role_permission` VALUES ('4', '1', '4', null);
INSERT INTO `t_role_permission` VALUES ('5', '1', '5', null);
INSERT INTO `t_role_permission` VALUES ('6', '1', '6', null);
INSERT INTO `t_role_permission` VALUES ('7', '1', '7', null);
INSERT INTO `t_role_permission` VALUES ('8', '1', '8', null);
INSERT INTO `t_role_permission` VALUES ('9', '2', '1', null);
INSERT INTO `t_role_permission` VALUES ('10', '2', '2', null);
INSERT INTO `t_role_permission` VALUES ('11', '2', '4', null);
INSERT INTO `t_role_permission` VALUES ('12', '3', '1', null);
INSERT INTO `t_role_permission` VALUES ('13', '3', '2', null);
INSERT INTO `t_role_permission` VALUES ('14', '3', '4', null);
INSERT INTO `t_role_permission` VALUES ('15', '3', '5', null);
INSERT INTO `t_role_permission` VALUES ('16', '3', '6', null);
INSERT INTO `t_role_permission` VALUES ('17', '3', '8', null);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_index` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'a0fc3b6dd79600fdc1abee4b3348206c', '管理员', '1', '2016-08-19 17:46:58');
INSERT INTO `t_user` VALUES ('2', 'yh8888', 'a0fc3b6dd79600fdc1abee4b3348206c', '用户8', '1', '2017-12-06 18:05:05');
INSERT INTO `t_user` VALUES ('3', 'mg8888', 'a0fc3b6dd79600fdc1abee4b3348206c', '经理8', '1', '2017-12-07 11:35:31');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role_index` (`user_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '1', '1', '2016-08-22 11:42:01');
INSERT INTO `t_user_role` VALUES ('2', '2', '2', '2017-12-07 11:36:05');
INSERT INTO `t_user_role` VALUES ('3', '3', '3', '2017-12-07 11:36:13');
INSERT INTO `t_user_role` VALUES ('4', '1', '3', '2017-12-07 11:37:00');
