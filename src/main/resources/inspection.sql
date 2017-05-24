/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : inspection

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2017-05-24 13:53:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aa
-- ----------------------------
DROP TABLE IF EXISTS `aa`;
CREATE TABLE `aa` (
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aa
-- ----------------------------
INSERT INTO `aa` VALUES ('广汽乘用车项目');
INSERT INTO `aa` VALUES ('广汽研究院项目');
INSERT INTO `aa` VALUES ('广汽菲克广州分厂项目');
INSERT INTO `aa` VALUES ('鞍钢广州项目');
INSERT INTO `aa` VALUES ('清华科技园广州创新基地');
INSERT INTO `aa` VALUES ('广州江森汽车内饰系统有限公司化龙工厂建设工程');
INSERT INTO `aa` VALUES ('申雅密封件（广州）有限公司迁、扩、建项目');
INSERT INTO `aa` VALUES ('广州广汽优利得汽车内饰系统研发有限公司');
INSERT INTO `aa` VALUES ('延锋汽车饰件系统广州有限公司');
INSERT INTO `aa` VALUES ('广汽商贸钢材加工中心\n');
INSERT INTO `aa` VALUES ('广州广汽商贸再生资源有限公司');
INSERT INTO `aa` VALUES ('广州君国汽车配件有限公司');
INSERT INTO `aa` VALUES ('广州广汽商贸物流有限公司\n');
INSERT INTO `aa` VALUES ('广州华益盛模塑有限公司');
INSERT INTO `aa` VALUES ('广州精乐汽车部件有限公司');
INSERT INTO `aa` VALUES ('广州市巨志汽车零部件有限公司（一期）');
INSERT INTO `aa` VALUES ('广州骏高模具科技有限公司');
INSERT INTO `aa` VALUES ('广州广汽荻原模具冲压有限公司');
INSERT INTO `aa` VALUES ('广州广汽荻原模具冲压有限公司');
INSERT INTO `aa` VALUES ('广州广汽商贸再生资源有限公司（报废机动车回收拆解项目）');
INSERT INTO `aa` VALUES ('广州中鼎汽车零部件有限公司');
INSERT INTO `aa` VALUES ('广东国利汽车部件有限公司');
INSERT INTO `aa` VALUES ('广州市巨志汽车零部件有限公司（二期）');
INSERT INTO `aa` VALUES ('广州宇龙汽车零部件有限公司');
INSERT INTO `aa` VALUES ('广汽商贸钢材加工中心（二期）');
INSERT INTO `aa` VALUES ('区政府');
INSERT INTO `aa` VALUES ('番禺现代产业基地建设指挥部');
INSERT INTO `aa` VALUES ('区住房和建设局');
INSERT INTO `aa` VALUES ('区交通局');
INSERT INTO `aa` VALUES ('区水务局');
INSERT INTO `aa` VALUES ('区发展改革局');
INSERT INTO `aa` VALUES ('区财政局');
INSERT INTO `aa` VALUES ('区科技工业商务和信息化局');
INSERT INTO `aa` VALUES ('区人力资源和社会保障局');
INSERT INTO `aa` VALUES ('区环保局');
INSERT INTO `aa` VALUES ('区住建局');
INSERT INTO `aa` VALUES ('区城管综合执法分局');
INSERT INTO `aa` VALUES ('区招商办');
INSERT INTO `aa` VALUES ('番禺信息技术投资发展有限公司');
INSERT INTO `aa` VALUES ('区城市管理局');
INSERT INTO `aa` VALUES ('番禺公安分局');
INSERT INTO `aa` VALUES ('区国土资源和规划局');
INSERT INTO `aa` VALUES ('区地方公路管理总站');
INSERT INTO `aa` VALUES ('区基建办');
INSERT INTO `aa` VALUES ('区土地开发中心');
INSERT INTO `aa` VALUES ('番禺公安交警大队');
INSERT INTO `aa` VALUES ('区防汛抢险专业队');
INSERT INTO `aa` VALUES ('化龙镇');
INSERT INTO `aa` VALUES ('石楼镇');
INSERT INTO `aa` VALUES ('番禺水务公司');
INSERT INTO `aa` VALUES ('番禺交投公司');
INSERT INTO `aa` VALUES ('莲花山保税区公司');
INSERT INTO `aa` VALUES ('番禺建管公司');
INSERT INTO `aa` VALUES ('区河涌管理所');
INSERT INTO `aa` VALUES ('广州汽车集团股份有限公司');
INSERT INTO `aa` VALUES ('广州汽车集团股份有限公司汽车工程研究院');
INSERT INTO `aa` VALUES ('广州汽车集团乘用车有限公司');
INSERT INTO `aa` VALUES ('广汽菲亚特克莱斯勒汽车有限公司广州分公司');
INSERT INTO `aa` VALUES ('鞍钢广州汽车钢有限公司');
INSERT INTO `aa` VALUES ('广州市番禺创新科技园有限公司');
INSERT INTO `aa` VALUES ('广州汽车集团商贸有限公司');
INSERT INTO `aa` VALUES ('广州广汽商贸物流有限公司');
INSERT INTO `aa` VALUES ('广州广汽商贸再生资源有限公司');
INSERT INTO `aa` VALUES ('广州广汽宝商钢材加工有限公司');
INSERT INTO `aa` VALUES ('广州江森汽车内饰系统有限公司');
INSERT INTO `aa` VALUES ('申雅密封件广州有限公司');
INSERT INTO `aa` VALUES ('广州广汽优利得汽车内饰系统研发有限公司');
INSERT INTO `aa` VALUES ('广州广汽荻原模具冲压有限公司');
INSERT INTO `aa` VALUES ('延锋汽车饰件系统广州有限公司');
INSERT INTO `aa` VALUES ('广州君国汽车配件有限公司');
INSERT INTO `aa` VALUES ('广州华益盛模塑有限公司');
INSERT INTO `aa` VALUES ('广州精乐汽车部件有限公司');
INSERT INTO `aa` VALUES ('广州市巨志汽车零部件有限公司');
INSERT INTO `aa` VALUES ('广州骏高模具科技有限公司');
INSERT INTO `aa` VALUES ('广州中鼎汽车零部件有限公司');
INSERT INTO `aa` VALUES ('广东国利汽车部件有限公司');
INSERT INTO `aa` VALUES ('广州宇龙汽车零部件有限公司');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` varchar(36) NOT NULL,
  `problem_id` varchar(36) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_comment_id` varchar(36) DEFAULT NULL,
  `head_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_Reference_6` (`problem_id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_num` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  ` website` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `company_type` int(255) DEFAULT NULL,
  `legal_person` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `contact_person` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `industry` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_use` int(11) DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `latest_update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  CONSTRAINT `foreign_key` FOREIGN KEY (`com_id`) REFERENCES `system_users` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for demo_export
-- ----------------------------
DROP TABLE IF EXISTS `demo_export`;
CREATE TABLE `demo_export` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo_export
-- ----------------------------
INSERT INTO `demo_export` VALUES ('1', 'side1.png', 'Front Side', '1', '2017-04-19 11:29:08');
INSERT INTO `demo_export` VALUES ('2', 'side2.png', 'Back Side', '1', '2017-04-19 11:29:13');
INSERT INTO `demo_export` VALUES ('3', 'side3.png', 'Main Label', '1', '2017-04-19 11:29:15');
INSERT INTO `demo_export` VALUES ('4', 'side4.png', 'Master Carton packaging', '1', '2017-04-19 11:29:18');
INSERT INTO `demo_export` VALUES ('5', 'side5.png', 'Shank Button', '1', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('6', 'side6.png', 'Stickers Can Be Readable', '1', '2017-04-19 11:29:22');
INSERT INTO `demo_export` VALUES ('7', 'side2.png', 'Back Side', '1', '2017-04-19 11:29:24');
INSERT INTO `demo_export` VALUES ('8', 'side3.png', 'Main Label', '2', '2017-04-19 11:29:26');
INSERT INTO `demo_export` VALUES ('9', 'side2.png', 'Back Side', '2', '2017-04-19 11:29:28');
INSERT INTO `demo_export` VALUES ('10', 'side1.png', 'Front Side', '2', '2017-04-19 11:29:30');
INSERT INTO `demo_export` VALUES ('11', 'side2.png', 'Back Side', '2', '2017-04-19 11:29:33');
INSERT INTO `demo_export` VALUES ('12', 'side3.png', 'Main Label', '2', '2017-04-19 11:29:35');
INSERT INTO `demo_export` VALUES ('13', 'side5.png', 'Shank Button', '2', '2017-04-19 11:29:39');
INSERT INTO `demo_export` VALUES ('14', '1.jpg', 'Facility name', '3', '2017-04-19 11:29:08');
INSERT INTO `demo_export` VALUES ('15', '2.jpg', 'Facility entrance', '3', '2017-04-19 11:29:13');
INSERT INTO `demo_export` VALUES ('16', '3.jpg', 'Production building', '3', '2017-04-19 11:29:15');
INSERT INTO `demo_export` VALUES ('17', '4.jpg', 'Domitory building', '3', '2017-04-19 11:29:18');
INSERT INTO `demo_export` VALUES ('18', '5.png', 'Rewiding workshop', '3', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('19', '6.jpg', 'Knitting workshop', '3', '2017-04-19 11:29:22');
INSERT INTO `demo_export` VALUES ('20', '7.png', 'Pressing workshop', '3', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('21', '8.png', 'Packing workshop', '3', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('22', '9.png', 'Material warehouse', '3', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('23', '10.png', 'Finished goods warehouse', '3', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('24', 'n-1.jpg', 'One ladder (1.2 meters height) without handrail was used for adding fuel in the boiler room.', '4', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('25', 'n-2.png', 'Fire exitinguishers', '4', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('26', 'c-1.png', '', '5', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('27', 'c-2.png', '', '5', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('28', 'c-3.png', '', '5', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('29', 'c-4.png', '', '5', '2017-04-19 11:29:20');
INSERT INTO `demo_export` VALUES ('30', 'c-5.png', '', '5', '2017-04-19 11:29:20');

-- ----------------------------
-- Table structure for depamanage
-- ----------------------------
DROP TABLE IF EXISTS `depamanage`;
CREATE TABLE `depamanage` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `department_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `latest_update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `latest_update_time` timestamp NULL DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `represent` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `is_use` int(11) DEFAULT NULL,
  `levels` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of depamanage
-- ----------------------------
INSERT INTO `depamanage` VALUES ('1', '0', '广州市番禺现代产业基地建设指挥部', 'admin', '2016-07-11 18:01:57', 'admin', '2016-07-27 11:22:09', '1', 'adsadasd', '1', '1');
INSERT INTO `depamanage` VALUES ('2', '1', '区领导', 'admin', '2016-07-20 10:55:35', 'admin', '2016-07-27 11:22:09', '1', '1asdasd', '1', '2');
INSERT INTO `depamanage` VALUES ('3', '1', '指挥部领导', 'admin', '2016-07-20 10:56:25', 'admin', '2016-07-27 11:22:09', '1', '1sdas', '1', '2');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dept_id` varchar(36) NOT NULL,
  `dept_code` varchar(20) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `parent_dept_id` varchar(36) DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT NULL COMMENT '0:否\n            1:是',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for invest
-- ----------------------------
DROP TABLE IF EXISTS `invest`;
CREATE TABLE `invest` (
  `invest_id` varchar(36) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `years` date DEFAULT NULL,
  `month_gross` decimal(16,2) NOT NULL,
  `month_product_value` decimal(16,2) DEFAULT NULL,
  `month_revenue` decimal(16,2) DEFAULT '0.00',
  `month_product_amounr` varchar(64) DEFAULT NULL,
  `month_sale_amount` varchar(64) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0：否\n            1：是',
  PRIMARY KEY (`invest_id`),
  KEY `IDX_TYPE_ID` (`invest_id`),
  KEY `IDX_TYPE_CODE` (`project_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invest
-- ----------------------------

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `member_id` varchar(36) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `station_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `IDX_TYPE_ID` (`member_id`),
  KEY `IDX_TYPE_CODE` (`project_id`),
  KEY `FK_Reference_17` (`station_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `permission_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名称',
  `permission_type` int(255) DEFAULT NULL COMMENT '权限类型',
  `parent_id` int(11) DEFAULT NULL,
  `permission_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permission_level` int(255) DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `latest_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'System Management', '1', '0', 'systemManagement', '1', '/loginout', '系统管理', '2017-04-16 23:08:42', '2016-07-27 09:50:12');
INSERT INTO `permission` VALUES ('2', '部门管理', '1', '0', 'departmentManagement', '2', '/department_management', '部门管理', '2016-08-09 11:29:44', '2016-07-15 10:04:05');
INSERT INTO `permission` VALUES ('3', 'User Management', '3', '1', 'userManagement', '2', '/account_info_management', '用户管理', '2017-04-16 23:08:24', '2016-07-15 10:06:18');
INSERT INTO `permission` VALUES ('4', '项目管理', '1', '0', 'projectManagement', '1', '/loginout', '项目管理', '2016-08-09 11:29:24', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('5', '项目信息', '1', '4', 'projectInfoManagement', '2', '/project_info_management', '项目信息', '2016-07-31 16:19:43', '2016-07-15 10:04:05');
INSERT INTO `permission` VALUES ('6', '项目类型', '3', '4', 'projectTypeManagement', '2', '/project_type_management', '项目类型', '2016-07-31 16:19:44', '2016-07-15 10:06:18');
INSERT INTO `permission` VALUES ('7', '项目单位管理', '3', '1', 'projectUnitManagement', '2', '/project_unit_management', '项目单位管理', '2016-08-18 09:19:29', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('8', '项目信息查询', '3', '4', 'projectInfoShow', '2', '/project_info_show', '项目信息查询', '2016-08-18 09:19:40', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('9', 'Inspection', '1', '0', 'OrderManagement', '1', '/loginout', 'Inspetion', '2017-04-17 01:34:33', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('10', 'Order List', '3', '9', 'ReportManagement', '2', '/export', 'Order List', '2017-05-23 15:11:17', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('11', 'Task Management', '3', '9', 'ReportManagement', '2', '/task', 'Task Management', '2017-05-23 15:11:21', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('12', 'Factory Audit', '1', '0', 'OrderManagement', '1', '/loginout', 'Factory Audit', '2017-04-17 01:34:38', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('13', 'Factory List', '3', '12', 'ReportManagement', '2', '/export_factory_list', 'Order List', '2017-05-23 15:11:45', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('14', 'Monitor', '1', '0', 'ReportMapManagement', '1', '/loginout', 'Order Map', '2017-04-17 00:45:59', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('15', 'Location Monitor', '3', '14', 'ReportMapManagement', '2', '/export_factory_map', 'Monitor', '2017-05-24 13:50:19', '2016-07-15 09:50:12');
INSERT INTO `permission` VALUES ('16', 'Location Track', '3', '14', 'ReportMapManagement', '2', '/export_factory_map2', 'Monitor', '2017-05-24 13:49:44', '2016-07-15 09:50:12');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `problem_id` varchar(36) NOT NULL,
  `task_id` varchar(36) DEFAULT '',
  `title` varchar(100) NOT NULL,
  `describes` varchar(500) DEFAULT NULL,
  `involved_dept` varchar(100) DEFAULT NULL,
  `solution` varchar(500) DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0' COMMENT '0：未解决\n            1：已解决',
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0:否\n            1:是',
  `project_id` varchar(36) DEFAULT NULL,
  `head_img` varchar(200) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `update_person` varchar(60) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`problem_id`),
  KEY `FK_Reference_3` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('02f4b0c322e14e7fb6fb665ff0c45b50', '', 'F地块788亩收地进度滞后', '根据会议纪要要求石楼镇在10月15日前完成F地块788亩收地。但现阶段还需待测量队进行测量确定后，再进场围蔽收地。', '土地开发中心、石楼镇', '', '1', '陆婉玲', '2016-10-19 09:52:14', '0', '7652e2cdf8784ee793b3827d2edc1de9', null, '83794fe9dc3b4cf7aa5367eb5666039d', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-11-01 10:42:35');
INSERT INTO `problem` VALUES ('1d6c6bba10a14a52a87e6bc6fa5431ce', '', 'D3地块填土滞后', '因地块内涉及青苗、鱼塘未迁移，目前填土已停工。', '莲花山保税区公司、化龙镇', '', '1', '管理员', '2016-10-20 10:58:38', '0', 'bcc7a58078844119a484de1f1e4c5733', '/upload/sysUser/1.jpg', '1', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-11 16:44:20');
INSERT INTO `problem` VALUES ('2561181696504de99978893b18a27d97', '', 'G2地块1、2号路接驳工程一直受到当地村民阻挠', '位于G2地块内1、2号路接驳位工程由于施工路段内（二期地块）征地差价未补偿，施工一直受到村民断断续续的阻挠，现已停工长达5个月，严重影响G2地块内零部件项目的用水用电需求。', '区土地开发中心、区基建办', '建议区土地开发中心尽快将相关土地款项落实到村。\r\n据了解，区土发中心已将工程涉及的征地协议交复甦村，有关征地款项已完成审批，2017年1月18日已将征地款拨付给化龙镇，待化龙镇拨付给复甦村。', '1', '郑卓权', '2016-10-08 10:15:12', '0', '7954c8746dc449829fab51d9e40d6f4f', null, '8aedb1d213fa447eaa07c3768e60b299', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:47:43');
INSERT INTO `problem` VALUES ('2664a473b79f4040aa93a0a83679fd67', '', 'F地块788亩收地情况', '土发中心于10月31日已对F地块788亩用地完成围蔽工作，但因征地款项未到位，石楼镇暂缓收地工作。', '区财政局、区土地开发中心、石楼镇', '', '1', '陆婉玲', '2016-11-09 15:02:21', '0', '7652e2cdf8784ee793b3827d2edc1de9', null, '83794fe9dc3b4cf7aa5367eb5666039d', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-11-09 15:02:21');
INSERT INTO `problem` VALUES ('711238e55a684fa484f83600d2f27011', '', '110千伏广汽输变电电力管沟项目工期滞后', '按原计划要求项目工程在10月30前完成，但因设计方案更改等问题影响工程进度，9月底才进行围蔽，10月初开始进场施工。根据番禺通信管道公司目前的施工计划，工期需180天，远远不能满足220千伏化龙站年底向广汽供电的需求。', '番禺通信管道建设投资有限公司', '请张文在每周一报反映有关问题。请婉玲联系番禺通信管道公司收集问题，整理后向陈区报告。', '1', '陆婉玲', '2016-10-17 15:56:37', '1', 'ab019c862c2e49189bf6bb23811720d7', null, '83794fe9dc3b4cf7aa5367eb5666039d', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-10-17 15:56:37');
INSERT INTO `problem` VALUES ('a80acb0193c44d7cbe234555393ce727', '', 'F地块收地问题', '区土地开发中心向区财政申请首期补偿款5700万元，区财政局已向中心拨付5003万元。该拨付款项中已有3000万元支付给胜洲村，胜洲村表示需完成全部首期补偿款支付后再行收地。', '区土发中心、化龙镇', '', '1', '张文', '2016-12-14 15:02:07', '0', '7652e2cdf8784ee793b3827d2edc1de9', '/upload/sysUser/39a43d8647c947e4b06b440e3e84aafe.jpg', '39a43d8647c947e4b06b440e3e84aafe', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-11 16:43:38');
INSERT INTO `problem` VALUES ('b49dc8843e02447496e94db0984fa497', '', 'C地块填土、压实工作', '因天气及地质原因，莲花山公司压实效果与广汽乘用车公司预期要求暂无法一致。', '区土发中心、莲花山公司及广汽乘用车', '待16吨压路机进行压实后，再行讨论压实方案。', '1', '陈威', '2016-08-31 16:07:12', '0', '0e1e9c0810894433bc5dc4731dfb6236', null, 'b4bf67c3f035421188c2d7bc590e5fc6', 'f9d735eeeee84930b5223862b87cc75b', '2016-10-09 15:28:31');
INSERT INTO `problem` VALUES ('ebacdd7fc2d34c2c9921bc7c4327d94e', '', '复苏安置区（一期）项目征地问题', '项目目前已完成设计招标，并开始相应设计及钻探前期准备工作，因征地价差的补偿工作未完成，导致收地工作严重滞后，时间上不能满足复甦村村民的安置需求。', '化龙镇、区土地开发中心', '提请化龙镇加紧与区土地开发中心及村开展征地价差的补偿工作。', '1', '管理员', '2016-10-20 10:48:38', '1', '1de2549613d94195b8b68ad57112d1eb', '/upload/sysUser/1.jpg', '1', '1', '2016-10-20 10:48:38');
INSERT INTO `problem` VALUES ('f384566101f94d3ab30a0238fd65da4b', '', 'F地块奠基仪式周边环境整治问题', '狄原项目、骏高项目、3.5号路项目周边环境待整治', '狄原项目、骏高项目', '', '1', '张文', '2017-03-30 17:05:02', '1', '7652e2cdf8784ee793b3827d2edc1de9', '/upload/sysUser/39a43d8647c947e4b06b440e3e84aafe.jpg', '39a43d8647c947e4b06b440e3e84aafe', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:05:02');

-- ----------------------------
-- Table structure for problem_annex
-- ----------------------------
DROP TABLE IF EXISTS `problem_annex`;
CREATE TABLE `problem_annex` (
  `problem_annex_id` varchar(36) NOT NULL,
  `problem_id` varchar(36) NOT NULL,
  `problem_annex_name` varchar(64) DEFAULT NULL,
  `problem_annex_type` tinyint(4) DEFAULT NULL COMMENT '0：图片\n            1：视频\n            2：文件\n            3：语音',
  `problem_annex_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`problem_annex_id`),
  KEY `FK_Reference_4` (`problem_id`),
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`problem_id`) REFERENCES `problem` (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_annex
-- ----------------------------
INSERT INTO `problem_annex` VALUES ('31e6d91228094736a28fa9a4fa5c7a08', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/31e6d91228094736a28fa9a4fa5c7a08.jpg');
INSERT INTO `problem_annex` VALUES ('4b803b966f8a493197b6004fc37c2fdc', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/4b803b966f8a493197b6004fc37c2fdc.jpg');
INSERT INTO `problem_annex` VALUES ('5239cd9ba3834be2b41ab22122012eec', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/5239cd9ba3834be2b41ab22122012eec.jpg');
INSERT INTO `problem_annex` VALUES ('89ae4e0462a4429c818740ee6eee3817', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/89ae4e0462a4429c818740ee6eee3817.jpg');
INSERT INTO `problem_annex` VALUES ('aba03b6fea824cee8e55c9ad261f5010', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/aba03b6fea824cee8e55c9ad261f5010.jpg');
INSERT INTO `problem_annex` VALUES ('e8863b3a40fb4b35bf4c851a69bc2b59', 'f384566101f94d3ab30a0238fd65da4b', 'pingguo.jpg', '1', '/upload/7652e2cdf8784ee793b3827d2edc1de9/problem/e8863b3a40fb4b35bf4c851a69bc2b59.jpg');

-- ----------------------------
-- Table structure for progress
-- ----------------------------
DROP TABLE IF EXISTS `progress`;
CREATE TABLE `progress` (
  `progress_id` varchar(36) NOT NULL,
  `task_id` varchar(36) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `progress` decimal(6,2) DEFAULT NULL,
  `actual_begin_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `describes` varchar(500) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `modify_person` varchar(60) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `plan_begin_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  PRIMARY KEY (`progress_id`),
  KEY `FK_Reference_14` (`task_id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`task_id`) REFERENCES `task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of progress
-- ----------------------------
INSERT INTO `progress` VALUES ('022f13dbdb3b48f88150f58a0110f037', null, '2', '26.00', '2015-01-01', null, '电力隧道1号工作井、接收井全部完成 ；双排电缆沟完成57%。总工程进度为26%。', 'ab019c862c2e49189bf6bb23811720d7', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:40:22', '2015-01-01', '2016-10-30');
INSERT INTO `progress` VALUES ('02ef8294f10c47e08062d260a5cefc69', null, '3', '0.00', '2016-08-01', '2017-12-29', '已于9月28日完成招标工作，10月13日进场放线，预计施工单位10月20日进场施工。', '20f75384690348d18687acd7759d3043', '1', '2016-10-17 15:47:46', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('04233c78df4145a1bea082e5f68ab231', null, '2', '0.00', null, null, '目前已完成设计招标，并开始相应设计及钻探前期准备工作。目前区土发中心正完善征地补偿的结算材料。', '1de2549613d94195b8b68ad57112d1eb', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:39:48', null, null);
INSERT INTO `progress` VALUES ('04454b727d36409a9d20c220ad360ffb', null, '3', '95.00', null, null, 'D地块村民出行道路：目前施工队正进行道路路基的压实工作，该项目预计10月下旬完成。', 'b27937394a5f4d8abe0f2642a6fbfaaa', '1', '2016-10-17 15:44:02', null, null);
INSERT INTO `progress` VALUES ('0551e9ada6b5423c8a90e96e005fd979', null, '3', '62.00', '2010-08-11', null, '项目一期已完成，二期正进行前期报建工作。', '434a9f9576f04838a650dd3599572314', '1', '2016-10-17 15:27:05', '2010-08-09', '2017-08-31');
INSERT INTO `progress` VALUES ('0884a1c2128e4521986025b0e798e9eb', null, '3', '58.00', '2015-08-01', '2016-12-30', '西半幅水泥路面已完工，可供通行。目前正进行排水管建设。', '67e65a9c4d914cf9954593f23b3ab1be', '1', '2016-10-17 15:35:32', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('09342237f03942a48decfa367405200c', null, '3', '12.00', null, null, '', 'eb65bd333d1a4fd39b23933b70c4d887', 'b68eb29a93304c059c8bfda78e1dfc4e', '2016-08-24 18:59:23', null, null);
INSERT INTO `progress` VALUES ('0bda09d922784d08985b462f124b0b09', null, '3', '85.00', '2016-03-01', null, 'D地块排水管已于7月底完工。\r\n B、D地块之间规划道路排水管工程目前已完成排水沟的开挖，目前正在下埋排水管。总工程进度完成85%，计划11月中旬前完成。', 'e4abc220a528433b90c774e603b4336b', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:09:20', '2016-03-01', '2016-10-15');
INSERT INTO `progress` VALUES ('0f91d16181e54be9a418a87bbd74bf7f', null, '2', '0.00', null, null, '完成进度为35% ；区基建办于4月22日进场施工之时被村民阻扰。现在处于停工状态。', '7954c8746dc449829fab51d9e40d6f4f', '1', '2016-08-31 11:12:55', null, null);
INSERT INTO `progress` VALUES ('10411c5aab3c4cd298a72569da0ef943', null, '3', '98.00', '2016-05-09', '2016-12-30', '目前施工队已完成道路路基的压实工作，近期将进行水泥路面的铺设。预计11月中旬完成全部工作。', '919d9c7ce730415ca19f61d6b1f02b2e', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:03:12', '2016-03-01', '2016-08-31');
INSERT INTO `progress` VALUES ('15a965926b3d448ea1ce2730c0c7bd3f', null, '3', '90.00', '2015-01-01', '2016-12-30', '已完成主控楼及220千伏变电站的主体结构建设。', '4e73fe85d5a54dc58baed78e39a01726', '1', '2016-08-31 11:28:29', '2015-01-01', '2016-12-30');
INSERT INTO `progress` VALUES ('18fc4b447edb4576b7803d28aea14c8d', null, '3', '15.00', null, null, '目前进行打桩工作，工程进度为15%；报建工作同步推进。', '52f7f9605f714a8793b53995543af4af', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:44:24', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('191f39680aef4adc80b34857bb9d7269', null, '3', '100.00', '2015-08-03', '2016-07-18', '已完成全部工程。', 'c1cb80e53fa445e29fb8c7c11b38b272', '1', '2016-11-16 10:20:42', '2015-08-03', '2016-06-30');
INSERT INTO `progress` VALUES ('1aae0fa0ac704a5398969c9988ff1cf7', null, '3', '80.00', '2015-08-03', '2016-09-30', '其中五涌桥至C地块段830米已完成所有桩基及填土工作；东复路与塘复路并行段工程正在进行道路下方的行人涵洞施工。该段路段预计11月中旬完成。', '31b2058c44384ef1945bc4313a3ae37e', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:06:51', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('1addffc79d9d42eab6f93957325b5d51', null, '3', '100.00', '2015-06-01', '2016-03-01', '', '6c572c6a2e0e4931adef8e623e5bf5af', '1', '2016-08-30 12:17:29', '2015-06-01', '2016-03-02');
INSERT INTO `progress` VALUES ('1bba10bb8ec94a26a034dacd30722011', null, '3', '90.00', null, null, '正常推进', '556a0e23a3d94ea49408722a835e189e', '1', '2016-11-16 10:21:18', '2015-09-01', '2016-12-01');
INSERT INTO `progress` VALUES ('1c65539bebcc4e859291f913b7b1c05b', null, '3', '1.00', null, null, '已进场施工。', '8f329e46aee74f509ecf49548e6a079a', '1', '2016-11-07 16:35:37', null, null);
INSERT INTO `progress` VALUES ('1d0898e9afe44ce68a92f45117dab2c8', null, '2', '20.00', '2016-09-15', '2016-10-15', '收地：区土发中心计划10月24日进场围蔽 ，按照“围蔽、收地同步”的方式，预计11月20日完成收地。 \r\n用地报批：区土发中心已开展报批手续，目前正进行勘界测定。\r\n控规修改：区国规局准备将申请立项的资料报区政府审批。', '7652e2cdf8784ee793b3827d2edc1de9', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-26 11:24:46', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('1f5c74a92ee542abab924bcc566b3a2c', null, '3', '85.00', null, null, '正常推进', '556a0e23a3d94ea49408722a835e189e', '1', '2016-11-07 16:26:46', '2015-09-01', '2016-12-01');
INSERT INTO `progress` VALUES ('236681debb884bd28f8c5c66536df886', null, '2', '9.00', '2015-01-01', null, '对金山大道延长线进行软基处理。', 'ab019c862c2e49189bf6bb23811720d7', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 11:58:36', '2015-01-01', '2016-10-30');
INSERT INTO `progress` VALUES ('25e1640f610447a4935d7ef3cb7f4c1b', null, '3', '41.00', '2009-01-01', '2020-12-31', '15#、16#、17#的地下室已完成，15#已建成2层，16#已建成14层，17#已建成12层，已完成工程总量的41.5%；\r\n18# ：准备施工图送审。', 'e468523dea6f451d8d2d4e2befecb639', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:08:37', '2009-01-01', '2020-12-31');
INSERT INTO `progress` VALUES ('26173541e44047b7bbfd6a3516ca5fd1', null, '3', '16.00', null, null, '厂房建设', '7fecf07b02e74dd8bb0651f46eb7e677', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:52:22', null, null);
INSERT INTO `progress` VALUES ('264909206588489c9662456ecb82056f', null, '3', '98.00', null, null, '南北向路段（1000米）：已铺设水泥路面，且该路段已与复甦村内道路接通。\r\n       东西向路段（600米）：已铺设水泥路面，目前正在开展道路北面50米排水沟建设。', '256ffe9af1c146859535b04f61a57db4', '1', '2016-10-17 15:32:51', null, null);
INSERT INTO `progress` VALUES ('2862c39b47354a9a973145719120fe90', null, '2', '7.00', '2015-01-01', null, '目前正对金山大道延长线进行软基处理。', 'ab019c862c2e49189bf6bb23811720d7', '1', '2016-11-16 10:12:59', '2015-01-01', '2016-10-30');
INSERT INTO `progress` VALUES ('31cd898a83b94d6db440a6e4ff3dabee', null, '2', '21.00', '2016-09-15', '2016-10-31', 'F地块788亩用地已完成围蔽，但征地款项还在财局审批中，涉及金额约6千万。由于款项未发放给村民，石楼镇暂缓收地工作。', '7652e2cdf8784ee793b3827d2edc1de9', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-11-09 15:05:42', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('3324adbd36d6416bba41297b0f590219', null, '3', '90.00', null, null, '市土委会会议纪要已于7月22日出具，待市政府批复。', '3740ce50d6f54345aa8fd505040db1b4', '1', '2016-08-31 11:20:13', null, null);
INSERT INTO `progress` VALUES ('3399cb60d14140369e5fc066f1d19aa2', null, '3', '60.00', '2009-01-01', '2020-12-31', '15#-17#：16#楼内墙批荡至22层，17#楼内墙批荡至28层，已完成工程总量的60%；\r\n18# ：施工图已送相关公司审查。', 'e468523dea6f451d8d2d4e2befecb639', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:51:18', '2009-01-01', '2020-12-31');
INSERT INTO `progress` VALUES ('33cf740a816b465baf15e885e3b2a9e3', null, '3', '100.00', '2015-07-01', '2016-03-01', '', '88d38fbb1d974373bf2358b7fbd27f36', '1', '2016-08-30 12:12:06', '2015-07-05', '2016-03-01');
INSERT INTO `progress` VALUES ('34bf6d72615141f6b4142deba7c4df41', null, '1', '35.00', '2015-08-01', null, '区土发中心已将工程涉及的征地协议交复甦村，有关征地款项已完成审批，2017年1月18日已将征地款拨付给化龙镇，待化龙镇拨付给复甦村。', '7954c8746dc449829fab51d9e40d6f4f', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:38:24', '2015-08-01', '2015-12-31');
INSERT INTO `progress` VALUES ('380be29b7f234f04b4222c0707717ce0', null, '2', '45.00', null, null, '', 'eb65bd333d1a4fd39b23933b70c4d887', 'b68eb29a93304c059c8bfda78e1dfc4e', '2016-08-24 21:13:15', null, null);
INSERT INTO `progress` VALUES ('38624d28d91b4238b7efc134c9bc130a', null, '3', '92.00', '2015-01-01', '2016-12-30', '已完成主控楼及220千伏变电站的主体结构建设。', '4e73fe85d5a54dc58baed78e39a01726', '1', '2016-10-17 15:36:22', '2015-01-01', '2016-12-30');
INSERT INTO `progress` VALUES ('3ad9b49c46454a4883e01868b87ed835', null, '3', '10.00', null, null, '区土地开发中心提供的推进情况：\r\n(1)该地块已完成用地结案，并取得发改、环保意见及规划条件，区土地开发中心现正组织地块的财政评审材料。\r\n(2)由于广汽集团提出B地块现行控规指标无法满足其建设要求，地块限高需由原25米调整为不高于50米.根据区政府工作会议要求，经与广汽公司协调，由区土地开发中心委托市城市设计所编制控规修正论证方案，由广汽集团内部设计单位自行编制相应的概念规划方案。5月12日区国规局该地块控规修正方案技术审查会并于5月23日将审查意见函复区土地开发中心，区土地开发中心按该意见修改完善该方案，6月30日，区规划局将该项目控规修正方案会办市国规委。8月31日，区土地开发中心于市政务中心窗口办理规划类业务案，立案总序号：20160000007778。9月28日，市国规委召开会议研究B地块控高调整事宜，拟将建筑限高调至40米（原规划方案调至60米），同时增加建筑密度。', '89b50174e8684f4fb142820a963586ed', '1', '2016-10-17 15:56:27', null, null);
INSERT INTO `progress` VALUES ('3aee741640ef44dfb87ae0217a3296bf', null, '3', '80.00', '2016-03-01', null, 'D地块排水管已于7月底完工。 B、D地块之间规划道路排水管工程目前已完成打桩并于10月14日完成桩基检测，计划11月中旬前完成。', 'e4abc220a528433b90c774e603b4336b', '1', '2016-10-17 15:53:37', '2016-03-01', '2016-10-15');
INSERT INTO `progress` VALUES ('3d31ce65a5ff471f9900e36a3c4c0ecf', null, '3', '100.00', '2015-09-01', '2016-10-25', '压实进度为75%。', '0e1e9c0810894433bc5dc4731dfb6236', '1', '2016-11-16 10:17:39', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('408504c1d281473bbebbdbaf64d185ee', null, '3', '0.00', null, null, '土地使用证书已经办理完成。已经向区规划局报建。', '18046c5f084e46a99654541c767e2f48', '1', '2016-10-17 16:04:04', null, null);
INSERT INTO `progress` VALUES ('42fba9939c984b95ae51de4dc9dc731c', null, '3', '1.00', null, null, '已于9月21日开标，预计10月19日进场放线，施工单位预计10月24日进场施工。', '52f7f9605f714a8793b53995543af4af', 'f9d735eeeee84930b5223862b87cc75b', '2016-10-20 10:13:22', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('43c1ba9371804031bfd3a995ad0918bf', null, '3', '90.00', null, null, '市土委会会议纪要已于7月22日出具，待市政府批复。', '3740ce50d6f54345aa8fd505040db1b4', '1', '2016-08-30 16:26:08', null, null);
INSERT INTO `progress` VALUES ('43c3baf83ed84a23ad245c4be39191b0', null, '3', '0.00', null, null, '一、已完成土地招拍挂工作，目前正处于土地交付确认阶段。\r\n二、正在进行修规申报工作。', '7fecf07b02e74dd8bb0651f46eb7e677', '1', '2016-10-17 15:58:24', null, null);
INSERT INTO `progress` VALUES ('4669545120984ccbb421e0da2fc90aa5', null, '3', '100.00', '2011-03-03', '2012-12-28', '', 'c31e960c4418442f8af4514f7dfad6e4', '1', '2016-08-30 10:07:04', '2011-03-03', '2012-12-12');
INSERT INTO `progress` VALUES ('4a0ba321bae8485f883bdb2cbc525dd1', null, '3', '100.00', '2015-09-01', '2016-10-25', '进行平整压实工作。', '0e1e9c0810894433bc5dc4731dfb6236', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:02:33', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('4bb39e0c052c47c8ab8b8ae9eb2bfba0', null, '3', '41.00', '2015-08-03', '2016-09-30', '其中五涌桥至C地块段830米已完成所有桩基检查，目前正进行填土工作，填土完成约80%；东复路与塘复路并行段工程已完成路基稳定层施工，因复甦村提出调整道路下方的行人涵洞位置，交投公司已修改涵洞设计方案并正在实施。受此影响该路段预计11月中旬完成。', '31b2058c44384ef1945bc4313a3ae37e', '1', '2016-10-17 15:33:42', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('4ead4651e98c45da9a3f98fed41a06e2', null, '3', '98.00', '2015-09-01', '2016-10-25', '10月10日计划完成第一区三个不合格区域的换填工作。', '0e1e9c0810894433bc5dc4731dfb6236', 'f9d735eeeee84930b5223862b87cc75b', '2016-10-10 10:20:52', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('4f932ccb872a40b1a5f13e10aaa0cfc5', null, '2', '85.00', '2015-08-03', '2016-09-30', '现工程进度为85%。其中五涌桥至C地块段830米已完成所有桩基及填土工作；东复路与塘复路并行段已完成道路下方的行人涵洞施工。因该项目存在卫星图斑问题目前工程已停工。', '31b2058c44384ef1945bc4313a3ae37e', '1', '2016-11-07 16:22:22', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('5115e764033b4a8b93476576cc54fe06', null, '2', '45.00', null, null, '测试', '05e607f06eab44f38f51d6d57bb13197', 'b68eb29a93304c059c8bfda78e1dfc4e', '2016-08-26 15:18:50', null, null);
INSERT INTO `progress` VALUES ('530b921bcd4243e9a07901c836557646', null, '3', '98.00', '2016-05-09', '2016-12-30', '目前施工队正进行道路路基的压实工作，该项目预计10月下旬完成。', '919d9c7ce730415ca19f61d6b1f02b2e', '1', '2016-10-17 15:46:13', '2016-03-01', '2016-08-31');
INSERT INTO `progress` VALUES ('566969794fa04eca88a6229eae75bd55', null, '3', '100.00', '2014-11-01', '2016-04-18', '', 'd07d8eb52eac4d1aabb3b4c4de2abad4', '1', '2016-08-30 12:00:51', '2014-11-01', '2016-04-18');
INSERT INTO `progress` VALUES ('57b3d654c06544bd86940a3a306de265', null, '3', '100.00', null, null, '已完成全部道路建设工作。', '256ffe9af1c146859535b04f61a57db4', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:06:05', null, null);
INSERT INTO `progress` VALUES ('580eea9c22c743d7bf9697ba1d3073fa', null, '3', '5.00', '2016-08-01', '2017-12-29', '已于11月1日进场施工，目前正进行路基回填工作。', '20f75384690348d18687acd7759d3043', '1', '2016-11-07 16:13:23', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('5aea20f2b0d1463aa9b5ceee162ed740', null, '3', '6.00', null, null, '正进行厂房建设。', '2ca9c4448b17495ab2ba113b462ae6bf', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:57:58', null, null);
INSERT INTO `progress` VALUES ('5f0f4580bb0e43d8add608adfbf49267', null, '3', '88.00', '2016-03-01', null, 'D地块排水管已于7月底完工。\r\n      B、D地块之间规划道路排水管工程已完成排水沟的开挖，目前正在下埋排水管。总工程进度完成88%，计划11月25日前完成。', 'e4abc220a528433b90c774e603b4336b', '1', '2016-11-16 10:23:05', '2016-03-01', '2016-10-15');
INSERT INTO `progress` VALUES ('625a372b07c74ce69727421d7fdd12d9', null, '3', '100.00', null, null, '已于7月15日挂牌。广汽乘用车公司于8月15日购得该地块。', 'dd40363edddb4b0899b169ca154bb2f1', '1', '2016-10-17 15:54:20', null, null);
INSERT INTO `progress` VALUES ('63c06831d6d04045b712c1e0486a1f16', null, '2', '20.00', '2016-09-15', '2016-10-15', '关于788亩收地情况，土地开发中心已发征地公告给耕户，石楼镇已初步与村委和耕户沟通，待测量队进行测量面积后再进行围蔽收地。', '7652e2cdf8784ee793b3827d2edc1de9', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-10-18 16:43:43', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('6444adb633c84667a5c53a5fc328aa11', null, '2', '96.00', '2015-08-03', '2016-09-30', '其中东复路与塘复路并行的530米段目前已完成水稳层道路铺设工作。因违法图斑问题，表层施工目前已暂停。', '31b2058c44384ef1945bc4313a3ae37e', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:41:01', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('6459bfb882d24a25be72fc49f1ecff4b', null, '3', '92.00', '2015-08-03', '2016-11-15', '930米路段：已完成7米宽基本路面，可供通行。\r\n300米路段：施工单位已进场准备桩基工程施工。', 'da265f1c9f674b0ca6d58e5e1b6d9945', '1', '2016-10-17 15:34:21', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('69ee894f64dd4e84bb05a1a2f3cf00cc', null, '3', '99.00', '2015-09-01', '2016-10-25', '已完成全部填土工作 ，压实工作完成50%.', '0e1e9c0810894433bc5dc4731dfb6236', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-26 11:27:23', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('6a7b3e318f2347b5852cbab7dbc0a8c5', null, '3', '2.00', null, null, '已进场施工。', '7fecf07b02e74dd8bb0651f46eb7e677', '1', '2016-11-07 16:35:13', null, null);
INSERT INTO `progress` VALUES ('6d7c81c2a20c4b8c85c5d576ce8ea6e5', null, '2', '93.00', '2015-08-03', '2016-11-15', '目前总工程进度为92.5%。西段与南段合计930米路段：已完成7米宽基本路面，可供通行。中段300米路段：因该项目存在卫星图斑问题目前桩基工程已停工。', 'da265f1c9f674b0ca6d58e5e1b6d9945', '1', '2016-11-07 16:21:50', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('759be96d36b34670b750df8b51331925', null, '2', '21.00', '2016-09-15', '2016-10-31', 'F地块控规修改：区国规局于11月7日已将申请立项资料报区政府，待批复。', '7652e2cdf8784ee793b3827d2edc1de9', '1', '2016-11-16 10:15:28', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('76434223b0bf4c55975aff5886a28beb', null, '3', '57.00', '2015-08-01', '2016-12-30', '西半幅水泥路面已完工，可供通行。', '67e65a9c4d914cf9954593f23b3ab1be', '1', '2016-08-31 11:29:30', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('76546ecdbcb84acb8d0ed1b0fd538e42', null, '2', '0.00', null, null, '目前已完成设计招标，并开始相应设计及钻探前期准备工作。现准备收地及勘探工作，化龙镇正加紧与区土地开发中心及村开展征地价差的补偿工作。', '1de2549613d94195b8b68ad57112d1eb', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-26 11:22:08', null, null);
INSERT INTO `progress` VALUES ('7bbdd004f8c84feca6d30689c7385820', null, '3', '63.00', '2015-08-01', '2016-12-30', '进行路面面层和软基施工', '67e65a9c4d914cf9954593f23b3ab1be', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:12:35', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('85d5a905fe524b60bbfa31966fb02b86', null, '3', '86.00', '2016-03-01', null, 'D地块排水管已于7月底完工。\r\n      B、D地块之间规划道路排水管工程已完成排水沟的开挖，目前正在下埋排水管。总工程进度完成86%，计划11月中旬前完成。', 'e4abc220a528433b90c774e603b4336b', '1', '2016-11-07 16:30:54', '2016-03-01', '2016-10-15');
INSERT INTO `progress` VALUES ('8664450315d24785a2d281556e508d1c', null, '3', '0.00', null, null, 'E2地块：该地块报批面积235.4亩，为区土地开发中心已征收珠江甘蔗场国有农用地；该地块功能片区土规于2016年6月获省政府批复，现省厅已备案。于2016年8月31日拿到批后实施通知、耕地占用税缴款通知及用地批复并立即办理耕地占用税请款及国有农用地土地证变更测绘（地籍调查表及宗地图），国有农用地土地证变更（注销）工作已到审批中心入案；耕地占用税已扣税，待出完税证明。', '2c82e6544fc8464595bd0e3de3fffbc7', '1', '2016-10-17 16:05:21', null, null);
INSERT INTO `progress` VALUES ('868b6055b8be4c02925d627bb1eae9a8', null, '3', '60.00', null, null, '进度正常', '556a0e23a3d94ea49408722a835e189e', '1', '2016-10-17 15:50:59', '2015-09-01', '2016-12-01');
INSERT INTO `progress` VALUES ('8853702991354836b5737e5ad8797a51', null, '2', '21.00', '2016-09-15', '2016-10-31', 'F地块用地报批:已出具征地欲公告，现正准备听证会议材料', '7652e2cdf8784ee793b3827d2edc1de9', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:08:43', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('88bc37f3721e43b1874a3784c2c77a6e', null, '3', '100.00', '2015-09-01', '2016-10-25', '压实工作基本完成', '0e1e9c0810894433bc5dc4731dfb6236', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:09:04', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('8a3536a37c6248aabd930878b8f9c642', null, '3', '98.00', '2016-05-09', '2016-12-30', '目前施工队已完成道路路基的压实工作，因该道路为村民出行唯一一条出路，近期村民私人施工车辆进出频繁，对项目施工造成一定影响。经研究，区基建办将于12月初进行水泥路面的铺设。', '919d9c7ce730415ca19f61d6b1f02b2e', '1', '2016-11-07 16:20:07', '2016-03-01', '2016-08-31');
INSERT INTO `progress` VALUES ('8eaaa005bc2d491581d97f4873845471', null, '3', '2.00', null, null, '东龙大道南段（B、D地块）排水系统设计、建设，人行道、绿化、交通等市政基础设施的修复施工图设计已完成，正在送财局评审，约需要二个月才能完成施工招标。\r\n     照明工程施工、监理招标已完成，目前已与番禺供电局签订用电协议，并正在进行工程变电箱设计。照明工程预计于2017年3月前完成。', '537ccac51870451faa354f1e3b93aaa1', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:50:44', null, null);
INSERT INTO `progress` VALUES ('917bfcc407044ff288edcf22792b8181', null, '3', '43.00', '2009-01-01', '2020-12-31', '15#、16#、17#的地下室已完成，15#已建成2层，16#已建成15层，17#已建成13层。', 'e468523dea6f451d8d2d4e2befecb639', '1', '2016-11-07 16:30:31', '2009-01-01', '2020-12-31');
INSERT INTO `progress` VALUES ('98cab40ab1a947a2be46963b5d4e056a', null, '3', '1.00', null, null, '', 'eb65bd333d1a4fd39b23933b70c4d887', '1', '2016-08-25 18:23:40', null, null);
INSERT INTO `progress` VALUES ('99519f6b43e14978a321dfdb51a4ae64', null, '3', '1.00', null, null, '已于10月25日进场放线，目前正在同步进行报建工作。', '52f7f9605f714a8793b53995543af4af', '1', '2016-11-07 16:19:33', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('9a0b6efa415e4b5abab0715fc103065b', null, '3', '100.00', '2015-08-03', '2016-07-18', '正在进行用电报装和护坡施工，待完成护坡建设再进行护栏建设.。', 'c1cb80e53fa445e29fb8c7c11b38b272', '1', '2016-11-07 16:23:15', '2015-08-03', '2016-06-30');
INSERT INTO `progress` VALUES ('9c467379084545b290c4ab7ec7573ab8', null, '1', '35.00', '2015-08-01', null, '区基建办于4月22日进场施工之时被村民阻扰。10月17日陈区在协调会要求区土地开发中心加快落实有关土地款项，争取区基建办早日进场建设。', '7954c8746dc449829fab51d9e40d6f4f', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-26 11:21:25', '2015-08-01', '2015-12-31');
INSERT INTO `progress` VALUES ('a47d7fbd24c7448096f6cddee5d6a0b3', null, '3', '80.00', null, null, '正常进行。', '556a0e23a3d94ea49408722a835e189e', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:07:51', '2015-09-01', '2016-12-01');
INSERT INTO `progress` VALUES ('a57cb480ef314b16ad9978dbe512a7fd', null, '3', '75.00', '2015-08-01', '2016-12-30', '西半幅水泥路面已完工，可供通行。预计4月底完成东半幅道路的预压土卸载，6月底道路竣工。', '67e65a9c4d914cf9954593f23b3ab1be', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:10:46', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('a808e26b10d140ce9abe1e7a50bc754e', null, '2', '21.00', '2016-09-15', '2016-10-31', '一期767亩:1.用地报批:3月17日省国土资源厅下发用地批复，3月20日办理集体土地所有权变更工作。现已入件办理用地结案，待复。2.控规修改:\r\n    2月17日通过规委会审议，3月20日上报市政府。3.用地出让:\r\n    3月21日已挂牌，计划4月底前完成摘牌。\r\n二期：征地工作：征地面积约为4600亩（因征地界线尚未最终敲定，具体征地面积待定），目前已有3774亩签订征地协议。其中：化龙范围：明经村2226亩，草堂村33亩，合计2259亩。石楼范围：茭东村894亩，茭西村621亩，合计1515亩。', '7652e2cdf8784ee793b3827d2edc1de9', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:09:20', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('ad0d7d05a0804b4c8f511121cd1697fe', null, '3', '100.00', '2016-05-09', '2016-12-30', '已交付使用', '919d9c7ce730415ca19f61d6b1f02b2e', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:45:07', '2016-03-01', '2016-08-31');
INSERT INTO `progress` VALUES ('ad2b6fb915b441aea8142d4bd1e28be9', null, '3', '58.00', '2015-08-01', '2016-12-30', '西半幅水泥路面已完工，可供通行。目前正进行排水管建设。', '67e65a9c4d914cf9954593f23b3ab1be', '1', '2016-11-07 16:22:49', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('ad5a65e8b63a4af0ba8e803ff8e76cca', null, '3', '4.00', null, null, '已完成清表工作，正进行试桩工作。', '52f7f9605f714a8793b53995543af4af', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:10:18', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('b0c87bc1361b45bf9febb870258db007', null, '3', '59.00', '2011-03-03', '2012-12-28', '', 'c31e960c4418442f8af4514f7dfad6e4', 'b68eb29a93304c059c8bfda78e1dfc4e', '2016-08-27 16:59:25', '2011-03-03', '2012-12-12');
INSERT INTO `progress` VALUES ('b1fe231735034adb8d3323e049093051', null, '2', '93.00', '2015-08-03', '2016-11-15', '西段与南段合计930米路段：已完成7米宽基本路面，可供通行。中段300米路段：已完成桩基工程，目前正在进行道路回填土，春节前完成道路填土工程。', 'da265f1c9f674b0ca6d58e5e1b6d9945', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:41:24', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('b49c2dee062442e1bf5323bd2d3094ff', null, '3', '2.00', null, null, '东龙大道南段（B、D地块）排水系统设计、建设，人行道、绿化、交通等市政基础设施的修复施工图设计已完成，正在开展施工招标。\r\n    照明工程施工、监理招标已完成，目前已进场开展清理杂草杂物、灯杆标号等施工，同时工程变电箱正在报装，待与番禺供电局签订用电协议。', '537ccac51870451faa354f1e3b93aaa1', '1', '2016-11-16 10:22:09', null, null);
INSERT INTO `progress` VALUES ('b77c431c32ef42c8af579388a9c6c522', null, '3', '100.00', null, null, '已完工', 'b27937394a5f4d8abe0f2642a6fbfaaa', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:50:15', null, null);
INSERT INTO `progress` VALUES ('b855db8379c04db3aef57640c68d3e50', null, '3', '45.00', '2016-08-01', '2017-12-29', '目前正进行挡土墙施工', '20f75384690348d18687acd7759d3043', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:00:03', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('b93fb99e351b4d918437632953848451', null, '3', '95.00', null, null, 'D地块村民出行道路：目前施工队已完成道路路基的压实工作，因该道路为村民出行唯一一条出路，近期村民私人施工车辆进出频繁，对项目施工造成一定影响。经研究，区基建办将于12月初进行水泥路面的铺设。', 'b27937394a5f4d8abe0f2642a6fbfaaa', '1', '2016-11-07 16:24:35', null, null);
INSERT INTO `progress` VALUES ('b9d83c8599534c73a02613a658b1a956', null, '1', '35.00', '2015-08-01', null, '位于G2地块内1、2号路接驳位工程由于施工路段内（二期地块）征地差价未补偿，施工一直受到村民断断续续的阻挠，现已停工长达6个月，严重影响G2地块内零部件项目的用水用电需求。', '7954c8746dc449829fab51d9e40d6f4f', '1', '2016-10-17 15:29:50', '2015-08-01', '2015-12-31');
INSERT INTO `progress` VALUES ('bb27ab358514473ca80b78bc25accf5a', null, '3', '100.00', '2015-09-01', '2016-10-25', '已交付使用', '0e1e9c0810894433bc5dc4731dfb6236', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:43:51', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('bbac8fcd4ba64694a9b50cda21f1f15a', null, '3', '98.00', '2016-05-09', '2016-12-30', '预计12月15日前完成路面铺设，12月25日可通车。', '919d9c7ce730415ca19f61d6b1f02b2e', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:11:16', '2016-03-01', '2016-08-31');
INSERT INTO `progress` VALUES ('bf2a1a048fbc48ec977a162a11245034', null, '3', '98.00', null, null, '一、冲压车间钢结构收尾，机电安装工程施工。钢结构收尾完成80%。 机电安装工程完成38%。\r\n二、综合研发楼装修收尾工作（含质量问题整改）完成17%。 \r\n三、厂区道路：冲压车间周边道路完成58%，人行道完成60%：路灯完成53%。', '233570fd6d45415ba97eb4e762b9a349', '1', '2016-10-17 16:07:41', null, '2016-10-30');
INSERT INTO `progress` VALUES ('bf5337b98a214a05a263662ffb2e89c6', null, '3', '2.00', null, null, '照明工程施工、监理招标已完成，目前已进场开展清理杂草杂物、灯杆标号等施工。', '537ccac51870451faa354f1e3b93aaa1', '1', '2016-11-07 16:26:25', null, null);
INSERT INTO `progress` VALUES ('c201280722b14812b39f80201c45941a', null, '3', '100.00', '2012-10-01', '2013-12-01', '', '24c3042ba9c040e683499fe39776f9e7', '1', '2016-08-30 12:04:31', '2012-10-01', '2013-12-01');
INSERT INTO `progress` VALUES ('c231e98c4b2043a09c26a22fc68f78ec', null, '2', '0.00', null, null, '用地报批手续已于2014年11月上报市国土局，2014年12月上报省国土厅，2015年7月取得批复，目前进入批后实施阶段。\r\n目前化龙镇正在办理用地结案相关手续并已缴交相关费用。正在制定拆迁安置方案，并完成征地价差补偿，正开展相关设计方案制定。', '1de2549613d94195b8b68ad57112d1eb', '1', '2016-08-31 10:16:33', null, null);
INSERT INTO `progress` VALUES ('c476009c560c4d0db65d45d793812481', null, '3', '0.00', '2016-08-01', '2017-12-29', '已于8月19日挂网招标，预计9月19日开标。', '20f75384690348d18687acd7759d3043', '1', '2016-08-31 11:14:15', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('c6c40fac9fb94d49ac596e4e098dda2a', null, '3', '100.00', '2008-12-01', '2016-07-28', '项目于2016年7月28日举行竣工仪式。', 'ca10fd23364140d587587c1feecd5e36', '1', '2016-10-17 15:28:23', '2008-12-01', '2016-07-28');
INSERT INTO `progress` VALUES ('c8e5d95f03914246ba7eba3e3ed8084c', null, '3', '100.00', null, null, '目前地块已完成填土，正在进行压实。计划1月底前完成。', '556a0e23a3d94ea49408722a835e189e', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:48:45', '2015-09-01', '2016-12-01');
INSERT INTO `progress` VALUES ('ca0c597828b54c619e02d9b0ae221081', null, '3', '63.00', '2009-01-01', '2020-12-31', '16#楼、17#楼正进行安装工程施工，总工程进度为63%；\r\n18# ：正在办理《建设工程规划许可证》。', 'e468523dea6f451d8d2d4e2befecb639', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:11:14', '2009-01-01', '2020-12-31');
INSERT INTO `progress` VALUES ('ca3c568747ca4ec1aff7fdc97fcaacad', null, '3', '0.00', null, null, '地块9,：市土委会会议纪要已于7月22日出具，待市政府批复。\r\n地块15：撤拍', 'd5306ef00b6a41cab5de0bed7ce09317', '1', '2016-08-31 14:59:32', null, null);
INSERT INTO `progress` VALUES ('cb71d2bed59649178be7db2386310b44', null, '3', '100.00', null, null, '已于10月9日摘牌。', '3740ce50d6f54345aa8fd505040db1b4', '1', '2016-10-17 15:52:56', null, null);
INSERT INTO `progress` VALUES ('cd60aac9071049e79d79c457679af93d', null, '2', '90.00', '2015-08-03', '2016-09-30', '东复路与塘复路并行的530米段目前正铺设水稳层，预计12月底完成铺设工作。', '31b2058c44384ef1945bc4313a3ae37e', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:05:19', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('cdd286af460648d5bd5d0d3e37a075ff', null, '2', '93.00', '2015-08-03', '2016-11-15', '中段300米路段已完成桩基浇筑，12月底完成桩检测。', 'da265f1c9f674b0ca6d58e5e1b6d9945', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:07:19', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('d49782d4e9d7481ebd7bbc6c9f31607b', null, '2', '21.00', '2016-09-15', '2016-10-31', '用地报批：区国规局于1月11日将相关报批资料报市国规委。\r\n控规修改：区国规局于1月12日将控规修改方案报市国规委。', '7652e2cdf8784ee793b3827d2edc1de9', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:42:28', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('d586f445c6b74bbfbf5a2a04e1cb6cdf', null, '3', '100.00', '2016-03-01', null, 'D地块排水管已于7月底完工。B、D地块之间规划道路排水管工程已于12月5日完成。', 'e4abc220a528433b90c774e603b4336b', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 15:34:36', '2016-03-01', '2016-10-15');
INSERT INTO `progress` VALUES ('d5bd6a07a0114588ae8560b2f17d3328', null, '3', '90.00', '2016-08-01', '2017-12-29', '目前正进行路面混凝土施工，计划1月底完工。', '20f75384690348d18687acd7759d3043', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:43:33', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('d5e3d8a4138f4a1287716603e2885bef', null, '3', '100.00', '2014-11-01', '2015-08-01', '', 'e6a6f7f20d8f4ee68b1eaab1e0e29350', '1', '2016-08-30 12:08:38', '2014-11-01', '2015-08-01');
INSERT INTO `progress` VALUES ('d6dd4d99610741a89dc524a9096389f5', null, '3', '2.00', null, null, '东龙大道南段（B、D地块）排水系统设计、建设，人行道、绿化、交通等市政基础设施的修复施工图设计已完成，正在送财局评审，约需要二个月才能完成施工招标。\r\n        照明工程施工、监理招标已完成，目前已进场开展清理杂草杂物、灯杆标号等施工，同时工程变电箱正在报装，待与番禺供电局签订用电协议。照明工程预计于2017年3月前完成。', '537ccac51870451faa354f1e3b93aaa1', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 15:35:36', null, null);
INSERT INTO `progress` VALUES ('d79182b33eda422f96a03431fea2737e', null, '1', '35.00', '2015-08-01', null, '原涉及的征地问题已解决，正在开展施工前期准备工作。预计3月底重新进场，9月底完成整体工程。', '7954c8746dc449829fab51d9e40d6f4f', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:06:59', '2015-08-01', '2015-12-31');
INSERT INTO `progress` VALUES ('d9377dbde9ca4c6ba2aad52e6e639a20', null, '2', '60.00', '2016-08-24', '2016-09-01', '根据项目制定的实施计划，目前项目滞后', 'dbec1b6a162140e7914f2d0a96d8875d', '1', '2016-08-26 16:04:09', '2016-08-16', '2016-08-16');
INSERT INTO `progress` VALUES ('d95545e781ff4f8eb2631c9cf51911a9', null, '3', '38.00', '2009-01-01', '2020-12-31', '15#-17#：15#、16#、17#的地下室已完成，15#已建成2层，16#已建成9层，17#已建成7层。18# ：目前正在工程设计阶段。', 'e468523dea6f451d8d2d4e2befecb639', '1', '2016-10-17 15:51:48', '2009-01-01', '2020-12-31');
INSERT INTO `progress` VALUES ('db62d8414a3a4d69bb01e8fb7e0314d6', null, '3', '0.00', null, null, '根据市土委会2015年第十次会议精神，在功能片区土规中调剂52.5公顷建设用地规模给F地块使用。功能片区土规成果已通过市政府审批和省国土资源厅备案，并经市国规委正式批复实施。', '7652e2cdf8784ee793b3827d2edc1de9', '1', '2016-10-17 15:57:05', null, null);
INSERT INTO `progress` VALUES ('dbe7db85e6764b308c7d38e70ceb04ef', null, '3', '100.00', '2015-09-01', '2016-10-25', '平整压实工作完成60%。', '0e1e9c0810894433bc5dc4731dfb6236', '1', '2016-11-07 16:18:30', '2015-09-01', '2016-09-30');
INSERT INTO `progress` VALUES ('dceb20fe542d4c7b9ef1398b043dffa6', null, '2', '21.00', '2016-09-15', '2016-10-31', '收地问题：区土发中心已于10月28日完成788亩围蔽 工作。因补偿款项仍在区财政局审批中，需待款项发放到石楼镇胜洲村才能进行收地工作。用地报批：已完成勘界工作，因涉及河涌改道问题，正在征求区水务局意见，待区水务局出具意见后再报国规局申请征地预公告。控规修改：区国规局准备将申请立项的资料报区政府审批。', '7652e2cdf8784ee793b3827d2edc1de9', '1', '2016-11-07 16:12:49', '2016-09-01', '2016-10-15');
INSERT INTO `progress` VALUES ('ddfefeb050c24594bc88013285c078d0', null, '2', '0.00', null, null, '项目预计9月开标。', '52f7f9605f714a8793b53995543af4af', '1', '2016-08-31 11:12:16', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('df26dcf96ab04a2a8ec37b229a389c14', null, '3', '0.00', null, null, '一、已完成土地招拍挂工作，目前正处于土地交付确认阶段。\r\n二、已完成初步规划设计。', 'fd7221abccc74f19a935b785089c8b1d', '1', '2016-10-17 16:03:18', null, null);
INSERT INTO `progress` VALUES ('e061200d59464ec0ab1f283c37301d02', null, '1', '35.00', '2015-08-01', null, '区土发中心已和复甦村签订工程涉及的征地协议，目前区土发中心已于12月7日将请款材料交区领导审阅，待批', '7954c8746dc449829fab51d9e40d6f4f', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-14 12:03:16', '2015-08-01', '2015-12-31');
INSERT INTO `progress` VALUES ('e2dc96532f834f028e424d21203c2747', null, '3', '100.00', null, null, '已于2017年1月5日交付使用。', 'bcc7a58078844119a484de1f1e4c5733', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:37:38', null, null);
INSERT INTO `progress` VALUES ('e462ba999c5b46f38634f56fc8eddf13', null, '3', '95.00', '2015-01-01', '2016-12-30', '已完成主控楼及220千伏变电站的主体结构建设。目前正进行电气设备安装。', '4e73fe85d5a54dc58baed78e39a01726', '1', '2016-11-07 16:23:45', '2015-01-01', '2016-12-30');
INSERT INTO `progress` VALUES ('e755e0fdf64346ec80f535f0009e1bec', null, '3', '96.00', '2015-01-01', '2016-12-30', '计划2017年3月底前完工。', '4e73fe85d5a54dc58baed78e39a01726', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:49:14', '2015-01-01', '2016-12-30');
INSERT INTO `progress` VALUES ('e8eeaddd55194bd6abce335b59f17eae', null, '3', '100.00', '2014-06-01', '2016-04-18', '该项目已于2016年4月18日举行落成仪式。', '0bdc081322544d48a537f610f9b2fdfb', '1', '2016-10-17 15:18:03', '2014-06-01', '2016-02-29');
INSERT INTO `progress` VALUES ('eaf7dd1c176d4694b19aeea85d70c0bf', null, '3', '95.00', '2015-01-01', '2016-12-30', '已完成主控楼及220千伏变电站的主体结构建设。目前正进行电气设备安装。', '4e73fe85d5a54dc58baed78e39a01726', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-26 11:29:46', '2015-01-01', '2016-12-30');
INSERT INTO `progress` VALUES ('ee63b5831a5e420faab32125cd8eb533', null, '3', '50.00', null, null, '已于2016年10月9日摘牌。', 'd5306ef00b6a41cab5de0bed7ce09317', '1', '2016-10-17 15:52:35', null, null);
INSERT INTO `progress` VALUES ('f09692f30cac4c69b9afc2f1110e4204', null, '3', '90.00', '2015-08-03', '2016-11-15', '已完成前930米段7米宽基本路面，可供通行。余下约300米正在进行道路建设。', 'da265f1c9f674b0ca6d58e5e1b6d9945', '1', '2016-08-31 15:00:54', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('f0d0cbcd77a84195af3c191c743997ca', null, '3', '0.00', '2015-08-03', '2016-09-30', '现工程进度为33%。其中五涌桥至C地块段830米已打桩完毕，计划9月10日前完成所有桩基检查。9月15日完成东复路与塘复路并行段工程建设。', '31b2058c44384ef1945bc4313a3ae37e', '1', '2016-08-31 11:19:42', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('f1532b8dc07742f68cd6e42c6bfab8c9', null, '3', '32.00', null, null, '5号路东侧北半幅已完成污水管、雨水管及电缆沟施工。', '52f7f9605f714a8793b53995543af4af', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:10:09', '2016-09-15', '2017-09-15');
INSERT INTO `progress` VALUES ('f174768135294cfb82a3d87890d56910', null, '3', '69.00', '2015-08-01', '2016-12-30', '已完成全段软基处理。', '67e65a9c4d914cf9954593f23b3ab1be', '39a43d8647c947e4b06b440e3e84aafe', '2017-01-22 08:45:51', '2015-08-03', '2016-08-31');
INSERT INTO `progress` VALUES ('f41f442069ec4659bbee199cf90be0bf', null, '3', '15.00', '2008-08-19', '2016-08-24', '', 'aef168c1b6a24dd8a022caec67b9e250', '1', '2016-08-26 15:47:20', '2008-06-02', '2016-06-22');
INSERT INTO `progress` VALUES ('fae5bfdc908f4db7addd76696534b485', null, '3', '100.00', '2016-08-01', '2017-12-29', '已完工。', '20f75384690348d18687acd7759d3043', '39a43d8647c947e4b06b440e3e84aafe', '2017-03-30 17:09:46', '2016-01-01', '2017-12-29');
INSERT INTO `progress` VALUES ('fb8a59c3a69c45098947c4726765eedb', null, '3', '0.00', '2016-08-01', '2017-12-29', '已于10月25日再次进场放线，并已确定线位位置，目前已通知村民清表，施工单位预计31日进场施工。', '20f75384690348d18687acd7759d3043', '39a43d8647c947e4b06b440e3e84aafe', '2016-10-28 10:01:59', '2016-01-01', '2017-12-29');

-- ----------------------------
-- Table structure for progress_annex
-- ----------------------------
DROP TABLE IF EXISTS `progress_annex`;
CREATE TABLE `progress_annex` (
  `progress_annex_id` varchar(36) NOT NULL,
  `progress_id` varchar(36) NOT NULL,
  `progress_annex_name` varchar(64) DEFAULT NULL,
  `progress_annex_type` tinyint(4) DEFAULT NULL COMMENT '0：图片\n            1：视频\n            2：文件\n            3：语音',
  `progress_annex_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`progress_annex_id`),
  KEY `FK_Reference_5` (`progress_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`progress_id`) REFERENCES `progress` (`progress_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of progress_annex
-- ----------------------------
INSERT INTO `progress_annex` VALUES ('0e439f69560142bf903b5b518f8445bd', '380be29b7f234f04b4222c0707717ce0', 'p-a50c4814.jpg', '1', '/upload/eb65bd333d1a4fd39b23933b70c4d887/progressAnnex/0e439f69560142bf903b5b518f8445bd.jpg');
INSERT INTO `progress_annex` VALUES ('2c3545bd01f740288d06eec9cad89684', '09342237f03942a48decfa367405200c', 'p-e8766a57.jpg', '1', '/upload/eb65bd333d1a4fd39b23933b70c4d887/progressAnnex/2c3545bd01f740288d06eec9cad89684.jpg');
INSERT INTO `progress_annex` VALUES ('93acd6aed1634f5baf061851292f60fe', 'd9377dbde9ca4c6ba2aad52e6e639a20', 'u=2827215269,592152198&fm=21&gp=0.jpg', '1', '/upload/dbec1b6a162140e7914f2d0a96d8875d/progressAnnex/attr2d9377dbde9ca4c6ba2aad52e6e639a20.jpg');
INSERT INTO `progress_annex` VALUES ('bbb265f6665245338df0f7d250d1eb3b', 'd9377dbde9ca4c6ba2aad52e6e639a20', 'u=2197353147,239839915&fm=21&gp=0.jpg', '1', '/upload/dbec1b6a162140e7914f2d0a96d8875d/progressAnnex/attr1d9377dbde9ca4c6ba2aad52e6e639a20.jpg');
INSERT INTO `progress_annex` VALUES ('e996e790451845b59b27b11df7bf9d84', '380be29b7f234f04b4222c0707717ce0', 'Screenshot_20160822-102635.png', '1', '/upload/eb65bd333d1a4fd39b23933b70c4d887/progressAnnex/e996e790451845b59b27b11df7bf9d84.png');
INSERT INTO `progress_annex` VALUES ('f435cc09bd9a4ac598dcbee175ddd6ca', 'f41f442069ec4659bbee199cf90be0bf', 'sgs.png', '1', '/upload/aef168c1b6a24dd8a022caec67b9e250/progressAnnex/attr1f41f442069ec4659bbee199cf90be0bf.png');
INSERT INTO `progress_annex` VALUES ('ffce94da03754b15a2bfb4eaa6612c96', '5115e764033b4a8b93476576cc54fe06', 'p-c48b7327.jpg', '1', '/upload/05e607f06eab44f38f51d6d57bb13197/progressAnnex/ffce94da03754b15a2bfb4eaa6612c96.jpg');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` varchar(36) NOT NULL DEFAULT '',
  `type_id` varchar(36) DEFAULT NULL,
  `NAME` varchar(128) NOT NULL,
  `NO` varchar(20) DEFAULT NULL,
  `parent_project_id` varchar(36) DEFAULT '0',
  `state` tinyint(4) DEFAULT NULL COMMENT '0:进行中\n            1:已滞后\n            2:严重问题\n            3:已取消\n            4:已完成',
  `priority` tinyint(4) DEFAULT NULL COMMENT '0：低\n            1：中\n            2：高\n            3：极高',
  `progress` decimal(6,2) DEFAULT '0.00',
  `plan_begin_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `actual_begin_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `resp_dept` varchar(64) DEFAULT NULL,
  `owner_dept` varchar(64) DEFAULT NULL,
  `deputy_dept` varchar(64) DEFAULT NULL,
  `builder_dept` varchar(64) DEFAULT NULL,
  `sup_dept` varchar(64) DEFAULT NULL,
  `design_dept` varchar(64) DEFAULT NULL,
  `investor` varchar(128) DEFAULT NULL,
  `gross` decimal(16,2) DEFAULT NULL,
  `assets` decimal(16,2) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `floor_area` decimal(16,2) DEFAULT NULL,
  `covered_area` decimal(16,2) DEFAULT NULL,
  `plan_area` decimal(16,2) DEFAULT NULL,
  `capacity` varchar(20) DEFAULT NULL,
  `product_type` varchar(64) DEFAULT NULL,
  `annual_product_value` decimal(16,2) DEFAULT NULL,
  `annual_product_amounr` varchar(64) DEFAULT NULL,
  `annual_sale_value` decimal(16,2) DEFAULT NULL,
  `annual_sale_amount` varchar(64) DEFAULT NULL,
  `annual_revenue` decimal(16,2) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `acre_product_value` decimal(16,2) DEFAULT NULL,
  `acre_revenue` decimal(16,2) DEFAULT NULL,
  `acre_assets` decimal(16,2) DEFAULT NULL,
  `acre_gross` decimal(16,2) DEFAULT NULL,
  `electricity` decimal(16,2) DEFAULT NULL,
  `water` decimal(16,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `intro` varchar(1200) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT NULL COMMENT '0:否\n            1:是',
  `investment` decimal(16,2) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `IDX_PROJECT_TYPE` (`type_id`),
  KEY `IDX_PROJECT_ID` (`project_id`),
  KEY `IDX_PROJECT_STATE` (`state`),
  KEY `IDX_PROJECT_PRIORITY` (`priority`),
  KEY `IDX_PROJECT_NAME` (`NAME`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('0bdc081322544d48a537f610f9b2fdfb', 'a3295b244a2c44139ecb33dab4932727', '广汽菲克广州分厂项目', 'C0003', '0', '3', '1', '100.00', '2014-06-01', '2016-02-29', '2014-06-01', '2016-04-18', '', '0948916c-6c15-11e6-852b-00163e028179', '46a42abb408f42e491ccc40c4436a614', '', '', '', '', '广州汽车集团股份有限公司菲亚特集团汽车股份公司', '470000.00', '160000.00', '广州市番禺区东龙大道66号', '426.00', '22.00', null, '', '', '2530000.00', '', null, '', '220000.00', '1438', '5938.96', '516.00', '375.60', null, null, null, '', '广汽菲亚特克莱斯勒汽车有限公司广州分公司（简称“广汽菲克公司”）由广州汽车集团股份有限公司和菲亚特集团汽车股份公司共同投资，成立于2010年3月9日。广汽菲克广州分厂项目占地面积426亩，建筑面积22万平方米，总投资47亿元。项目建成后形成16万辆/年的整车生产能力，达产后年销售收入约253亿元，年税收22亿元。', '1', '2016-08-26 16:38:02', '1', '470000.00');
INSERT INTO `project` VALUES ('0e1e9c0810894433bc5dc4731dfb6236', '8456e644300d4c608a5f683a4b437209', 'C地块填土工程项目', 'J0013', '0', '3', '2', '100.00', '2015-09-01', '2016-09-30', '2015-09-01', '2016-10-25', '', '0948c81e-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '1800.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'C地块填土面积280亩，总填方量约29万立方米，计划总投资0.18亿元。C地块拟用作广汽乘用车有限公司和广菲克有限公司整车物流停车场。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:31:00', '1', '1800.00');
INSERT INTO `project` VALUES ('18046c5f084e46a99654541c767e2f48', 'a3295b244a2c44139ecb33dab4932727', '广州骏高模具科技有限公司', 'C0017', '0', '3', '3', '0.00', null, null, null, null, '', '09489a7f-6c15-11e6-852b-00163e028179', '09489a7f-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '100.00', '', '41.00', null, null, '', '', '25000.00', '', null, '', '700.00', null, '609.76', '17.07', '2.44', null, null, null, '', '广州骏高模具项目占地面积41亩，计划投资1.34亿元。主营业务是汽车零部件模具制造和产品生产（主要是刹车片钢背业务）等。项目建成后预计年产值2.5亿元，年税收0.07亿元。', '1', '2016-08-30 15:01:59', '1', '9000.00');
INSERT INTO `project` VALUES ('1de2549613d94195b8b68ad57112d1eb', '8456e644300d4c608a5f683a4b437209', '复甦安置区（一期）项目', 'J0016', '0', '2', '2', '0.00', null, null, null, null, '', '0948c739-6c15-11e6-852b-00163e028179', '0948c739-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, null, '', '231.00', null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '复甦安置区（一期）总用地报批面积为154166平方米（约231亩），根据穗规地证【2014】51号，安置房为公寓式住宅，按照户均建筑面积280平方米标准执行，一期项目共安置1010户。该项目的建成为复苏村村民居住提供保障。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:38:21', '1', null);
INSERT INTO `project` VALUES ('20f75384690348d18687acd7759d3043', '8456e644300d4c608a5f683a4b437209', 'G2地块村民出行道路', 'J0009', '0', '3', '2', '100.00', '2016-01-01', '2017-12-29', '2016-08-01', '2017-12-29', '围绕G2地块东边红线由北向南建设', '0948c739-6c15-11e6-852b-00163e028179', '0948c739-6c15-11e6-852b-00163e028179', '0948c739-6c15-11e6-852b-00163e028179', '化龙镇', '', '', '', '610.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '湛沙路工程总投资610万元，道路总长度1900米，路宽6米，道路建成后可满足G2地块周边居住村民的出行需求。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 16:13:55', '1', '610.00');
INSERT INTO `project` VALUES ('233570fd6d45415ba97eb4e762b9a349', 'a3295b244a2c44139ecb33dab4932727', '广汽荻原项目', 'C0013', '0', '3', '3', '98.00', null, '2016-10-30', null, null, '', '09489b01-6c15-11e6-852b-00163e028179', '09489b01-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '52587.00', '', '207.00', '50500.00', null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '2015年该项目年产值达6.96亿元，年税收达0.1亿元。', '广州广汽荻原模具冲压有限公司整体搬迁扩能及股权调整建设项目占地面积12.7万平方米，建筑面积约5.05万平方米, 计划投资6.98亿元。项目主要制造汽车车身外覆盖件、汽车车身冲压焊接零部件等。', '1', '2016-08-30 14:46:41', '1', '69800.00');
INSERT INTO `project` VALUES ('24c3042ba9c040e683499fe39776f9e7', 'a3295b244a2c44139ecb33dab4932727', '广州申雅项目', 'C0007', '0', '3', '3', '100.00', '2012-10-01', '2013-12-01', '2012-10-01', '2013-12-01', '', '0948ca2a-6c15-11e6-852b-00163e028179', '0948ca2a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '8000.00', '1470.00', '番禺区化龙镇现代产业园A1地块', '70.00', null, null, '', '密封条', null, '', null, '', null, null, null, null, null, null, null, null, '2015年该项目年产值达1.85亿元，年税收达0.18亿元。', '2002年7月，申雅（上海）与中隆投资按照70%对30%的出资比例，收购原广州标致配套商广州番禺远东密封件厂的全部资产后，组建申雅（广州）公司。该项目于2013年12月建成，占地面积70亩，总投资0.8亿元，主要制造车门门框密封条、行李箱密封条等。', '1', '2016-08-30 12:04:11', '1', '8000.00');
INSERT INTO `project` VALUES ('256ffe9af1c146859535b04f61a57db4', '8456e644300d4c608a5f683a4b437209', 'C地块村民出行道路', 'J0007', '0', '3', '3', '100.00', null, null, null, null, '围绕C地块东边红线由北向南建设', '0948c739-6c15-11e6-852b-00163e028179', '0948c739-6c15-11e6-852b-00163e028179', '0948c739-6c15-11e6-852b-00163e028179', '化龙镇', '', '', '', '366.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'C地块村民出行道路工程总投资366万元，道路总长度1646米，路宽6米，道路建成后可满足复甦村村民出行需求。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 16:07:34', '1', '366.00');
INSERT INTO `project` VALUES ('2c82e6544fc8464595bd0e3de3fffbc7', '3590c78bee8148d1a3d4625b9d6c67fa', 'E2地块用地', 'D0001', '0', '3', '3', '0.00', null, null, null, null, '化龙镇东龙大道以东狮子洋以西海军基地以北', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', '235.40', null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '区土发中心已于2015年12月将用地报批材料送市国规委经办处室初审。待功能片区土规通过省厅备案后，市国规委将正式受理此案。目前该地块已完成补偿工作。', 'E2地块用地报批面积约235.4亩，该地块拟用作广汽菲克公司永久物流准备中心及员工培训使用。计划投资2.5亿元。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:00:09', '1', '25000.00');
INSERT INTO `project` VALUES ('2ca9c4448b17495ab2ba113b462ae6bf', 'a3295b244a2c44139ecb33dab4932727', '延锋汽车饰件系统广州有限公司', 'C0010', '0', '3', '3', '6.00', null, null, null, null, '', '0948965a-6c15-11e6-852b-00163e028179', '0948cb06-6c15-11e6-852b-00163e028179', '', '', '', '', '', '34450.00', '5000.00', '', '58.31', null, null, '', '', '29100.00', '', null, '', '980.00', null, null, null, null, null, null, null, '', '项目占地面积32027平方米(约58.31亩)，建筑面积14490平方，计划投资34450亿元。项目投产后计划年生产50万套汽车门板和18万套仪表板，预计年产值2.91亿元，年税收0.1亿元。', '1', '2016-08-30 12:14:49', '1', '13000.00');
INSERT INTO `project` VALUES ('31b2058c44384ef1945bc4313a3ae37e', '8456e644300d4c608a5f683a4b437209', '东复路', 'J0006', '0', '2', '3', '96.00', '2015-08-03', '2016-08-31', '2015-08-03', '2016-09-30', '展贸北路东段与C地块连接段', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c7e4-6c15-11e6-852b-00163e028179', '番禺交投公司', '', '', '', '4100.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '东复路工程总投资4100万元，道路总长度1970米，路宽7米，单向1车道。道路建成后可进一步缓解广汽乘用车公司、广汽菲克公司的物流运输问题。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 16:04:05', '1', '4100.00');
INSERT INTO `project` VALUES ('3740ce50d6f54345aa8fd505040db1b4', '3590c78bee8148d1a3d4625b9d6c67fa', 'D1、D2地块出让工作', 'D0005', '0', '3', '3', '100.00', null, null, null, null, '番禺区化龙镇东龙大道以西', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', '512.00', null, '593.30', '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'D地块用地报批面积约593.3亩，首期出让地块（D1、D2）面积约276亩（可建设用地约236亩）。该地块拟用作广汽乘用车有限公司和广菲克有限公司整车物流停车场。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:26:27', '1', null);
INSERT INTO `project` VALUES ('434a9f9576f04838a650dd3599572314', 'a3295b244a2c44139ecb33dab4932727', '广汽研究院项目', 'C0002', '0', '3', '1', '62.00', '2010-08-09', '2017-08-31', '2010-08-11', null, '', 'a4a35b8cf0884cb38b04945428c29bd4', '', '', '', '', '', '', null, null, '', '783.00', null, null, '', '', null, '', null, '', null, '2200', null, null, null, null, null, null, '', '广汽集团汽车工程研究院成立于2006年7月，项目一期占地面积约432亩，建筑面积约29万平方米，总投资约30亿元，已于2012年11月落成使用。该项目主要承担广汽集团产品和技术发展战略规划的制定，重大研发任务的具体推进实施，负责开发具有市场竞争力的自主品牌整车、动力总成、关键总成零部件系列产品及先导性技术研究等。\r\n    项目二期建筑面积约18.2万平方米，计划投资约8.14亿元，主要建设内容有高新技术与新能源实验室，系统及零部件开发实验室、轻量化实验室以及工程样车及常规车停车场楼、科研设计大楼等。', '1', '2016-08-26 16:34:03', '1', '381400.00');
INSERT INTO `project` VALUES ('4e73fe85d5a54dc58baed78e39a01726', '8456e644300d4c608a5f683a4b437209', '220千伏化龙变电站', 'J0002', '0', '3', '3', '96.00', '2015-01-01', '2016-12-30', '2015-01-01', '2016-12-30', '番禺区化龙镇明经村内', '0948c81e-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', '37000.00', null, '', '5.10', '7054.61', '5.10', '', '', null, '', null, '', null, null, null, null, null, '7184.00', null, null, '', '220千伏化龙变电站占地面积3432.66平方米，建筑面积7054.61平方米，总投资3.7亿元。该项目的建成保证了广汽乘用车公司、广汽菲克公司的用电需求。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 15:48:16', '1', '37000.00');
INSERT INTO `project` VALUES ('52f7f9605f714a8793b53995543af4af', '8456e644300d4c608a5f683a4b437209', '金荷一路 、三路（3、5号路）项目', 'J0010', '0', '3', '2', '32.00', '2016-09-15', '2017-09-15', null, null, '', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '13000.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'G2地块3、5号路工程总投资1.3亿元；两条路全长2000米；路宽30米，双向4车道。道路建成后可满足广汽传祺零部件工业园各企业的物流运输。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:09:48', '1', '13000.00');
INSERT INTO `project` VALUES ('537ccac51870451faa354f1e3b93aaa1', '8456e644300d4c608a5f683a4b437209', '东龙大道南半段市政基础设施修复完善工程项目', 'J0017', '0', '3', '3', '2.00', null, null, null, null, '', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '4924.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '施工工程全长1820米，道路红线宽度60m，项目总投资约4923.87万元。道路现状已按照公路标准建成，现要求进行修复完善。本次修复完善的内容包括：雨污水工程、人行道工程、交通工程、照明工程、绿化工程等市政基础设施。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:39:51', '1', '4924.00');
INSERT INTO `project` VALUES ('556a0e23a3d94ea49408722a835e189e', '8456e644300d4c608a5f683a4b437209', 'G2地块（二期）填土工程项目', 'J0015', '0', '3', '3', '100.00', '2015-09-01', '2016-12-01', null, null, '', '0948c81e-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '2800.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '该项目填土面积132亩，总填方量约22万立方米，计划总投资0.28亿元。该项目填土完成后，拟建设广州华益盛模塑有限公司、广州精乐汽车部件有限公司、广州中鼎汽车零部件有限公司。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:36:59', '1', '2800.00');
INSERT INTO `project` VALUES ('67e65a9c4d914cf9954593f23b3ab1be', '8456e644300d4c608a5f683a4b437209', '东龙大道北延段', 'J0004', '0', '3', '3', '75.00', '2015-08-03', '2016-08-31', '2015-08-01', '2016-12-30', '龙秀路与东龙大道交叉口至龙沙码头门口段', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c7e4-6c15-11e6-852b-00163e028179', '番禺交投公司', '', '', '', '1900.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '东龙大道北延段工程总投资1900万元，道路总长度400米，路宽60米，双向共8车道。道路建成后可解决广汽菲克生产准备车间、龙沙码头货物运输问题。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 15:55:35', '1', '1900.00');
INSERT INTO `project` VALUES ('6c572c6a2e0e4931adef8e623e5bf5af', 'a3295b244a2c44139ecb33dab4932727', '广汽商贸再生资源项目', 'C0011', '0', '3', '3', '100.00', '2015-06-01', '2016-03-02', '2015-06-01', '2016-03-01', '', '09489756-6c15-11e6-852b-00163e028179', '09489756-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '2000.00', '', '28.06', null, null, '', '', '19675.00', '', null, '', '453.00', null, null, null, null, null, null, null, '', '广州广汽商贸再生资源项目分两期建成，其中：项目一期占地面积28.06亩，计划投资0.4亿元。主营业务是汽车整车及零部件制造行业的有价工业废弃物回收再利用。项目建成后预计年产值2亿元，年税收0.05亿元。', '1', '2016-08-30 12:17:12', '1', '4000.00');
INSERT INTO `project` VALUES ('7652e2cdf8784ee793b3827d2edc1de9', '3590c78bee8148d1a3d4625b9d6c67fa', 'F地块用地', 'D0002', '0', '2', '3', '21.00', '2016-09-01', '2016-10-15', '2016-09-15', '2016-10-31', '东至龙丰路、南达莲花大道', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', null, null, '6665.00', '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'F地块现规划面积为6665亩，其中已征土地约1863亩，未征土地约4802亩。F地块在《广州市城市总体规划（2011-2020）》中已从生态控制区调整为适建区；在控规上主要为耕地；6665亩用地中已落实建设用地规模788亩（暂未取得2016年土地利用计划指标）。根据广汽基地的发展规划，F地块拟建设为广汽乘用车公司的新能源汽车工厂（20万辆/年）、发动机工厂（100万台/年）及变速箱工厂（60万台/年）。该项目总投资140亿元，占地面积约2000亩，预计建成后年产值达368亿元，年税收达63亿元。约4000亩拟建零部件企业。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:16:01', '1', '2076300.00');
INSERT INTO `project` VALUES ('7954c8746dc449829fab51d9e40d6f4f', '8456e644300d4c608a5f683a4b437209', 'G2地块1、2号路接驳工程项目', 'J0019', '0', '1', '2', '35.00', '2015-08-01', '2015-12-31', '2015-08-01', null, '', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '600.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '施工工程全长200米，道路红线宽度30m，项目总投资约600万元。道路按照市政道路标准建成。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:44:00', '1', '600.00');
INSERT INTO `project` VALUES ('7e233004b1d14406b4064ff47a89ee3a', 'a3295b244a2c44139ecb33dab4932727', '广州华益盛模塑有限公司', 'C0014', '0', '3', '3', '0.00', null, null, null, null, '', '094898e7-6c15-11e6-852b-00163e028179', '094898e7-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '3000.00', '', '41.43', null, null, '', '', '18000.00', '', null, '', null, null, null, null, null, null, null, null, '', '广州华益盛模塑项目占地面积41.43亩，计划投资0.97亿元。主营业务为汽车行业注塑产品配套:1.IMD/IML工艺产品(如仪表板与门板装饰件)等；2.高技术或精密产品注塑配套（包括出风口、高光、高光双色产品等)，MUCELL工艺产品配套；3.提供给广州江森、中新PO等客户做二级注塑配套。项目建成后预计年产值达1.8亿元，年税收达0.1亿元。', '1', '2016-08-30 14:52:01', '1', '9708.80');
INSERT INTO `project` VALUES ('7fecf07b02e74dd8bb0651f46eb7e677', 'a3295b244a2c44139ecb33dab4932727', '广州宇龙汽车零部件有限公司', 'C0019', '0', '3', '3', '16.00', null, null, null, null, '', '0948c184-6c15-11e6-852b-00163e028179', '0948c184-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '4000.00', '', '41.10', null, null, '', '', '23500.00', '30000', null, '', '1200.00', null, null, null, null, null, null, null, '', '占地27401平方米，用地面积25608平方米，建筑面积20000平方米产，建设1栋单层钢结构厂房，1栋三层厂房.预计生产能力达30000万元/年以上，年创税收1200万元/年以上', '1', '2016-08-30 15:10:19', '1', '15000.00');
INSERT INTO `project` VALUES ('88d38fbb1d974373bf2358b7fbd27f36', 'a3295b244a2c44139ecb33dab4932727', '广汽商贸钢材加工项目（一期）', 'C0009', '0', '3', '3', '100.00', '2015-07-05', '2016-03-01', '2015-07-01', '2016-03-01', '', '0948c9ef-6c15-11e6-852b-00163e028179', '0948c9ef-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '6800.00', '', '92.89', null, null, '', '', '100100.00', '', null, '', '5100.00', null, null, null, null, null, null, null, '', '广汽商贸钢材加工中心分两期建成，其中：\r\n    1.项目一期占地面积92.89亩，计划投资4亿元，主营业务是汽车用钢材的仓储、加工、配送、销售、研发。项目建成后预计年产值10亿元，年税收0.5亿元。', '1', '2016-08-30 12:11:43', '1', '40000.00');
INSERT INTO `project` VALUES ('89b50174e8684f4fb142820a963586ed', '3590c78bee8148d1a3d4625b9d6c67fa', 'B地块出让', 'D0003', '0', '3', '3', '10.00', null, null, null, null, '番禺区化龙镇金山大道以南，东龙大道以西', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', '316.00', null, '351.32', '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'B地块用地报批面积351.32亩，出让面积316亩。该地块拟用作广汽研究院化龙基地二期建设。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:21:10', '1', null);
INSERT INTO `project` VALUES ('8f329e46aee74f509ecf49548e6a079a', 'a3295b244a2c44139ecb33dab4932727', '广州君国汽车配件有限公司', 'C0012', '0', '3', '3', '1.00', null, null, null, null, '', '094897db-6c15-11e6-852b-00163e028179', '094897db-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '4480.00', '', null, null, null, '', '', '25000.00', '', null, '', '800.00', null, null, null, null, null, null, null, '', '广州君国汽车配件项目占地面积约占地26870平方米(44.78亩)，建筑面积24819平方米，计划投资1.5亿元。主营业务是零配件的研发、生产、销售等工作。项目建成后预计年产值2.5亿元，年税收0.8亿元。', '1', '2016-08-30 14:36:28', '1', '15000.00');
INSERT INTO `project` VALUES ('919d9c7ce730415ca19f61d6b1f02b2e', '8456e644300d4c608a5f683a4b437209', 'D地块村民出行道路', 'J0008', '0', '3', '3', '100.00', '2016-03-01', '2016-08-31', '2016-05-09', '2016-12-30', '围绕D地块西边红线由北向南建设', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '300.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'D地块村民出行道路工程总投资约300万元，总长度1300米，路宽7米，道路建成后可满足复甦村村民出行需求。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 16:10:07', '1', '300.00');
INSERT INTO `project` VALUES ('95de29dd7e7941fa991a63e796c69cca', 'a3295b244a2c44139ecb33dab4932727', '鞍钢广州项目', 'C0004', '0', '3', '2', '100.00', '2014-11-01', '2016-04-18', '2014-11-01', '2016-04-18', '', 'cfadc426cef64787912dae1271a9e4dd', 'cfadc426cef64787912dae1271a9e4dd', '', '', '', '', '鞍钢广州汽车钢有限公司', '11.40', '45800.00', '番禺区化龙镇金山大道E地块', '210.00', '45000.00', null, '', '', '300000.00', '', null, '', '30000.00', '107', '1428.57', '142.85', '218.00', '542.85', null, null, '项目已于2016年4月18日举行落成仪式。', '鞍钢广州项目占地210亩，总投资约25亿元。项目分为两期进行，其中第一期总投资约11.4亿元，建筑面积4.5万平方米，已建成45万吨镀锌生产线和钢材配送中心，预计达产后年产值约30亿元，年税收3亿元。', '1', '2016-08-30 11:36:25', '1', '25.00');
INSERT INTO `project` VALUES ('ab019c862c2e49189bf6bb23811720d7', '8456e644300d4c608a5f683a4b437209', '110千伏广汽输变电电力管沟项目', 'J0012', '0', '2', '2', '26.00', '2015-01-01', '2016-10-30', '2015-01-01', null, '', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '15600.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '该项目总投资1.56亿元，项目由电缆隧道和电缆管沟组成，其中电缆隧道位于220千伏化龙变电站以北至草堂公交站，敷设8回110千伏电缆隧道，路线全长1.04公里。电缆管沟位于草堂公交站至110千伏广汽变电站，路线全长3.6公里，敷设6回110千伏电缆管沟，截面为3.45米×1.55米，其中双排电缆沟路线全长2.8公里，14孔电缆沟路线全长0.8公里。另建检修房、通风井、工作井、接收井、排水工程、供电设施工程、修复路面工程、标志牌、通风工程等。该项目的建成保证了广汽乘用车公司、广汽菲克公司的用电需求。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:28:19', '1', '15600.00');
INSERT INTO `project` VALUES ('b27937394a5f4d8abe0f2642a6fbfaaa', '8456e644300d4c608a5f683a4b437209', '龙港南路南段工程项目', 'J0018', '0', '3', '3', '100.00', null, null, null, null, '', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '510.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '龙港南路南段工程（D地块村民出行道路）：总投资510万元，道路总长度700米，路宽7米，道路建成后可改善复甦村七沙涌东侧沿岸村民的出行需求。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:42:37', '1', '510.00');
INSERT INTO `project` VALUES ('bcc7a58078844119a484de1f1e4c5733', '8456e644300d4c608a5f683a4b437209', 'D3地块填土工程项目', 'J0014', '0', '3', '3', '100.00', null, null, null, null, '', '0948c81e-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '2100.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'D地块填土面积约90亩，总填方量约10万立方米。计划总投资0.21亿元。D地块拟用作广汽乘用车有限公司和广菲克有限公司整车物流停车场。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:33:53', '1', '2100.00');
INSERT INTO `project` VALUES ('be3c2092e01d4bd39f0d6a96a3af42ca', 'a3295b244a2c44139ecb33dab4932727', '广州精乐汽车部件有限公司', 'C0015', '0', '3', '3', '0.00', null, null, null, null, '', '09489974-6c15-11e6-852b-00163e028179', '09489974-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '5100.00', '', '45.39', null, null, '', '', '30000.00', '', null, '', '5100.00', null, null, null, null, null, null, null, '', '广州精乐汽车部件项目占地面积45.39亩，计划投资1.3亿元。主营业务是汽车侧围亮条、三角窗、汽车门框、窗框、车顶装饰条、汽车门窗内外挡水条、驻车制动器等。项目建成后预计年产值3亿元，年税收0.5亿元。', '1', '2016-08-30 14:54:41', '1', '13000.00');
INSERT INTO `project` VALUES ('c1cb80e53fa445e29fb8c7c11b38b272', '8456e644300d4c608a5f683a4b437209', 'C地块物流通道桥', 'J0003', '0', '3', '3', '100.00', '2015-08-03', '2016-06-30', '2015-08-03', '2016-07-18', '龙秀路与龙港北路交界处至C地块北端', '0948c7e4-6c15-11e6-852b-00163e028179', '0948c7e4-6c15-11e6-852b-00163e028179', '', '番禺交投公司', '', '', '', '2915.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'C地块物流通道桥工程总投资2915万元，主要以高架形式联通广汽菲克厂区与C地块停车场。该物流通道桥总长度647米，桥宽13米，双向共3车道。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 15:52:42', '1', '2915.00');
INSERT INTO `project` VALUES ('c31e960c4418442f8af4514f7dfad6e4', 'a3295b244a2c44139ecb33dab4932727', '广州广汽优利得汽车内饰系统研发有限公司', 'C0005', '0', '3', '3', '100.00', '2011-03-03', '2012-12-12', '2011-03-03', '2012-12-28', '番禺区化龙镇现代产业园A3地块', '094895e0-6c15-11e6-852b-00163e028179', '', '', '', '', '', '广州汽车集团零部件有限公司、台湾全兴国际集团', null, '12000.00', '', '88.00', null, null, '', '', '50000.00', '', null, '', '5000.00', '740', '568.18', '56.80', '136.36', null, null, null, '', '广州广汽优利得汽车内饰系统研发有限公司成立于2008年10月7日，由广州汽车集团零部件有限公司与台湾全兴国际集团各自出资50%共同组建，注册资金1.2亿元，是一个以研发为主生产为辅的汽车相关企业。该项目于2012年12月落成使用，占地面积约88亩，总投资1.6亿元。项目主要以研发与生产汽车座椅和手刹车为主，规划年产量20万套，未来将逐步开发及生产整车内饰件产品，并在立足配套广汽自主品牌乘用车的基础上面向全国市场。2015年该项目年产值达5.05亿元，年税收达0.46亿元。', 'b68eb29a93304c059c8bfda78e1dfc4e', '2016-08-27 13:09:44', '1', '16000.00');
INSERT INTO `project` VALUES ('c6c16be927914eba97bf97922c350fca', 'a3295b244a2c44139ecb33dab4932727', '广汽商贸再生资源报废机动车回收拆解基地', 'C0011', '0', '3', '3', '0.00', '2017-01-01', '2018-01-01', null, null, '', '', '', '', '', '', '', '', '19800.00', null, '广州市番禺区石楼镇胜洲村现代产业园地块13', null, '44626.00', null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '用地面积约64200平方米，其中可建设用地面积54360平方米，建筑面积为44626.4平方米。工程拟建设内容为：汽车拆解及破碎车间、零部件储存仓库、油品存放间等工业建筑各一栋。项目建成后，年回收、拆解报废机动车的能力为20000辆/年。', '39a43d8647c947e4b06b440e3e84aafe', '2016-12-15 10:29:50', '1', '19800.00');
INSERT INTO `project` VALUES ('ca10fd23364140d587587c1feecd5e36', 'a3295b244a2c44139ecb33dab4932727', '广汽乘用车项目', 'C0001', '0', '3', '1', '100.00', '2008-12-01', '2016-07-28', '2008-12-01', '2016-07-28', '', '35a8ec0186c545d3a5f3da317c75d843', '35a8ec0186c545d3a5f3da317c75d843', '', '', '', '', '广州汽车集团股份有限公司', null, '541792.00', '广州市番禺区金山大道东路633号', '1374.00', '68.50', null, '', '', '5700000.00', '', null, '', '680000.00', '6000', '4148.50', '495.00', '394.00', null, null, null, '', '广汽乘用车公司成立于2008年7月21日，注册资金12亿元，占地面积120万平方米。其中：\r\n    1.首期工程于2008年动工建设，2010年9月建成竣工。该项目建筑面积约22万平方米，投资预算38亿元人民币，建成年产10万辆整车、10万台发动机的规模。项目建成达产后预计年产值达130亿元，年税收16亿元。\r\n    2.广汽乘用车二期（10-20万辆/年）能扩项目建筑面积约25.5万平方米，计划投资42.23亿元，主要建设内容为：扩建整车四大工艺（冲压、焊装、涂装、总装）工厂和发动机工厂，新建树脂车间、配送中心、技术中心及其他辅助设施建设等；以及为广汽菲亚特广州工厂代建产能16万辆/年的冲压、涂装厂房及冲压、涂装生产线。项目建成达产后，广汽乘用车整车产能将从10万辆/年增至20万辆/年，发动机产能将从10万台/年增至25万台/年，预计达成280亿元产值（其中新增产值150亿元），50亿元利税（其中新增利税30亿元）。\r\n    3.广汽乘用车三期（新增15万辆/年）扩建项目占地面积250亩，建筑面积21万平方米，总投资26亿元，拟达成年产乘用车15万辆，年产发动机15万台和年产变速箱10万台，项目建成达产后年新增营业收入163.19亿元，利润总额9.4亿元，税金17.9亿元。该项目于2015年3月启动建设，计划提前于2016年6月完工。\r\n   该项目2011年总产值19.86亿元，总税收2.1亿元，汽车产量1.7万辆，销量1.7万辆；2012年总产值41.6亿元，总税收3.68亿元，汽车产量3.3万辆，销量3.3万辆；2013年总产值91.8亿元，总税收7.48亿元，汽车产量8.8万辆，销量8.5万辆；2014年总产值111.1亿元，总税收12.25亿元，汽车产量12万辆，销量11.6万辆；2015年总产值产值161.85亿元，总税收16.16亿元，汽车产量18.22万辆，销量18.8万辆。', '1', '2016-08-26 16:28:33', '1', '1062300.00');
INSERT INTO `project` VALUES ('cea1a230804d42e99206080812f9ab40', 'a3295b244a2c44139ecb33dab4932727', '广州巨志汽车零部件项目', 'C0016', '0', '3', '3', '0.00', null, null, null, null, '', '0948cbf6-6c15-11e6-852b-00163e028179', '0948cbf6-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '5000.00', '', '128.93', null, null, '', '', null, '35000', null, '', '4200.00', null, null, null, null, null, null, null, '', '项目占地50000平方米，新建厂房3幢，建筑面积35000平方米；购置各种焊接、检测设备等200台套。产品为轿车车身焊接件；用MOTOMAN-ES165系列电焊机器人；设计年产能80万台套；年销售额35000万元；利税4200万元。', '1', '2016-08-30 14:59:38', '1', '26000.00');
INSERT INTO `project` VALUES ('d07d8eb52eac4d1aabb3b4c4de2abad4', 'a3295b244a2c44139ecb33dab4932727', '广州江森项目', 'C0006', '0', '3', '3', '100.00', '2011-03-01', '2012-10-01', '2010-03-01', '2012-10-30', '', '72831fea623e4f54a58d62982dcf42d6', '72831fea623e4f54a58d62982dcf42d6', '', '', '', '', '', '12000.00', '2294.67', '番禺区化龙镇现代产业园A2地块', '43.00', null, null, '', '仪表台、中控台', null, '', null, '', null, null, null, null, null, null, null, null, '2015年该项目年产值达11.4亿元，年税收达0.93亿元。', '广州江森汽车内饰系统有限公司成立于2008年11月28日，由广州汽车集团零部件有限公司与美国江森自控有限公司共同投资组建。项目占地面积43亩，计划投资1.2亿元。该项目建成后是广汽乘用车公司的零部件配套供应商，是目前华南地区唯一的乘用车仪表台、中控台及其他内饰产品的专业生产厂家。', '1', '2016-08-30 12:00:35', '1', '12000.00');
INSERT INTO `project` VALUES ('d5306ef00b6a41cab5de0bed7ce09317', '3590c78bee8148d1a3d4625b9d6c67fa', 'G2地块：地块9、地块15出让工作', 'D0006', '0', '3', '3', '50.00', null, null, null, null, '番禺区化龙镇G2地块内', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', '104.00', null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '地块9出让面积50亩，拟建设广州市新程汽车零部件项目；地块15出让面积54亩，拟建设广东国利汽车零部件项目。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:28:14', '1', null);
INSERT INTO `project` VALUES ('d930b837c75443138583958a998607b4', 'a3295b244a2c44139ecb33dab4932727', '广东国利汽车部件有限公司', 'C0018', '0', '3', '3', '0.00', null, null, null, null, '', '09489c13-6c15-11e6-852b-00163e028179', '09489c13-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '1000.00', '', '53.82', null, null, '', '', '32300.00', '', null, '', '1076.00', null, '600.00', '20.00', '18.58', null, null, null, '', '广东国利汽车部件项目占地面积53.82亩，计划投资1.45亿元。主营业务是汽车座椅面套销售和开发等。项目建成后预计年产值3.23亿元，年税收0.1亿元', '1', '2016-08-30 15:08:14', '1', '14500.00');
INSERT INTO `project` VALUES ('da265f1c9f674b0ca6d58e5e1b6d9945', '8456e644300d4c608a5f683a4b437209', '塘复路', 'J0005', '0', '2', '3', '93.00', '2015-08-03', '2016-08-31', '2015-08-03', '2016-11-15', '展贸南路东段与C地块连接段', '0948c6fc-6c15-11e6-852b-00163e028179', '0948c6fc-6c15-11e6-852b-00163e028179', '0948c6fc-6c15-11e6-852b-00163e028179', '', '', '', '', '3500.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '塘复路工程总投资3500万元，道路总长度1230米，路宽7米，单向1车道。道路建成后可进一步缓解广汽乘用车公司、广汽菲克公司的物流运输问题。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 16:02:00', '1', '35000.00');
INSERT INTO `project` VALUES ('dd40363edddb4b0899b169ca154bb2f1', '3590c78bee8148d1a3d4625b9d6c67fa', 'C地块出让工作', 'D0004', '0', '3', '3', '100.00', null, null, null, null, '番禺区化龙镇地块C', '0948c68a-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', null, null, '', '264.00', null, '300.00', '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'C地块用地报批面积约300亩，出让面积约264亩。该地块拟用作广汽乘用车有限公司和广菲克有限公司整车物流停车场。', '83794fe9dc3b4cf7aa5367eb5666039d', '2016-08-30 15:24:12', '1', null);
INSERT INTO `project` VALUES ('e468523dea6f451d8d2d4e2befecb639', '8456e644300d4c608a5f683a4b437209', '金雁佳园', 'J0001', '0', '3', '3', '63.00', '2009-01-01', '2020-12-31', '2009-01-01', '2020-12-31', '番禺区化龙镇复甦村东部快线以西、金山大道以北', '0948c81e-6c15-11e6-852b-00163e028179', '', '', '', '', '', '', '100000.00', null, '', '265.00', null, '265.00', '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '金雁佳园总占地面积17.7万平方米，总投资额10亿元。该项目分三期建成。其中：\r\n    1.一期（传祺公寓）占地面积13705平方米，总建筑面积23143平方米，总投资约7000万元。项目于2009年2月启动，2010年11月完工并投入使用，共建有330套保障性住房，其中二人间110套，四人间220套，可供约1080人入住。\r\n    2.二期（14#住宅楼）占地面积1462.52平方米，总投资1.2亿元。项目于2011年10月底动工，2013年2月底竣工。共有一栋14层高的公寓楼，与一栋18层高公寓楼连接，其中“一房二厅”户型共318套，“二房二厅”户型共128套。\r\n    3.三期（15#—19#楼）占地面积8323平方米，总投资4.4亿元，计划建设楼高十八层的住宅楼一栋，楼高二十三层的住宅楼三栋，楼高三层的综合服务中心楼一栋，楼高一层的公交首末站和公共卫生间各一座。', 'b4bf67c3f035421188c2d7bc590e5fc6', '2016-08-30 15:36:14', '1', '100000.00');
INSERT INTO `project` VALUES ('e4abc220a528433b90c774e603b4336b', '8456e644300d4c608a5f683a4b437209', 'B、D地块排水口及排水管线项目', 'J0011', '0', '3', '3', '100.00', '2016-03-01', '2016-10-15', '2016-03-01', null, '', '0948c653-6c15-11e6-852b-00163e028179', '0948c653-6c15-11e6-852b-00163e028179', '', '', '', '', '', '800.00', null, '', null, null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', 'B、D地块排水口及排水管线工程总投资800万元，建成后可解决B、D地块排水问题。', '8aedb1d213fa447eaa07c3768e60b299', '2016-08-30 15:25:27', '1', '800.00');
INSERT INTO `project` VALUES ('e6a6f7f20d8f4ee68b1eaab1e0e29350', 'a3295b244a2c44139ecb33dab4932727', '广汽商贸物流项目', 'C0008', '0', '3', '3', '100.00', '2014-11-01', '2015-08-01', '2014-11-01', '2015-08-01', '', '09489858-6c15-11e6-852b-00163e028179', '09489858-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '20000.00', '', '129.78', null, null, '', '', null, '', null, '', null, null, null, null, null, null, null, null, '', '项目占地面积约129.78亩，计划投资1.9亿元。主营业务是汽车采购物流、包装、整车配送、售后物流、仓储等。项目建成后预计年产值8.09亿元，年税收0.21亿元。', '1', '2016-08-30 12:08:26', '1', '19000.00');
INSERT INTO `project` VALUES ('fd7221abccc74f19a935b785089c8b1d', 'a3295b244a2c44139ecb33dab4932727', '广州中鼎汽车零部件有限公司', 'C0017', '0', '3', '3', '0.00', null, null, null, null, '', '09489bd7-6c15-11e6-852b-00163e028179', '09489bd7-6c15-11e6-852b-00163e028179', '', '', '', '', '', null, '3000.00', '', '109.01', null, null, '', '', '15500.00', '', null, '', '515.00', null, '563.23', '18.17', '109.01', null, null, null, '', '广州中鼎汽车零部件项目占地面积27.52亩，计划投资0.69亿元。主营业务是汽车零部件的研发、生产与销售（橡胶密封件）等。项目建成后预计年产值1.55亿元，年税收0.05亿元。', '1', '2016-08-30 15:04:57', '1', '6850.00');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(99) NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类ID',
  `role_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色键',
  `role_level` int(255) DEFAULT NULL COMMENT '角色等级',
  `description` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `latest_update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后一修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'super admin', '0', 'superAdmin', '1', '超级管理员', '2017-04-16 23:59:58', '2016-07-15 10:09:07');
INSERT INTO `roles` VALUES ('2', '普通用户', '0', 'plainUser', '1', '普通用户', '2016-08-30 10:42:45', '2016-08-29 09:19:20');
INSERT INTO `roles` VALUES ('3', '查看用户', '0', null, '1', '查看用户', '2016-10-21 17:03:28', '2016-08-30 10:42:45');

-- ----------------------------
-- Table structure for role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions`;
CREATE TABLE `role_permissions` (
  `id` int(255) NOT NULL,
  `role_id` int(255) DEFAULT NULL,
  `permission_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_key_role` (`role_id`),
  KEY `foreign_key_permission` (`permission_id`),
  CONSTRAINT `foreign_key_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `foreign_key_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_permissions
-- ----------------------------
INSERT INTO `role_permissions` VALUES ('1', '1', '1');
INSERT INTO `role_permissions` VALUES ('3', '1', '3');
INSERT INTO `role_permissions` VALUES ('9', '2', '4');
INSERT INTO `role_permissions` VALUES ('10', '2', '5');
INSERT INTO `role_permissions` VALUES ('11', '2', '8');
INSERT INTO `role_permissions` VALUES ('12', '2', '6');
INSERT INTO `role_permissions` VALUES ('13', '3', '4');
INSERT INTO `role_permissions` VALUES ('14', '3', '5');
INSERT INTO `role_permissions` VALUES ('15', '3', '8');
INSERT INTO `role_permissions` VALUES ('16', '1', '9');
INSERT INTO `role_permissions` VALUES ('17', '1', '10');
INSERT INTO `role_permissions` VALUES ('18', '1', '11');
INSERT INTO `role_permissions` VALUES ('19', '1', '12');
INSERT INTO `role_permissions` VALUES ('20', '1', '13');
INSERT INTO `role_permissions` VALUES ('21', '1', '14');
INSERT INTO `role_permissions` VALUES ('22', '1', '15');
INSERT INTO `role_permissions` VALUES ('23', '1', '16');

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station` (
  `station_id` varchar(36) NOT NULL,
  `CODE` varchar(3) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `list_no` int(11) NOT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0：否\n            1：是',
  PRIMARY KEY (`station_id`),
  KEY `IDX_TYPE_ID` (`station_id`),
  KEY `IDX_TYPE_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station
-- ----------------------------

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users` (
  `Id` varchar(255) NOT NULL DEFAULT '-1' COMMENT 'Id',
  `username` varchar(255) CHARACTER SET utf8 DEFAULT 'user' COMMENT '用户登录名',
  `usercname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户昵称或者姓名',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT '123456' COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT '12345677890' COMMENT '电话',
  `sex` int(2) DEFAULT '1' COMMENT '性别',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT '123@123.com' COMMENT '邮箱',
  `head_img` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `ranks` int(99) DEFAULT NULL COMMENT '等级',
  `description` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `com_id` int(11) DEFAULT NULL COMMENT '公司',
  `department_id` int(11) DEFAULT NULL COMMENT '部门',
  `position` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '职位',
  `remarks` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '评论',
  `is_use` int(2) DEFAULT NULL COMMENT '是否为用户',
  `latest_login_time` timestamp NULL DEFAULT NULL COMMENT '最后登录时间',
  `created_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `created_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `latest_update_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后修改时间',
  `latest_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '最后修改人',
  `priority` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`Id`),
  KEY `com_id` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES ('1', 'admin', '张文', 'e10adc3949ba59abbe56e057f20f883e', '13760796566', '2', '1', '784298266@qq.com', '/upload/sysUser/1.jpg', '1', '1', '1', '1', '11', '11', '1', '2016-07-06 00:00:00', '2016-07-05 00:00:00', '1', '2016-11-07 16:08:24', 'admin', '0');
INSERT INTO `system_users` VALUES ('39a43d8647c947e4b06b440e3e84aafe', 'zhangw', '张文', 'cd20b2b34fcfb92fc30e54c3ae7432b2', '13760796566', '2', null, '784298266@qq.com', '/upload/sysUser/39a43d8647c947e4b06b440e3e84aafe.jpg', null, null, null, null, null, null, '1', null, '2016-08-29 11:24:34', null, '2016-10-24 09:57:14', null, '0');
INSERT INTO `system_users` VALUES ('6bd1388b528f42e29441495a6d7a5387', 'lizj', '李灼坚', 'e10adc3949ba59abbe56e057f20f883e', '13802838893', '1', null, 'lzjpy2006@163.com', null, null, null, null, null, null, null, '1', null, '2016-09-06 10:54:10', null, '2016-10-25 15:29:47', null, '0');
INSERT INTO `system_users` VALUES ('83794fe9dc3b4cf7aa5367eb5666039d', 'lu', '陆婉玲', '1d24275104ed546eaea5b0e8bb048843', '13580473660', '2', null, '121233905@qq.com', null, null, null, null, null, null, null, '1', null, '2016-08-29 10:41:41', null, '2016-10-24 09:57:34', 'lu', '0');
INSERT INTO `system_users` VALUES ('8aedb1d213fa447eaa07c3768e60b299', 'zhengzq', '郑卓权', 'f20ae558e09054347f3e408f8e3e88d1', '13066333088', '1', null, '5422373@qq.coom', '/upload/sysUser/8aedb1d213fa447eaa07c3768e60b299.jpg', null, null, null, null, null, null, '1', null, '2016-08-29 11:22:38', null, '2016-10-24 09:57:20', null, '0');
INSERT INTO `system_users` VALUES ('949b51098081435eb7f72cf2e8042451', 'liml', '李敏玲', 'e10adc3949ba59abbe56e057f20f883e', '13826036911', '2', null, '379674081@qq.com', null, null, null, null, null, null, null, '1', null, '2016-11-08 15:17:54', null, '2016-11-08 15:17:54', null, '0');
INSERT INTO `system_users` VALUES ('b4bf67c3f035421188c2d7bc590e5fc6', 'chenw', '陈威', 'db4b319370c6b04c0419ae962cd04ee6', '13760684519', '1', null, '120103729@qq.com', '/upload/sysUser/b4bf67c3f035421188c2d7bc590e5fc6.jpg', null, null, null, null, null, null, '1', null, '2016-08-29 11:21:15', null, '2016-10-24 09:57:25', 'chenw', '0');
INSERT INTO `system_users` VALUES ('b68eb29a93304c059c8bfda78e1dfc4e', 'mengzh', '孟站', 'e10adc3949ba59abbe56e057f20f883e', '13416173656', '1', null, '43537506@qq.com', '/upload/sysUser/b68eb29a93304c059c8bfda78e1dfc4e.png', null, null, null, null, null, null, '1', null, '2016-08-20 10:03:43', null, '2016-10-12 14:30:01', 'admin', '0');
INSERT INTO `system_users` VALUES ('bdac485e59b5407ba16d6ec2dabeece3', 'kong', '孔文傲', 'e10adc3949ba59abbe56e057f20f883e', '13642705599', '1', null, ' 609699016@qq.com', '/upload/sysUser/bdac485e59b5407ba16d6ec2dabeece3.jpg', null, null, null, null, null, null, '1', null, '2016-09-05 16:15:39', null, '2016-10-24 09:57:09', null, '0');
INSERT INTO `system_users` VALUES ('cfc6414e5060410c8faf6c49bcfdfe74', 'user', '逢s', 'e10adc3949ba59abbe56e057f20f883e', '123245325', '1', null, '', '/upload/sysUser/cfc6414e5060410c8faf6c49bcfdfe74.jpg', null, null, null, null, null, null, '0', null, '2016-08-19 15:12:37', null, '2016-08-26 15:48:38', 'user', '0');
INSERT INTO `system_users` VALUES ('d3c20dd6863945649c2c4a6e730e4cb2', 'ietdh', '肖逢', 'e10adc3949ba59abbe56e057f20f883e', '1234567', '1', null, '', '/upload/sysUser/d3c20dd6863945649c2c4a6e730e4cb2.jpg', null, null, null, null, null, null, '1', null, '2016-08-30 14:49:02', null, '2016-10-24 09:16:51', 'admin', '0');
INSERT INTO `system_users` VALUES ('d45bbde8acb4461082117593649c9d59', 'chenmj', '陈明捷', 'e10adc3949ba59abbe56e057f20f883e', '39270868', '1', null, '', null, null, null, null, null, null, null, '1', null, '2016-11-08 15:20:35', null, '2016-11-08 15:20:35', null, '0');
INSERT INTO `system_users` VALUES ('f9d735eeeee84930b5223862b87cc75b', 'zhengy', '郑宇', 'd0970714757783e6cf17b26fb8e2298f', '13826151282', '1', null, '12342170@qq.com', null, null, null, null, null, null, null, '1', null, '2016-08-29 11:18:16', null, '2016-10-24 09:57:30', 'zhengy', '0');

-- ----------------------------
-- Table structure for sys_common_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_common_dept`;
CREATE TABLE `sys_common_dept` (
  `common_dept_id` varchar(36) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `principal` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0:否\n            1:是',
  PRIMARY KEY (`common_dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_common_dept
-- ----------------------------
INSERT INTO `sys_common_dept` VALUES ('09488d97-6c15-11e6-852b-00163e028179', '广汽乘用车项目', null, null, null, null, null, '0');
INSERT INTO `sys_common_dept` VALUES ('0948916c-6c15-11e6-852b-00163e028179', '广汽研究院项目', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489321-6c15-11e6-852b-00163e028179', '广汽菲克广州分厂项目', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094893cc-6c15-11e6-852b-00163e028179', '鞍钢广州项目', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489457-6c15-11e6-852b-00163e028179', '清华科技园广州创新基地', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094894d4-6c15-11e6-852b-00163e028179', '广州江森汽车内饰系统有限公司化龙工厂建设工程', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489554-6c15-11e6-852b-00163e028179', '申雅密封件（广州）有限公司迁、扩、建项目', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094895e0-6c15-11e6-852b-00163e028179', '广州广汽优利得汽车内饰系统研发有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948965a-6c15-11e6-852b-00163e028179', '延锋汽车饰件系统广州有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094896dd-6c15-11e6-852b-00163e028179', '广汽商贸钢材加工中心\n', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489756-6c15-11e6-852b-00163e028179', '广州广汽商贸再生资源有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094897db-6c15-11e6-852b-00163e028179', '广州君国汽车配件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489858-6c15-11e6-852b-00163e028179', '广州广汽商贸物流有限公司\n', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094898e7-6c15-11e6-852b-00163e028179', '广州华益盛模塑有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489974-6c15-11e6-852b-00163e028179', '广州精乐汽车部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('094899fc-6c15-11e6-852b-00163e028179', '广州市巨志汽车零部件有限公司（一期）', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489a7f-6c15-11e6-852b-00163e028179', '广州骏高模具科技有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489b01-6c15-11e6-852b-00163e028179', '广州广汽荻原模具冲压有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489b56-6c15-11e6-852b-00163e028179', '广州广汽荻原模具冲压有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489b9a-6c15-11e6-852b-00163e028179', '广州广汽商贸再生资源有限公司（报废机动车回收拆解项目）', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489bd7-6c15-11e6-852b-00163e028179', '广州中鼎汽车零部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('09489c13-6c15-11e6-852b-00163e028179', '广东国利汽车部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c0ec-6c15-11e6-852b-00163e028179', '广州市巨志汽车零部件有限公司（二期）', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c184-6c15-11e6-852b-00163e028179', '广州宇龙汽车零部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c1d5-6c15-11e6-852b-00163e028179', '广汽商贸钢材加工中心（二期）', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c216-6c15-11e6-852b-00163e028179', '区政府', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c257-6c15-11e6-852b-00163e028179', '番禺现代产业基地建设指挥部', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c299-6c15-11e6-852b-00163e028179', '区住房和建设局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c2d5-6c15-11e6-852b-00163e028179', '区交通局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c30f-6c15-11e6-852b-00163e028179', '区水务局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c34c-6c15-11e6-852b-00163e028179', '区发展改革局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c389-6c15-11e6-852b-00163e028179', '区财政局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c3c2-6c15-11e6-852b-00163e028179', '区科技工业商务和信息化局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c3ff-6c15-11e6-852b-00163e028179', '区人力资源和社会保障局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c439-6c15-11e6-852b-00163e028179', '区环保局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c477-6c15-11e6-852b-00163e028179', '区住建局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c4b5-6c15-11e6-852b-00163e028179', '区城管综合执法分局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c4f2-6c15-11e6-852b-00163e028179', '区招商办', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c529-6c15-11e6-852b-00163e028179', '番禺信息技术投资发展有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c569-6c15-11e6-852b-00163e028179', '区城市管理局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c5a3-6c15-11e6-852b-00163e028179', '番禺公安分局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c5dc-6c15-11e6-852b-00163e028179', '区国土资源和规划局', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c615-6c15-11e6-852b-00163e028179', '区地方公路管理总站', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c653-6c15-11e6-852b-00163e028179', '区基建办', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c68a-6c15-11e6-852b-00163e028179', '区土地开发中心', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c6c1-6c15-11e6-852b-00163e028179', '番禺公安交警大队', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c6fc-6c15-11e6-852b-00163e028179', '区防汛抢险专业队', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c739-6c15-11e6-852b-00163e028179', '化龙镇', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c771-6c15-11e6-852b-00163e028179', '石楼镇', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c7ad-6c15-11e6-852b-00163e028179', '番禺水务公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c7e4-6c15-11e6-852b-00163e028179', '番禺交投公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c81e-6c15-11e6-852b-00163e028179', '莲花山保税区公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c859-6c15-11e6-852b-00163e028179', '番禺建管公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c891-6c15-11e6-852b-00163e028179', '区河涌管理所', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c8c8-6c15-11e6-852b-00163e028179', '广州汽车集团股份有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c904-6c15-11e6-852b-00163e028179', '广州市番禺创新科技园有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c941-6c15-11e6-852b-00163e028179', '广州汽车集团商贸有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c979-6c15-11e6-852b-00163e028179', '广州广汽商贸物流有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c9b2-6c15-11e6-852b-00163e028179', '广州广汽商贸再生资源有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948c9ef-6c15-11e6-852b-00163e028179', '广州广汽宝商钢材加工有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948ca2a-6c15-11e6-852b-00163e028179', '申雅密封件广州有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948ca63-6c15-11e6-852b-00163e028179', '广州广汽优利得汽车内饰系统研发有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cabf-6c15-11e6-852b-00163e028179', '广州广汽荻原模具冲压有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cb06-6c15-11e6-852b-00163e028179', '延锋汽车饰件系统广州有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cb45-6c15-11e6-852b-00163e028179', '广州君国汽车配件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cb7e-6c15-11e6-852b-00163e028179', '广州华益盛模塑有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cbb8-6c15-11e6-852b-00163e028179', '广州精乐汽车部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cbf6-6c15-11e6-852b-00163e028179', '广州市巨志汽车零部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cc2f-6c15-11e6-852b-00163e028179', '广州骏高模具科技有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cc6a-6c15-11e6-852b-00163e028179', '广州中鼎汽车零部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cca6-6c15-11e6-852b-00163e028179', '广东国利汽车部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('0948cce3-6c15-11e6-852b-00163e028179', '广州宇龙汽车零部件有限公司', null, null, null, null, null, '1');
INSERT INTO `sys_common_dept` VALUES ('35a8ec0186c545d3a5f3da317c75d843', '广州汽车集团乘用车有限公司', '', '', '', '1', '2016-08-26 15:36:46', '1');
INSERT INTO `sys_common_dept` VALUES ('46a42abb408f42e491ccc40c4436a614', '广汽菲亚特克莱斯勒汽车有限公司广州分公司', '', '', '', '1', '2016-08-26 15:37:00', '1');
INSERT INTO `sys_common_dept` VALUES ('72831fea623e4f54a58d62982dcf42d6', '广州江森汽车内饰系统有限公司', '', '', '', '1', '2016-08-26 15:37:08', '1');
INSERT INTO `sys_common_dept` VALUES ('a4a35b8cf0884cb38b04945428c29bd4', '广州汽车集团股份有限公司汽车工程研究院', '', '', '', 'mengzh', '2016-08-20 10:16:09', '1');
INSERT INTO `sys_common_dept` VALUES ('cfadc426cef64787912dae1271a9e4dd', '鞍钢广州汽车钢有限公司', '', '', '', '1', '2016-08-26 15:37:23', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` varchar(36) NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_url` varchar(200) DEFAULT NULL,
  `parent_menu_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operate
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate`;
CREATE TABLE `sys_operate` (
  `operate_id` varchar(36) NOT NULL,
  `menu_id` varchar(36) DEFAULT NULL,
  `operate_code` varchar(20) DEFAULT NULL,
  `operate_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`operate_id`),
  KEY `FK_Reference_13` (`menu_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_operate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `role_code` varchar(20) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_right`;
CREATE TABLE `sys_role_right` (
  `role_right_id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `menu_id` varchar(36) DEFAULT NULL,
  `operate_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`role_right_id`),
  KEY `FK_Reference_10` (`role_id`),
  KEY `FK_Reference_11` (`menu_id`),
  KEY `FK_Reference_12` (`operate_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`menu_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`operate_id`) REFERENCES `sys_operate` (`operate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_right
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` varchar(36) NOT NULL,
  `dept_id` varchar(36) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `PASSWORD` varchar(32) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '1：男\n            2：女',
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo_path` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT NULL COMMENT '0:否\n            1:是',
  PRIMARY KEY (`user_id`),
  KEY `FK_Reference_7` (`dept_id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_role_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FK_Reference_8` (`user_id`),
  KEY `FK_Reference_9` (`role_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `taskDescribe` varchar(200) DEFAULT NULL,
  `task_id` varchar(36) NOT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `parent_task_id` varchar(36) DEFAULT '0',
  `NAME` varchar(100) DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL COMMENT '0:进行中\n            1:已滞后\n            2:严重问题\n            3:已取消\n            4:已完成',
  `weight` int(11) DEFAULT NULL,
  `progress` decimal(6,2) DEFAULT '0.00',
  `plan_begin_date` date DEFAULT NULL,
  `plan_end_date` date DEFAULT NULL,
  `actual_begin_date` date DEFAULT NULL,
  `actual_end_date` date DEFAULT NULL,
  `involved_dept` varchar(100) DEFAULT NULL,
  `list_no` int(11) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0:否\n            1:是',
  PRIMARY KEY (`task_id`),
  KEY `FK_Reference_2` (`project_id`),
  KEY `IDX_TASK_ID` (`task_id`),
  KEY `IDX_TASK_STATE` (`state`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` varchar(36) NOT NULL,
  `CODE` varchar(3) NOT NULL,
  `NAME` varchar(36) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `parent_type_id` varchar(36) DEFAULT '0',
  `list_no` int(11) DEFAULT NULL,
  `creator` varchar(36) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0' COMMENT '0：否\n            1：是',
  PRIMARY KEY (`type_id`),
  KEY `IDX_TYPE_ID` (`type_id`),
  KEY `IDX_TYPE_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('3590c78bee8148d1a3d4625b9d6c67fa', '003', '用地', '用地', '0', '3', 'mengzh', '2016-08-20 10:10:45', '1');
INSERT INTO `type` VALUES ('8456e644300d4c608a5f683a4b437209', '002', '基础设施', '基础设施', '0', '2', 'mengzh', '2016-08-20 10:10:29', '1');
INSERT INTO `type` VALUES ('a3295b244a2c44139ecb33dab4932727', '001', '企业', '企业', '0', '1', 'mengzh', '2016-08-20 10:10:16', '1');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` varchar(255) NOT NULL,
  `role_id` int(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_key_roles` (`role_id`),
  KEY `foreign_key_user` (`user_id`),
  CONSTRAINT `foreign_key_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `foreign_key_user` FOREIGN KEY (`user_id`) REFERENCES `system_users` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('070aee8c38f243c2a1eda8eddc73ba48', '2', '8aedb1d213fa447eaa07c3768e60b299');
INSERT INTO `user_roles` VALUES ('0c02f718ae1845cfa87c1c907dd2f82c', '2', 'b68eb29a93304c059c8bfda78e1dfc4e');
INSERT INTO `user_roles` VALUES ('1', '1', '1');
INSERT INTO `user_roles` VALUES ('32a6565803fa49fba8ebf989c5d4cef3', '3', '6bd1388b528f42e29441495a6d7a5387');
INSERT INTO `user_roles` VALUES ('5c580803c6ef40d09b797ad5b435abab', '2', 'b4bf67c3f035421188c2d7bc590e5fc6');
INSERT INTO `user_roles` VALUES ('645c8e928858439c829bb11849a94d31', '1', 'f9d735eeeee84930b5223862b87cc75b');
INSERT INTO `user_roles` VALUES ('8584871908ca40a191cc491ac1bc1fb6', '3', 'd3c20dd6863945649c2c4a6e730e4cb2');
INSERT INTO `user_roles` VALUES ('88e587da7bb44aa79694a6288b031035', '2', '83794fe9dc3b4cf7aa5367eb5666039d');
INSERT INTO `user_roles` VALUES ('930b29436e0948f497dc87734001cef3', '1', '39a43d8647c947e4b06b440e3e84aafe');
INSERT INTO `user_roles` VALUES ('9951dce2ecd84418b8f6f147f3b9172f', '1', 'cfc6414e5060410c8faf6c49bcfdfe74');
INSERT INTO `user_roles` VALUES ('af340ca55a4b4c25ad302f7e99cc0c8e', '1', '949b51098081435eb7f72cf2e8042451');
INSERT INTO `user_roles` VALUES ('d035ec0f21ab422bb529db72d2e6d01e', '3', 'bdac485e59b5407ba16d6ec2dabeece3');
INSERT INTO `user_roles` VALUES ('d7de8ba77b184f85ba9ea8b42cab0ea5', '1', 'd45bbde8acb4461082117593649c9d59');
