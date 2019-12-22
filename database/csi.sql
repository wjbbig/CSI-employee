/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : csi

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 22/12/2019 15:05:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dept_nameDesc`(`name`, `dept_desc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (8, '客服部', '主要负责客户维护，解答疑问等工作');
INSERT INTO `dept_inf` VALUES (7, '市场部', '市场是个大的方向，具体可以有推广、商务、媒介、电话营销等岗位');
INSERT INTO `dept_inf` VALUES (2, '测试部', '也属于技术岗，通过相关的程序查找产品中相应的bug，相应的基础和经验当然也是需要的');
INSERT INTO `dept_inf` VALUES (1, '研发部', '技术岗，需要有相关的学习基础，也有其它专业参加了培训班之后做研发工作的，因人而异，看水平、兴趣和实力');
INSERT INTO `dept_inf` VALUES (6, '编辑部', '网站内容的整理，格式规范化，增加新的内容');
INSERT INTO `dept_inf` VALUES (3, '设计部', '网页设计、美工等，需要有点美术素养，ps/dw等相关软件的使用技巧');
INSERT INTO `dept_inf` VALUES (5, '运营部', '网站的运作和营销，网站活动、内容安排、用户分析等等大大小小的事，对专业限制不大');

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `document_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `document_inf_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (2, 'JAVA作业', '4d3c8bf6-7a5c-44ee-8044-6d875fc3b5d3.docx', '9.18号晚间作业', '2019年09月19日', 13);
INSERT INTO `document_inf` VALUES (6, '', 'eac8c9e7-f67d-4767-b7bb-32c7255b6353.docx', '', '2019年12月03日', 13);

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `degree` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `employee_inf_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_inf_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (3, '吴彦祖', '123456789123456789', '123456', '123456', '12345678912', '1234123456', 'qwerty@qq.com', '1', '3', '2019年09月01日', '汉', '6', '计算机', '吃饭', 'qqqq', 1, 2);

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dept_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `job_inf_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '测试工程师', '对被测试软件进行配置管理和版本控制，记录系统升级时间，升级次数等', 2);
INSERT INTO `job_inf` VALUES (2, '高级测试工程师', '辅助测试组 长 完成小组年度计划并执行\n辅助测试 组长 进行项目分析、制定测试计划和测试方案\n负责项目中具体业务的分析、整理，辅助测试工程师进行测试需求分析\n提供测试工程师业务培训和指导、答疑\n负责测试过程中与项目组成员的沟通\n对整个项目的质量进行监督和控制\n对测试过程产生的文档进行管理和版本控制\n有义务对项目工作提出建设性建议\n有义务对测试小组长提出建设性建议\n', 2);

-- ----------------------------
-- Table structure for notice_inf
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `notice_inf_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES (1, '国庆放假通知', '国庆放假按照国家规定，从1号到7号，8号正常上班。\n国庆加班双倍工资，夜宵正常提供', '2019年09月20日', 13);

-- ----------------------------
-- Table structure for permission_inf
-- ----------------------------
DROP TABLE IF EXISTS `permission_inf`;
CREATE TABLE `permission_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NULL DEFAULT NULL,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_inf
-- ----------------------------
INSERT INTO `permission_inf` VALUES (1, NULL, '用户管理', NULL);
INSERT INTO `permission_inf` VALUES (2, 1, '用户查询', 'user/toIndx.go');
INSERT INTO `permission_inf` VALUES (3, 1, '添加用户', 'user/toAddUser.go');
INSERT INTO `permission_inf` VALUES (4, NULL, '部门管理', NULL);
INSERT INTO `permission_inf` VALUES (5, 4, '部门查询', 'dept/toIndex.go');
INSERT INTO `permission_inf` VALUES (6, 4, '添加部门', 'dept/toAddDept.go');
INSERT INTO `permission_inf` VALUES (7, NULL, '职位管理', NULL);
INSERT INTO `permission_inf` VALUES (8, 7, '职位查询', 'job/toIndex.go');
INSERT INTO `permission_inf` VALUES (9, 7, '添加职位', 'job/toIndex.go');
INSERT INTO `permission_inf` VALUES (10, NULL, '员工管理', NULL);
INSERT INTO `permission_inf` VALUES (11, 10, '员工查询', 'emp/toIndex.go');
INSERT INTO `permission_inf` VALUES (12, 10, '添加员工', 'emp/toAddEmployee.go');
INSERT INTO `permission_inf` VALUES (13, NULL, '公告管理', NULL);
INSERT INTO `permission_inf` VALUES (14, 13, '公告查询', 'notice/toIndex.go');
INSERT INTO `permission_inf` VALUES (15, 13, '添加公告', 'notice/toAddNotice.go');
INSERT INTO `permission_inf` VALUES (16, NULL, '下载中心', NULL);
INSERT INTO `permission_inf` VALUES (17, 16, '文档查询', 'document/toIndex.go');
INSERT INTO `permission_inf` VALUES (18, 16, '上传文档', 'document/toAddDocument.go');
INSERT INTO `permission_inf` VALUES (19, NULL, '权限管理', NULL);
INSERT INTO `permission_inf` VALUES (22, 19, '角色查询', 'role/toIndex.go');
INSERT INTO `permission_inf` VALUES (23, 19, '权限查询', 'permission/toIndex.go');

-- ----------------------------
-- Table structure for role_inf
-- ----------------------------
DROP TABLE IF EXISTS `role_inf`;
CREATE TABLE `role_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_inf
-- ----------------------------
INSERT INTO `role_inf` VALUES (1, '超级管理员');
INSERT INTO `role_inf` VALUES (2, '普通用户');
INSERT INTO `role_inf` VALUES (3, '无权测试A用户');

-- ----------------------------
-- Table structure for role_permission_inf
-- ----------------------------
DROP TABLE IF EXISTS `role_permission_inf`;
CREATE TABLE `role_permission_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `permission_id`(`permission_id`) USING BTREE,
  CONSTRAINT `role_permission_inf_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_permission_inf_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission_inf
-- ----------------------------
INSERT INTO `role_permission_inf` VALUES (10, 1, 1);
INSERT INTO `role_permission_inf` VALUES (11, 1, 2);
INSERT INTO `role_permission_inf` VALUES (12, 1, 3);
INSERT INTO `role_permission_inf` VALUES (13, 1, 4);
INSERT INTO `role_permission_inf` VALUES (14, 1, 5);
INSERT INTO `role_permission_inf` VALUES (15, 1, 6);
INSERT INTO `role_permission_inf` VALUES (16, 1, 7);
INSERT INTO `role_permission_inf` VALUES (17, 1, 8);
INSERT INTO `role_permission_inf` VALUES (18, 1, 9);
INSERT INTO `role_permission_inf` VALUES (19, 1, 10);
INSERT INTO `role_permission_inf` VALUES (20, 1, 11);
INSERT INTO `role_permission_inf` VALUES (21, 1, 12);
INSERT INTO `role_permission_inf` VALUES (22, 1, 13);
INSERT INTO `role_permission_inf` VALUES (23, 1, 14);
INSERT INTO `role_permission_inf` VALUES (24, 1, 15);
INSERT INTO `role_permission_inf` VALUES (25, 1, 16);
INSERT INTO `role_permission_inf` VALUES (26, 1, 17);
INSERT INTO `role_permission_inf` VALUES (27, 1, 18);
INSERT INTO `role_permission_inf` VALUES (28, 1, 19);
INSERT INTO `role_permission_inf` VALUES (29, 1, 22);
INSERT INTO `role_permission_inf` VALUES (30, 1, 23);
INSERT INTO `role_permission_inf` VALUES (45, 2, 1);
INSERT INTO `role_permission_inf` VALUES (46, 2, 2);
INSERT INTO `role_permission_inf` VALUES (47, 2, 4);
INSERT INTO `role_permission_inf` VALUES (48, 2, 5);
INSERT INTO `role_permission_inf` VALUES (49, 2, 7);
INSERT INTO `role_permission_inf` VALUES (50, 2, 8);
INSERT INTO `role_permission_inf` VALUES (51, 2, 10);
INSERT INTO `role_permission_inf` VALUES (52, 2, 11);
INSERT INTO `role_permission_inf` VALUES (53, 2, 13);
INSERT INTO `role_permission_inf` VALUES (54, 2, 14);
INSERT INTO `role_permission_inf` VALUES (55, 2, 16);
INSERT INTO `role_permission_inf` VALUES (56, 2, 17);

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (13, 'superadmin', 'e10adc3949ba59abbe56e057f20f883e', '2019-09-17 16:17:51', 'admin');
INSERT INTO `user_inf` VALUES (14, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2019-09-17 16:19:43', 'admin2');
INSERT INTO `user_inf` VALUES (15, 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '2019-09-17 16:22:54', '哈哈哈嘿嘿嘿');

-- ----------------------------
-- Table structure for user_role_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_role_inf`;
CREATE TABLE `user_role_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userrole_userId`(`user_id`) USING BTREE,
  INDEX `idx_userrole_roleId`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role_inf
-- ----------------------------
INSERT INTO `user_role_inf` VALUES (3, 13, 1);
INSERT INTO `user_role_inf` VALUES (4, 14, 2);
INSERT INTO `user_role_inf` VALUES (5, 15, 2);

SET FOREIGN_KEY_CHECKS = 1;
