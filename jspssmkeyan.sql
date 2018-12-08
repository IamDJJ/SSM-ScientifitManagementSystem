/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : jspssmkeyan

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-04-01 19:32:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cqjb
-- ----------------------------
DROP TABLE IF EXISTS `cqjb`;
CREATE TABLE `cqjb` (
  `cqjbid` int(11) NOT NULL auto_increment,
  `jb` varchar(40) default NULL COMMENT '级别',
  PRIMARY KEY  (`cqjbid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of cqjb
-- ----------------------------
INSERT INTO `cqjb` VALUES ('1', '普通');
INSERT INTO `cqjb` VALUES ('2', '中级');

-- ----------------------------
-- Table structure for gly
-- ----------------------------
DROP TABLE IF EXISTS `gly`;
CREATE TABLE `gly` (
  `glyid` int(11) NOT NULL auto_increment,
  `yhm` varchar(40) default NULL COMMENT '用户名',
  `mm` varchar(40) default NULL COMMENT '密码',
  `xm` varchar(40) default NULL COMMENT '姓名',
  PRIMARY KEY  (`glyid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of gly
-- ----------------------------
INSERT INTO `gly` VALUES ('2', 'admin', '21232F297A57A5A743894A0E4A801FC3', 'admin');

-- ----------------------------
-- Table structure for hetong
-- ----------------------------
DROP TABLE IF EXISTS `hetong`;
CREATE TABLE `hetong` (
  `htid` int(11) NOT NULL auto_increment,
  `htbt` varchar(40) default NULL COMMENT '合同标题',
  `htbh` varchar(40) default NULL COMMENT '合同编号',
  `htnr` varchar(4000) default NULL COMMENT '合同内容',
  `qcsj` varchar(40) default NULL COMMENT '起草时间',
  `qcr` varchar(40) default NULL COMMENT '起草人',
  `jf` varchar(40) default NULL COMMENT '甲方',
  `jflxfs` varchar(400) default NULL COMMENT '甲方联系方式',
  `yf` varchar(40) default NULL COMMENT '乙方',
  `yflxfs` varchar(400) default NULL COMMENT '乙方联系方式',
  `zt` varchar(40) default NULL COMMENT '状态',
  `fj` varchar(40) default NULL,
  PRIMARY KEY  (`htid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of hetong
-- ----------------------------
INSERT INTO `hetong` VALUES ('1', '起草一个条款', 'con201803161301000009', '起草一个条款', '2018-03-16 13:01:09', '123', '213123', '123123', '12312', '12312312', '通过', null);
INSERT INTO `hetong` VALUES ('2', '1号合同', 'con201803161957000011', '1号合同', '2018-03-16 19:57:11', '123', '123', '123123', '12311', '123', '通过', null);
INSERT INTO `hetong` VALUES ('3', '123', 'con201804011916000014', '12312', '2018-04-01 19:16:14', '123', '123123', '123', '123', '131', '未审核', '1522581552678.jpg');

-- ----------------------------
-- Table structure for htbg
-- ----------------------------
DROP TABLE IF EXISTS `htbg`;
CREATE TABLE `htbg` (
  `htbgid` int(11) NOT NULL auto_increment,
  `htbh` varchar(40) default NULL COMMENT '合同编号',
  `bgsmbgr` varchar(4000) default NULL COMMENT '变更说明变更人',
  `sj` varchar(40) default NULL COMMENT '时间',
  `zt` varchar(40) default NULL COMMENT '状态',
  PRIMARY KEY  (`htbgid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of htbg
-- ----------------------------
INSERT INTO `htbg` VALUES ('1', 'con201803161301000009', '11231232', '2018-03-16 13:34:27', '通过');
INSERT INTO `htbg` VALUES ('2', 'con201803161957000011', '修改了乙方信息', '2018-03-16 19:58:13', '通过');
INSERT INTO `htbg` VALUES ('3', 'con201804011916000014', '123', '2018-04-01 19:19:14', '通过');

-- ----------------------------
-- Table structure for leixing
-- ----------------------------
DROP TABLE IF EXISTS `leixing`;
CREATE TABLE `leixing` (
  `lxid` int(11) NOT NULL auto_increment,
  `lx` varchar(40) default NULL COMMENT '类型',
  PRIMARY KEY  (`lxid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of leixing
-- ----------------------------
INSERT INTO `leixing` VALUES ('1', '论文');
INSERT INTO `leixing` VALUES ('2', '专利');
INSERT INTO `leixing` VALUES ('3', '软件著作权');
INSERT INTO `leixing` VALUES ('4', '著作');
INSERT INTO `leixing` VALUES ('5', '鉴定成果');
INSERT INTO `leixing` VALUES ('6', '成果推广');
INSERT INTO `leixing` VALUES ('7', '研究报告');
INSERT INTO `leixing` VALUES ('8', '音像');
INSERT INTO `leixing` VALUES ('9', '地图');

-- ----------------------------
-- Table structure for xiangmu
-- ----------------------------
DROP TABLE IF EXISTS `xiangmu`;
CREATE TABLE `xiangmu` (
  `xmid` int(11) NOT NULL auto_increment,
  `xmmc` varchar(40) default NULL COMMENT '项目名称',
  `fzr` varchar(40) default NULL COMMENT '负责人',
  `xmjd` varchar(40) default NULL COMMENT '项目阶段',
  `gs` varchar(4000) default NULL COMMENT '概述',
  `lxsj` varchar(40) default NULL COMMENT '立项时间',
  `js` varchar(4000) default NULL COMMENT '介绍',
  `yh` varchar(40) default NULL COMMENT '用户',
  `zt` varchar(40) default NULL COMMENT '状态',
  `fj` varchar(40) default NULL,
  PRIMARY KEY  (`xmid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xiangmu
-- ----------------------------
INSERT INTO `xiangmu` VALUES ('1', '科研一个网站', '1231212', '立项', '123', '2018-03-16 14:14:12', '12321', '123', '通过', null);
INSERT INTO `xiangmu` VALUES ('2', '一个企业项目', '张三', '结项', '企业技术人才', '2018-03-16 19:58:47', '介绍', '123', '通过', null);
INSERT INTO `xiangmu` VALUES ('3', '222', '22', '立项', '222', '2018-04-01 18:37:45', '123', '123', '未审核', null);
INSERT INTO `xiangmu` VALUES ('4', '123123', '123', '立项', '1231', '2018-04-01 19:31:17', '123', '123', '未审核', '1522582283611.jpg');

-- ----------------------------
-- Table structure for xmbg
-- ----------------------------
DROP TABLE IF EXISTS `xmbg`;
CREATE TABLE `xmbg` (
  `xmbgid` int(11) NOT NULL auto_increment,
  `xm` varchar(40) default NULL COMMENT '项目',
  `bgnr` varchar(4000) default NULL COMMENT '变更内容',
  `xmsm` varchar(40) default NULL COMMENT '项目说明',
  PRIMARY KEY  (`xmbgid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xmbg
-- ----------------------------
INSERT INTO `xmbg` VALUES ('1', '1', '123123', '123');
INSERT INTO `xmbg` VALUES ('2', '2', '123123', '123');

-- ----------------------------
-- Table structure for xmjx
-- ----------------------------
DROP TABLE IF EXISTS `xmjx`;
CREATE TABLE `xmjx` (
  `xmjxid` int(11) NOT NULL auto_increment,
  `xm` varchar(40) default NULL COMMENT '项目',
  `jxsm` varchar(4000) default NULL COMMENT '结项说明',
  `yh` varchar(40) default NULL COMMENT '用户',
  `sj` varchar(40) default NULL COMMENT '时间',
  `bz` varchar(4000) default NULL COMMENT '备注',
  PRIMARY KEY  (`xmjxid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xmjx
-- ----------------------------
INSERT INTO `xmjx` VALUES ('1', '1', '1231231', '123', '2018-03-16 14:52:39', '12312');
INSERT INTO `xmjx` VALUES ('2', '2', '结项了', '123', '2018-03-16 19:59:45', '123123');

-- ----------------------------
-- Table structure for xmzj
-- ----------------------------
DROP TABLE IF EXISTS `xmzj`;
CREATE TABLE `xmzj` (
  `xmzjid` int(11) NOT NULL auto_increment,
  `xm` varchar(40) default NULL COMMENT '项目',
  `zjnr` varchar(4000) default NULL COMMENT '中检内容',
  `yh` varchar(40) default NULL COMMENT '用户',
  `sj` varchar(40) default NULL COMMENT '时间',
  PRIMARY KEY  (`xmzjid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of xmzj
-- ----------------------------
INSERT INTO `xmzj` VALUES ('1', '1', '123123', '123', '2018-03-16 14:44:28');
INSERT INTO `xmzj` VALUES ('2', '2', '123131', '123', '2018-03-16 19:59:37');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `yhid` int(11) NOT NULL auto_increment,
  `yhm` varchar(40) default NULL COMMENT '用户名',
  `mm` varchar(40) default NULL COMMENT '密码',
  `xm` varchar(40) default NULL COMMENT '姓名',
  `xy` varchar(40) default NULL COMMENT '学院',
  `QQ` varchar(40) default NULL COMMENT 'QQ',
  `dh` varchar(40) default NULL COMMENT '电话',
  `xb` varchar(40) default NULL COMMENT '性别',
  `nl` varchar(40) default NULL COMMENT '年龄',
  PRIMARY KEY  (`yhid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('2', '123', '202CB962AC59075B964B07152D234B70', '123', '123', '123', '123', '男', '22');

-- ----------------------------
-- Table structure for zscq
-- ----------------------------
DROP TABLE IF EXISTS `zscq`;
CREATE TABLE `zscq` (
  `zscqid` int(11) NOT NULL auto_increment,
  `cqmc` varchar(40) default NULL COMMENT '产权名称',
  `lx` varchar(40) default NULL COMMENT '类型',
  `fj` varchar(40) default NULL COMMENT '附件',
  `nr` varchar(4000) default NULL COMMENT '内容',
  `cqjb` varchar(40) default NULL COMMENT '产权级别',
  `ytcg` varchar(4000) default NULL COMMENT '依托成果',
  `djr` varchar(40) default NULL COMMENT '登记人',
  `djsj` varchar(40) default NULL COMMENT '登记时间',
  PRIMARY KEY  (`zscqid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of zscq
-- ----------------------------
INSERT INTO `zscq` VALUES ('1', '123', '论文', '1521184599649.jpg', '123123', '普通', '123123', '123', '2018-03-16 15:16:33');
INSERT INTO `zscq` VALUES ('2', '12312312', '成果推广', '1521201607462.jpg', '1231', '普通', '2312312', '123', '2018-03-16 20:00:00');
