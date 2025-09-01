/*
 Navicat Premium Dump SQL

 Source Server         : 6.25im-new
 Source Server Type    : MySQL
 Source Server Version : 80024 (8.0.24)
 Source Host           : 150.109.148.67:3306
 Source Schema         : xad_xprojectcs_c

 Target Server Type    : MySQL
 Target Server Version : 80024 (8.0.24)
 File Encoding         : 65001

 Date: 01/09/2025 11:34:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wa_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_admin_roles`;
CREATE TABLE `wa_admin_roles` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int NOT NULL COMMENT '角色id',
  `admin_id` int NOT NULL COMMENT '管理员id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `role_admin_id` (`role_id`,`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色表';

-- ----------------------------
-- Records of wa_admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `wa_admin_roles` (`id`, `role_id`, `admin_id`) VALUES (1, 1, 1);
INSERT INTO `wa_admin_roles` (`id`, `role_id`, `admin_id`) VALUES (2, 2, 2);
COMMIT;

-- ----------------------------
-- Table structure for wa_admins
-- ----------------------------
DROP TABLE IF EXISTS `wa_admins`;
CREATE TABLE `wa_admins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/app/admin/avatar.png' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `status` tinyint DEFAULT NULL COMMENT '禁用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员表';

-- ----------------------------
-- Records of wa_admins
-- ----------------------------
BEGIN;
INSERT INTO `wa_admins` (`id`, `username`, `nickname`, `password`, `avatar`, `email`, `mobile`, `created_at`, `updated_at`, `login_at`, `status`) VALUES (1, 'admin', '超级管理员', '$2y$10$u8iqcCXgg8yEskXJLZH9ausf8xhX5kVwOpvD6OA7IvdxJoLwWK1mW', '/app/admin/avatar.png', NULL, NULL, '2025-07-23 15:52:19', '2025-08-29 15:59:24', '2025-08-29 15:59:24', NULL);
INSERT INTO `wa_admins` (`id`, `username`, `nickname`, `password`, `avatar`, `email`, `mobile`, `created_at`, `updated_at`, `login_at`, `status`) VALUES (2, 'guanliyuan', '管理员', '$2y$10$0PWqCIYt1C68g/GiZSZ2kecCS6zACwYlYeIUMK4FVaEmir5EFJONm', '/app/admin/avatar.png', '', '', '2025-08-19 10:41:15', '2025-08-28 17:37:12', '2025-08-28 17:37:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for wa_advice
-- ----------------------------
DROP TABLE IF EXISTS `wa_advice`;
CREATE TABLE `wa_advice` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int unsigned NOT NULL DEFAULT '0' COMMENT '用户',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '图片',
  `truename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='意见反馈';

-- ----------------------------
-- Records of wa_advice
-- ----------------------------
BEGIN;
INSERT INTO `wa_advice` (`id`, `user_id`, `class_name`, `content`, `images`, `truename`, `mobile`, `created_at`, `updated_at`) VALUES (1, 1, '分类1', '123123', '/app/admin/upload/img/20250222/67b9a1fc6360.jpg', NULL, NULL, '2025-02-22 18:07:57', '2025-02-22 18:07:57');
INSERT INTO `wa_advice` (`id`, `user_id`, `class_name`, `content`, `images`, `truename`, `mobile`, `created_at`, `updated_at`) VALUES (2, 2, '分类1', '1111', '/app/admin/upload/img/20250419/680375411f85.png,/app/admin/upload/img/20250419/68037545bb18.jpg', '156', '15638187275', '2025-04-19 18:05:00', '2025-04-19 18:05:00');
INSERT INTO `wa_advice` (`id`, `user_id`, `class_name`, `content`, `images`, `truename`, `mobile`, `created_at`, `updated_at`) VALUES (3, 1, 'n你好你好', '123456', '/app/admin/upload/img/20250731/688b1cc5c9f6.png,/app/admin/upload/img/20250731/688b1cd04a2a.png,', '段', '123456789', '2025-07-31 15:35:55', '2025-07-31 15:35:55');
COMMIT;

-- ----------------------------
-- Table structure for wa_advice_class
-- ----------------------------
DROP TABLE IF EXISTS `wa_advice_class`;
CREATE TABLE `wa_advice_class` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='意见反馈分类';

-- ----------------------------
-- Records of wa_advice_class
-- ----------------------------
BEGIN;
INSERT INTO `wa_advice_class` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'n你好你好', NULL, NULL);
INSERT INTO `wa_advice_class` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, '2222', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for wa_favorites
-- ----------------------------
DROP TABLE IF EXISTS `wa_favorites`;
CREATE TABLE `wa_favorites` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_Id` int NOT NULL COMMENT '用户',
  `chat_type` tinyint(1) NOT NULL COMMENT '1=单聊 2=群聊',
  `msg_type` tinyint NOT NULL COMMENT '1=文本 2=图片 3=语音 4=视频 5=文件 6=聊天记录',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '文本内容或文件信息(JSON)',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '本地/对象存储的文件路径',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收藏';

-- ----------------------------
-- Records of wa_favorites
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_options
-- ----------------------------
DROP TABLE IF EXISTS `wa_options`;
CREATE TABLE `wa_options` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  `created_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '2022-08-15 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='选项表';

-- ----------------------------
-- Records of wa_options
-- ----------------------------
BEGIN;
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (1, 'system_config', '{\"logo\":{\"title\":\"Webman Admin\",\"image\":\"\\/app\\/admin\\/admin\\/images\\/logo.png\"},\"menu\":{\"data\":\"\\/app\\/admin\\/rule\\/get\",\"method\":\"GET\",\"accordion\":true,\"collapse\":false,\"control\":false,\"controlWidth\":500,\"select\":\"0\",\"async\":true},\"tab\":{\"enable\":true,\"keepState\":true,\"preload\":false,\"session\":true,\"max\":\"30\",\"index\":{\"id\":\"0\",\"href\":\"\\/app\\/admin\\/index\\/dashboard\",\"title\":\"\\u4eea\\u8868\\u76d8\"}},\"theme\":{\"defaultColor\":\"2\",\"defaultMenu\":\"light-theme\",\"defaultHeader\":\"light-theme\",\"allowCustom\":true,\"banner\":false},\"colors\":[{\"id\":\"1\",\"color\":\"#36b368\",\"second\":\"#f0f9eb\"},{\"id\":\"2\",\"color\":\"#2d8cf0\",\"second\":\"#ecf5ff\"},{\"id\":\"3\",\"color\":\"#f6ad55\",\"second\":\"#fdf6ec\"},{\"id\":\"4\",\"color\":\"#f56c6c\",\"second\":\"#fef0f0\"},{\"id\":\"5\",\"color\":\"#3963bc\",\"second\":\"#ecf5ff\"}],\"other\":{\"keepLoad\":\"500\",\"autoHead\":false,\"footer\":false},\"header\":{\"message\":false},\"rule\":{\"privacy_policy\":\"<p><span style=\\\"font-size: 24px; font-family: -apple-system, BlinkMacSystemFont, \'Helvetica Neue\', Arial, sans-serif;\\\">\\u9690\\u79c1\\u653f\\u7b56<\\/span><\\/p>\\n<div class=\\\"container\\\"><header>\\n<div class=\\\"meta\\\">\\u751f\\u6548\\u65e5\\u671f\\uff1a<strong>2025-08-12<\\/strong><\\/div>\\n<\\/header>\\n<section>\\n<h2>1. \\u5f15\\u8a00<\\/h2>\\n<p>\\u6211\\u4eec\\uff08&ldquo;\\u672c\\u516c\\u53f8&rdquo;\\u6216&ldquo;\\u6211\\u4eec&rdquo;\\uff09\\u91cd\\u89c6\\u60a8\\u7684\\u9690\\u79c1\\u3002\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u8bf4\\u660e\\u6211\\u4eec\\u5982\\u4f55\\u6536\\u96c6\\u3001\\u4f7f\\u7528\\u3001\\u5b58\\u50a8\\u548c\\u62ab\\u9732\\u60a8\\u5728\\u4f7f\\u7528\\u6211\\u4eec\\u7684\\u7f51\\u7ad9\\u6216\\u670d\\u52a1\\u65f6\\u63d0\\u4f9b\\u6216\\u4ea7\\u751f\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>2. \\u6211\\u4eec\\u6536\\u96c6\\u7684\\u4fe1\\u606f<\\/h2>\\n<ul>\\n<li><strong>\\u8d26\\u6237\\u4fe1\\u606f\\uff1a<\\/strong>\\u59d3\\u540d\\u3001\\u90ae\\u7bb1\\u3001\\u7535\\u8bdd\\u53f7\\u7801\\u3001\\u7528\\u6237\\u540d\\u3001\\u5bc6\\u7801\\u7b49\\u3002<\\/li>\\n<li><strong>\\u4f7f\\u7528\\u6570\\u636e\\uff1a<\\/strong>\\u8bbf\\u95ee\\u65e5\\u5fd7\\u3001IP \\u5730\\u5740\\u3001\\u8bbe\\u5907\\u4fe1\\u606f\\u3001\\u6d4f\\u89c8\\u884c\\u4e3a\\u3001\\u529f\\u80fd\\u4f7f\\u7528\\u60c5\\u51b5\\u7b49\\u3002<\\/li>\\n<li><strong>\\u652f\\u4ed8\\u4fe1\\u606f\\uff1a<\\/strong>\\u7528\\u4e8e\\u4ea4\\u6613\\u7684\\u5fc5\\u8981\\u4fe1\\u606f\\uff08\\u6211\\u4eec\\u53ef\\u80fd\\u901a\\u8fc7\\u7b2c\\u4e09\\u65b9\\u652f\\u4ed8\\u670d\\u52a1\\u5546\\u5904\\u7406\\uff0c\\u5177\\u4f53\\u89c1\\u4e0b\\u6587\\uff09\\u3002<\\/li>\\n<li><strong>\\u5176\\u4ed6\\u4fe1\\u606f\\uff1a<\\/strong>\\u60a8\\u4e3b\\u52a8\\u63d0\\u4f9b\\u7684\\u53cd\\u9988\\u3001\\u5ba2\\u670d\\u8bb0\\u5f55\\u7b49\\u3002<\\/li>\\n<\\/ul>\\n<\\/section>\\n<section>\\n<h2>3. \\u4fe1\\u606f\\u7684\\u4f7f\\u7528\\u76ee\\u7684<\\/h2>\\n<p>\\u6211\\u4eec\\u4f1a\\u5728\\u4e0b\\u5217\\u76ee\\u7684\\u8303\\u56f4\\u5185\\u4f7f\\u7528\\u60a8\\u7684\\u4fe1\\u606f\\uff1a<\\/p>\\n<ul>\\n<li>\\u4e3a\\u60a8\\u63d0\\u4f9b\\u3001\\u7ef4\\u62a4\\u548c\\u6539\\u8fdb\\u670d\\u52a1\\uff1b<\\/li>\\n<li>\\u8fdb\\u884c\\u5ba2\\u6237\\u652f\\u6301\\u548c\\u6545\\u969c\\u5904\\u7406\\uff1b<\\/li>\\n<li>\\u9632\\u6b62\\u6b3a\\u8bc8\\u5e76\\u4fdd\\u969c\\u670d\\u52a1\\u5b89\\u5168\\uff1b<\\/li>\\n<li>\\u6ee1\\u8db3\\u6cd5\\u5f8b\\u3001\\u76d1\\u7ba1\\u6216\\u5408\\u89c4\\u8981\\u6c42\\uff1b<\\/li>\\n<li>\\u5728\\u83b7\\u5f97\\u8bb8\\u53ef\\u7684\\u60c5\\u51b5\\u4e0b\\uff0c\\u7528\\u4e8e\\u8425\\u9500\\u548c\\u4e2a\\u6027\\u5316\\u63a8\\u8350\\u3002<\\/li>\\n<\\/ul>\\n<\\/section>\\n<section>\\n<h2>4. \\u4fe1\\u606f\\u5171\\u4eab\\u4e0e\\u62ab\\u9732<\\/h2>\\n<p>\\u6211\\u4eec\\u4e0d\\u4f1a\\u5728\\u672a\\u7ecf\\u60a8\\u540c\\u610f\\u7684\\u60c5\\u51b5\\u4e0b\\u5c06\\u60a8\\u7684\\u4e2a\\u4eba\\u4fe1\\u606f\\u51fa\\u552e\\u7ed9\\u7b2c\\u4e09\\u65b9\\u3002\\u4f46\\u5728\\u4ee5\\u4e0b\\u60c5\\u5f62\\u4e2d\\u6211\\u4eec\\u53ef\\u80fd\\u4f1a\\u62ab\\u9732\\u4fe1\\u606f\\uff1a<\\/p>\\n<ul>\\n<li>\\u4e0e\\u670d\\u52a1\\u63d0\\u4f9b\\u5546\\uff08\\u5982\\u4e91\\u670d\\u52a1\\u3001\\u652f\\u4ed8\\u5904\\u7406\\u3001\\u5206\\u6790\\u4f9b\\u5e94\\u5546\\uff09\\u5171\\u4eab\\u4ee5\\u4fbf\\u63d0\\u4f9b\\u670d\\u52a1\\uff1b<\\/li>\\n<li>\\u4f9d\\u6cd5\\u8981\\u6c42\\u65f6\\uff08\\u5982\\u6cd5\\u9662\\u3001\\u76d1\\u7ba1\\u673a\\u6784\\uff09\\uff1b<\\/li>\\n<li>\\u4e3a\\u4fdd\\u62a4\\u6211\\u4eec\\u7684\\u6743\\u5229\\u3001\\u8d22\\u4ea7\\u6216\\u5b89\\u5168\\uff0c\\u6216\\u4fdd\\u62a4\\u7528\\u6237\\u6216\\u516c\\u4f17\\u5b89\\u5168\\u7684\\u5fc5\\u8981\\u62ab\\u9732\\u3002<\\/li>\\n<\\/ul>\\n<\\/section>\\n<section>\\n<h2>5. Cookie \\u4e0e\\u7c7b\\u4f3c\\u6280\\u672f<\\/h2>\\n<p>\\u6211\\u4eec\\u53ca\\u5408\\u4f5c\\u4f19\\u4f34\\u53ef\\u80fd\\u4f7f\\u7528 Cookie\\u3001localStorage\\u3001Web Beacon \\u7b49\\u6280\\u672f\\u6765\\u6536\\u96c6\\u548c\\u5b58\\u50a8\\u4fe1\\u606f\\uff0c\\u7528\\u4e8e\\u7ef4\\u62a4\\u767b\\u5f55\\u72b6\\u6001\\u3001\\u5206\\u6790\\u6d41\\u91cf\\u548c\\u4e2a\\u6027\\u5316\\u4f53\\u9a8c\\u3002\\u60a8\\u53ef\\u4ee5\\u901a\\u8fc7\\u6d4f\\u89c8\\u5668\\u8bbe\\u7f6e\\u7ba1\\u7406\\u6216\\u62d2\\u7edd Cookie\\uff0c\\u4f46\\u8fd9\\u53ef\\u80fd\\u5f71\\u54cd\\u90e8\\u5206\\u529f\\u80fd\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>6. \\u4fe1\\u606f\\u4fdd\\u7559<\\/h2>\\n<p>\\u6211\\u4eec\\u4ec5\\u5728\\u5b9e\\u73b0\\u6536\\u96c6\\u76ee\\u7684\\u6240\\u9700\\u65f6\\u95f4\\u5185\\u6216\\u4e3a\\u9075\\u5b88\\u6cd5\\u5f8b\\u4e49\\u52a1\\u3001\\u89e3\\u51b3\\u7ea0\\u7eb7\\u548c\\u6267\\u884c\\u534f\\u8bae\\u6240\\u9700\\u7684\\u5408\\u7406\\u671f\\u9650\\u5185\\u4fdd\\u7559\\u60a8\\u7684\\u4fe1\\u606f\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>7. \\u60a8\\u7684\\u6743\\u5229<\\/h2>\\n<p>\\u5728\\u9002\\u7528\\u6cd5\\u5f8b\\u8303\\u56f4\\u5185\\uff0c\\u60a8\\u53ef\\u80fd\\u4eab\\u6709\\u8bbf\\u95ee\\u3001\\u66f4\\u6b63\\u3001\\u5220\\u9664\\u3001\\u9650\\u5236\\u5904\\u7406\\u3001\\u6570\\u636e\\u4fbf\\u643a\\u3001\\u64a4\\u56de\\u540c\\u610f\\u7b49\\u6743\\u5229\\u3002\\u82e5\\u8981\\u884c\\u4f7f\\u8fd9\\u4e9b\\u6743\\u5229\\uff0c\\u8bf7\\u8054\\u7cfb\\u6211\\u4eec\\uff08\\u89c1\\u4e0b\\u6587\\uff09\\u3002\\u6211\\u4eec\\u5c06\\u6839\\u636e\\u9002\\u7528\\u6cd5\\u5f8b\\u9a8c\\u8bc1\\u8eab\\u4efd\\u5e76\\u5904\\u7406\\u8bf7\\u6c42\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>8. \\u6570\\u636e\\u5b89\\u5168<\\/h2>\\n<p>\\u6211\\u4eec\\u91c7\\u53d6\\u5408\\u7406\\u7684\\u6280\\u672f\\u548c\\u7ec4\\u7ec7\\u63aa\\u65bd\\u4fdd\\u62a4\\u4e2a\\u4eba\\u4fe1\\u606f\\u7684\\u5b89\\u5168\\uff0c\\u4f46\\u8bf7\\u6ce8\\u610f\\u4efb\\u4f55\\u4e92\\u8054\\u7f51\\u4f20\\u8f93\\u6216\\u7535\\u5b50\\u5b58\\u50a8\\u65b9\\u5f0f\\u90fd\\u65e0\\u6cd5\\u505a\\u5230\\u7edd\\u5bf9\\u5b89\\u5168\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>9. \\u672a\\u6210\\u5e74\\u4eba<\\/h2>\\n<p>\\u6211\\u4eec\\u7684\\u670d\\u52a1\\u5e76\\u975e\\u9762\\u5411\\u672a\\u6ee118\\u5468\\u5c81\\u7684\\u672a\\u6210\\u5e74\\u4eba\\u3002\\u5982\\u53d1\\u73b0\\u672a\\u6210\\u5e74\\u4eba\\u63d0\\u4f9b\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u6211\\u4eec\\u4f1a\\u91c7\\u53d6\\u63aa\\u65bd\\u4e88\\u4ee5\\u5220\\u9664\\uff0c\\u9664\\u975e\\u6709\\u6cd5\\u5b9a\\u5141\\u8bb8\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>10. \\u672c\\u653f\\u7b56\\u7684\\u66f4\\u65b0<\\/h2>\\n<p>\\u6211\\u4eec\\u53ef\\u80fd\\u4f1a\\u4e0d\\u65f6\\u66f4\\u65b0\\u672c\\u9690\\u79c1\\u653f\\u7b56\\uff0c\\u53d8\\u66f4\\u5c06\\u901a\\u8fc7\\u5728\\u672c\\u9875\\u53d1\\u5e03\\u66f4\\u65b0\\u540e\\u7684\\u7248\\u672c\\u5e76\\u6ce8\\u660e\\u751f\\u6548\\u65e5\\u671f\\u7684\\u65b9\\u5f0f\\u544a\\u77e5\\u3002\\u8bf7\\u5b9a\\u671f\\u67e5\\u770b\\u4ee5\\u4e86\\u89e3\\u6700\\u65b0\\u6761\\u6b3e\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>11. \\u8054\\u7cfb\\u6211\\u4eec<\\/h2>\\n<p>\\u5982\\u5bf9\\u672c\\u9690\\u79c1\\u653f\\u7b56\\u6709\\u7591\\u95ee\\u6216\\u9700\\u884c\\u4f7f\\u6743\\u5229\\uff0c\\u8bf7\\u8054\\u7cfb\\uff1a<br \\/>\\u7535\\u5b50\\u90ae\\u7bb1\\uff1a<strong>spicjoyc1989@icloud.com<\\/strong><\\/p>\\n<\\/section>\\n<section>\\n<h2>12. \\u6280\\u672f\\u652f\\u6301\\u7f51\\u5740<\\/h2>\\n<p>https:\\/\\/www.baidu.com<\\/p>\\n<\\/section>\\n<footer>\\n<p>&copy; \\u672c\\u516c\\u53f8\\u3002\\u4fdd\\u7559\\u6240\\u6709\\u6743\\u5229\\u3002<\\/p>\\n<\\/footer><\\/div>\",\"user_agreement\":\"<p><span style=\\\"font-size: 24px; font-family: -apple-system, BlinkMacSystemFont, \'Helvetica Neue\', Arial, sans-serif;\\\">\\u7528\\u6237\\u534f\\u8bae<\\/span><\\/p>\\n<div class=\\\"container\\\"><header>\\n<div class=\\\"meta\\\">\\u751f\\u6548\\u65e5\\u671f\\uff1a<strong>2025-08-12<\\/strong><\\/div>\\n<\\/header>\\n<section>\\n<h2>1. \\u534f\\u8bae\\u8303\\u56f4\\u4e0e\\u63a5\\u53d7<\\/h2>\\n<p>\\u672c\\u7528\\u6237\\u534f\\u8bae\\uff08\\u4ee5\\u4e0b\\u7b80\\u79f0&ldquo;\\u672c\\u534f\\u8bae&rdquo;\\uff09\\u9002\\u7528\\u4e8e\\u60a8\\u4f7f\\u7528\\u7531\\u672c\\u516c\\u53f8\\u63d0\\u4f9b\\u7684\\u5168\\u90e8\\u4ea7\\u54c1\\u4e0e\\u670d\\u52a1\\u3002\\u6ce8\\u518c\\u3001\\u767b\\u5f55\\u6216\\u4ee5\\u5176\\u4ed6\\u65b9\\u5f0f\\u4f7f\\u7528\\u672c\\u670d\\u52a1\\u5373\\u8868\\u793a\\u60a8\\u5df2\\u9605\\u8bfb\\u5e76\\u540c\\u610f\\u53d7\\u672c\\u534f\\u8bae\\u7ea6\\u675f\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>2. \\u670d\\u52a1\\u5185\\u5bb9<\\/h2>\\n<p>\\u672c\\u516c\\u53f8\\u6839\\u636e\\u672c\\u534f\\u8bae\\u53ca\\u76f8\\u5173\\u8bf4\\u660e\\u5411\\u60a8\\u63d0\\u4f9b\\u5728\\u7ebf\\u670d\\u52a1\\uff0c\\u670d\\u52a1\\u5185\\u5bb9\\u53ef\\u80fd\\u5305\\u62ec\\u5e73\\u53f0\\u529f\\u80fd\\u3001\\u6280\\u672f\\u652f\\u6301\\u3001\\u6570\\u636e\\u5b58\\u50a8\\u4e0e\\u7b2c\\u4e09\\u65b9\\u96c6\\u6210\\u7b49\\u3002\\u6211\\u4eec\\u6709\\u6743\\u5728\\u5408\\u7406\\u8303\\u56f4\\u5185\\u53d8\\u66f4\\u3001\\u6682\\u505c\\u6216\\u7ec8\\u6b62\\u670d\\u52a1\\u5e76\\u63d0\\u524d\\u516c\\u544a\\uff08\\u5982\\u9002\\u7528\\uff09\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>3. \\u8d26\\u6237\\u4e0e\\u6ce8\\u518c\\u4e49\\u52a1<\\/h2>\\n<ul>\\n<li>\\u60a8\\u5e94\\u63d0\\u4f9b\\u771f\\u5b9e\\u3001\\u5b8c\\u6574\\u3001\\u51c6\\u786e\\u7684\\u8d26\\u6237\\u4fe1\\u606f\\u5e76\\u53ca\\u65f6\\u66f4\\u65b0\\uff1b<\\/li>\\n<li>\\u60a8\\u6709\\u4e49\\u52a1\\u59a5\\u5584\\u4fdd\\u7ba1\\u8d26\\u6237\\u51ed\\u8bc1\\u5e76\\u5bf9\\u8d26\\u6237\\u4e0b\\u7684\\u6240\\u6709\\u6d3b\\u52a8\\u8d1f\\u8d23\\uff1b<\\/li>\\n<li>\\u82e5\\u53d1\\u73b0\\u672a\\u7ecf\\u6388\\u6743\\u7684\\u4f7f\\u7528\\uff0c\\u5e94\\u7acb\\u5373\\u901a\\u77e5\\u6211\\u4eec\\u3002<\\/li>\\n<\\/ul>\\n<\\/section>\\n<section>\\n<h2>4. \\u7528\\u6237\\u884c\\u4e3a\\u89c4\\u8303<\\/h2>\\n<p>\\u60a8\\u5728\\u4f7f\\u7528\\u670d\\u52a1\\u65f6\\u5e94\\u9075\\u5b88\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u53ca\\u672c\\u534f\\u8bae\\uff0c\\u4e0d\\u5f97\\u5229\\u7528\\u670d\\u52a1\\u4ece\\u4e8b\\u8fdd\\u6cd5\\u6216\\u4fb5\\u6743\\u6d3b\\u52a8\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\uff1a<\\/p>\\n<ul>\\n<li>\\u4e0a\\u4f20\\u3001\\u53d1\\u5e03\\u8fdd\\u53cd\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u6216\\u4fb5\\u72af\\u4ed6\\u4eba\\u6743\\u5229\\u7684\\u5185\\u5bb9\\uff1b<\\/li>\\n<li>\\u4f20\\u64ad\\u6076\\u610f\\u8f6f\\u4ef6\\u3001\\u5783\\u573e\\u4fe1\\u606f\\u6216\\u8fdb\\u884c\\u7f51\\u7edc\\u653b\\u51fb\\uff1b<\\/li>\\n<li>\\u4ee5\\u672a\\u7ecf\\u6388\\u6743\\u7684\\u65b9\\u5f0f\\u8bbf\\u95ee\\u3001\\u5e72\\u6270\\u4ed6\\u4eba\\u8d26\\u6237\\u6216\\u670d\\u52a1\\u3002<\\/li>\\n<\\/ul>\\n<\\/section>\\n<section>\\n<h2>5. \\u77e5\\u8bc6\\u4ea7\\u6743<\\/h2>\\n<p>\\u9664\\u975e\\u53e6\\u6709\\u8bf4\\u660e\\uff0c\\u670d\\u52a1\\u4e2d\\u6240\\u6709\\u5185\\u5bb9\\u7684\\u8457\\u4f5c\\u6743\\u3001\\u5546\\u6807\\u6743\\u7b49\\u77e5\\u8bc6\\u4ea7\\u6743\\u5c5e\\u4e8e\\u672c\\u516c\\u53f8\\u6216\\u6743\\u5229\\u4eba\\u3002\\u672a\\u7ecf\\u6388\\u6743\\uff0c\\u4e0d\\u5f97\\u64c5\\u81ea\\u590d\\u5236\\u3001\\u4f20\\u64ad\\u6216\\u7528\\u4e8e\\u5546\\u4e1a\\u7528\\u9014\\u3002\\u60a8\\u5bf9\\u81ea\\u5df1\\u4e0a\\u4f20\\u7684\\u5185\\u5bb9\\u4fdd\\u7559\\u6743\\u5229\\uff0c\\u4f46\\u6388\\u4e88\\u672c\\u516c\\u53f8\\u5728\\u670d\\u52a1\\u8303\\u56f4\\u5185\\u5fc5\\u8981\\u7684\\u8bb8\\u53ef\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>6. \\u514d\\u8d23\\u58f0\\u660e\\u4e0e\\u8d23\\u4efb\\u9650\\u5236<\\/h2>\\n<p>\\u5728\\u6cd5\\u5f8b\\u5141\\u8bb8\\u7684\\u6700\\u5927\\u8303\\u56f4\\u5185\\uff0c\\u672c\\u516c\\u53f8\\u5bf9\\u56e0\\u4f7f\\u7528\\u6216\\u65e0\\u6cd5\\u4f7f\\u7528\\u670d\\u52a1\\u6240\\u4ea7\\u751f\\u7684\\u635f\\u5931\\u4e0d\\u627f\\u62c5\\u8d23\\u4efb\\uff08\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u6570\\u636e\\u4e22\\u5931\\u3001\\u4e1a\\u52a1\\u4e2d\\u65ad\\uff09\\u3002\\u5bf9\\u4e8e\\u56e0\\u7b2c\\u4e09\\u65b9\\u670d\\u52a1\\u5bfc\\u81f4\\u7684\\u635f\\u5931\\uff0c\\u6211\\u4eec\\u4e5f\\u4e0d\\u627f\\u62c5\\u8fde\\u5e26\\u8d23\\u4efb\\u3002\\u82e5\\u56e0\\u6211\\u4eec\\u8fdd\\u53cd\\u6cd5\\u5f8b\\u6216\\u534f\\u8bae\\u9020\\u6210\\u76f4\\u63a5\\u635f\\u5931\\uff0c\\u6211\\u4eec\\u7684\\u8d54\\u507f\\u8d23\\u4efb\\u4e0d\\u8d85\\u8fc7\\u7528\\u6237\\u5728\\u8fc7\\u53bb\\u5341\\u4e8c\\u4e2a\\u6708\\u5185\\u4e3a\\u8be5\\u670d\\u52a1\\u5411\\u6211\\u4eec\\u652f\\u4ed8\\u7684\\u8d39\\u7528\\uff08\\u5982\\u9002\\u7528\\uff09\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>7. \\u7ec8\\u6b62\\u4e0e\\u51bb\\u7ed3<\\/h2>\\n<p>\\u82e5\\u60a8\\u8fdd\\u53cd\\u672c\\u534f\\u8bae\\u6216\\u4ece\\u4e8b\\u635f\\u5bb3\\u5e73\\u53f0\\u6216\\u5176\\u4ed6\\u7528\\u6237\\u6743\\u76ca\\u7684\\u884c\\u4e3a\\uff0c\\u6211\\u4eec\\u6709\\u6743\\u5728\\u4e0d\\u901a\\u77e5\\u6216\\u5728\\u901a\\u77e5\\u540e\\u7acb\\u5373\\u91c7\\u53d6\\u51bb\\u7ed3\\u3001\\u9650\\u5236\\u6216\\u7ec8\\u6b62\\u670d\\u52a1\\u7b49\\u63aa\\u65bd\\uff0c\\u5e76\\u4fdd\\u7559\\u8ffd\\u7a76\\u8d23\\u4efb\\u7684\\u6743\\u5229\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>8. \\u4fee\\u6539<\\/h2>\\n<p>\\u6211\\u4eec\\u53ef\\u6839\\u636e\\u4e1a\\u52a1\\u9700\\u8981\\u4fee\\u6539\\u672c\\u534f\\u8bae\\uff0c\\u91cd\\u5927\\u4fee\\u6539\\u4f1a\\u4ee5\\u9002\\u5f53\\u65b9\\u5f0f\\u516c\\u544a\\u5e76\\u5728\\u5fc5\\u8981\\u65f6\\u5f81\\u6c42\\u7528\\u6237\\u540c\\u610f\\u3002\\u7ee7\\u7eed\\u4f7f\\u7528\\u670d\\u52a1\\u89c6\\u4e3a\\u63a5\\u53d7\\u4fee\\u6539\\u540e\\u7684\\u534f\\u8bae\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>9. \\u901a\\u77e5<\\/h2>\\n<p>\\u6211\\u4eec\\u53ef\\u80fd\\u901a\\u8fc7\\u7f51\\u7ad9\\u516c\\u544a\\u3001\\u7535\\u5b50\\u90ae\\u4ef6\\u6216\\u5e94\\u7528\\u5185\\u6d88\\u606f\\u7b49\\u65b9\\u5f0f\\u5411\\u60a8\\u53d1\\u9001\\u901a\\u77e5\\u3002\\u8bf7\\u786e\\u4fdd\\u8054\\u7cfb\\u65b9\\u5f0f\\u6709\\u6548\\u5e76\\u53ca\\u65f6\\u67e5\\u6536\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>10. \\u9002\\u7528\\u6cd5\\u5f8b\\u4e0e\\u4e89\\u8bae\\u89e3\\u51b3<\\/h2>\\n<p>\\u672c\\u534f\\u8bae\\u9002\\u7528\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u5f8b\\uff08\\u6216\\u6839\\u636e\\u4f60\\u8981\\u6c42\\u66ff\\u6362\\u4e3a\\u6307\\u5b9a\\u7ba1\\u8f96\\u5730\\u6cd5\\u5f8b\\uff09\\u3002\\u56e0\\u672c\\u534f\\u8bae\\u4ea7\\u751f\\u7684\\u4e89\\u8bae\\uff0c\\u53cc\\u65b9\\u5e94\\u53cb\\u597d\\u534f\\u5546\\uff1b\\u534f\\u5546\\u4e0d\\u6210\\u7684\\uff0c\\u4efb\\u4f55\\u4e00\\u65b9\\u53ef\\u5411\\u516c\\u53f8\\u6240\\u5728\\u5730\\u6709\\u7ba1\\u8f96\\u6743\\u7684\\u6cd5\\u9662\\u63d0\\u8d77\\u8bc9\\u8bbc\\uff08\\u6216\\u6309\\u4f60\\u6307\\u5b9a\\u7684\\u4ef2\\u88c1\\u673a\\u6784\\u4ef2\\u88c1\\uff09\\u3002<\\/p>\\n<\\/section>\\n<section>\\n<h2>11. \\u8054\\u7cfb\\u65b9\\u5f0f<\\/h2>\\n<p>\\u5982\\u6709\\u7591\\u95ee\\uff0c\\u8bf7\\u8054\\u7cfb\\uff1a<br \\/>\\u7535\\u5b50\\u90ae\\u7bb1\\uff1a<strong>spicjoyc1989@icloud.com<\\/strong><\\/p>\\n<\\/section>\\n<section>\\n<h2>12. \\u6280\\u672f\\u652f\\u6301\\u7f51\\u5740<\\/h2>\\n<p>https:\\/\\/www.baidu.com<\\/p>\\n<\\/section>\\n<footer>\\n<p>&copy; \\u672c\\u516c\\u53f8\\u3002\\u4fdd\\u7559\\u6240\\u6709\\u6743\\u5229\\u3002<\\/p>\\n<\\/footer><\\/div>\",\"invite_rule\":\"<p>333<\\/p>\"},\"kefu\":{\"kefu_id\":\"2\",\"notice\":\"\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\\u8fd9\\u662f\\u6d4b\\u8bd5\"}}', '2022-12-05 14:49:01', '2025-08-29 16:04:29');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (2, 'table_form_schema_wa_users', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"sex\":{\"field\":\"sex\",\"_field_id\":\"4\",\"comment\":\"性别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/sex\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"5\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"6\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"7\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"level\":{\"field\":\"level\",\"_field_id\":\"8\",\"comment\":\"等级\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"birthday\":{\"field\":\"birthday\",\"_field_id\":\"9\",\"comment\":\"生日\",\"control\":\"datePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"money\":{\"field\":\"money\",\"_field_id\":\"10\",\"comment\":\"余额(元)\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"score\":{\"field\":\"score\",\"_field_id\":\"11\",\"comment\":\"积分\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"last_time\":{\"field\":\"last_time\",\"_field_id\":\"12\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"last_ip\":{\"field\":\"last_ip\",\"_field_id\":\"13\",\"comment\":\"登录ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"join_time\":{\"field\":\"join_time\",\"_field_id\":\"14\",\"comment\":\"注册时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"join_ip\":{\"field\":\"join_ip\",\"_field_id\":\"15\",\"comment\":\"注册ip\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false},\"token\":{\"field\":\"token\",\"_field_id\":\"16\",\"comment\":\"token\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"17\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"18\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"role\":{\"field\":\"role\",\"_field_id\":\"19\",\"comment\":\"角色\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"20\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:28:13');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (3, 'table_form_schema_wa_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"角色组\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"rules\":{\"field\":\"rules\",\"_field_id\":\"2\",\"comment\":\"权限\",\"control\":\"treeSelectMulti\",\"control_args\":\"url:\\/app\\/admin\\/rule\\/get?type=0,1,2\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"5\",\"comment\":\"父级\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/role\\/select?format=tree\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-19 14:24:25');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (4, 'table_form_schema_wa_rules', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"title\":{\"field\":\"title\",\"_field_id\":\"1\",\"comment\":\"标题\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"icon\":{\"field\":\"icon\",\"_field_id\":\"2\",\"comment\":\"图标\",\"control\":\"iconPicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"key\":{\"field\":\"key\",\"_field_id\":\"3\",\"comment\":\"标识\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"pid\":{\"field\":\"pid\",\"_field_id\":\"4\",\"comment\":\"上级菜单\",\"control\":\"treeSelect\",\"control_args\":\"\\/app\\/admin\\/rule\\/select?format=tree&type=0,1\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"5\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"6\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"href\":{\"field\":\"href\",\"_field_id\":\"7\",\"comment\":\"url\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"type\":{\"field\":\"type\",\"_field_id\":\"8\",\"comment\":\"类型\",\"control\":\"select\",\"control_args\":\"data:0:目录,1:菜单,2:权限\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"weight\":{\"field\":\"weight\",\"_field_id\":\"9\",\"comment\":\"排序\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:44:45');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (5, 'table_form_schema_wa_admins', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"ID\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"between\",\"form_show\":false,\"searchable\":false},\"username\":{\"field\":\"username\",\"_field_id\":\"1\",\"comment\":\"用户名\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"nickname\":{\"field\":\"nickname\",\"_field_id\":\"2\",\"comment\":\"昵称\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"password\":{\"field\":\"password\",\"_field_id\":\"3\",\"comment\":\"密码\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"avatar\":{\"field\":\"avatar\",\"_field_id\":\"4\",\"comment\":\"头像\",\"control\":\"uploadImage\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/avatar\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"email\":{\"field\":\"email\",\"_field_id\":\"5\",\"comment\":\"邮箱\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"mobile\":{\"field\":\"mobile\",\"_field_id\":\"6\",\"comment\":\"手机\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"7\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"searchable\":true,\"search_type\":\"between\",\"list_show\":false,\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"8\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"search_type\":\"normal\",\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"login_at\":{\"field\":\"login_at\",\"_field_id\":\"9\",\"comment\":\"登录时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"between\",\"enable_sort\":false,\"searchable\":false},\"status\":{\"field\":\"status\",\"_field_id\":\"10\",\"comment\":\"禁用\",\"control\":\"switch\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-23 15:36:48');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (6, 'table_form_schema_wa_options', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"键\",\"control\":\"input\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"value\":{\"field\":\"value\",\"_field_id\":\"2\",\"comment\":\"值\",\"control\":\"textArea\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"3\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"4\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:36:57');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (7, 'table_form_schema_wa_uploads', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"search_type\":\"normal\",\"form_show\":false,\"searchable\":false},\"name\":{\"field\":\"name\",\"_field_id\":\"1\",\"comment\":\"名称\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"url\":{\"field\":\"url\",\"_field_id\":\"2\",\"comment\":\"文件\",\"control\":\"upload\",\"control_args\":\"url:\\/app\\/admin\\/upload\\/file\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"3\",\"comment\":\"管理员\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/admin\\/select?format=select\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"file_size\":{\"field\":\"file_size\",\"_field_id\":\"4\",\"comment\":\"文件大小\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"mime_type\":{\"field\":\"mime_type\",\"_field_id\":\"5\",\"comment\":\"mime类型\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_width\":{\"field\":\"image_width\",\"_field_id\":\"6\",\"comment\":\"图片宽度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"image_height\":{\"field\":\"image_height\",\"_field_id\":\"7\",\"comment\":\"图片高度\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false},\"ext\":{\"field\":\"ext\",\"_field_id\":\"8\",\"comment\":\"扩展名\",\"control\":\"input\",\"control_args\":\"\",\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false,\"enable_sort\":false},\"storage\":{\"field\":\"storage\",\"_field_id\":\"9\",\"comment\":\"存储位置\",\"control\":\"input\",\"control_args\":\"\",\"search_type\":\"normal\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false,\"searchable\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"10\",\"comment\":\"上传时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"searchable\":true,\"search_type\":\"between\",\"form_show\":false,\"list_show\":false,\"enable_sort\":false},\"category\":{\"field\":\"category\",\"_field_id\":\"11\",\"comment\":\"类别\",\"control\":\"select\",\"control_args\":\"url:\\/app\\/admin\\/dict\\/get\\/upload\",\"form_show\":true,\"list_show\":true,\"searchable\":true,\"search_type\":\"normal\",\"enable_sort\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"12\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-08 11:47:45');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (8, 'dict_upload', '[{\"value\":\"1\",\"name\":\"分类1\"},{\"value\":\"2\",\"name\":\"分类2\"},{\"value\":\"3\",\"name\":\"分类3\"}]', '2022-12-04 16:24:13', '2022-12-04 16:24:13');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (9, 'dict_sex', '[{\"value\":\"0\",\"name\":\"女\"},{\"value\":\"1\",\"name\":\"男\"}]', '2022-12-04 15:04:40', '2022-12-04 15:04:40');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (10, 'dict_status', '[{\"value\":\"0\",\"name\":\"正常\"},{\"value\":\"1\",\"name\":\"禁用\"}]', '2022-12-04 15:05:09', '2022-12-04 15:05:09');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (11, 'table_form_schema_wa_admin_roles', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"role_id\":{\"field\":\"role_id\",\"_field_id\":\"1\",\"comment\":\"角色id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false},\"admin_id\":{\"field\":\"admin_id\",\"_field_id\":\"2\",\"comment\":\"管理员id\",\"control\":\"inputNumber\",\"control_args\":\"\",\"form_show\":true,\"list_show\":true,\"search_type\":\"normal\",\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (12, 'dict_dict_name', '[{\"value\":\"dict_name\",\"name\":\"字典名称\"},{\"value\":\"status\",\"name\":\"启禁用状态\"},{\"value\":\"sex\",\"name\":\"性别\"},{\"value\":\"upload\",\"name\":\"附件分类\"}]', '2022-08-15 00:00:00', '2022-12-20 19:42:51');
INSERT INTO `wa_options` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES (13, 'table_form_schema_wa_favorites', '{\"id\":{\"field\":\"id\",\"_field_id\":\"0\",\"comment\":\"主键\",\"control\":\"inputNumber\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"normal\",\"form_show\":false},\"created_at\":{\"field\":\"created_at\",\"_field_id\":\"1\",\"comment\":\"创建时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"enable_sort\":true,\"searchable\":true,\"search_type\":\"between\",\"form_show\":false},\"updated_at\":{\"field\":\"updated_at\",\"_field_id\":\"2\",\"comment\":\"更新时间\",\"control\":\"dateTimePicker\",\"control_args\":\"\",\"list_show\":true,\"search_type\":\"between\",\"form_show\":false,\"enable_sort\":false,\"searchable\":false}}', '2022-08-15 00:00:00', '2022-08-15 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for wa_roles
-- ----------------------------
DROP TABLE IF EXISTS `wa_roles`;
CREATE TABLE `wa_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色组',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '权限',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `pid` int unsigned DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员角色';

-- ----------------------------
-- Records of wa_roles
-- ----------------------------
BEGIN;
INSERT INTO `wa_roles` (`id`, `name`, `rules`, `created_at`, `updated_at`, `pid`) VALUES (1, '超级管理员', '*', '2022-08-13 16:15:01', '2022-12-23 12:05:07', NULL);
INSERT INTO `wa_roles` (`id`, `name`, `rules`, `created_at`, `updated_at`, `pid`) VALUES (2, '管理员', '86,87,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,85', '2025-08-19 10:40:29', '2025-08-28 11:01:31', 1);
COMMIT;

-- ----------------------------
-- Table structure for wa_rules
-- ----------------------------
DROP TABLE IF EXISTS `wa_rules`;
CREATE TABLE `wa_rules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图标',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `pid` int unsigned DEFAULT '0' COMMENT '上级菜单',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'url',
  `type` int NOT NULL DEFAULT '1' COMMENT '类型',
  `weight` int DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限规则';

-- ----------------------------
-- Records of wa_rules
-- ----------------------------
BEGIN;
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (1, '数据库', 'layui-icon-template-1', 'database', 0, '2025-07-23 15:51:56', '2025-07-23 15:51:56', NULL, 0, 1000);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (2, '所有表', NULL, 'plugin\\admin\\app\\controller\\TableController', 1, '2025-07-23 15:51:56', '2025-07-23 15:51:56', '/app/admin/table/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (3, '权限管理', 'layui-icon-vercode', 'auth', 0, '2025-07-23 15:51:56', '2025-07-23 15:51:56', NULL, 0, 900);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (4, '账户管理', NULL, 'plugin\\admin\\app\\controller\\AdminController', 3, '2025-07-23 15:51:56', '2025-07-23 15:51:56', '/app/admin/admin/index', 1, 1000);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (5, '角色管理', NULL, 'plugin\\admin\\app\\controller\\RoleController', 3, '2025-07-23 15:51:56', '2025-07-23 15:51:56', '/app/admin/role/index', 1, 900);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (6, '菜单管理', NULL, 'plugin\\admin\\app\\controller\\RuleController', 3, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/rule/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (7, '会员管理', 'layui-icon-username', 'user', 0, '2025-07-23 15:51:57', '2025-07-23 15:51:57', NULL, 0, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (8, '用户', NULL, 'plugin\\admin\\app\\controller\\UserController', 7, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/user/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (9, '通用设置', 'layui-icon-set', 'common', 0, '2025-07-23 15:51:57', '2025-07-23 15:51:57', NULL, 0, 700);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (10, '个人资料', NULL, 'plugin\\admin\\app\\controller\\AccountController', 9, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/account/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (11, '附件管理', NULL, 'plugin\\admin\\app\\controller\\UploadController', 9, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/upload/index', 1, 700);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (12, '字典设置', NULL, 'plugin\\admin\\app\\controller\\DictController', 9, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/dict/index', 1, 600);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (13, '系统设置', NULL, 'plugin\\admin\\app\\controller\\ConfigController', 9, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/config/index', 1, 500);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (14, '插件管理', 'layui-icon-app', 'plugin', 0, '2025-07-23 15:51:57', '2025-07-23 15:51:57', NULL, 0, 600);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (15, '应用插件', NULL, 'plugin\\admin\\app\\controller\\PluginController', 14, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/plugin/index', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (16, '开发辅助', 'layui-icon-fonts-code', 'dev', 0, '2025-07-23 15:51:57', '2025-07-23 15:51:57', NULL, 0, 500);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (17, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController', 16, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/dev/form-build', 1, 800);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (18, '示例页面', 'layui-icon-templeate-1', 'demos', 0, '2025-07-23 15:51:57', '2025-07-23 15:51:57', NULL, 0, 400);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (19, '工作空间', 'layui-icon-console', 'demo1', 18, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (20, '控制后台', 'layui-icon-console', 'demo10', 19, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/demos/console/console1.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (21, '数据分析', 'layui-icon-console', 'demo13', 19, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/demos/console/console2.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (22, '百度一下', 'layui-icon-console', 'demo14', 19, '2025-07-23 15:51:57', '2025-07-23 15:51:57', 'http://www.baidu.com', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (23, '主题预览', 'layui-icon-console', 'demo15', 19, '2025-07-23 15:51:57', '2025-07-23 15:51:57', '/app/admin/demos/system/theme.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (24, '常用组件', 'layui-icon-component', 'demo20', 18, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (25, '功能按钮', 'layui-icon-face-smile', 'demo2011', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/button.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (26, '表单集合', 'layui-icon-face-cry', 'demo2014', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/form.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (27, '字体图标', 'layui-icon-face-cry', 'demo2010', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/icon.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (28, '多选下拉', 'layui-icon-face-cry', 'demo2012', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/select.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (29, '动态标签', 'layui-icon-face-cry', 'demo2013', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/tag.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (30, '数据表格', 'layui-icon-face-cry', 'demo2031', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/table.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (31, '分布表单', 'layui-icon-face-cry', 'demo2032', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/step.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (32, '树形表格', 'layui-icon-face-cry', 'demo2033', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/treetable.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (33, '树状结构', 'layui-icon-face-cry', 'demo2034', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/dtree.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (34, '文本编辑', 'layui-icon-face-cry', 'demo2035', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/tinymce.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (35, '卡片组件', 'layui-icon-face-cry', 'demo2036', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/card.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (36, '抽屉组件', 'layui-icon-face-cry', 'demo2021', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/drawer.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (37, '消息通知', 'layui-icon-face-cry', 'demo2022', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/notice.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (38, '加载组件', 'layui-icon-face-cry', 'demo2024', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/loading.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (39, '弹层组件', 'layui-icon-face-cry', 'demo2023', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/popup.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (40, '多选项卡', 'layui-icon-face-cry', 'demo60131', 24, '2025-07-23 15:51:58', '2025-07-23 15:51:58', '/app/admin/demos/document/tab.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (41, '数据菜单', 'layui-icon-face-cry', 'demo60132', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/menu.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (42, '哈希加密', 'layui-icon-face-cry', 'demo2041', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/encrypt.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (43, '图标选择', 'layui-icon-face-cry', 'demo2042', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/iconPicker.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (44, '省市级联', 'layui-icon-face-cry', 'demo2043', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/area.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (45, '数字滚动', 'layui-icon-face-cry', 'demo2044', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/count.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (46, '顶部返回', 'layui-icon-face-cry', 'demo2045', 24, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/document/topBar.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (47, '结果页面', 'layui-icon-auz', 'demo666', 18, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (48, '成功', 'layui-icon-face-smile', 'demo667', 47, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/result/success.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (49, '失败', 'layui-icon-face-cry', 'demo668', 47, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/result/error.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (50, '错误页面', 'layui-icon-face-cry', 'demo-error', 18, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (51, '403', 'layui-icon-face-smile', 'demo403', 50, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/error/403.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (52, '404', 'layui-icon-face-cry', 'demo404', 50, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/error/404.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (53, '500', 'layui-icon-face-cry', 'demo500', 50, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/error/500.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (54, '系统管理', 'layui-icon-set-fill', 'demo-system', 18, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (55, '用户管理', 'layui-icon-face-smile', 'demo601', 54, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/system/user.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (56, '角色管理', 'layui-icon-face-cry', 'demo602', 54, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/system/role.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (57, '权限管理', 'layui-icon-face-cry', 'demo603', 54, '2025-07-23 15:51:59', '2025-07-23 15:51:59', '/app/admin/demos/system/power.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (58, '部门管理', 'layui-icon-face-cry', 'demo604', 54, '2025-07-23 15:52:00', '2025-07-23 15:52:00', '/app/admin/demos/system/deptment.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (59, '行为日志', 'layui-icon-face-cry', 'demo605', 54, '2025-07-23 15:52:00', '2025-07-23 15:52:00', '/app/admin/demos/system/log.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (60, '数据字典', 'layui-icon-face-cry', 'demo606', 54, '2025-07-23 15:52:00', '2025-07-23 15:52:00', '/app/admin/demos/system/dict.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (61, '常用页面', 'layui-icon-template-1', 'demo-common', 18, '2025-07-23 15:52:00', '2025-07-23 15:52:00', '', 0, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (62, '空白页面', 'layui-icon-face-smile', 'demo702', 61, '2025-07-23 15:52:00', '2025-07-23 15:52:00', '/app/admin/demos/system/space.html', 1, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (63, '查看表', NULL, 'plugin\\admin\\app\\controller\\TableController@view', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (64, '查询表', NULL, 'plugin\\admin\\app\\controller\\TableController@show', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (65, '创建表', NULL, 'plugin\\admin\\app\\controller\\TableController@create', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (66, '修改表', NULL, 'plugin\\admin\\app\\controller\\TableController@modify', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (67, '一键菜单', NULL, 'plugin\\admin\\app\\controller\\TableController@crud', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (68, '查询记录', NULL, 'plugin\\admin\\app\\controller\\TableController@select', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (69, '插入记录', NULL, 'plugin\\admin\\app\\controller\\TableController@insert', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (70, '更新记录', NULL, 'plugin\\admin\\app\\controller\\TableController@update', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (71, '删除记录', NULL, 'plugin\\admin\\app\\controller\\TableController@delete', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (72, '删除表', NULL, 'plugin\\admin\\app\\controller\\TableController@drop', 2, '2025-07-23 17:13:33', '2025-07-23 17:13:33', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (73, '表摘要', NULL, 'plugin\\admin\\app\\controller\\TableController@schema', 2, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (74, '插入', NULL, 'plugin\\admin\\app\\controller\\AdminController@insert', 4, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (75, '更新', NULL, 'plugin\\admin\\app\\controller\\AdminController@update', 4, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (76, '删除', NULL, 'plugin\\admin\\app\\controller\\AdminController@delete', 4, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (77, '插入', NULL, 'plugin\\admin\\app\\controller\\RoleController@insert', 5, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (78, '更新', NULL, 'plugin\\admin\\app\\controller\\RoleController@update', 5, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (79, '删除', NULL, 'plugin\\admin\\app\\controller\\RoleController@delete', 5, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (80, '获取角色权限', NULL, 'plugin\\admin\\app\\controller\\RoleController@rules', 5, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (81, '查询', NULL, 'plugin\\admin\\app\\controller\\RuleController@select', 6, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (82, '添加', NULL, 'plugin\\admin\\app\\controller\\RuleController@insert', 6, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (83, '更新', NULL, 'plugin\\admin\\app\\controller\\RuleController@update', 6, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (84, '删除', NULL, 'plugin\\admin\\app\\controller\\RuleController@delete', 6, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (85, '插入', NULL, 'plugin\\admin\\app\\controller\\UserController@insert', 8, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (86, '更新', NULL, 'plugin\\admin\\app\\controller\\UserController@update', 8, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (87, '查询', NULL, 'plugin\\admin\\app\\controller\\UserController@select', 8, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (88, '删除', NULL, 'plugin\\admin\\app\\controller\\UserController@delete', 8, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (89, '更新', NULL, 'plugin\\admin\\app\\controller\\AccountController@update', 10, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (90, '修改密码', NULL, 'plugin\\admin\\app\\controller\\AccountController@password', 10, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (91, '查询', NULL, 'plugin\\admin\\app\\controller\\AccountController@select', 10, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (92, '添加', NULL, 'plugin\\admin\\app\\controller\\AccountController@insert', 10, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (93, '删除', NULL, 'plugin\\admin\\app\\controller\\AccountController@delete', 10, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (94, '浏览附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@attachment', 11, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (95, '查询附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@select', 11, '2025-07-23 17:13:34', '2025-07-23 17:13:34', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (96, '更新附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@update', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (97, '添加附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@insert', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (98, '上传文件', NULL, 'plugin\\admin\\app\\controller\\UploadController@file', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (99, '上传图片', NULL, 'plugin\\admin\\app\\controller\\UploadController@image', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (100, '上传头像', NULL, 'plugin\\admin\\app\\controller\\UploadController@avatar', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (101, '删除附件', NULL, 'plugin\\admin\\app\\controller\\UploadController@delete', 11, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (102, '查询', NULL, 'plugin\\admin\\app\\controller\\DictController@select', 12, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (103, '插入', NULL, 'plugin\\admin\\app\\controller\\DictController@insert', 12, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (104, '更新', NULL, 'plugin\\admin\\app\\controller\\DictController@update', 12, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (105, '删除', NULL, 'plugin\\admin\\app\\controller\\DictController@delete', 12, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (106, '更改', NULL, 'plugin\\admin\\app\\controller\\ConfigController@update', 13, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (107, '列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@list', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (108, '安装', NULL, 'plugin\\admin\\app\\controller\\PluginController@install', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (109, '卸载', NULL, 'plugin\\admin\\app\\controller\\PluginController@uninstall', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (110, '支付', NULL, 'plugin\\admin\\app\\controller\\PluginController@pay', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (111, '登录官网', NULL, 'plugin\\admin\\app\\controller\\PluginController@login', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (112, '获取已安装的插件列表', NULL, 'plugin\\admin\\app\\controller\\PluginController@getInstalledPlugins', 15, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
INSERT INTO `wa_rules` (`id`, `title`, `icon`, `key`, `pid`, `created_at`, `updated_at`, `href`, `type`, `weight`) VALUES (113, '表单构建', NULL, 'plugin\\admin\\app\\controller\\DevController@formBuild', 17, '2025-07-23 17:13:35', '2025-07-23 17:13:35', NULL, 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for wa_sms
-- ----------------------------
DROP TABLE IF EXISTS `wa_sms`;
CREATE TABLE `wa_sms` (
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '事件',
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '验证码',
  `times` int unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'IP',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='短信';

-- ----------------------------
-- Records of wa_sms
-- ----------------------------
BEGIN;
INSERT INTO `wa_sms` (`event`, `id`, `mobile`, `code`, `times`, `ip`, `created_at`, `updated_at`) VALUES ('register', 1, '15638187273', '2719', 0, '115.60.85.237', '2025-08-28 11:43:17', '2025-08-28 11:43:17');
INSERT INTO `wa_sms` (`event`, `id`, `mobile`, `code`, `times`, `ip`, `created_at`, `updated_at`) VALUES ('register', 2, '18600006324', '3642', 0, '116.212.133.96', '2025-08-28 17:39:09', '2025-08-28 17:39:09');
COMMIT;

-- ----------------------------
-- Table structure for wa_uploads
-- ----------------------------
DROP TABLE IF EXISTS `wa_uploads`;
CREATE TABLE `wa_uploads` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件',
  `admin_id` int DEFAULT NULL COMMENT '管理员',
  `file_size` int NOT NULL COMMENT '文件大小',
  `mime_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'mime类型',
  `image_width` int DEFAULT NULL COMMENT '图片宽度',
  `image_height` int DEFAULT NULL COMMENT '图片高度',
  `ext` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '扩展名',
  `storage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `created_at` date DEFAULT NULL COMMENT '上传时间',
  `category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类别',
  `updated_at` date DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `ext` (`ext`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='附件';

-- ----------------------------
-- Records of wa_uploads
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wa_users
-- ----------------------------
DROP TABLE IF EXISTS `wa_users`;
CREATE TABLE `wa_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `sex` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '性别',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `level` tinyint NOT NULL DEFAULT '0' COMMENT '等级',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额(元)',
  `score` int NOT NULL DEFAULT '0' COMMENT '积分',
  `last_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '登录ip',
  `join_time` datetime DEFAULT NULL COMMENT '注册时间',
  `join_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '注册ip',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'token',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `role` int NOT NULL DEFAULT '1' COMMENT '角色',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '禁用',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  `last_online_time` datetime DEFAULT NULL COMMENT '最后在线时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `join_time` (`join_time`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE,
  KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of wa_users
-- ----------------------------
BEGIN;
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (1, NULL, NULL, NULL, '1', NULL, NULL, '13833397919', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-06 09:39:07', '2025-08-06 09:39:07', 1, 0, NULL, NULL);
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (2, NULL, '王世文', '$2y$10$SVafPeOWA3zedTkkyHSZ2.7GX5PnE4yNUglY.a0yDi2SftHvkBQ6e', '1', '/app/admin/upload/img/20250825/68abf8c02fb4.jpg', NULL, '15638187275', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-06 09:39:31', '2025-09-01 10:33:20', 1, 0, NULL, '2025-09-01 10:33:20');
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (3, NULL, '测试', '$2y$10$zY68cJy0VnDq3Fmku8qNJ.9NvNVaLjtf/51zlNZrv6I.afpGzGmUu', '1', '/app/admin/upload/img/20250807/68944b48cd44.jpg', NULL, '15093289016', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-07 10:16:15', '2025-08-07 14:44:32', 1, 0, NULL, NULL);
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (4, NULL, '测试1', '$2y$10$VshvGK8tzfcF3ZSvTpVAaeNnwaVrUKS/xPzcI/Z.fHd9GBsaWgPLO', '0', '/app/admin/upload/img/20250813/689be5e6ae00.jpg', NULL, '15638187270', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-13 09:09:40', '2025-08-13 09:10:09', 1, 0, NULL, NULL);
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (5, NULL, '测试2', '$2y$10$z3iCRAlSxnUyQAtekS6d5.bEeoCUTw2HhjQPCwPX/eO/KGKYXm/aS', '0', '/app/admin/upload/img/20250826/68ad468cc6c8.png', NULL, '15638187272', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-13 09:38:47', '2025-08-29 13:20:03', 1, 0, NULL, '2025-08-29 13:20:03');
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (6, NULL, '以后再说', '$2y$10$CaseAJZqM6GLN7YEidG5UuKPSWL6AdzfoPx5v0ssiLb1bbp7kNG3W', '1', '/app/admin/upload/img/20250815/689f168464e2.jpg', NULL, '15638187271', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-15 19:13:24', '2025-08-28 17:38:59', 1, 0, NULL, '2025-08-28 17:38:59');
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (7, NULL, '阿沁', '$2y$10$TFkeTaIE2y/YTxzunanTDep49iayIxRrI7qjVEjCRC3h5BbgEkESC', '1', '/app/admin/upload/img/20250823/68a97a06cc29.jpg', NULL, '13781176252', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-22 14:33:02', '2025-09-01 09:40:53', 1, 0, NULL, '2025-09-01 09:40:53');
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (8, NULL, '6', '$2y$10$iNz.o00po7IJDU49dTi1OOF535Skj8vPYsQ43O4Eh/mufee/q5pVW', '0', '/app/admin/upload/img/20250823/68a96564f206.jpg', NULL, '15638487272', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-23 14:53:08', '2025-08-23 14:53:38', 1, 0, NULL, NULL);
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (9, NULL, '小王', '$2y$10$LrpblzUDidlufxtLKu2uKOuK/qRYCM32YNKPi83BD/8zWY6dihBv.', '1', '/app/admin/upload/img/20250828/68afd06be718.png', NULL, '15638187273', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-28 11:43:24', '2025-08-28 11:44:27', 1, 0, NULL, '2025-08-28 11:44:27');
INSERT INTO `wa_users` (`id`, `username`, `nickname`, `password`, `sex`, `avatar`, `email`, `mobile`, `level`, `birthday`, `money`, `score`, `last_time`, `last_ip`, `join_time`, `join_ip`, `token`, `created_at`, `updated_at`, `role`, `status`, `deleted_at`, `last_online_time`) VALUES (10, NULL, 'A生产部', '$2y$10$I4DrCIr/xpImBbLUmHbeHO8JQ3MaghxFjxohOdt6oU1XG9/g9TFXm', '1', '', NULL, '18300006324', 0, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, '2025-08-28 17:38:42', '2025-08-29 10:36:52', 1, 0, NULL, '2025-08-29 10:36:52');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
