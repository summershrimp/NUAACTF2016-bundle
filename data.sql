SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS platform DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL PRIVILEGES ON platform.* TO platform@127.0.0.1 identified by 'cCstCtF2o16';

CREATE DATABASE IF NOT EXISTS nuaactf DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT SELECT ON nuaactf.* TO nuaactf@127.0.0.1 identified by 'dfasdfgasdfbdsfgsdkmladfkajnsvuasdlasd';

USE nuaactf;
-- ----------------------------
--  Table structure for `web3`
-- ----------------------------
DROP TABLE IF EXISTS `web3`;
CREATE TABLE `web3` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `isadmin` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `web3`
-- ----------------------------
BEGIN;
INSERT INTO `web3` VALUES ('1', 'user', 'xxxxxxxxx4axx3b89xxxx01afxx9366d', '0');
INSERT INTO `web3` VALUES ('2', 'admin', 'xxxxxxxxx4axx3b89xxxx01afxx9366d', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

