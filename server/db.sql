SET NAMES UTF8;
DROP DATABASE IF EXISTS world;
CREATE DATABASE world CHARSET = UTF8;
USE world;

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
INSERT INTO element VALUES(NULL,"基本元素","泥土","",1);
INSERT INTO element VALUES(NULL,"基本元素","气","",1);
INSERT INTO element VALUES(NULL,"基本元素","雾","",0);
INSERT INTO element VALUES(NULL,"基本元素","闪电","",0);
INSERT INTO element VALUES(NULL,"基本元素","雾","",0);
INSERT INTO element VALUES(NULL,"基本元素","岩石","",0);
INSERT INTO element VALUES(NULL,"基本元素","蒸汽","",0);
INSERT INTO element VALUES(NULL,"基本元素","泥","",0);
INSERT INTO element VALUES(NULL,"基本元素","沙子","",0);
INSERT INTO element VALUES(NULL,"基本元素","云","",0);
INSERT INTO element VALUES(NULL,"基本元素","阳光","",0);
INSERT INTO element VALUES(NULL,"基本元素","冰","",0);
INSERT INTO element VALUES(NULL,"基本元素","DNA","",0);
INSERT INTO element VALUES(NULL,"基本元素","黑暗","",0);
INSERT INTO element VALUES(NULL,"基本元素","月亮","",0);
INSERT INTO element VALUES(NULL,"基本元素","雪","",0);
INSERT INTO element VALUES(NULL,"基本元素","黏土","",0);
INSERT INTO element VALUES(NULL,"基本元素","煤炭","",0);

INSERT INTO element VALUES(NULL,"植物","海草","",0);
INSERT INTO element VALUES(NULL,"植物","蘑菇","",0);
INSERT INTO element VALUES(NULL,"植物","苔藓","",0);
INSERT INTO element VALUES(NULL,"植物","蕨类植物","",0);
INSERT INTO element VALUES(NULL,"植物","草","",0);
INSERT INTO element VALUES(NULL,"植物","树","",0);
INSERT INTO element VALUES(NULL,"植物","棕榈树","",0);
INSERT INTO element VALUES(NULL,"植物","枞树","",0);
INSERT INTO element VALUES(NULL,"植物","花","",0);
INSERT INTO element VALUES(NULL,"植物","芦苇","",0);
INSERT INTO element VALUES(NULL,"植物","荆棘","",0);
INSERT INTO element VALUES(NULL,"植物","仙人掌","",0);
INSERT INTO element VALUES(NULL,"植物","向日葵","",0);
INSERT INTO element VALUES(NULL,"植物","荷花","",0);
INSERT INTO element VALUES(NULL,"植物","玫瑰","",0);
INSERT INTO element VALUES(NULL,"植物","毒蕈","",0);

INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","火蜥蜴","",0);
INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","青蛙","",0);
INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","陆地龟","",0);
INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","蜥蜴","",0);
INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","蟾蜍","",0);
INSERT INTO element VALUES(NULL,"爬行动物或两栖动物","蛇","",0);

INSERT INTO element VALUES(NULL,"昆虫","虫子","",0);
INSERT INTO element VALUES(NULL,"昆虫","蜜蜂","",0);
INSERT INTO element VALUES(NULL,"昆虫","蜻蜓","",0);
INSERT INTO element VALUES(NULL,"昆虫","蝎子","",0);

INSERT INTO element VALUES(NULL,"鸟类","鸟","",0);
INSERT INTO element VALUES(NULL,"鸟类","鸭","",0);
INSERT INTO element VALUES(NULL,"鸟类","猫头鹰","",0);
INSERT INTO element VALUES(NULL,"鸟类","乌鸦","",0);
INSERT INTO element VALUES(NULL,"鸟类","猫鸽","",0);
INSERT INTO element VALUES(NULL,"鸟类","企鹅","",0);
INSERT INTO element VALUES(NULL,"鸟类","喜鹊","",0);
INSERT INTO element VALUES(NULL,"鸟类","潜鸟","",0);

INSERT INTO element VALUES(NULL,"海洋生物","浮游生物","",0);
INSERT INTO element VALUES(NULL,"海洋生物","鱼","",0);
INSERT INTO element VALUES(NULL,"海洋生物","三叶草","",0);
INSERT INTO element VALUES(NULL,"海洋生物","电鳗","",0);
INSERT INTO element VALUES(NULL,"海洋生物","虾","",0);
INSERT INTO element VALUES(NULL,"海洋生物","螃蟹","",0);
INSERT INTO element VALUES(NULL,"海洋生物","黄貂鱼","",0);
INSERT INTO element VALUES(NULL,"海洋生物","鲸鱼","",0);
INSERT INTO element VALUES(NULL,"海洋生物","海狮","",0);
INSERT INTO element VALUES(NULL,"海洋生物","鲶鱼","",0);
INSERT INTO element VALUES(NULL,"海洋生物","逆戟鲸","",0);

INSERT INTO element VALUES(NULL,"哺乳动物","哺乳动物","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","黑猩猩","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","地鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","猪","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","马","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","黄鼬","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","羊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","黑豹","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","狼","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","人类","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","麝鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","刺猬","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","蝙蝠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","松鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","跳鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","海狸","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","骆驼","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","獾","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","水獭","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","浣熊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","狮子","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","狐狸","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","熊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","猫","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","狗","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","老鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","鸭嘴兽","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","北极狐","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","小熊猫","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","北极熊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","熊猫","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","斑马","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","臭鼬","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","树袋熊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","袋熊","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","负鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","袋鼠","",0);
INSERT INTO element VALUES(NULL,"哺乳动物","袋獾","",0);

INSERT INTO element VALUES(NULL,"其他物种","颜料","",1);
INSERT INTO element VALUES(NULL,"其他物种","布袋","",1);
INSERT INTO element VALUES(NULL,"其他物种","木轮","",1);
INSERT INTO element VALUES(NULL,"其他物种","玻璃","",0);
INSERT INTO element VALUES(NULL,"其他物种","沙漏","",0);
INSERT INTO element VALUES(NULL,"其他物种","病毒","",0);
INSERT INTO element VALUES(NULL,"其他物种","砖块","",0);
INSERT INTO element VALUES(NULL,"其他物种","长笛","",0);
INSERT INTO element VALUES(NULL,"其他物种","房子","",0);
INSERT INTO element VALUES(NULL,"其他物种","蜂蜜","",0);
INSERT INTO element VALUES(NULL,"其他物种","雪人","",0);
INSERT INTO element VALUES(NULL,"其他物种","僵尸","",0);
INSERT INTO element VALUES(NULL,"其他物种","陶罐","",0);
INSERT INTO element VALUES(NULL,"其他物种","手推车","",0);
INSERT INTO element VALUES(NULL,"其他物种","木齿铁轮","",0);
INSERT INTO element VALUES(NULL,"其他物种","风笛","",0);
INSERT INTO element VALUES(NULL,"其他物种","时钟","",0);

-- 合成表
CREATE TABLE compound (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_element VARCHAR(16),
    second_element VARCHAR(16),
    composition VARCHAR(16)
);
INSERT INTO compound VALUES(NULL,"气","火","闪电");
INSERT INTO compound VALUES(NULL,"气","水","雾");
INSERT INTO compound VALUES(NULL,"泥土","火","岩石");
INSERT INTO compound VALUES(NULL,"泥土","水","泥");
INSERT INTO compound VALUES(NULL,"火","水","蒸汽");
INSERT INTO compound VALUES(NULL,"火","闪电","阳光");
INSERT INTO compound VALUES(NULL,"雾","水","冰");
INSERT INTO compound VALUES(NULL,"岩石","气","沙子");
INSERT INTO compound VALUES(NULL,"气","雾","云");
INSERT INTO compound VALUES(NULL,"泥土","闪电","DNA");
INSERT INTO compound VALUES(NULL,"泥土","阳光","黑暗");
INSERT INTO compound VALUES(NULL,"岩石","阳光","月亮");
INSERT INTO compound VALUES(NULL,"云","冰","雪");
INSERT INTO compound VALUES(NULL,"泥","沙子","黏土");
INSERT INTO compound VALUES(NULL,"火","树","煤炭");
INSERT INTO compound VALUES(NULL,"DNA","阳光","海草");
INSERT INTO compound VALUES(NULL,"DNA","泥土","蘑菇");
INSERT INTO compound VALUES(NULL,"岩石","海草","苔藓");
INSERT INTO compound VALUES(NULL,"海草","气","蕨类植物");
INSERT INTO compound VALUES(NULL,"泥土","苔藓","草");
INSERT INTO compound VALUES(NULL,"草","阳光","花");
INSERT INTO compound VALUES(NULL,"泥土","蕨类植物","树");
INSERT INTO compound VALUES(NULL,"沙子","蕨类植物","棕榈树");
INSERT INTO compound VALUES(NULL,"树","雪","枞树");
INSERT INTO compound VALUES(NULL,"水","草","芦苇");
INSERT INTO compound VALUES(NULL,"草","沙子","荆棘");
INSERT INTO compound VALUES(NULL,"沙子","花","仙人掌");
INSERT INTO compound VALUES(NULL,"阳光","花","向日葵");
INSERT INTO compound VALUES(NULL,"水","花","荷花");
INSERT INTO compound VALUES(NULL,"花","荆棘","玫瑰");
INSERT INTO compound VALUES(NULL,"蘑菇","蟾蜍","毒蕈");
INSERT INTO compound VALUES(NULL,"DNA","水","浮游生物");
INSERT INTO compound VALUES(NULL,"水","浮游生物","鱼");
INSERT INTO compound VALUES(NULL,"岩石","浮游生物","三叶虫");
INSERT INTO compound VALUES(NULL,"闪电","鱼","电鳗");
INSERT INTO compound VALUES(NULL,"水","三叶虫","虾");
INSERT INTO compound VALUES(NULL,"沙子","三叶虫","螃蟹");
INSERT INTO compound VALUES(NULL,"鱼","荆棘","黄貂鱼");
INSERT INTO compound VALUES(NULL,"水","哺乳动物","鲸鱼");
INSERT INTO compound VALUES(NULL,"狮子","水","海狮");
INSERT INTO compound VALUES(NULL,"鱼","猫","鲶鱼");
INSERT INTO compound VALUES(NULL,"鲸鱼","颜料","逆戟鲸");
INSERT INTO compound VALUES(NULL,"气","鱼","火蜥蜴");
INSERT INTO compound VALUES(NULL,"泥","火蜥蜴","青蛙");
INSERT INTO compound VALUES(NULL,"岩石","火蜥蜴","陆地龟");
INSERT INTO compound VALUES(NULL,"沙子","火蜥蜴","蜥蜴");
INSERT INTO compound VALUES(NULL,"青蛙","泥土","蟾蜍");
INSERT INTO compound VALUES(NULL,"电鳗","蜥蜴","蛇");
INSERT INTO compound VALUES(NULL,"树","三叶虫","虫子");
INSERT INTO compound VALUES(NULL,"虫子","花","蜜蜂");
INSERT INTO compound VALUES(NULL,"虫子","芦苇","蜻蜓");
INSERT INTO compound VALUES(NULL,"虫子","沙子","蝎子");
INSERT INTO compound VALUES(NULL,"蜥蜴","气","鸟");
INSERT INTO compound VALUES(NULL,"鸟","水","鸭");
INSERT INTO compound VALUES(NULL,"鸟","黑暗","猫头鹰");
INSERT INTO compound VALUES(NULL,"鸟","煤炭","乌鸦");
INSERT INTO compound VALUES(NULL,"鸟","猫","猫鸽");
INSERT INTO compound VALUES(NULL,"鸟","颜料","企鹅");
INSERT INTO compound VALUES(NULL,"乌鸦","颜料","喜鹊");
INSERT INTO compound VALUES(NULL,"颜料","鸭","潜鸟");
INSERT INTO compound VALUES(NULL,"玻璃","沙子","沙漏");
INSERT INTO compound VALUES(NULL,"DNA","DNA","病毒");
INSERT INTO compound VALUES(NULL,"沙子","火","玻璃");
INSERT INTO compound VALUES(NULL,"蜜蜂","花","蜂蜜");
INSERT INTO compound VALUES(NULL,"人","雪","雪人");
INSERT INTO compound VALUES(NULL,"病毒","人","僵尸");
INSERT INTO compound VALUES(NULL,"树","砖块","房子");
INSERT INTO compound VALUES(NULL,"木轮","树","手推车");
INSERT INTO compound VALUES(NULL,"木轮","荆棘","木齿铁轮");
INSERT INTO compound VALUES(NULL,"长笛","布袋","风笛");
INSERT INTO compound VALUES(NULL,"黏土","火","砖块");
INSERT INTO compound VALUES(NULL,"气","树","长笛");
INSERT INTO compound VALUES(NULL,"木轮","黏土","陶罐");
INSERT INTO compound VALUES(NULL,"沙漏","木齿铁轮","时钟");
INSERT INTO compound VALUES(NULL,"泥土","蜥蜴","哺乳动物");
INSERT INTO compound VALUES(NULL,"树","哺乳动物","黑猩猩");
INSERT INTO compound VALUES(NULL,"泥土","哺乳动物","地鼠");
INSERT INTO compound VALUES(NULL,"泥","哺乳动物","猪");
INSERT INTO compound VALUES(NULL,"草","哺乳动物","马");
INSERT INTO compound VALUES(NULL,"闪电","哺乳动物","黄鼬");
INSERT INTO compound VALUES(NULL,"云","哺乳动物","羊");
INSERT INTO compound VALUES(NULL,"黑暗","哺乳动物","黑豹");
INSERT INTO compound VALUES(NULL,"月亮","哺乳动物","狼");
INSERT INTO compound VALUES(NULL,"黑猩猩","长笛","人");
INSERT INTO compound VALUES(NULL,"地鼠","芦苇","麝鼠");
INSERT INTO compound VALUES(NULL,"地鼠","荆棘","刺猬");
INSERT INTO compound VALUES(NULL,"地鼠","气","蝙蝠");
INSERT INTO compound VALUES(NULL,"地鼠","树","松鼠");
INSERT INTO compound VALUES(NULL,"地鼠","沙子","跳鼠");
INSERT INTO compound VALUES(NULL,"地鼠","水","海狸");
INSERT INTO compound VALUES(NULL,"马","沙子","骆驼");
INSERT INTO compound VALUES(NULL,"黄鼬","泥土","獾");
INSERT INTO compound VALUES(NULL,"黄鼬","水","水獭");
INSERT INTO compound VALUES(NULL,"黄鼬","树","浣熊");
INSERT INTO compound VALUES(NULL,"黑豹","沙子","狮子");
INSERT INTO compound VALUES(NULL,"狼","泥土","狐狸");
INSERT INTO compound VALUES(NULL,"蜂蜜","哺乳动物","熊");
INSERT INTO compound VALUES(NULL,"黑豹","人","猫");
INSERT INTO compound VALUES(NULL,"狼","人","狗");
INSERT INTO compound VALUES(NULL,"麝鼠","泥土","老鼠");
INSERT INTO compound VALUES(NULL,"海狸","鸭","鸭嘴兽");
INSERT INTO compound VALUES(NULL,"狐狸","雪","北极狐");
INSERT INTO compound VALUES(NULL,"熊","雪","北极熊");
INSERT INTO compound VALUES(NULL,"火","狐狸","小熊猫");
INSERT INTO compound VALUES(NULL,"熊","颜料","熊猫");
INSERT INTO compound VALUES(NULL,"马","颜料","斑马");
INSERT INTO compound VALUES(NULL,"黑豹","颜料","金钱豹");
INSERT INTO compound VALUES(NULL,"黄鼬","颜料","臭鼬");
INSERT INTO compound VALUES(NULL,"熊","布袋","树袋熊");
INSERT INTO compound VALUES(NULL,"跳鼠","布袋","袋鼠");
INSERT INTO compound VALUES(NULL,"地鼠","布袋","负鼠");
INSERT INTO compound VALUES(NULL,"麝鼠","布袋","袋熊");
INSERT INTO compound VALUES(NULL,"老鼠","布袋","袋獾");

-- 卡片表
CREATE TABLE card (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    value VARCHAR(128),
    sex TINYINT,
    employ TINYINT
);

INSERT INTO card VALUES(NULL,"卡片1","1111",1,0);
INSERT INTO card VALUES(NULL,"卡片2","222",0,0);
INSERT INTO card VALUES(NULL,"卡片3","1331",1,0);
INSERT INTO card VALUES(NULL,"卡片4","4411",0,0);
INSERT INTO card VALUES(NULL,"卡片5","15511",0,0);
INSERT INTO card VALUES(NULL,"卡片6","661",2,0);
INSERT INTO card VALUES(NULL,"卡片7","77711",2,0);
INSERT INTO card VALUES(NULL,"卡片8","11881",2,1);