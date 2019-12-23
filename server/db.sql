SET NAMES UTF8
DROP DATABASE IF EXISTS world
CREATE DATABASE world CHARSET = UTF8
USE world

-- 元素表
CREATE TABLE element (
    id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(16),
    name VARCHAR(16),
    img_url VARCHAR(256),
    is_show TINYINT
);

INSERT INTO element VALUES(NULL,"基本元素","火","",1);
INSERT INTO element VALUES(NULL,"基本元素","水","",1);
INSERT INTO element VALUES(NULL,"基本元素","土","",1);
INSERT INTO element VALUES(NULL,"基本元素","气","",1);
INSERT INTO element VALUES(NULL,"基本元素","雾","",0);
INSERT INTO element VALUES(NULL,"基本元素","闪电","",0);
INSERT INTO element VALUES(NULL,"基本元素","雾","",0);
INSERT INTO element VALUES(NULL,"基本元素","岩石","",0);
INSERT INTO element VALUES(NULL,"基本元素","蒸汽","",0);
INSERT INTO element VALUES(NULL,"基本元素","泥","",0);
INSERT INTO element VALUES(NULL,"基本元素","沙子","",0);
INSERT INTO element VALUES(NULL,"基本元素","云","",0);

INSERT INTO element VALUES(NULL,"其他物种","颜料","",1);
INSERT INTO element VALUES(NULL,"其他物种","布袋","",1);
INSERT INTO element VALUES(NULL,"其他物种","轮子","",1);
INSERT INTO element VALUES(NULL,"其他物种","玻璃","",0);
INSERT INTO element VALUES(NULL,"其他物种","沙漏","",0);

-- 合成表
CREATE TABLE compound (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_element VARCHAR(16),
    second_element VARCHAR(16),
    composition VARCHAR(16)
);
INSERT INTO compound VALUES(NULL,"气","火","闪电");
INSERT INTO compound VALUES(NULL,"气","水","雾");
INSERT INTO compound VALUES(NULL,"土","火","岩石");
INSERT INTO compound VALUES(NULL,"土","水","泥");
INSERT INTO compound VALUES(NULL,"火","水","蒸汽");
INSERT INTO compound VALUES(NULL,"岩石","气","沙子");
INSERT INTO compound VALUES(NULL,"沙子","火","玻璃");
INSERT INTO compound VALUES(NULL,"气","雾","云");
INSERT INTO compound VALUES(NULL,"玻璃","沙子","沙漏");