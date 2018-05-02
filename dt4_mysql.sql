/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ad_dt4

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-26 12:04:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dt_manager
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager`;
CREATE TABLE `dt_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `role_type` int(11) DEFAULT NULL COMMENT '管理员类型1超管2系管',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '登录密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '6位随机字符串,加密用到',
  `real_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `telephone` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(30) DEFAULT NULL COMMENT '电子邮箱',
  `is_lock` int(11) DEFAULT NULL COMMENT '是否锁定',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of dt_manager
-- ----------------------------
INSERT INTO `dt_manager` VALUES ('1', '1', '1', 'admin', '7A5295D20FFE3F0F523084EB45D7580D', '24V0XZ', '超级管理员', '0755-36613761', 'cl@szyw88.com', '0', '2015-03-13 13:41:39');

-- ----------------------------
-- Table structure for dt_manager_log
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_log`;
CREATE TABLE `dt_manager_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(100) DEFAULT NULL COMMENT '用户名',
  `action_type` varchar(100) DEFAULT NULL COMMENT '操作类型',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `user_ip` varchar(30) DEFAULT NULL COMMENT '用户IP',
  `add_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1646 DEFAULT CHARSET=utf8 COMMENT='管理日志表';

-- ----------------------------
-- Records of dt_manager_log
-- ----------------------------
INSERT INTO `dt_manager_log` VALUES ('1562', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2016-11-19 08:46:52');
INSERT INTO `dt_manager_log` VALUES ('1563', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 08:48:38');
INSERT INTO `dt_manager_log` VALUES ('1564', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 08:55:15');
INSERT INTO `dt_manager_log` VALUES ('1565', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 08:55:48');
INSERT INTO `dt_manager_log` VALUES ('1566', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 08:57:28');
INSERT INTO `dt_manager_log` VALUES ('1567', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 08:58:10');
INSERT INTO `dt_manager_log` VALUES ('1568', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:02:50');
INSERT INTO `dt_manager_log` VALUES ('1569', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:03:03');
INSERT INTO `dt_manager_log` VALUES ('1570', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:03:25');
INSERT INTO `dt_manager_log` VALUES ('1571', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:03:47');
INSERT INTO `dt_manager_log` VALUES ('1572', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:07:55');
INSERT INTO `dt_manager_log` VALUES ('1573', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:08:05');
INSERT INTO `dt_manager_log` VALUES ('1574', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:14:28');
INSERT INTO `dt_manager_log` VALUES ('1575', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:17:13');
INSERT INTO `dt_manager_log` VALUES ('1576', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:23:52');
INSERT INTO `dt_manager_log` VALUES ('1577', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:23:56');
INSERT INTO `dt_manager_log` VALUES ('1578', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:24:12');
INSERT INTO `dt_manager_log` VALUES ('1579', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:24:17');
INSERT INTO `dt_manager_log` VALUES ('1580', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:25:13');
INSERT INTO `dt_manager_log` VALUES ('1581', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:25:23');
INSERT INTO `dt_manager_log` VALUES ('1582', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:25:30');
INSERT INTO `dt_manager_log` VALUES ('1583', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:25:40');
INSERT INTO `dt_manager_log` VALUES ('1584', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:29:42');
INSERT INTO `dt_manager_log` VALUES ('1585', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:41:52');
INSERT INTO `dt_manager_log` VALUES ('1586', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:56:20');
INSERT INTO `dt_manager_log` VALUES ('1587', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 09:56:25');
INSERT INTO `dt_manager_log` VALUES ('1588', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 10:03:22');
INSERT INTO `dt_manager_log` VALUES ('1589', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 10:10:08');
INSERT INTO `dt_manager_log` VALUES ('1590', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 10:10:12');
INSERT INTO `dt_manager_log` VALUES ('1591', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 10:10:45');
INSERT INTO `dt_manager_log` VALUES ('1592', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-19 10:11:20');
INSERT INTO `dt_manager_log` VALUES ('1593', '1', 'admin', 'Add', '发送手机短信', '127.0.0.1', '2016-11-19 10:16:13');
INSERT INTO `dt_manager_log` VALUES ('1594', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2016-11-24 11:21:03');
INSERT INTO `dt_manager_log` VALUES ('1595', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-24 13:24:42');
INSERT INTO `dt_manager_log` VALUES ('1596', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-24 13:37:52');
INSERT INTO `dt_manager_log` VALUES ('1597', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2016-11-24 13:49:54');
INSERT INTO `dt_manager_log` VALUES ('1598', '1', 'admin', 'Delete', '删除管理日志340条', '127.0.0.1', '2016-11-24 13:50:33');
INSERT INTO `dt_manager_log` VALUES ('1599', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2018-03-22 15:29:52');
INSERT INTO `dt_manager_log` VALUES ('1600', '1', 'admin', 'Edit', '修改管理角色:管理员', '127.0.0.1', '2018-03-22 15:30:51');
INSERT INTO `dt_manager_log` VALUES ('1601', '1', 'admin', 'Edit', '删除news频道内容成功21条，失败0条', '127.0.0.1', '2018-03-22 15:31:50');
INSERT INTO `dt_manager_log` VALUES ('1602', '1', 'admin', 'Edit', '删除news频道栏目分类数据', '127.0.0.1', '2018-03-22 15:31:53');
INSERT INTO `dt_manager_log` VALUES ('1603', '1', 'admin', 'Edit', '删除news频道内容成功2条，失败0条', '127.0.0.1', '2018-03-22 15:32:27');
INSERT INTO `dt_manager_log` VALUES ('1604', '1', 'admin', 'Edit', '删除goods频道内容成功15条，失败0条', '127.0.0.1', '2018-03-22 15:32:30');
INSERT INTO `dt_manager_log` VALUES ('1605', '1', 'admin', 'Edit', '删除goods频道栏目分类数据', '127.0.0.1', '2018-03-22 15:32:33');
INSERT INTO `dt_manager_log` VALUES ('1606', '1', 'admin', 'Edit', '删除video频道内容成功15条，失败0条', '127.0.0.1', '2018-03-22 15:32:37');
INSERT INTO `dt_manager_log` VALUES ('1607', '1', 'admin', 'Edit', '删除video频道栏目分类数据', '127.0.0.1', '2018-03-22 15:32:40');
INSERT INTO `dt_manager_log` VALUES ('1608', '1', 'admin', 'Edit', '删除video频道内容成功1条，失败0条', '127.0.0.1', '2018-03-22 15:32:44');
INSERT INTO `dt_manager_log` VALUES ('1609', '1', 'admin', 'Edit', '删除photo频道内容成功17条，失败0条', '127.0.0.1', '2018-03-22 15:32:48');
INSERT INTO `dt_manager_log` VALUES ('1610', '1', 'admin', 'Edit', '删除photo频道栏目分类数据', '127.0.0.1', '2018-03-22 15:32:51');
INSERT INTO `dt_manager_log` VALUES ('1611', '1', 'admin', 'Edit', '删除down频道内容成功15条，失败0条', '127.0.0.1', '2018-03-22 15:32:55');
INSERT INTO `dt_manager_log` VALUES ('1612', '1', 'admin', 'Edit', '删除down频道栏目分类数据', '127.0.0.1', '2018-03-22 15:32:58');
INSERT INTO `dt_manager_log` VALUES ('1613', '1', 'admin', 'Edit', '删除content频道内容成功2条，失败0条', '127.0.0.1', '2018-03-22 15:33:02');
INSERT INTO `dt_manager_log` VALUES ('1614', '1', 'admin', 'Edit', '删除content频道栏目分类数据', '127.0.0.1', '2018-03-22 15:33:04');
INSERT INTO `dt_manager_log` VALUES ('1615', '1', 'admin', 'Delete', '删除频道成功6条，失败0条', '127.0.0.1', '2018-03-22 15:33:07');
INSERT INTO `dt_manager_log` VALUES ('1616', '1', 'admin', 'Add', '添加管理角色:代理商', '127.0.0.1', '2018-03-22 15:38:21');
INSERT INTO `dt_manager_log` VALUES ('1617', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2018-03-23 11:51:47');
INSERT INTO `dt_manager_log` VALUES ('1618', '1', 'admin', 'Build', '生成模板:main', '127.0.0.1', '2018-03-23 11:51:51');
INSERT INTO `dt_manager_log` VALUES ('1619', '1', 'admin', 'Build', '生成模板:web', '127.0.0.1', '2018-03-23 11:53:18');
INSERT INTO `dt_manager_log` VALUES ('1620', '1', 'admin', 'Build', '生成模板:web', '127.0.0.1', '2018-03-23 11:53:19');
INSERT INTO `dt_manager_log` VALUES ('1621', '1', 'admin', 'Edit', '修改系统配置信息', '127.0.0.1', '2018-03-23 11:57:20');
INSERT INTO `dt_manager_log` VALUES ('1622', '1', 'admin', 'Build', '生成模板:web', '127.0.0.1', '2018-03-23 11:58:52');
INSERT INTO `dt_manager_log` VALUES ('1623', '1', 'admin', 'Delete', '删除站点成功1条，失败0条', '127.0.0.1', '2018-03-23 11:59:00');
INSERT INTO `dt_manager_log` VALUES ('1624', '1', 'admin', 'Edit', '修改站点:默认站点', '127.0.0.1', '2018-03-23 11:59:56');
INSERT INTO `dt_manager_log` VALUES ('1625', '1', 'admin', 'UnLoad', '卸载插件', '127.0.0.1', '2018-03-23 12:12:45');
INSERT INTO `dt_manager_log` VALUES ('1626', '1', 'admin', 'Delete', '删除管理员1条，失败0条', '127.0.0.1', '2018-03-23 18:43:45');
INSERT INTO `dt_manager_log` VALUES ('1627', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2018-03-24 16:08:58');
INSERT INTO `dt_manager_log` VALUES ('1628', '1', 'admin', 'Edit', '修改管理员:admin', '127.0.0.1', '2018-03-24 16:40:05');
INSERT INTO `dt_manager_log` VALUES ('1629', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2018-03-24 16:40:14');
INSERT INTO `dt_manager_log` VALUES ('1630', '1', 'admin', 'Edit', '修改管理员:admin', '127.0.0.1', '2018-03-24 16:40:20');
INSERT INTO `dt_manager_log` VALUES ('1631', '1', 'admin', 'Login', '用户登录', '127.0.0.1', '2018-03-26 10:19:22');
INSERT INTO `dt_manager_log` VALUES ('1632', '1', 'admin', 'Delete', '删除管理角色2条，失败0条', '127.0.0.1', '2018-03-26 10:24:51');
INSERT INTO `dt_manager_log` VALUES ('1633', '1', 'admin', 'Edit', '修改管理角色:代理商', '127.0.0.1', '2018-03-26 10:34:10');
INSERT INTO `dt_manager_log` VALUES ('1634', '1', 'admin', 'Delete', '删除管理角色3条，失败0条', '127.0.0.1', '2018-03-26 10:37:37');
INSERT INTO `dt_manager_log` VALUES ('1635', '1', 'admin', 'Edit', '修改管理角色:t1', '127.0.0.1', '2018-03-26 10:40:59');
INSERT INTO `dt_manager_log` VALUES ('1636', '1', 'admin', 'Delete', '删除管理角色3条，失败0条', '127.0.0.1', '2018-03-26 10:44:40');
INSERT INTO `dt_manager_log` VALUES ('1637', '1', 'admin', 'Delete', '删除管理角色3条，失败0条', '127.0.0.1', '2018-03-26 11:14:12');
INSERT INTO `dt_manager_log` VALUES ('1638', '1', 'admin', 'Delete', '删除管理角色2条，失败0条', '127.0.0.1', '2018-03-26 11:20:09');
INSERT INTO `dt_manager_log` VALUES ('1639', '1', 'admin', 'Delete', '删除管理角色1条，失败0条', '127.0.0.1', '2018-03-26 11:20:48');
INSERT INTO `dt_manager_log` VALUES ('1640', '1', 'admin', 'Delete', '删除管理角色3条，失败0条', '127.0.0.1', '2018-03-26 11:25:56');
INSERT INTO `dt_manager_log` VALUES ('1641', '1', 'admin', 'Delete', '删除管理角色2条，失败0条', '127.0.0.1', '2018-03-26 11:29:01');
INSERT INTO `dt_manager_log` VALUES ('1642', '1', 'admin', 'Delete', '删除管理角色2条，失败0条', '127.0.0.1', '2018-03-26 11:30:54');
INSERT INTO `dt_manager_log` VALUES ('1643', '1', 'admin', 'Add', '添加管理角色:t2', '127.0.0.1', '2018-03-26 11:34:52');
INSERT INTO `dt_manager_log` VALUES ('1644', '1', 'admin', 'Delete', '删除管理角色2条，失败0条', '127.0.0.1', '2018-03-26 11:35:04');
INSERT INTO `dt_manager_log` VALUES ('1645', '1', 'admin', 'Add', '添加导航菜单:代理', '127.0.0.1', '2018-03-26 11:53:55');

-- ----------------------------
-- Table structure for dt_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_role`;
CREATE TABLE `dt_manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_type` tinyint(4) DEFAULT NULL COMMENT '角色类型',
  `is_sys` tinyint(4) DEFAULT NULL COMMENT '是否系统默认0否1是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='管理角色表';

-- ----------------------------
-- Records of dt_manager_role
-- ----------------------------
INSERT INTO `dt_manager_role` VALUES ('1', '管理员', '1', '1');
INSERT INTO `dt_manager_role` VALUES ('2', '代理商', '2', '0');
INSERT INTO `dt_manager_role` VALUES ('21', 'a', '0', '2');
INSERT INTO `dt_manager_role` VALUES ('9', 'a', '0', '2');
INSERT INTO `dt_manager_role` VALUES ('15', 'a', '0', '2');

-- ----------------------------
-- Table structure for dt_manager_role_value
-- ----------------------------
DROP TABLE IF EXISTS `dt_manager_role_value`;
CREATE TABLE `dt_manager_role_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `nav_name` varchar(100) DEFAULT NULL COMMENT '导航名称',
  `action_type` varchar(50) DEFAULT NULL COMMENT '权限类型',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='管理角色权限表';

-- ----------------------------
-- Records of dt_manager_role_value
-- ----------------------------
INSERT INTO `dt_manager_role_value` VALUES ('2', '2', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('3', '2', 'channel_main', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('17', '0', 'channel_main', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('16', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('15', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('14', '0', 'channel_main', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('13', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('12', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('10', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('11', '0', 'channel_main', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('18', '0', 'sys_application', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('19', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('20', '0', 'channel_main', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('21', '0', 'sys_contents', 'Show');
INSERT INTO `dt_manager_role_value` VALUES ('22', '0', 'channel_main', 'Show');

-- ----------------------------
-- Table structure for dt_navigation
-- ----------------------------
DROP TABLE IF EXISTS `dt_navigation`;
CREATE TABLE `dt_navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属父导航ID',
  `channel_id` int(11) DEFAULT NULL COMMENT '所属频道ID',
  `nav_type` varchar(50) DEFAULT NULL COMMENT '导航类别',
  `name` varchar(50) DEFAULT NULL COMMENT '导航ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `sub_title` varchar(100) DEFAULT NULL COMMENT '副标题',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `sort_id` int(11) DEFAULT NULL COMMENT '排序数字',
  `is_lock` tinyint(4) DEFAULT NULL COMMENT '是否隐藏0显示1隐藏',
  `remark` text COMMENT '备注说明',
  `action_type` text COMMENT '权限资源',
  `is_sys` tinyint(4) DEFAULT NULL COMMENT '系统默认',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COMMENT='系统导航菜单';

-- ----------------------------
-- Records of dt_navigation
-- ----------------------------
INSERT INTO `dt_navigation` VALUES ('1', '0', '0', 'System', 'sys_contents', '站点管理', '站点', '/admin/skin/default/nav/home.png', '', '99', '0', '系统默认导航，不可更改导航ID', 'Show', '1');
INSERT INTO `dt_navigation` VALUES ('2', '0', '0', 'System', 'sys_application', '应用管理', '应用', '/admin/skin/default/nav/pus.png', '', '100', '0', '系统默认导航，不可更改导航ID', 'Show', '1');
INSERT INTO `dt_navigation` VALUES ('3', '0', '0', 'System', 'sys_users', '会员管理', '会员', '/admin/skin/default/nav/user.png', '', '101', '0', '系统默认导航，不可更改导航ID', 'Show', '1');
INSERT INTO `dt_navigation` VALUES ('4', '0', '0', 'System', 'sys_controller', '控制面板', '控制面板', '/admin/skin/default/nav/sys.png', '', '103', '0', '系统默认导航，不可更改导航ID', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('7', '4', '0', 'System', 'sys_manager', '系统用户', '', '', '', '103', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('8', '7', '0', 'System', 'manager_list', '管理员管理', '', '', 'manager/manager_list.aspx', '99', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('9', '7', '0', 'System', 'manager_role', '角色管理', '', '', 'manager/role_list.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('10', '7', '0', 'System', 'manager_log', '管理日志', '', '', 'manager/manager_log.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('11', '4', '0', 'System', 'sys_settings', '系统管理', '', '', '', '98', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('12', '11', '0', 'System', 'sys_config', '系统设置', '', '', 'settings/sys_config.aspx', '1', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('13', '11', '0', 'System', 'sys_plugin_config', '插件设置', '', '', 'settings/plugin_list.aspx', '2', '0', '', 'Show,View,Build,Instal,Unload', '0');
INSERT INTO `dt_navigation` VALUES ('14', '11', '0', 'System', 'sys_url_rewrite', 'URL配置', '', '', 'settings/url_rewrite_list.aspx', '3', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('15', '4', '0', 'System', 'sys_site_settings', '站点设置', '', '', '', '100', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('16', '15', '0', 'System', 'sys_site_manage', '站点管理', '', '', 'channel/site_list.aspx', '99', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('17', '15', '0', 'System', 'sys_channel_manage', '频道管理', '', '', 'channel/channel_list.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('18', '15', '0', 'System', 'sys_channel_field', '扩展字段', '', '', 'channel/attribute_field_list.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('19', '4', '0', 'System', 'sys_design', '界面管理', '', '', '', '102', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('20', '19', '0', 'System', 'sys_site_templet', '站点模板管理', '', '', 'settings/templet_list.aspx', '99', '0', '', 'Show,View,Add,Edit,Delete,Build', '0');
INSERT INTO `dt_navigation` VALUES ('21', '19', '0', 'System', 'sys_builder_html', '生成静态管理', '', '', 'settings/builder_html.aspx', '100', '0', '', 'Show,View,Build', '0');
INSERT INTO `dt_navigation` VALUES ('22', '19', '0', 'System', 'sys_navigation', '后台导航管理', '', '', 'settings/nav_list.aspx', '102', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('23', '0', '0', 'System', 'sys_orders', '订单管理', '订单', '/admin/skin/default/nav/order.png', '', '102', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('25', '1', '0', 'System', 'channel_main', '默认站点', '', '', '', '1', '0', '', 'Show', '1');
INSERT INTO `dt_navigation` VALUES ('26', '2', '0', 'System', 'sys_plugin_manage', '插件管理', '', '', '', '99', '0', '', 'Show,View', '1');
INSERT INTO `dt_navigation` VALUES ('35', '23', '0', 'System', 'order_manage', '订单管理', '', '', '', '99', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('36', '23', '0', 'System', 'order_settings', '订单设置', '', '', '', '100', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('37', '36', '0', 'System', 'order_config', '订单参数设置', '', '', 'order/order_config.aspx', '99', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('38', '36', '0', 'System', 'order_payment', '支付方式设置', '', '', 'order/payment_list.aspx', '100', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('39', '36', '0', 'System', 'order_express', '配送方式设置', '', '', 'order/express_list.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('40', '15', '0', 'System', 'sys_goods_spec', '商品规格', '', '', 'channel/spec_list.aspx', '102', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('41', '35', '0', 'System', 'order_confirm', '待确认订单', '', '', 'order/order_confirm.aspx', '99', '0', '', 'Show,View,Confirm', '0');
INSERT INTO `dt_navigation` VALUES ('42', '35', '0', 'System', 'order_list', '全部订单', '', '', 'order/order_list.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete,Confirm,Cancel,Invalid', '0');
INSERT INTO `dt_navigation` VALUES ('43', '3', '0', 'System', 'user_manage', '会员管理', '', '', '', '99', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('44', '43', '0', 'System', 'user_audit', '审核会员', '', '', 'users/user_audit.aspx', '99', '0', '', 'Show,View,Audit', '0');
INSERT INTO `dt_navigation` VALUES ('45', '43', '0', 'System', 'user_list', '所有会员', '', '', 'users/user_list.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('46', '43', '0', 'System', 'user_group', '会员组别', '', '', 'users/group_list.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('47', '3', '0', 'System', 'user_log', '会员日志', '', '', '', '100', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('48', '47', '0', 'System', 'user_sms', '发送短信', '', '', 'users/user_sms.aspx', '1', '0', '', 'Show,View,Add', '0');
INSERT INTO `dt_navigation` VALUES ('49', '47', '0', 'System', 'user_message', '站内消息', '', '', 'users/message_list.aspx', '3', '0', '', 'Show,View,Add,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('50', '47', '0', 'System', 'user_recharge_log', '充值记录', '', '', 'users/recharge_list.aspx', '4', '0', '', 'Show,View,Add,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('51', '47', '0', 'System', 'user_amount_log', '消费记录', '', '', 'users/amount_log.aspx', '5', '0', '', 'Show,View,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('52', '47', '0', 'System', 'user_point_log', '积分记录', '', '', 'users/point_log.aspx', '6', '0', '', 'Show,View,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('53', '3', '0', 'System', 'user_settings', '会员设置', '', '', '', '101', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('54', '53', '0', 'System', 'user_config', '参数设置', '', '', 'users/user_config.aspx', '99', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('55', '53', '0', 'System', 'user_sms_template', '短信模板', '', '', 'users/sms_template_list.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('56', '53', '0', 'System', 'user_mail_template', '邮件模板', '', '', 'users/mail_template_list.aspx', '102', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('57', '53', '0', 'System', 'user_oauth', 'OAuth设置', '', '', 'users/oauth_app_list.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('58', '2', '0', 'System', 'sys_weixin_message', '微信管理', '', '', '', '100', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('59', '15', '0', 'System', 'sys_article_tags', 'Tags标签', '', '', 'channel/tags_list.aspx', '103', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('82', '58', '0', 'System', 'weixin_base_settings', '基本设置', '', '', '', '99', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('83', '82', '0', 'System', 'weixin_account_manage', '公众平台管理', '', '', 'weixin/account_edit.aspx', '99', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('84', '82', '0', 'System', 'weixin_custom_menu', '自定义菜单', '', '', 'weixin/menu_edit.aspx', '100', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('85', '58', '0', 'System', 'weixin_message_manage', '消息管理', '', '', '', '100', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('86', '85', '0', 'System', 'weixin_subscribe_subscribe', '关注回复', '', '', 'weixin/subscribe_edit.aspx?action=subscribe', '99', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('87', '85', '0', 'System', 'weixin_subscribe_default', '默认回复', '', '', 'weixin/subscribe_edit.aspx?action=default', '100', '0', '', 'Show,View,Edit', '0');
INSERT INTO `dt_navigation` VALUES ('88', '85', '0', 'System', 'weixin_response_text', '文本回复', '', '', 'weixin/text_list.aspx', '101', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('89', '85', '0', 'System', 'weixin_response_picture', '图文回复', '', '', 'weixin/picture_list.aspx', '102', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('90', '85', '0', 'System', 'weixin_response_sound', '语音回复', '', '', 'weixin/sound_list.aspx', '103', '0', '', 'Show,View,Add,Edit,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('91', '85', '0', 'System', 'weixin_response_content', '消息记录', '', '', 'weixin/response_list.aspx', '104', '0', '', 'Show,View,Delete', '0');
INSERT INTO `dt_navigation` VALUES ('249', '307', '0', 'System', 'system_cache', '缓存管理', '', '', 'settings/sys_cache.aspx', '5', '0', '', 'Show,View,DelAll', '0');
INSERT INTO `dt_navigation` VALUES ('250', '47', '0', 'System', 'user_email', '发送邮件', '', '', 'users/user_email.aspx', '2', '0', '', 'Show,View,Add', '0');
INSERT INTO `dt_navigation` VALUES ('306', '307', '0', 'System', 'lucene_index', '索引文件', '', '', 'lucene/builder_index.aspx', '4', '0', '', 'Show,View,Edit,Build', '0');
INSERT INTO `dt_navigation` VALUES ('307', '4', '0', 'System', 'sys_optimize', '系统优化', '', '', '', '99', '0', '', 'Show', '0');
INSERT INTO `dt_navigation` VALUES ('308', '307', '0', 'System', 'lucene_pangu', '盘古词库', '', '', 'lucene/pangu.aspx', '3', '0', '', 'Show,View,Add,Edit,Delete,DelAll', '0');
INSERT INTO `dt_navigation` VALUES ('309', '0', '0', 'System', 'sys_agent', '代理', '代理', '', '', '0', '0', '', 'Show', '0');
