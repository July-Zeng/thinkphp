/*
Navicat MySQL Data Transfer

Source Server         : hellomysql
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : thinkphp

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-02-12 16:18:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_access
-- ----------------------------
DROP TABLE IF EXISTS `think_access`;
CREATE TABLE `think_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_access
-- ----------------------------
INSERT INTO `think_access` VALUES ('1', '1', '1', null);
INSERT INTO `think_access` VALUES ('1', '2', '2', null);
INSERT INTO `think_access` VALUES ('1', '3', '2', null);
INSERT INTO `think_access` VALUES ('2', '1', '1', null);
INSERT INTO `think_access` VALUES ('2', '2', '2', null);
INSERT INTO `think_access` VALUES ('2', '3', '2', null);
INSERT INTO `think_access` VALUES ('2', '4', '3', null);
INSERT INTO `think_access` VALUES ('3', '1', '1', null);
INSERT INTO `think_access` VALUES ('3', '2', '2', null);
INSERT INTO `think_access` VALUES ('3', '3', '2', null);
INSERT INTO `think_access` VALUES ('3', '4', '3', null);
INSERT INTO `think_access` VALUES ('3', '5', '3', null);
INSERT INTO `think_access` VALUES ('1', '4', '3', null);
INSERT INTO `think_access` VALUES ('2', '5', '3', null);
INSERT INTO `think_access` VALUES ('3', '6', '3', null);

-- ----------------------------
-- Table structure for think_node
-- ----------------------------
DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_node
-- ----------------------------
INSERT INTO `think_node` VALUES ('1', 'Home', '前台模块', '1', null, null, '0', '1');
INSERT INTO `think_node` VALUES ('2', 'Index', '首页控制器', '1', null, null, '1', '2');
INSERT INTO `think_node` VALUES ('3', 'Test', '权限控制器', '1', null, null, '1', '2');
INSERT INTO `think_node` VALUES ('4', 'read', '普通会员', '1', null, null, '3', '3');
INSERT INTO `think_node` VALUES ('5', 'write', '白银会员', '1', null, null, '3', '3');
INSERT INTO `think_node` VALUES ('6', 'change', '黄金会员', '1', null, null, '3', '3');
INSERT INTO `think_node` VALUES ('7', 'delete', '钻石会员', '1', null, null, '3', '3');

-- ----------------------------
-- Table structure for think_role
-- ----------------------------
DROP TABLE IF EXISTS `think_role`;
CREATE TABLE `think_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_role
-- ----------------------------
INSERT INTO `think_role` VALUES ('1', '普通会员', '0', '1', null);
INSERT INTO `think_role` VALUES ('2', '白银会员', '0', '1', null);
INSERT INTO `think_role` VALUES ('3', '黄金会员', '0', '1', null);

-- ----------------------------
-- Table structure for think_role_user
-- ----------------------------
DROP TABLE IF EXISTS `think_role_user`;
CREATE TABLE `think_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_role_user
-- ----------------------------
INSERT INTO `think_role_user` VALUES ('1', '2');
INSERT INTO `think_role_user` VALUES ('2', '1');
INSERT INTO `think_role_user` VALUES ('3', '3');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `user_id` int(32) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', 'zhou', 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `think_user` VALUES ('2', 'bai', 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `think_user` VALUES ('3', 'zeng', 'e10adc3949ba59abbe56e057f20f883e', null, null);
INSERT INTO `think_user` VALUES ('4', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null);
