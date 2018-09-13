###CREATE EMPLOYEE TABLE QUERY
CREATE TABLE `employee` (
  
`ID` int(11) NOT NULL AUTO_INCREMENT,

`USERNAME` varchar(20) DEFAULT NULL,

`PWD` varchar(60) DEFAULT NULL,

`NAME` varchar(20) DEFAULT NULL,

`DEPARTMENT` varchar(15) DEFAULT NULL,

`GENDER` char(1) DEFAULT NULL,

`CONTACT` varchar(10) DEFAULT NULL,

`AUTH` varchar(15) DEFAULT NULL,

`enabled` tinyint(1) DEFAULT NULL,

`file` blob,
  PRIMARY KEY (`ID`)
);


####INSERT TEMP DATA FOR TESTING
INSERT INTO employee
(`USERNAME`,
`PWD`,
`NAME`,
`DEPARTMENT`,
`GENDER`,
`CONTACT`,
`AUTH`,
`enabled`)

VALUES
("admin",
"admin","admin","Managment","M","9945099450",
"ROLE_ADMIN",
1);

INSERT INTO employee
(`USERNAME`,
`PWD`,
`NAME`,
`DEPARTMENT`,
`GENDER`,
`CONTACT`,
`AUTH`,
`enabled`)

VALUES
("dba",
"dba","DBA","DATABASE","F","9845098450",
"ROLE_DBA",
1);


INSERT INTO employee
(`USERNAME`,
`PWD`,
`NAME`,
`DEPARTMENT`,
`GENDER`,
`CONTACT`,
`AUTH`,
`enabled`)

VALUES
("tech",
"tech","TECH","TECHNICAL","M","9945001122",
"ROLE_TECH",
1);

INSERT INTO employee
(`USERNAME`,
`PWD`,
`NAME`,
`DEPARTMENT`,
`GENDER`,
`CONTACT`,
`AUTH`,
`enabled`)

VALUES
("user",
"user","USER","FRESHER","F","9988001155",
"ROLE_USER",
1);
