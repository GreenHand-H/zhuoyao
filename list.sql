set names utf8;
#创建游戏数据库
drop database  if exists game;
create database game charset=utf8;
use game;
#宠物类别
create table pet(
  pet_id int primary key, 
  id_name varchar(10)
);
#宠物列表
create table pet_list(
  pet_list_id   int primary key auto_increment,
  pet_name  varchar(5),
  list_id  int, #对应分类
  story  varchar(200),
  img   varchar(50),
  img_head  varchar(50),
  foreign key(list_id) references pet(pet_id)
);
#新闻活动之类
 create table news(
   nid int primary key  auto_increment,
   news_cont varchar(20),
   news_sort  varchar(2),#类别的分类
   news_url  varchar(20),  #跳转地址
   news_date  date
);
#攻略中心
create table strategy(
    s_id  int primary key  auto_increment,
    state_cont	varchar(20),
    state_sort	 varchar(4),#类别的分类
    state_url  varchar(20),  #跳转地址
    state_date   date
);
#图片展示
create table img_show(
    img_id int primary key  auto_increment,
    author  varchar(10),
    author_img  varchar(20),
    cont_url   varchar(20)
);

#插入pet 宠物类别数据
insert into pet values(1,'上古三门');
INSERT INTO pet VALUES(2,'最初的伙伴');
INSERT INTO pet VALUES(3,'四海志');
INSERT INTO pet VALUES(4,'四海志传奇');
INSERT INTO pet VALUES(5,'古怪集');
INSERT INTO pet VALUES(6,'古怪集传奇');
INSERT INTO pet VALUES(7,'青丘录');
INSERT INTO pet VALUES(8,'神武道');
INSERT INTO pet VALUES(9,'英雄会');


#插入新闻 news   公告
INSERT INTO news VALUES(null,'5月14日非法游戏行为处罚公示','公告',null,'2019-05-14');
INSERT INTO news VALUES(null,'5月11日非法游戏行为处罚公示','公告',null,'2019-05-11');
INSERT INTO news VALUES(null,'《一起来捉妖》玩家安全公约（跟新）','公告',null,'2019-05-09');
INSERT INTO news VALUES(null,'第三方软件政治说明','公告',null,'2019-05-02');
INSERT INTO news VALUES(null,'IOS系统避免重复资源跟新指引','公告',null,'2019-04-30');
INSERT INTO news VALUES(null,'【跟新公告】4月28日跟新说明','公告',null,'2019-04-27');
INSERT INTO news VALUES(null,'聊天环境整顿说明','公告',null,'2019-04-26');
INSERT INTO news VALUES(null,'严厉打击工作室公告','公告',null,'2019-04-23');
INSERT INTO news VALUES(null,'【恶劣天气】拒宅日温馨提示（4月21日）','公告',null,'2019-04-21');
INSERT INTO news VALUES(null,'【恶劣天气】拒宅日温馨提示（4月20日）','公告',null,'2019-04-20');
#插入新闻 news    新闻
INSERT INTO news VALUES(null,'拒宅周末，三大主播带你畅玩捉妖','新闻',null,'2019-05-11');
INSERT INTO news VALUES(null,'报告！前方有人即将承包你的精彩周六','新闻',null,'2019-05-10');
INSERT INTO news VALUES(null,'【5月8日】答御灵师问','新闻',null,'2019-05-11');
INSERT INTO news VALUES(null,'【4月20日】答御灵师问','新闻',null,'2019-05-11');
INSERT INTO news VALUES(null,'恭喜《一起来捉妖》登顶App Store免费榜','新闻',null,'2019-05-11');
INSERT INTO news VALUES(null,'腾讯首款AR探索手游《一起来捉妖》今日上线','新闻',null,'2019-05-11');
INSERT INTO news VALUES(null,'重大消息！4月11日不删档测试开启，就等你来','新闻',null,'2019-05-11');
#插入新闻 news    活动
INSERT INTO news VALUES(null,'【猫咪推理】520套装猫2配方基因线索公开','活动',null,'2019-05-11');
INSERT INTO news VALUES(null,'拒宅周末，三大主播带你畅玩捉妖','活动',null,'2019-05-11');
INSERT INTO news VALUES(null,'限时抽奖，满月狂欢，猫狗头套，就等你来','新闻',null,'2019-05-11');




#插入攻略中心  stategy  官方指引
INSERT INTO strategy VALUES(null,'【妖灵日记】角落里的小妖灵','官方指引',null,'2019-05-17');
INSERT INTO strategy VALUES(null,'【妖灵日记】你配吗','官方指引',null,'2019-05-15');
INSERT INTO strategy VALUES(null,'玩法爆料|御灵团战规则介绍','官方指引',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'四部教你玩转套装猫','官方指引',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：腾讯首款AR探索手游，户外旅行说走就走！','官方指引',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'一起来捉妖手游评测 健康出行悠闲捉妖','官方指引',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：探索万物有灵的奇幻世界','官方指引',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'【进阶攻略】偷吃香火的成精老鼠 地涌夫人战时策略','官方指引',null,'2018-09-17');
#新手指南
INSERT INTO strategy VALUES(null,'【妖灵日记】角落里的小妖灵','新手指南',null,'2019-05-17');
INSERT INTO strategy VALUES(null,'【妖灵日记】你配吗','新手指南',null,'2019-05-15');
INSERT INTO strategy VALUES(null,'玩法爆料|御灵团战规则介绍','新手指南',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'四部教你玩转套装猫','新手指南',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：腾讯首款AR探索手游，户外旅行说走就走！','新手指南',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'一起来捉妖手游评测 健康出行悠闲捉妖','新手指南',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：探索万物有灵的奇幻世界','新手指南',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'【进阶攻略】偷吃香火的成精老鼠 地涌夫人战时策略','新手指南',null,'2018-09-17');
#玩法活动
INSERT INTO strategy VALUES(null,'【妖灵日记】角落里的小妖灵','活动玩法',null,'2019-05-17');
INSERT INTO strategy VALUES(null,'【妖灵日记】你配吗','活动玩法',null,'2019-05-15');
INSERT INTO strategy VALUES(null,'玩法爆料|御灵团战规则介绍','活动玩法',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'四部教你玩转套装猫','活动玩法',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：腾讯首款AR探索手游，户外旅行说走就走！','活动玩法',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'一起来捉妖手游评测 健康出行悠闲捉妖','活动玩法',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：探索万物有灵的奇幻世界','活动玩法',null,'2019-03-19');
#御灵攻略
INSERT INTO strategy VALUES(null,'【妖灵日记】角落里的小妖灵','御灵攻略',null,'2019-05-17');
INSERT INTO strategy VALUES(null,'【妖灵日记】你配吗','御灵攻略',null,'2019-05-15');
INSERT INTO strategy VALUES(null,'玩法爆料|御灵团战规则介绍','御灵攻略',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'四部教你玩转套装猫','御灵攻略',null,'2019-04-25');
INSERT INTO strategy VALUES(null,'《一起来捉妖》评测：腾讯首款AR探索手游，户外旅行说走就走！','御灵攻略',null,'2019-03-19');
INSERT INTO strategy VALUES(null,'一起来捉妖手游评测 健康出行悠闲捉妖','御灵攻略',null,'2019-03-19');
