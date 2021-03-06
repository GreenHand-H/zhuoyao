﻿set names utf8;
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
  img_name   varchar(50),
  img_sm  varchar(50),
  img_lg  varchar(50),
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


#插入宠物 pet_list
INSERT INTO   pet_list VALUES(null,"狻猊",1,"我是龙的第五子，因为性格文静，被收为佛祖坐骑。 我也是香炉，焚香在我腹中燃烧，散发出香气。 故而千百年来，我在香气缭绕中，熟知了每一种香料： 白梅、檀木、麝香、桂花…… 虽然我是火，我是毁灭。 而我懂得在我心中燃烧之物的珍贵。 于是，它们心甘情愿地在我怀中温柔消逝。",'sn-name.png',"sn-sm.png","sn-lg.png");
INSERT INTO   pet_list VALUES(null,"火猊王",1,"和我的模样不太一样：其实我喜欢和平，不爱动手。 每次打仗都弄得四处乱糟糟的民不聊生，扰了我的清净，我还想静静赏香呢。 尤其是那些恃强凌弱的不义战争，我着实厌恶极了。 如果结束战争的唯一办法就是打赢它，那么…… 硝烟的味道，我也很喜欢。",'hnw-name.png',"hnw-sm.png","hnw-lg.png");
INSERT INTO   pet_list VALUES(null,"龙狮帝",1,"你说……你已经寻得了吾自何处而生的答案？ 且慢，且慢……御灵师，你可知道狻猊这个名字已经在中华大陆传颂了多少年……你可知自己正试图解释怎样的历史？ ……什么？什么叫“安静的力量”？ 强大的力量蕴含着狂暴与愤怒……而安静的力量，则像是佛前缭绕的香烟那样，即温和，又不容辩驳……这就是你找到的答案吗，御灵师？ 与纯粹的力量相对应的，克制的力量，安静的力量……这样说来，确实没有任何狻猊造像是杀戮之像，相反，倒有些嬉闹、慈爱的例子…… 不……吾不会轻易接受你的答案，这太轻易了；但是……这倒算是个…… 不错的答案。",'lsd-name.png',"lsd-sm.png","lsd-lg.png");
INSERT INTO   pet_list VALUES(null,"贪狼",1,"贪狼从西伯利亚的雪原而来，是雪狼神仅存的一支血脉。 “像人类一样，狼群也有严格的等级制度，只有变得更强更快才行。”面对镜头的小贪狼落落大方，面对记者的采访，俨然一个成熟的格斗国际冠军。实际上，他就是。 “但是追求速度就意味着，我永远不会是重量级选手。所以趁我还小的时候，我应该多学习一些招式轻盈的功夫。天下武功，唯快不破。” “我也研究了许多功夫电影，我的偶像是李小龙。”",'tl-name.png',"tl-sm.png","tl-lg.png");
INSERT INTO   pet_list VALUES(null,"啸渊王",1,"“都说狼是贪婪，残忍，野性，暴虐的…… 可是， 贪婪造就我更锋利的牙齿， 残忍是我更快的身手， 野性让步伐更轻盈， 暴虐让我更冷静面对结局。 是的，我贪婪，残忍，野性，暴虐。 听上去没有一个好词儿， 因为，这正是敌人对我的理解！” “Cut！非常好！”导演拍拍它的肩膀，“等着吧，你的这支个人宣传片一定会火！” 关掉了灯光，啸渊王擦掉了脸上的粉脂，只觉得有些迷茫。",'xyw-name.png',"xyw-sm.png","xyw-lg.png");
INSERT INTO   pet_list VALUES(null,"天狼星",1,"所以，怎么也没想到，自己竟然成了跑通告的明星。走到哪儿，都有少女粉丝尖叫地上来索要签名。 其实这也没什么不好意思的，只要功夫不退步就行。 可是“三日不练功，外行也知道”，天狼星只得回到武馆埋头打拳。 最重要的事，不是钱，也不是名气。 而是，砰！把父亲教我的！功夫！传！出！去！ 既然选择了在城市中留下，就不要再羞耻了。好好干吧。",'tlx-name.png',"tlx-sm.png","tlx-lg.png");
INSERT INTO   pet_list VALUES(null,"招风",1,"风是鸟的神，鸟儿们借风飞翔，或在逆风中苦苦挣扎。 我却可以驾驶风，操纵风。我是风的主人。 只因我从不想征服天空，我从不渴求。风自然就会随心所欲。 人常言“好风凭借力，送我上青云。” ——青云之上，真有那么好？ 你是未晓得青云上的冷，便空艳羡高处的得意罢了。",'zf-name.png',"zf-sm.png","zf-lg.png");
INSERT INTO   pet_list VALUES(null,"胜寒鸟",1,"高处不胜寒。 在极高的天空，有一只鸟，叫做胜寒。 胜寒鸟栖息在云端。因为飞得太高，它也常常搭飞机的便车，收起翅膀，蹲在行驶中的飞机上一会儿。但在人类靠近时，它们便会隐藏自己巨大的身躯。 有时飞机莫名的颠簸，其实正是源自它们翅膀扇动的气流。",'shn-name.png',"shn-sm.png","shn-lg.png");
INSERT INTO   pet_list VALUES(null,"御风凰",1,"如今的世界，不再需要凤凰这样繁复精致的巨鸟了。 凤凰们便不断进化，变得愈来愈轻盈。 然而，这一身华美羽衣依旧是它凤凰血脉的证明。 为什么总想飞得更高？ 你知道吗？在足够高的地方，是没有风的，所有东西都如此渺小。 飞得很高很高时，我首先学会的就是悲悯和遗忘。",'yfh-name.png',"yfh-sm.png","yfh-lg.png");
INSERT INTO   pet_list VALUES(null,"穿山甲",2,"“学挖掘技术，找……” 穿山甲听见这条广告，疑惑地问妈妈，“什么是‘挖掘技术’啊？” “挖掘技术，就是我们的拿手本领啊！” “我什么时候能学会呢？” “等你的爪子长得更坚硬，等你的手臂更有力的时候，就可以了！” “嗷呜，那我可要好好吃饭！” “真乖，宝宝为什么这么着急挖山啊？” “我想钻个洞，去找地火龟玩儿！它说它住在我们家下面大概一千多米深！”",'csj-name.png',"csj-sm.png","csj-lg.png");
INSERT INTO   pet_list VALUES(null,"搬山甲士",2,"“唉唉唉，您请留步，请问您对赚钱有兴趣吗？” 这天搬山甲士正在街上走着，一个人鬼鬼祟祟地拦住了它。 “您有兴趣和我合作宝石生意吗？您负责开山，我来把宝石卖出去，我们五五分成。价格好谈。” “你问过土地了吗？你问过小山神了吗？你问过跳跳他爸了吗？” “没有……这都是谁啊？” “那就不行，随便挖宝贝是要被惩罚的，再见！”搬山甲士头也不回的走了。 “喂……”",'bsjs-name.png',"bsjs-sm.png","bsjs-lg.png");
INSERT INTO   pet_list VALUES(null,"卸岭力士",2,"黑山要开隧道，通高铁，不能只用机器开。这样对在山中居住着的不知情的生灵很危险，只能先拜托卸岭力士了。 “妈妈，我出发了！” 卸岭力士向前挖，却挖到了奇怪的巨大内脏： “啊！这是黑山老妖的心肝脾肺肾！”",'xlls-name.png',"xlls-sm.png","xlls-lg.png");
INSERT INTO   pet_list VALUES(null,"迷蝴蝶",2,"“庄生晓梦迷蝴蝶”说的就是它了。很多人至今都不知道，我到底叫“迷蝴蝶”，还是“迷糊蝶”。 迷蝴蝶可以将你的梦境带出睡眠，这样你醒来的时候，还是能记得刚刚做的梦境。如果它不在你的卧室里，你醒来就会以为自己一夜无梦，其实只是忘了罢了。若是这个梦有预言意义，她便会暗暗发力，将你快些弄醒，如此你就会注意到梦中的信息。 越是把自己的梦当回事的人，越会招来更多的迷蝴蝶。",'mhd-name.png',"mhd-sm.png","mhd-lg.png");
INSERT INTO   pet_list VALUES(null,"莫返蝶",2,"有些人修炼清明梦，试图控制梦中的情节，像现实中一样，自主行动，甚至控制好自己将遇到的客体。这种行为十分危险，容易分不清梦境和现实而走火入魔。也容易沉溺于梦境不能自拔，一心只想做梦。 这样的人，幸运的话，莫返蝶就会剥夺他做清明梦的能力，不许他再自由做梦。不幸的话，莫返蝶则会将他带到梦境的更深处，直至不再醒来。",'mfd-name.png',"mfd-sm.png","mfd-lg.png");
INSERT INTO   pet_list VALUES(null,"清明蝶",2,"如果你认为梦中只是一个虚构的世界，那可就大错特错了。 现实中的每一个事物，都在梦中有完美的对照 你看那梦中天上的飞鸟，其实是你的野心，它那低飞的翅膀，正是暗示着你现实中受到的挫折。 你看那些你曾失去的东西，在梦中追逐着你，其实是你在后悔丢失它们。 那个小世界自行运转，你却无缘细细品鉴它。唯有知道你所有梦境的清明蝶在其中飞翔，整理并统治。",'qmd-name.png',"qmd-sm.png","qmd-lg.png");
INSERT INTO   pet_list VALUES(null,"螺莉莉",2,"嘘，我可不是一般的田螺哦！你有见过田螺里住人的吗？ 你看那个少年，每天早出晚归，白日辛苦上班，晚上仍然挑灯读书。多勤奋的一个孩子啊！我就在这儿住下了，早晚有一天他会拾到我。 到时候，我会给他一个惊喜。",'lll-name.png',"lll-sm.png","lll-lg.png");
INSERT INTO   pet_list VALUES(null,"地火小龟",2,"地火小龟在地壳中出没，凡是它们居住的地方，都有温泉流淌。 其中一个村就叫“温泉”，在胶东半岛。据说那里的驴儿都被惯出了毛病，从来不喝凉水，只喝温水。据说每个温泉泉眼，都有一个地火龟把守。 穿山甲常常说要找我玩，可是我这里真是很热啊。不知道它受得了吗？",'dhxg-name.png',"dhxg-sm.png","dhxg-lg.png");
INSERT INTO   pet_list VALUES(null,"顽铜狮",2,"顽铜狮自小就和狻猊玩，好多人只能凭颜色分辨他俩。 其实二人性格大不相同，狻猊喜静，顽铜狮喜动，最爱上街看看杂耍，自己也常常练习顶球。 再稍微大一点，顽铜狮就要练习一项对他来说更难的“杂技”： 安静地在门口坐着。",'wts-name.png',"wts-sm.png","wts-lg.png");

INSERT INTO   pet_list VALUES(null,"小狐狸",2,"我也不知道我是啥时候开始记事的。我能想到的最早的事情是有一天，我住的洞子门口突然出现了一颗萝卜。萝卜头上的四叶草中间有一颗果子。我本来不想理它，因为我对隔壁村养的鸡以外的食物都不大感兴趣。但这颗萝卜好死不死扎在我洞门口的正中央。于是我决定把它拱出来扔掉。但我刚靠近它，它竟然一把就从土里跳起来了。我还来不及说出“天哪，你真胖！”，这颗萝卜直接就给我跪下了，嘴巴里还念叨着什么“好汉饶命”之类的话。在磕了几个头后，这个胖萝卜一溜烟跑了，头上的果子也掉下来了。……恩……红红的……看起来很好吃的样子。但是！作为肉食主义者，我是不会吃的，这辈子都不可能吃果子的！…………嗯……真香……",'xhl-name.png',"xhl-sm.png","xhl-lg.png");
INSERT INTO   pet_list VALUES(null,"田螺少女",3,"他从未见过这么漂亮的田螺，便拾起来带回家了。洗干净以后，放在玻璃鱼缸中养起来。 白天他去上班了，田螺少女就从鱼缸中爬出来，打开吸尘器吸地，把脏衣服丢到洗衣机里，又做了他爱吃的牛肉芝士披萨（因为总见他点这个外卖）。忙活了一天，他刚好下班。田螺少女便飞速回到鱼缸里，钻进螺壳内。",'tlsn-name.png',"tlsn-sm.png","tlsn-lg.png");
INSERT INTO   pet_list VALUES(null,"金花狮",3,"一边的女孩子踩着小狮子，它自己要踩着绣球，说什么寓意着“社稷兴旺”。 他倒是不在乎这么多啦，不过来往的行人都要驻足观看，甚至摸摸它的爪子，说一句：“真好看啊……真威风！” 它听了有点得意，又挺了挺腰杆。",'jhs-name.png',"jhs-sm.png","jhs-lg.png");
INSERT INTO   pet_list VALUES(null,"花无邪",3,"花无邪是花妖，掌管一切美好而短暂的东西。 就像鲜花盛开，就像……爱情萌发。 要说她为什么是花妖，而非花神，是因为她邪得很： 她只管花儿开放的一瞬间。 “凌晨四点，看海棠花未眠。” 那时，你望着花，花垂下目光。而她，定坐在枝头望着你。",'hwy-name.png',"hwy-sm.png","hwy-lg.png");
INSERT INTO   pet_list VALUES(null,"花无撷",3,"讨厌一朵花，就把她摘下来。 爱一朵花，也把她摘下来。 人类不奇怪吗？ 你称赞她的美丽时，她却正在飞速衰老。 如果花会说话，那花瓶里的，都在哭吧。 如果你想知道她是花妖的原因： 她恨人类表达喜爱的方式如此残忍。 她太怨，而无法成为花神。",'hwx-name.png',"hwx-sm.png","hwx-lg.png");
INSERT INTO   pet_list VALUES(null,"田螺姑娘",4,"“咦，家里进贼了？”他回来看到这一切，很是疑惑。 “不对啊，我没给过别人钥匙呀……难道是？”目光说着落在了鱼缸里的田螺上。 “不会是传说中的田螺姑娘吧？” “我不信，我要做个辣炒田螺吃……”",'tlgl-name.png',"tlgl-sm.png","tlgl-lg.png");
INSERT INTO   pet_list VALUES(null,"门神狮",4,"不知不觉，门神狮已经在这里站了好几年了。人所不知的是，其实每到晚上，它依然会偷偷活动活动，变化变化姿势。 门神狮变得越来越专业，也会随着主人要求变化表情，如果有人请他站在自己卧房前，它就眯起眼睛，一副睡眼惺忪的模样。不像在外面那么怒目圆睁。",'mss-name.png',"mss-sm.png","mss-lg.png");
INSERT INTO   pet_list VALUES(null,"花非花",4,"花的尊严在何处呢？ 是美色吗？是香气吗？ 花，实非花也。 此时，花是你眼中的花，而非真正的花。 只有被观看的，才有价值吗？ 一朵深山的野花，独自绽开，独自凋零，没有被任何人看见。 它算美丽的花吗？ 一个人，做自己认为重要的事，不被任何人理解，甚至不被人知道。 他算一个出色的人吗？ 他是一个人，不是他人眼中的人，才算人。",'hfh-name.png',"hfh-sm.png","hfh-lg.png");
INSERT INTO   pet_list VALUES(null,"真火元龟",5,"我所到之处都散发出强大的地热能，如果说地火龟的热只够让人泡个温泉，那么我离火龟的能力就是帮他们供暖和发电了。 我的能力这么好用也是近些年人类才发现的，之前几千年的热能都白白燃烧了。也好，尚且不算晚！ 我们火龟虽然很多，可是等级非常森严，越往上的越稀少，一万只地火龟里有一只能成为离火龟的，可是一亿只离火龟里，才有一只真火龟。我所到之处都散发出强大的地热能，如果说地火龟的热只够让人泡个温泉，那么我离火龟的能力就是帮他们供暖和发电了。 我的能力这么好用也是近些年人类才发现的，之前几千年的热能都白白燃烧了。也好，尚且不算晚！ 我们火龟虽然很多，可是等级非常森严，越往上的越稀少，一万只地火龟里有一只能成为离火龟的，可是一亿只离火龟里，才有一只真火龟。",'zhyg-name.png',"zhyg-sm.png","zhyg-lg.png");
INSERT INTO   pet_list VALUES(null,"离火玄龟",6,"它突然嘴里喷出火来，在烈火中，财主的十四间厢房都烧了起来，火光满天，足足烧了七天七夜。 有人看到它在火中重生，化为巨大的龟神，踏着祥云远去。 大火烧过的地方，化为良田万顷，当地人民过上了富庶的好日子。 它始终没有怨恨过人类。",'lhxg-name.png',"lhxg-sm.png","lhxg-lg.png");
INSERT INTO   pet_list VALUES(null,"狐公子",7,"本公子玉树临风，英俊潇洒，怎是你说的这般不堪？啥？你说长得像吴彦祖都不行？那稍等，我变个彭于晏……嗯？你说我身高又不够？天哪我还是个孩子啊！孩子怎么了，孩子就不让玩了？我跟你讲我百年修行终得灵智岂是尔等可比的？我不管，我就要坐这个过山车。你不让我进去我就……等等喂，放我下来！我可是买了VIP插队票的！",'hgz-name.png',"hgz-sm.png","hgz-lg.png");
INSERT INTO   pet_list VALUES(null,"狐娘子",7,"和我那个蠢哥哥不一样，我喜欢安静的呆在洞子里，看看书，写写小说，偶尔玩一把吃鸡。哪像他，有点本事就变个帅哥出去到处浪，有几次喝醉了差点变回原形。狐仙的变化是无法跳出年龄的，你见过1米2的吴彦祖么？你看，说着说着就来了。我愚蠢的哥哥竟然跑去游乐场想做过山车，不仅没进去，逃票还被人发现，被扔出来了，打电话让我微信转点钱打车回来……你说在这世间安安心心修炼不好么？总比外面的人类起早贪黑的过几十年变一堆黄土强吧？算了不说了，以后我得把他管得死死的，省的到时候被人拿去做了围巾。",'hnz-name.png',"hnz-sm.png","hnz-lg.png");
INSERT INTO   pet_list VALUES(null,"红玉",7,"人说侠以武犯禁，可这世间总总不平，也没见事事得报。师傅曾说，历练红尘的好处在于把握心持，也就是自己的”道“。我想他的意思是让我在红尘中磨平我的性子，早日飞升。可在世间行走越久，我便更加嫉恶如仇。那冯生何罪之有？竟受杀父夺妻之辱？其子又有和错？那官府县令竟然要将其扼杀。这天道不应，我便来应。这便是我的”道“！",'hy-name.png',"hy-sm.png","hy-lg.png");
INSERT INTO   pet_list VALUES(null,"黄九郎",7,"我姓黄。因为年幼，家里尚未起名，排行老九，所以被叫做黄九郎。 不管男女老少，走到哪儿都有人称赞我的美貌。在21世纪，我选择当一个服装模特，摄影师和品牌方都喜欢我的冷郁的眼神，狭长的眼睛。 其实我们男狐和女狐一样，化为人类的时候都多少带着狐狸的特质。我们性格温柔又刚烈，既是缱绻的情人，到了复仇时，眼睛也可以不眨一下。但就像人有好人坏人一样，狐中也有在乎人性命的，和杀人不眨眼的。 而我，则是两者皆有：我为了自己在乎的人，帮他杀了一个坏人。像我这样的狐，你怎么看？",'hjl-name.png',"hjl-sm.png","hjl-lg.png");
INSERT INTO   pet_list VALUES(null,"酒狐",7,"且乐生前一杯酒，何须身后千载名？这酒……嗝儿……真是好东西啊！其实我的酒量并不好，和隔壁那个姓陆的判官比起来差远了。嗝儿……但是醉拳么，当然是醉得越早越好啊。嗝儿……可惜每次和陆判喝酒，必定是我先倒下，而后醒来时便发现趴在他庙里的供台上。如此酒友，哪里寻得到啊。",'jh-name.png',"jh-sm.png","jh-lg.png");
INSERT INTO   pet_list VALUES(null,"乔娜",7,"我喜欢喝酒。 从我的丈夫去世之后，我就愈发地喜欢喝酒。 所谓醉眼看人间，人间多温柔。 我本来就是个温柔的人，对世间的一切都充满同情。那年雷劫之后，我的眼睛开始变得不一样，渐渐地分为两种颜色。老人家说，这叫做“阴阳妖瞳”，能见鬼神。于是我见到的人间，比别人多了几重。 我能见孔郎与松娘带着孩子共享天伦，也能见表兄秉琅嬛诸宝遨游四海自在逍遥，每每想到，嘴角都忍不住会泛起微笑。 我也能见到在世间游离的幽魂精怪，他们都沉浸在自己的生命里。遇到处境凄惨的人，我都会忍不住帮上一把。 只是，温柔遍世，却无我自己的。 曾经我也是有丈夫、有家庭的人，可如今无论与家人如何亲近，我也知道我只是独自一人。 或许这就是温柔的寂寞吧，那个人曾经唱过的。",'qn-name.png',"qn-sm.png","qn-lg.png");
INSERT INTO   pet_list VALUES(null,"婴宁",7,"爱笑的女孩子，运气总不会太差。 我的狐母在学会上网后，就老是跟我重复这句话。 谁能帮帮她？让她少看些奇怪的网站啊？最最最不济，去微视看看短视频不好吗？土味情话也比这种尴尬的台词要强啊。 世界上的人只看到我笑，王子服却看过我哭。 是啊，既然为人，怎么会没有感情呢？我从小在山野里长大，面对诸多精怪，笑已经几乎成了我的武器。笑能软化别人的意志，放松别人的警惕，也让别人猜不透你到底在想什么。 我还有许多面貌，连王子服也没有见过。 所以，也许，爱笑的女孩子最危险。",'yn-name.png',"yn-sm.png","yn-lg.png");
INSERT INTO   pet_list VALUES(null,"皇甫公子",7,"小时后，我爱读一本叫《琅嬛琐记》的书。 世上的人都以为这书是虚言笑谈，但是把这本书传给我的狐族长老明确地告诉过我，这本书上记载的事情，全都真实存在过。 这是一本记载密地、法宝、奇咒的书，作者假托了一个“伊士珍”的姓名，其实就是谐音“异事真”。 这本书里记载的事情，多数都与我们妖灵有关。但是这本书的妖灵，与人为友，助人为善，并不存在害人的事情。长老传给我们这本书，就是要我们知道妖灵与人应该如何相处。 也许就是因为这本书的教导，我才能在多年后遇到孔雪笠，才能躲过那场天雷大劫，救得全家性命。 古人说：冤冤相报何时了，却没有说以善相处，以义相交，也是天长地久的事情啊。",'hfgz-name.png',"hfgz-sm.png","hfgz-lg.png");
INSERT INTO   pet_list VALUES(null,"小安康",8,"“他们为什么拿你祭河神？” “不是祭，是拜河神！彤彤有泪结石，村长说河神会帮彤彤治病哒。” “他们骗你！河神会吃了你！你家人不阻止吗？” “彤彤没有家人…谢谢哥哥，但您误会了，河神保护村子不会吃人的。” 云游到这偏远村落的陆少侠，听说今夜要祭祀河神，悄悄来到河边的牢房，想行侠仗义解救被献祭的少女，却不料这孩子丝毫没意识到等待她的命运。 “小陆哥哥…”看着为自己战斗的少侠，眼泪聚上彤彤的眼眶。 忽然，一壮汉从后方夹击，“哥哥小心！”待少侠回过神时，彤彤已挣脱怀抱，扑倒偷袭的壮汉，她的头撞在石壁上，而后直直掉进河里。 “彤彤！”少侠跪倒在地，向深不见底的河水咆哮“对不起…我没能保护你…” 一颗彤彤的眼泪滚到少侠身边，他捧起这颗圆润剔透的泪珠，就像将彤彤抱在怀里一样… 彤彤沉入河底，她看到面目骇人的河神游向自己“彤彤要被吃掉了…只要小陆哥哥平安就好…”河神抓住彤彤张开血盆大口，吻在彤彤额头“鳞儿，终于回来了，急死为父了…”随着冰冷的吻所有记忆涌回脑海，彤彤的双腿化为鱼尾，头顶生出明珠。呀，想起来了，我是河神的女儿，泣泪成珠的鲛人族公主，我不是彤彤，我叫彩鳞。",'xak-name.png',"xak-sm.png","xak-lg.png");
INSERT INTO   pet_list VALUES(null,"擎明珠",8,"前些日子，海底召开了一次民主大会。 龙王它们拟建立一套深海交通法规，以适应海底日益拥挤繁忙的现象。 这个主意本来不错，但是它们却偏偏要我当交警兼海底红绿灯，这是个苦差事，我可不愿意呢。 我说，不如把夜明珠交出来，这样自成一个发光的交通大转盘，岂不更好？ 龙王听了，又轮到他不愿意了。",'qmz-name.png',"qmz-sm.png","qmz-lg.png");
INSERT INTO   pet_list VALUES(null,"海灯使",8,"最后还是我在网上订购了一套交通信号灯系统，又拜托龙王在岸上做了一个防水抗压处理，这才敢拿下水用。 深海鱼们对这个信号灯褒贬不一，有的说它太亮了晃眼，有的说。我是喜欢光亮的。这不，自从海底有光了，大家都更注重打扮了，模样也愈来愈周正了。",'hds-name.png',"hds-sm.png","hds-lg.png");
INSERT INTO   pet_list VALUES(null,"雷童子",8,"雷童子驾到！！！！ 喂喂喂别挡道！挡道会被我劈的不知道吗！天打我劈，我打不动，我厉风行——反正我就是雷，雷就是我！ 要说我雷童子为啥看起来是黑黑的、小小的，那还不是要怪你们人类？！你们总觉得被我劈过的东西一团焦黑，所以我本人也得是黑的……有没有逻辑啊我说！你是御灵师吧？你动动脑筋帮我想想啊，我想变得闪闪发光、白白的、看起来特别帅——喂喂，别走，别走啊！",'ltz-name.png',"ltz-sm.png","ltz-lg.png");
INSERT INTO   pet_list VALUES(null,"雷先锋",8,"他们还真的做到了： 雷霆先锋呆呆翻着《雷州半岛概要》。看到里面记载了三种方案，可以将雷电引下，为人类所用： 一、用氢气球牵引细钢丝放入高空引雷 二、用小型火箭升空引雷 三、用气体激光器制造电离通道引雷。 然后再将这些电阻变成热能继续使用。 “太可怕了，我要告诉南海龙王。”",'lxf-name.png',"lxf-sm.png","lxf-lg.png");
INSERT INTO   pet_list VALUES(null,"天劫使",8,"我意识到一个非常严重的问题。 为什么我越厉害，发型就越……高呢？ 既然妖灵体现了人类的想象，到底为什么人类会觉得雷电应该是卷卷毛来着……因为“雷鬼”音乐吗？还是因为啥？听说有个叫雷神的形象最近很流行，为啥你们就不能努力点儿、把我的外形想象成他那样啊？真是的，我都可以一抬手降下天劫了，但还是黑乎乎的…… 不过啊，不过啊……看久了倒也觉得不赖，而且我的雷云又变大了哦~嘿嘿~很厉害吧？",'tjs-name.png',"tjs-sm.png","tjs-lg.png");
INSERT INTO   pet_list VALUES(null,"银灵童子",9,"银灵是太上老君身边的童子，看管着银炉子，自小和金角一起长大。 不像金角那般莽撞热情，银灵公子总是安静沉思着的。 所以在金角着急忙慌地拿出各种法宝挣钱，想要融入21世纪的一切时。 银灵只是沉默地看着。 金角跟师父生气的时候，银灵也依然一言不发。 最后金角也找到了银灵，质问他：“银灵，你就一点都不困惑吗？” “困惑什么？”",'yltz-name.png',"yltz-sm.png","yltz-lg.png");
INSERT INTO   pet_list VALUES(null,"银灵上仙",9,"“我知道你困惑什么。你看那山，是不是千年不变？这天，这地，虽然每瞬间都不一样，但也可以说它从未改变过。”银灵说。 “可是我不是天地，也不是山。我只是一个小神仙。” “所以跟我一起坐在这里看着大家熙熙攘攘地追赶，日头落了又升起来，潮水涨了又退了，不是很好吗？”银灵抬头看着金角，阳光悉数聚集在他的睫毛上，他继续问，“你有什么事要忙吗？” “……现在，没有了。” 金角坐在银灵身旁，又像个乖孩子了。 夕阳正在沉降到地平线以下。于此同时，在某处太阳也正在升起。",'ylsx-name.png',"ylsx-sm.png","ylsx-lg.png");
INSERT INTO   pet_list VALUES(null,"银灵尊者",9,"“银啊，为师我觉得，还是你更有修为些。”太上老君说。 “徒儿的智慧远不及金师兄。”银灵递给老君玉净瓶，摇着头一笑。 “他太莽撞，也不懂通融。” “故而正是可造之材，只要磨平棱角，褪去少年心性，师兄便可大有作为。” “你呢？” “我不过是个会安慰人的小仙罢了，只会善终，却没魄力开始。在我心里，我是可有可无的，但是师兄却是不可替代的热血。”",'ylzz-name.png',"ylzz-sm.png","ylzz-lg.png");






























