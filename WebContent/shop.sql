/*
 Navicat Premium Data Transfer

 Source Server         : main
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 05/12/2021 19:38:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `Admin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Admin`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('Admin', '123456');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `Uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gprice` decimal(10, 2) DEFAULT NULL,
  `Gsize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Gphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('wcj2000', '恒源祥全棉衬衣长袖商务正装职业工装秋季免烫纯棉条纹白色衬衫男', 218.00, 'L', '1', 'clothing/衬衫/image/21.webp');
INSERT INTO `cart` VALUES ('wcj2000', '安小落法式甜美娃娃领连衣裙早秋2021新款长袖气质中长款小白裙子', 149.00, 'XXL', '3', 'clothing/裙子/image/4.webp');
INSERT INTO `cart` VALUES ('wcj2000', '男士裤子休闲裤男春秋宽松直筒裤男裤长裤工装裤潮牌秋季潮流百搭', 123.00, 'XXL', '4', 'clothing/长裤/image/1.webp');
INSERT INTO `cart` VALUES ('111111', '小熊男士短袖t恤 2021新款潮牌纯棉体桖夏季青少年网红夏装上衣服', 78.00, 'M', '7', 'clothing/短袖/image/10.webp');
INSERT INTO `cart` VALUES ('333333', 'Dangerouspeople薛之谦dsp花卉粉色扎染卫衣个性潮男女圆领套头衫', 396.00, 'L', '1', 'clothing/卫衣/image/19.jpg');
INSERT INTO `cart` VALUES ('333333', '李宁卫衣女春秋2021新款休闲情侣装开衫休连帽外套宽松运动长袖女', 245.00, 'L', '1', 'clothing/卫衣/image/1.jpg');
INSERT INTO `cart` VALUES ('333333', '小众2021秋季新款POLO领宽松蝴蝶结拼接上衣白色波点衬衫衬衣女潮', 228.00, 'L', '1', 'clothing/衬衫/image/23.webp');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `Gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gprice` float(10, 2) NOT NULL,
  `Gsize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Goitw` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gstock` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Gname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2021早秋新款格子衬衫女休闲文艺时尚舒适透气百搭气质长袖上衣', 50.00, 'S,M,L,XL', '衬衫', '1000', '14.webp', '999');
INSERT INTO `goods` VALUES ('2021秋冬新款裙子中长款高腰不规则半身裙女设计感小众蓬蓬裙半裙', 175.00, 'S,M,L,XL,XXL', '裙子', '1000', '28.webp', '991');
INSERT INTO `goods` VALUES ('2021秋季新款休闲裤子男士束脚卫裤潮牌宽松灰色运动裤春秋款长裤', 128.00, 'M,L,XL,XXL', '长裤', '1000', '24.webp', '1000');
INSERT INTO `goods` VALUES ('270g日本加厚厚实纯棉纯色短袖打底衫白T恤内搭纯白精梳棉男女Tee', 48.00, 'S,M,L,XL', '短袖', '1000', '13.webp', '1000');
INSERT INTO `goods` VALUES ('ACHS AWAKE时代少年团-丁程鑫同款觉醒青年双头熊仿兔绒棉服外套', 349.00, 'S,M,L,XL,XXL', '棉袄', '1000', '4.jpg', '1000');
INSERT INTO `goods` VALUES ('AIGLE艾高FJORDIE男款防泼水轻量棉服舒适保暖休闲时尚外套', 452.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '21.jpg', '1000');
INSERT INTO `goods` VALUES ('AIGLE艾高秋冬FUNNY PAD F20女款MTD防水防风透汽保暖舒适棉服', 174.00, 'S,M,L,XL', '棉袄', '1000', '25.jpg', '1000');
INSERT INTO `goods` VALUES ('ARC\'TERYX始祖鸟 男子 ATOM LT 棉背心', 510.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '16.jpg', '1000');
INSERT INTO `goods` VALUES ('ARC\'TERYX始祖鸟 男子 轻量保暖 Proton LT 棉服', 2400.00, 'S,M,L,XXL,XXXL', '棉袄', '1000', '1.jpg', '1000');
INSERT INTO `goods` VALUES ('CALMMIND姜饼人小怪兽圆领上衣运动宽松春秋潮流情侣卫衣男潮牌', 298.00, 'M,L,XL,XXL', '卫衣', '1000', '22.jpg', '1000');
INSERT INTO `goods` VALUES ('CALMMIND姜饼人小怪兽情侣卫衣男秋季潮流宽松国潮上衣oversize', 298.00, 'S,M,L,XL,XXL', '卫衣', '1000', '21.jpg', '1000');
INSERT INTO `goods` VALUES ('Dangerouspeople薛之谦dsp花卉粉色扎染卫衣个性潮男女圆领套头衫', 396.00, 'M,L,XL,XXL', '卫衣', '1000', '19.jpg', '1000');
INSERT INTO `goods` VALUES ('Dangerouspeople薛之谦dsp连帽卫衣男女新款潮流雾霾蓝情侣帽衫', 339.00, 'M,L,XL,XXL,XXXL', '卫衣', '1000', '23.jpg', '1000');
INSERT INTO `goods` VALUES ('ddgirl 法式复古赫本风减龄时尚设计感小众A字连衣裙秋款小个子裙', 299.00, 'M,L,XL', '裙子', '1000', '20.webp', '1000');
INSERT INTO `goods` VALUES ('FILA FUSION x WM斐乐潮牌白山联名蔡徐坤同款2021秋季新款男卫衣', 814.00, 'S,M,L,XL,XXL,XXXL', '卫衣', '1000', '8.jpg', '1000');
INSERT INTO `goods` VALUES ('FILA FUSION斐乐男裤五分裤2021夏季新款运动裤休闲跑步短裤薄款', 339.00, 'S,M,L,XL', '短裤', '1000', '13.jpg', '1000');
INSERT INTO `goods` VALUES ('FILA 斐乐官方男子套头卫衣白色圆领2021年冬季新款运动卫衣', 479.00, 'S,M,L,XL,XXL', '卫衣', '1000', '9.jpg', '1000');
INSERT INTO `goods` VALUES ('FILA斐乐官方连帽卫衣男子2021秋季新款休闲时尚运动套头衫基础', 431.00, 'M,L,XL,XXL', '卫衣', '1000', '10.jpg', '1000');
INSERT INTO `goods` VALUES ('happiness bear韩风插画潮流印花情侣短袖T恤男女', 109.00, 'S,L,XL,XXL', '短袖', '1000', '22.webp', '1000');
INSERT INTO `goods` VALUES ('JackJones杰克琼斯秋季男简约百搭多色休闲连帽棉服外套221309001', 259.00, 'M,XL,XXL,XXXL', '棉袄', '1000', '30.jpg', '1000');
INSERT INTO `goods` VALUES ('JHXC 不规则鱼尾裙半身裙女高腰2021秋冬新款中长款显瘦A字百褶裙', 128.00, 'S,M,L,XL,XXL', '裙子', '1000', '10.webp', '998');
INSERT INTO `goods` VALUES ('JHXC 法式复古碎花V领连衣裙女长袖2021年秋季新款显瘦长款A字裙', 188.00, 'S,M,L,XL,XXL', '裙子', '1000', '2.webp', '1000');
INSERT INTO `goods` VALUES ('KELME卡尔美运动棉衣男长款大衣 官方旗舰棉袄足球棉服训练外套冬', 446.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '17.jpg', '1000');
INSERT INTO `goods` VALUES ('Lilbetter棉衣男 外套短款修身棒球服冬季上衣夹克棉袄男士棉服潮', 149.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '24.jpg', '1000');
INSERT INTO `goods` VALUES ('Lilbetter男士短裤休闲排扣裤运动中裤宽松沙滩裤子夏装五分裤男', 149.00, 'S,M,L,XL,XXL', '短裤', '1000', '9.jpg', '1000');
INSERT INTO `goods` VALUES ('Lilbetter短裤男休闲裤夏季2021新款中裤男士宽松牛仔五分裤潮LB', 139.00, 'S,M,L,XL,XXL', '短裤', '1000', '11.jpg', '1000');
INSERT INTO `goods` VALUES ('Line Two秋冬季小蜜蜂印花夹克工装潮流棉服连帽休闲外套男士棉衣', 456.00, 'S,M,L,XL,XXL', '棉袄', '1000', '12.jpg', '1000');
INSERT INTO `goods` VALUES ('linetwo男士短款印花棉衣外套工装翻领棉袄韩版潮流修身保暖棉服', 379.00, 'S,M,L,XL,XXL', '棉袄', '1000', '14.jpg', '1000');
INSERT INTO `goods` VALUES ('MAMC魔术贴可拆卸小熊腰包羊羔毛外套女潮秋冬季情侣装炸街棉服男', 349.00, 'M,L,XL,XXL,XXXL', '棉袄', '1000', '7.jpg', '1000');
INSERT INTO `goods` VALUES ('NASA XVVX旗舰店官网联名夏季小熊短袖T恤男排扣运动短裤套装男', 250.00, 'S,M,L', '短裤', '1000', '21.jpg', '1000');
INSERT INTO `goods` VALUES ('Nike/耐克正品ACG LOGO 男子户外加绒保暖休闲连帽卫衣外套CW4538', 699.00, 'M,L,XL,XXL', '卫衣', '1000', '28.jpg', '1000');
INSERT INTO `goods` VALUES ('NIKE耐克2021春季男子JORDAN 运动休闲连帽套头衫卫衣CV2245-010', 319.00, 'S,M,L,XL,XXL,XXXL', '卫衣', '1000', '14.jpg', '1000');
INSERT INTO `goods` VALUES ('Nike耐克官方STANDARD ISSUE男子篮球上衣卫衣法式毛圈情侣CK6359', 449.00, 'M,L,XL,XXL', '卫衣', '1000', '11.jpg', '1000');
INSERT INTO `goods` VALUES ('polo衫定制t恤印logo企业diy衣服广告衫文化工衣订做工作服短袖夏', 65.00, 'S,M,L,XXL,XXXL', '短袖', '1000', '19.webp', '1000');
INSERT INTO `goods` VALUES ('sanduolemen/山岛里美100%纯棉印花短袖雪山宇航员', 39.00, 'S,M,L,XL,XXL', '短袖', '1000', '15.webp', '1000');
INSERT INTO `goods` VALUES ('sanduolemen/山岛里美100%纯棉系列印花短袖t恤 瑞克男女款', 39.00, 'S,M,L,XL,XXL,XXXL', '短袖', '1000', '25.webp', '1000');
INSERT INTO `goods` VALUES ('SuaMoment血抓痕烫金印花螺纹袖口连帽卫衣棉男春秋宽松情侣帽衫', 268.00, 'S,M,L,XXL', '卫衣', '1000', '20.jpg', '1000');
INSERT INTO `goods` VALUES ('SuaMoment血爪抓痕波浪羊羔绒外套男秋冬潮流情侣棉服刘耀文同款', 399.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '3.jpg', '1000');
INSERT INTO `goods` VALUES ('TheDouerr 满分甜双层花边大翻领白衬衫女秋季新款小众设计感上衣', 165.00, 'S,M,L,XL,XXL,XXXL', '衬衫', '1000', '16.webp', '1000');
INSERT INTO `goods` VALUES ('THEWOW高阶色系 知性V领 超细羊毛纱线软糯不扎 坑条修身针织开衫', 169.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '3.webp', '1000');
INSERT INTO `goods` VALUES ('TWAT裤子男卫裤秋冬季宽松运动针织学生灰色阔腿抽绳束脚九分裤潮', 131.00, 'M,L,XL,XXL', '长裤', '1000', '15.webp', '1000');
INSERT INTO `goods` VALUES ('Wuuus 法式碎花连衣裙女夏公主裙鲜艳蓬蓬裙休闲气质名媛高端裙子', 277.00, 'M,L,XL,XXL', '裙子', '1000', '15.webp', '1000');
INSERT INTO `goods` VALUES ('XXstore日系复古原创卡通字母印花情侣款宽松纯棉美式短袖T恤男女', 65.00, 'S,L,XXL,XXXL', '短袖', '1000', '19.webp', '1000');
INSERT INTO `goods` VALUES ('《小气球》童趣古着昭和日系藏青海军领连衣裙2021秋季女可爱显瘦', 148.00, 'M,XL,XXL', '裙子', '1000', '17.webp', '1000');
INSERT INTO `goods` VALUES ('【2件】森马潮男纯棉短袖男士T恤2021夏季新款学生潮打底衫帅气体恤', 89.00, 'S,L,XL,XXL', '短袖', '1000', '16.webp', '1000');
INSERT INTO `goods` VALUES ('七分裤男夏季薄款宽松潮流百搭学生中裤57分夏天休闲运动工装短裤', 68.00, 'S,M,L', '短裤', '1000', '20.jpg', '1000');
INSERT INTO `goods` VALUES ('东日是个卷毛 减龄娃娃领复古衬衫女设计感小众长袖衬衣秋冬新款', 90.00, 'S,M,L,XL,XXL', '衬衫', '1000', '5.webp', '1000');
INSERT INTO `goods` VALUES ('东日是个卷毛 日系学院风白色长袖领结衬衫女学生宽松蝴蝶结衬衣', 89.00, 'S,M,L,XL,XXL', '衬衫', '1000', '6.webp', '1000');
INSERT INTO `goods` VALUES ('两人故事民族风女装复古上衣女春秋款民国服装港风衬衫改良衬衣冬', 196.00, 'S,M,L,XL,XXL', '衬衫', '1000', '8.webp', '1000');
INSERT INTO `goods` VALUES ('两面穿棉服男ins港风加绒羊羔毛外套潮流冬季皮棉衣冬装加厚棉袄', 156.00, 'S,M,L,XL,XXL', '棉袄', '1000', '9.jpg', '1000');
INSERT INTO `goods` VALUES ('中年运动套装男夏季短袖短裤父亲节纯棉中老年休闲服爸爸装两件套', 148.00, 'S,M,L,XL,XXL', '短裤', '1000', '2.jpg', '1000');
INSERT INTO `goods` VALUES ('中老年卫衣男士春秋季2021新款运动套装男宽松爸爸秋装外套休闲服', 233.00, 'M,L,XL,XXL', '卫衣', '1000', '17.jpg', '1000');
INSERT INTO `goods` VALUES ('丽哥潮牌V领雪纺连衣裙女2021新款夏收腰显瘦性感包臀短裙鱼尾裙', 119.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '14.webp', '1000');
INSERT INTO `goods` VALUES ('丽哥潮牌豹纹连衣裙女中长款吊带长裙收腰复古修身性感开叉裙子夏', 128.00, 'M,L,XL,XXL', '裙子', '1000', '12.webp', '1000');
INSERT INTO `goods` VALUES ('乔丹运动卫衣男装2021秋季新款男士休闲套头衫圆领上衣针织卫衣男', 129.00, 'M,L,XL,XXL', '卫衣', '1000', '26.jpg', '1000');
INSERT INTO `goods` VALUES ('休闲套装男冰丝夏季短裤五分运动裤+莫代尔短袖T恤运动两件套潮流', 72.00, 'S,M,L,XL,XXL', '短裤', '1000', '24.jpg', '1000');
INSERT INTO `goods` VALUES ('休闲长裤男宽松小直筒咔叽工装裤厚实水洗轻做旧长裤男潮配靴裤', 78.00, 'M,L,XXL,XXXL', '长裤', '1000', '19.webp', '1000');
INSERT INTO `goods` VALUES ('保安大衣男冬季加厚黑色特训作训服棉服套装耐磨军棉大衣冬装棉衣', 129.00, 'M,L,XL,XXL,XXXL', '棉袄', '1000', '28.jpg', '990');
INSERT INTO `goods` VALUES ('假两件棉衣男冬季韩版宽松PU皮百搭连帽棉服港风潮牌帅气棉袄外套', 168.00, 'S,M,L,XL,XXL', '棉袄', '1000', '11.jpg', '1000');
INSERT INTO `goods` VALUES ('冬季纯棉免烫加绒加厚保暖男士衬衫中年爸爸全棉商务休闲长袖衬衣', 158.00, 'S,M,L,XL', '衬衫', '1000', '30.webp', '1000');
INSERT INTO `goods` VALUES ('冰丝休闲运动速干套装男夏季短袖短裤两件套薄款潮流一套搭配衣服', 55.00, 'S,M,L,XL,XXL', '短裤', '1000', '15.jpg', '1000');
INSERT INTO `goods` VALUES ('冰丝裤子太透男士夏季短裤2021男装设计感小众古着vintage七分裤', 69.00, 'S,M,L,XXL', '短裤', '1000', '23.jpg', '1000');
INSERT INTO `goods` VALUES ('冰丝裤子男夏季超薄宽松中裤薄款男士休闲短裤男夏外穿五分裤潮流', 89.00, 'S,M,L,XL,XXL', '短裤', '1000', '17.jpg', '1000');
INSERT INTO `goods` VALUES ('十元诗苑 美杜莎的诱惑 法式简约缎面设计款小众长款吊带连衣裙女', 179.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '5.webp', '1000');
INSERT INTO `goods` VALUES ('南极人羊羔绒棉衣男士外套冬季潮流加绒加厚保暖棉袄冬装羽绒棉服', 135.00, 'S,M,L,XL,XXL', '棉袄', '1000', '5.jpg', '1000');
INSERT INTO `goods` VALUES ('南极人运动套装男夏季宽松舒适短袖T恤跑步休闲短裤学生两件套潮', 68.00, 'M,L,XL', '短裤', '1000', '27.jpg', '1000');
INSERT INTO `goods` VALUES ('卡通提花马甲+白色娃娃领连衣裙2021秋装新款日系穿搭两件套a字裙', 119.00, 'S,M,L,XL,XXL', '裙子', '1000', '16.webp', '1000');
INSERT INTO `goods` VALUES ('原创印花短袖T恤男生ins潮牌上衣服 夏季潮流宽松纯棉半袖体恤TEE', 69.00, 'S,M,XL,XXL', '短袖', '1000', '4.webp', '1000');
INSERT INTO `goods` VALUES ('啄木鸟男士加绒保暖衬衫男长袖中年假两件加厚衬衣男爸爸装毛衣男', 90.00, 'S,M,L,XL,XXL,XXXL', '衬衫', '1000', '28.webp', '1000');
INSERT INTO `goods` VALUES ('国潮醒狮短袖t恤男潮牌宽松2021年新款夏季男士纯棉体恤半袖港风', 29.00, 'M,L,XL,XXL', '短袖', '1000', '18.webp', '1000');
INSERT INTO `goods` VALUES ('圆领卫衣男秋季ins潮牌宽松痞帅外套2021年新款春秋高街港风衣服', 56.00, 'M,L,XL,XXL', '卫衣', '1000', '16.jpg', '1000');
INSERT INTO `goods` VALUES ('夏天运动套装男短裤两件套沙滩短袖t恤运动服海边宽松休闲裤套装', 29.00, 'S,M,L,XL,XXL', '短裤', '1000', '29.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季2021新款纯棉短袖T恤男潮流胖子宽松大码半袖百搭体恤上衣服', 29.00, 'S,M,L,XXL', '短袖', '1000', '21.webp', '1000');
INSERT INTO `goods` VALUES ('夏季ins工装裤男潮牌直筒九分裤胖子宽松加肥加大码抽绳束脚长裤', 146.00, 'L,XL,XXL,XXXL', '长裤', '1000', '29.webp', '1000');
INSERT INTO `goods` VALUES ('夏季原宿男士短袖t恤个性印花纯棉衣服宽松潮流半袖上衣韩版潮牌', 49.00, 'S,M,L', '短袖', '1000', '8.webp', '1000');
INSERT INTO `goods` VALUES ('夏季工装衬衫短袖休闲运动套装男纯棉七分袖短裤搭配潮流宽松三件', 138.00, 'S,M,L', '短裤', '1000', '11.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季户外运动男裤多口袋裤工装裤男休闲裤大码宽松直筒潮男长裤子', 63.00, 'M,L,XL,XXL', '长裤', '1000', '30.webp', '1000');
INSERT INTO `goods` VALUES ('夏季新款休闲运动套装情侣款背心薄短裤跑步锻炼服一套坎肩两件套', 57.00, 'S,M,L,XL', '短裤', '1000', '28.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季棉麻松紧三分短裤男士四分沙滩4分裤潮学生纯色宽松低腰3分裤', 39.00, 'S,M,L,XL,XXL', '短裤', '1000', '14.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季白色短袖t恤男潮牌宽松潮流半袖纯棉衣服欧美风嘻哈男士体恤', 69.00, 'S,M,L,XL,XXL', '短袖', '1000', '5.webp', '1000');
INSERT INTO `goods` VALUES ('夏季白色短袖衬衫男士韩版修身情侣装薄款衬衣潮流男装休闲寸外套', 30.00, 'S,M,L,XL,XXL', '衬衫', '1000', '4.webp', '1000');
INSERT INTO `goods` VALUES ('夏季短袖男港风t恤ins潮牌bf风学生半袖衣服纯棉宽松嘻哈潮流丅恤', 30.00, 'M,L,XL', '短袖', '1000', '9.webp', '1000');
INSERT INTO `goods` VALUES ('夏季短袖衬衫男士宽松胖子加肥加大码撞色拼接上衣服潮流衬衣外套', 78.00, 'S,M,L,XL,XXL', '衬衫', '1000', '10.webp', '1000');
INSERT INTO `goods` VALUES ('夏季社会精神小伙套装男短袖麻料V领中袖衬衫短裤两件套五分裤潮', 98.00, 'S,M,L', '短裤', '1000', '26.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季薄款宽松居家大裤衩花短裤男士休闲潮流沙滩裤外穿中裤五分裤', 69.00, 'S,M,L,XL', '短裤', '1000', '5.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季迷彩中裤男士短裤休闲纯棉耐磨5分裤工装裤 七分宽松多口袋潮', 49.00, 'S,M,L,XL', '短裤', '1000', '25.jpg', '1000');
INSERT INTO `goods` VALUES ('夏季黑色纯棉短袖T恤男潮牌ins国潮刺绣宽松大码男士半袖男装体恤', 78.00, 'M,L,XL,XXL', '短袖', '1000', '23.webp', '1000');
INSERT INTO `goods` VALUES ('大码格子衬衫男长袖胖子潮宽松加肥加大300斤男装青少年秋季外套', 58.00, 'S,M,L,XL,XXL', '衬衫', '1000', '19.webp', '1000');
INSERT INTO `goods` VALUES ('大码胖mm连衣裙2021新款秋装洋气遮肚方领洋气遮肚显瘦气质小黑裙', 159.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '8.webp', '1000');
INSERT INTO `goods` VALUES ('奶茶猫*原创定制肖邦回旋曲重工lolita洋装华丽茶会OP连衣裙复古', 989.00, 'S,M,L,XL,XXL', '裙子', '1000', '27.webp', '1000');
INSERT INTO `goods` VALUES ('妈妈全棉衬衣纯棉衬衫女士格子上衣40岁春秋装洋气中老年女装外套', 68.00, 'S,M,L,XL', '衬衫', '1000', '25.webp', '1000');
INSERT INTO `goods` VALUES ('安小落 白色提花小白裙女夏法式新款赫本风气质收腰中长连衣裙子', 139.00, 'M,L,XL,XXL', '裙子', '1000', '13.webp', '998');
INSERT INTO `goods` VALUES ('安小落法式甜美娃娃领连衣裙早秋2021新款长袖气质中长款小白裙子', 149.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '4.webp', '999');
INSERT INTO `goods` VALUES ('安踏动型科技卫衣2021秋季运动长袖男士套头圆领针织衫健身训练服', 179.00, 'S,L,XL,XXL', '卫衣', '1000', '13.jpg', '1000');
INSERT INTO `goods` VALUES ('安踏卫衣男宽松圆领2021新款秋季官网青年套头打底衫黑色长袖t恤', 129.00, 'S,M,L,XL,XXL,XXXL', '卫衣', '1000', '30.jpg', '1000');
INSERT INTO `goods` VALUES ('安踏运动卫衣男2021秋季新款圆领男士套头衫长袖潮流上衣官网旗舰', 139.00, 'M,L,XL,XXL', '卫衣', '1000', '12.jpg', '1000');
INSERT INTO `goods` VALUES ('安踏长袖卫衣男宽松春秋情侣上衣圆领无帽卫衣女套头中国运动服男', 174.00, 'M,L,XL,XXL', '卫衣', '1000', '15.jpg', '1000');
INSERT INTO `goods` VALUES ('官方旗舰店官网帕耐克丝棉童装男童女童夏装套装儿童透气短袖短裤', 99.00, 'S,M,L,XL', '短裤', '1000', '22.jpg', '1000');
INSERT INTO `goods` VALUES ('对钩印花短裤短袖t恤男士潮牌潮流夏季薄款宽松运动无袖背心套装', 57.00, 'M,L,XL,XXL', '短裤', '1000', '19.jpg', '1000');
INSERT INTO `goods` VALUES ('小众2021秋季新款POLO领宽松蝴蝶结拼接上衣白色波点衬衫衬衣女潮', 228.00, 'S,M,L,XL', '衬衫', '1000', '23.webp', '1000');
INSERT INTO `goods` VALUES ('小熊男士短袖t恤 2021新款潮牌纯棉体桖夏季青少年网红夏装上衣服', 78.00, 'S,M,L', '短袖', '1000', '10.webp', '1000');
INSERT INTO `goods` VALUES ('岛歌夫人棋盘格子复古修身显瘦吊带连衣裙长款长裙气质早秋季新款', 139.00, 'M,L,XL', '裙子', '1000', '21.webp', '1000');
INSERT INTO `goods` VALUES ('岛歌夫人法式茶歇裙印花裹身裙碎花裙气质连衣裙长款修身女早秋季', 159.00, 'L,XL,XXL', '裙子', '1000', '23.webp', '1000');
INSERT INTO `goods` VALUES ('幻海 2021年秋季新款小香风连衣裙女设计感小众名媛风高腰裙子', 299.00, 'S,M,L,XL,XXL,XXXL', '裙子', '1000', '1.webp', '1000');
INSERT INTO `goods` VALUES ('恒源祥全棉衬衣长袖商务正装职业工装秋季免烫纯棉条纹白色衬衫男', 218.00, 'S,M,L,XL', '衬衫', '1000', '21.webp', '1000');
INSERT INTO `goods` VALUES ('恒源祥男式保暖衬衣冬季中年针织衫毛衣假两件保暖衬衫男加厚加绒', 198.00, 'M,L,XL,XXL', '衬衫', '1000', '18.webp', '1000');
INSERT INTO `goods` VALUES ('悦游 新疆棉 不看不听不说 宽松短袖新款原创夏季潮牌T恤男半袖', 69.00, 'S,M,L,XL', '短袖', '1000', '14.webp', '1000');
INSERT INTO `goods` VALUES ('断码特价红都秋冬厚款男士棉服中老年宽松大码翻领爸爸装商务外套', 199.00, 'L,XL,XXL,XXXL', '棉袄', '1000', '29.jpg', '1000');
INSERT INTO `goods` VALUES ('日系休闲运动套装男夏季薄款大码潮流短袖短裤2021新款篮球两件套', 67.00, 'S,M,L,XL', '短裤', '1000', '8.jpg', '1000');
INSERT INTO `goods` VALUES ('早春秋2021年新款连衣裙子高贵夫人高端洋气质减龄中年妈妈40岁50', 298.00, 'M,L,XL', '裙子', '1000', '24.webp', '1000');
INSERT INTO `goods` VALUES ('春秋季潮牌印花长袖衬衫男士胖子宽松加肥加大码学生休闲衬衣外套', 89.00, 'S,M,L,XL,XXL', '衬衫', '1000', '11.webp', '994');
INSERT INTO `goods` VALUES ('春秋季纯棉长袖t恤男士假两件卫衣潮流秋装打底衫带领秋衣上衣服', 127.00, 'M,L,XL,XXL', '卫衣', '1000', '27.jpg', '1000');
INSERT INTO `goods` VALUES ('春秋季运动裤男潮束脚裤宽松休闲纯棉小脚裤冬季加绒束腿收口卫裤', 101.00, 'L,XL,XXL,XXXL', '长裤', '1000', '20.webp', '999');
INSERT INTO `goods` VALUES ('春秋裤子男韩版潮流休闲直筒宽松九分抽绳束脚卫裤夏季灰色运动裤', 49.00, 'L,XL,XXL,XXXL', '长裤', '1000', '10.webp', '1000');
INSERT INTO `goods` VALUES ('智潮定制衬衫绣logo短袖工作服商务工装长袖正装白衬衣男印字', 279.00, 'S,M,L,XL,XXL', '衬衫', '1000', '1.webp', '1000');
INSERT INTO `goods` VALUES ('木茶出品日系女装森系少女刺绣娃娃裙小清新甜美宽松纯棉连衣裙秋', 159.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '11.webp', '1000');
INSERT INTO `goods` VALUES ('木茶出品森系复古灯芯绒中长裙日系少女宽松娃娃领刺绣连衣裙秋冬', 159.00, 'L,XL,XXXL', '裙子', '1000', '26.webp', '994');
INSERT INTO `goods` VALUES ('李宁CF溯系列官方敦煌博物馆棉服加厚保暖棒球领冬季运动外套男', 398.00, 'S,M,L,XL,XXL', '棉袄', '1000', '6.jpg', '1000');
INSERT INTO `goods` VALUES ('李宁卫衣女春秋2021新款休闲情侣装开衫休连帽外套宽松运动长袖女', 245.00, 'S,M,L,XL,XXL,XXXL', '卫衣', '1000', '1.jpg', '1000');
INSERT INTO `goods` VALUES ('李宁卫衣男女春秋季2021新款圆领套头外套休闲长袖t恤无帽运动衫', 89.00, 'M,L,XL', '卫衣', '1000', '3.jpg', '1000');
INSERT INTO `goods` VALUES ('李宁卫衣男秋季休闲男装开衫夹克连帽长袖针织上衣运动外套男士潮', 158.00, 'M,L,XL', '短袖', '1000', '4.webp', '1000');
INSERT INTO `goods` VALUES ('李宁卫衣男装外套开衫立领夹克秋季拉链针织棉宽松休闲连帽运动服', 139.00, 'M,L,XL,XXL,XXXL', '卫衣', '1000', '5.jpg', '1000');
INSERT INTO `goods` VALUES ('李宁卫衣连帽男外套开衫秋季新款宽松长袖夹克潮流棉休闲运动服女', 99.00, 'S,M,L,XL', '卫衣', '1000', '2.jpg', '1000');
INSERT INTO `goods` VALUES ('棉衣男2021新款帅气面包服港风宽松立领棉服潮流ins百搭棉袄外套', 138.00, 'S,M,L,XL,XXL', '棉袄', '1000', '15.jpg', '1000');
INSERT INTO `goods` VALUES ('棉衣男冬季棉袄2021年新款韩版潮流/牌情侣面包羽绒棉服加厚外套', 108.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '22.jpg', '1000');
INSERT INTO `goods` VALUES ('森马夏季短袖t恤男2021新款学生纯棉体恤潮青年流行圆领印花半袖', 50.00, 'S,M,XL', '短袖', '1000', '3.webp', '1000');
INSERT INTO `goods` VALUES ('正品哥弟新款长袖气质蕾丝连衣裙秋季专柜名牌小个子收腰减龄裙子', 120.00, 'M,L,XL,XXL', '裙子', '1000', '9.webp', '999');
INSERT INTO `goods` VALUES ('段郎传奇夏季新款短袖运动套装男士速干短裤休闲跑步运动服两件套', 239.00, 'S,M,L', '短裤', '1000', '16.jpg', '1000');
INSERT INTO `goods` VALUES ('温柔风法式连衣裙设计感气质高端衬衫半裙职业套装裙女春秋两件套', 348.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '7.webp', '999');
INSERT INTO `goods` VALUES ('潮牌春秋季卫衣男装胖子宽松大码潮流百搭青少年运动连帽衫外套潮', 86.00, 'M,L,XL,XXL', '卫衣', '1000', '25.jpg', '1000');
INSERT INTO `goods` VALUES ('潮牌短袖t恤男潮流半袖夏季新款纯棉圆领衣服学生宽松港风印花T恤', 48.00, 'S,M,L,XL', '短袖', '1000', '11.webp', '1000');
INSERT INTO `goods` VALUES ('爱莎公主裙女夏冰雪奇缘2爱沙连衣裙子宝宝艾莎生日礼服儿童衣服', 158.00, 'S,M,L,XL', '裙子', '1000', '30.webp', '1000');
INSERT INTO `goods` VALUES ('爸爸冬装外套中老年人羽绒棉衣中年男装加厚上衣服老人秋冬季棉袄', 278.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '18.jpg', '1000');
INSERT INTO `goods` VALUES ('爸爸冬装外套男中长款加厚保暖羽绒棉服中老年人加绒棉衣中年男装', 228.00, 'S,M,L,XL,XXL', '棉袄', '1000', '10.jpg', '1000');
INSERT INTO `goods` VALUES ('牛仔裤男潮牌宽松2021年秋季新款哈伦工装休闲九分束脚春秋长裤子', 101.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '9.webp', '1000');
INSERT INTO `goods` VALUES ('特步卫衣男2021秋季新款打底长袖T恤运动服套头衫圆领休闲上衣男', 109.00, 'S,M,L,XL,XXL', '卫衣', '1000', '29.jpg', '1000');
INSERT INTO `goods` VALUES ('独立日 海德公园 复古印花水绿娃娃领雪纺连衣裙2021夏季新款', 199.00, 'M,L,XL,XXL', '裙子', '1000', '22.webp', '1000');
INSERT INTO `goods` VALUES ('独立日睡梦中紫色仙女裙chic温柔风甜美小雏菊连衣裙女夏碎花雪纺', 199.00, 'S,M,L,XL,XXL', '裙子', '1000', '19.webp', '1000');
INSERT INTO `goods` VALUES ('王一博同款INS黑色裤子美式抽绳高街卫裤男嘻哈宽松直筒运动裤秋', 171.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '22.webp', '1000');
INSERT INTO `goods` VALUES ('男士棉衣外套冬季新款潮流ins潮牌加厚棉袄冬装连帽抗寒羽绒棉服', 256.00, 'S,M,L,XL,XXL', '棉袄', '1000', '13.jpg', '1000');
INSERT INTO `goods` VALUES ('男士棉衣秋冬款韩版潮流假两件棉袄冬季加厚羽绒棉服面包服外套男', 196.00, 'S,M,L,XL', '棉袄', '1000', '20.jpg', '1000');
INSERT INTO `goods` VALUES ('男士灰色裤子男春秋款束脚裤休闲运动裤2021新款潮流百搭卫裤秋季', 87.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '4.webp', '1000');
INSERT INTO `goods` VALUES ('男士裤子休闲裤男春秋宽松直筒裤男裤长裤工装裤潮牌秋季潮流百搭', 123.00, 'S,M,L,XL,XXL', '长裤', '1000', '1.webp', '996');
INSERT INTO `goods` VALUES ('男士运动裤篮球裤夏季大码修身健身裤小脚收口裤宽松卫裤长裤裤子', 116.00, 'L,XL,XXL,XXXL', '长裤', '1000', '23.webp', '1000');
INSERT INTO `goods` VALUES ('男裤夏季薄款亚麻裤男士裤子春秋休闲裤棉麻宽松长裤中国风麻裤秋', 105.00, 'M,L,XL,XXL', '长裤', '1000', '27.webp', '1000');
INSERT INTO `goods` VALUES ('白衬衫男长袖商务正装职业修身黑衬衣韩版伴郎西装纯色内搭打底衫', 40.00, 'S,M,L,XL,XXL', '衬衫', '1000', '9.webp', '1000');
INSERT INTO `goods` VALUES ('百洛安圆领百搭连衣裙女夏秋新款宽松显瘦垂坠百褶裙长款大码裙子', 346.00, 'M,L,XL,XXL', '裙子', '1000', '25.webp', '1000');
INSERT INTO `goods` VALUES ('百胜狐大码男装加肥加大假两件上衣胖子大肚子秋装商务男春秋t恤', 188.00, 'M,L,XL,XXL', '卫衣', '1000', '18.jpg', '1000');
INSERT INTO `goods` VALUES ('短袖男潮牌日系夏装字母印花嘻哈宽松半袖男生夏天ins潮流个性t恤', 58.00, 'S,M,L,XL,XXL', '短袖', '1000', '30.webp', '1000');
INSERT INTO `goods` VALUES ('短袖衬衫男五分袖寸衣夏季休闲外套痞帅男装一套搭配帅气衣服套装', 155.00, 'S,M,L,XL,XXL', '衬衫', '1000', '15.webp', '1000');
INSERT INTO `goods` VALUES ('碎花连衣裙女秋小雏菊法式复古茶歇裙短款小个子绿色收腰V领裙子', 248.00, 'M,L,XL,XXL', '裙子', '1000', '29.webp', '1000');
INSERT INTO `goods` VALUES ('秋冬款男士棉衣韩版潮流棉袄面包服冬季加厚ins港风大码棉服外套', 179.00, 'S,M,L,XL,XXL', '棉袄', '1000', '23.jpg', '1000');
INSERT INTO `goods` VALUES ('秋季休闲裤男夏季薄款弹力直筒宽松男士运动裤春秋款冰丝长裤子男', 69.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '3.webp', '1000');
INSERT INTO `goods` VALUES ('秋季薄款垂坠感九分裤男宽松直筒西裤韩版潮流休闲裤男士夏季裤子', 112.00, 'M,L,XL,XXL', '长裤', '1000', '28.webp', '1000');
INSERT INTO `goods` VALUES ('秋季长袖衬衫男商务休闲职业工装衬衣纯白色免烫斜纹加肥加大寸杉', 49.00, 'S,M,L,XL,XXL', '衬衫', '1000', '26.webp', '1000');
INSERT INTO `goods` VALUES ('秋款运动裤男宽松直筒休闲长裤子冬季加绒针织纯棉卫裤大码跑步裤', 76.00, 'M,L,XL,XXL', '长裤', '1000', '11.webp', '1000');
INSERT INTO `goods` VALUES ('稻草人卫衣套装男士衬衫外套春秋季潮流春款休闲帅气搭配一套男装', 244.00, 'L,XL', '卫衣', '1000', '24.jpg', '1000');
INSERT INTO `goods` VALUES ('简约立领亚麻衬衫男长袖纯色复古休闲修身棉麻中国风小清新衬衣男', 79.00, 'S,M,L,XL,XXL', '衬衫', '1000', '12.webp', '1000');
INSERT INTO `goods` VALUES ('纯棉休闲长裤男直筒运动裤春夏季宽松加肥大码男士束口百搭卫裤子', 141.00, 'S,M,L,XL,XXL', '长裤', '1000', '26.webp', '1000');
INSERT INTO `goods` VALUES ('纯棉格子衬衫女士长袖春装2021春秋新款韩版减龄气质职业打底衬衣', 168.00, 'S,M,L,XL,XXL', '衬衫', '1000', '3.webp', '1000');
INSERT INTO `goods` VALUES ('纯棉男士短袖t恤 2021夏季新款潮流冰感半袖青少年丅冰丝薄款夏装', 78.00, 'M,L,XL,XXL,XXXL', '短袖', '1000', '28.webp', '1000');
INSERT INTO `goods` VALUES ('网格T恤男仿棉短袖夏季新款休闲拼色宽松圆领T恤', 34.00, 'S,M,L,XL,XXL', '短袖', '1000', '29.webp', '1000');
INSERT INTO `goods` VALUES ('背心套装男夏季薄款休闲短裤两件套潮流潮牌ins港风运动服无袖T恤', 48.00, 'S,M,L,XL', '短裤', '1000', '4.jpg', '1000');
INSERT INTO `goods` VALUES ('花花公子2021休闲裤男士春秋季新款工装韩版潮流运动束脚九分裤子', 198.00, 'M,L,XL,XXL', '长裤', '1000', '18.webp', '1000');
INSERT INTO `goods` VALUES ('花花公子冬季男士棉衣外套潮流加绒加厚保暖棉袄冬装羽绒棉服潮牌', 259.00, 'S,M,L,XL,XXL', '棉袄', '1000', '2.jpg', '1000');
INSERT INTO `goods` VALUES ('花花公子夏季男士短袖T恤纯棉2021新款体恤打底衫潮流上衣服男装', 85.00, 'S,M,L,XL,XXL', '短袖', '1000', '6.webp', '1000');
INSERT INTO `goods` VALUES ('花花公子外套男秋冬季2020新款摇粒绒棉衣中长款加厚潮流风衣棉服', 241.00, 'S,M,L,XL,XXL', '棉袄', '1000', '26.jpg', '1000');
INSERT INTO `goods` VALUES ('花花公子棉衣男士秋冬季外套潮流短款厚棉袄冬装连帽潮牌羽绒棉服', 249.00, 'S,M,L,XL,XXL', '棉袄', '1000', '8.jpg', '1000');
INSERT INTO `goods` VALUES ('花花公子男士休闲套装夏季薄款冰丝短袖T恤跑步短裤痞帅男装一套', 154.00, 'S,M,L,XL,XXL', '短裤', '1000', '1.jpg', '1000');
INSERT INTO `goods` VALUES ('花花公子男士工装衬衣职业商务正装2021蓝白条纹衬衫男长袖春秋款', 149.00, 'S,M,L,XL,XXL', '衬衫', '1000', '7.webp', '1000');
INSERT INTO `goods` VALUES ('若溯法式复古风琴褶毛呢格子半身裙女秋冬a字高腰呢子中长款裙子', 165.00, 'M,L,XL,XXL,XXXL', '裙子', '1000', '6.webp', '1000');
INSERT INTO `goods` VALUES ('英爵伦 230G重磅纯棉 夏季新款男装短袖T恤 圆领半袖百搭上衣体恤', 68.00, 'S,M,L,XL', '短袖', '1000', '2.webp', '1000');
INSERT INTO `goods` VALUES ('英爵伦 丝光棉2021新款男士短袖印花T恤潮牌冰丝体恤凉感上衣潮流', 58.00, 'S,M,L', '短袖', '1000', '1.webp', '1000');
INSERT INTO `goods` VALUES ('莎芭绮冬男加绒保暖衬衫中青年男装磨毛纯色加厚灰色保暖衬衣上衣', 108.00, 'S,M,L,XL', '衬衫', '1000', '27.webp', '1000');
INSERT INTO `goods` VALUES ('莎芭绮春秋季纯棉竹节男牛仔长袖衬衫休闲全棉男装牛仔衫衬衣上衣', 105.00, 'S,M,L,XL', '衬衫', '1000', '22.webp', '1000');
INSERT INTO `goods` VALUES ('蓝色条纹男士法兰绒衬衫男女秋冬长袖百搭韩版潮流叠穿衬衣外套', 158.00, 'S,M,L,XL', '衬衫', '1000', '20.webp', '1000');
INSERT INTO `goods` VALUES ('衣品乐欧洲站大码新款复古针织拼接雪纺长袖衬衫宽松女装2021秋装', 169.00, 'S,M,L,XL,XXL', '衬衫', '1000', '13.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男士夏季薄款宽松休闲裤九分小脚束脚裤修身长裤子男韩版潮流', 105.00, 'M,L,XL,XXL', '长裤', '1000', '13.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男春秋季运动裤潮牌宽松束脚裤灰色休闲裤男束腿直筒篮球卫裤', 77.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '5.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男春秋新款韩版潮流直筒裤男百搭西装裤纯色休闲九分裤男宽松', 147.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '2.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男秋季卫裤男直筒束脚裤百搭运动裤潮宽松休闲裤男长裤男秋季', 179.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '12.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男秋季新款男士卫裤宽松灰色潮流束脚裤休闲裤运动裤直筒薄款', 79.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '6.webp', '1000');
INSERT INTO `goods` VALUES ('裤子男秋季新款韩版男士休闲裤潮流运动裤哈伦裤长裤男束脚裤男裤', 140.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '14.webp', '1000');
INSERT INTO `goods` VALUES ('运动两件套装男夏季速干衣跑步训练宽松大码篮球健身短袖t恤短裤', 45.00, 'S,M,L,XL,XXL', '短裤', '1000', '18.jpg', '1000');
INSERT INTO `goods` VALUES ('运动套装男夏季2021新款短袖短裤套装男士速干t恤夏天休闲两件套', 75.00, 'S,M,L,XL,XXL,XXXL', '短裤', '1000', '10.jpg', '1000');
INSERT INTO `goods` VALUES ('运动套装男夏季男士短袖痞帅网红冰丝休闲速干两件套潮牌短裤男装', 78.00, 'S,M,L,XL,XXL', '短裤', '1000', '3.jpg', '1000');
INSERT INTO `goods` VALUES ('运动套装男夏季短袖短裤中老年纯棉两件套宽松跑步爸爸运动服薄款', 138.00, 'S,M,L,XL,XXL', '短裤', '1000', '30.jpg', '1000');
INSERT INTO `goods` VALUES ('运动裤男士裤子春秋弹力加肥大码宽松直筒夏薄款冰丝速干休闲长裤', 145.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '21.webp', '1000');
INSERT INTO `goods` VALUES ('运动裤男宽松男生篮球长裤美式春秋新款束脚裤子休闲德鲁大叔卫裤', 161.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '16.webp', '1000');
INSERT INTO `goods` VALUES ('运动裤男束脚裤春秋宽松直筒潮流灰色休闲长裤子冬季加绒抽绳卫裤', 100.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '8.webp', '1000');
INSERT INTO `goods` VALUES ('运动裤男裤长裤春秋款速干健身训练宽松夏季薄款冰丝束脚休闲卫裤', 107.00, 'M,L,XL,XXL', '长裤', '1000', '17.webp', '1000');
INSERT INTO `goods` VALUES ('长袖格子衬衫男宽松潮流大码胖子加肥加大男装青少年学生秋季外套', 58.00, 'S,M,L,XL,XXL', '衬衫', '1000', '17.webp', '1000');
INSERT INTO `goods` VALUES ('阿迪达斯官网 三叶草 新年款男装冬季运动棉服GN5444', 1499.00, 'M,L,XXL,XXXL', '棉袄', '1000', '27.jpg', '1000');
INSERT INTO `goods` VALUES ('阿迪达斯官网adidas 新年款男装冬季曼联足球运动棉服GK9446', 1190.00, 'S,M,L,XL,XXL,XXXL', '棉袄', '1000', '19.jpg', '1000');
INSERT INTO `goods` VALUES ('陈太太CHENTAITAI 天使领拼接长袖衬衫', 278.00, 'S,M,L,XL,XXL', '衬衫', '1000', '2.webp', '1000');
INSERT INTO `goods` VALUES ('青少年夏季薄款休闲短裤套装男高中初中学生男孩运动衣服大童夏装', 79.00, 'S,M,XL', '短裤', '1000', '6.jpg', '1000');
INSERT INTO `goods` VALUES ('青年男生短袖短裤运动套装夏季跑步健身服加肥加大码宽松篮球衣胖', 96.00, 'S,M,L,XL', '短裤', '1000', '7.jpg', '1000');
INSERT INTO `goods` VALUES ('韩潮袭人小翻领格子长袖衬衫女2021年新款秋装上衣女衬衣薄', 99.00, 'S,M,L,XXL', '衬衫', '1000', '24.webp', '1000');
INSERT INTO `goods` VALUES ('韩潮袭人连帽长袖中长款条纹衬衫外套女2021秋装新款复古撞色开衫', 109.00, 'S,M,L,XL', '衬衫', '1000', '29.webp', '1000');
INSERT INTO `goods` VALUES ('高级感小领口纯棉纯色短袖打底衫白色体桖男女T恤纯黑宽松t桖潮流', 35.00, 'S,M,L,XL', '短袖', '1000', '7.webp', '1000');
INSERT INTO `goods` VALUES ('高街运动束脚裤男女生水洗做旧潮牌休闲街头嘻哈垂感欧美宽松裤子', 154.00, 'M,L,XL,XXL', '长裤', '1000', '7.webp', '1000');
INSERT INTO `goods` VALUES ('鸿星尔克卫衣2021秋季新款男士宽松潮流运动休闲服连帽套头上衣男', 179.00, 'M,L,XL', '卫衣', '1000', '6.jpg', '1000');
INSERT INTO `goods` VALUES ('鸿星尔克卫衣2021秋季男士内搭潮流休闲服连帽运动套头上衣卫衣男', 149.00, 'M,L,XL', '卫衣', '1000', '7.jpg', '1000');
INSERT INTO `goods` VALUES ('鸿星尔克裤子男士九分裤春秋季韩版潮流直筒宽松百搭夏季运动休闲', 78.00, 'M,L,XL,XXL,XXXL', '长裤', '1000', '25.webp', '1000');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant`  (
  `Mid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mpassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mintroduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Mphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Micon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES ('88888888', '88888888', 'aitao', '你想要的都有', '88888888', '9.png');

-- ----------------------------
-- Table structure for morder
-- ----------------------------
DROP TABLE IF EXISTS `morder`;
CREATE TABLE `morder`  (
  `Uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gprice` decimal(10, 2) NOT NULL,
  `Gsize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gstate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of morder
-- ----------------------------
INSERT INTO `morder` VALUES ('wcj2000', '木茶出品森系复古灯芯绒中长裙日系少女宽松娃娃领刺绣连衣裙秋冬', 159.00, 'XXXL', '5', 'clothing/裙子/image/26.webp', '已发货');
INSERT INTO `morder` VALUES ('wcj2000', 'JHXC 不规则鱼尾裙半身裙女高腰2021秋冬新款中长款显瘦A字百褶裙', 128.00, 'XXL', '2', 'clothing/裙子/image/10.webp', '未发货');
INSERT INTO `morder` VALUES ('wcj2000', '2021秋冬新款裙子中长款高腰不规则半身裙女设计感小众蓬蓬裙半裙', 175.00, 'L', '1', 'clothing/裙子/image/28.webp', '已发货');
INSERT INTO `morder` VALUES ('wcj2000', '2021早秋新款格子衬衫女休闲文艺时尚舒适透气百搭气质长袖上衣', 50.00, 'XL', '1', 'clothing/衬衫/image/14.webp', '未发货');
INSERT INTO `morder` VALUES ('wcj2000', '春秋季潮牌印花长袖衬衫男士胖子宽松加肥加大码学生休闲衬衣外套', 89.00, 'XL', '6', 'clothing/衬衫/image/11.webp', '未发货');
INSERT INTO `morder` VALUES ('wcj2000', '2021秋冬新款裙子中长款高腰不规则半身裙女设计感小众蓬蓬裙半裙', 175.00, 'XXL', '8', 'clothing/裙子/image/28.webp', '已发货');
INSERT INTO `morder` VALUES ('wcj2000', '男士裤子休闲裤男春秋宽松直筒裤男裤长裤工装裤潮牌秋季潮流百搭', 123.00, 'XL', '4', 'clothing/长裤/image/1.webp', '未发货');
INSERT INTO `morder` VALUES ('111111', '春秋季运动裤男潮束脚裤宽松休闲纯棉小脚裤冬季加绒束腿收口卫裤', 101.00, 'XXXL', '1', 'clothing/长裤/image/20.webp', '未发货');
INSERT INTO `morder` VALUES ('111111', '正品哥弟新款长袖气质蕾丝连衣裙秋季专柜名牌小个子收腰减龄裙子', 120.00, 'L', '1', 'clothing/裙子/image/9.webp', '未发货');
INSERT INTO `morder` VALUES ('333333', '安小落 白色提花小白裙女夏法式新款赫本风气质收腰中长连衣裙子', 139.00, 'L', '2', 'clothing/裙子/image/13.webp', '未发货');
INSERT INTO `morder` VALUES ('333333', '安小落法式甜美娃娃领连衣裙早秋2021新款长袖气质中长款小白裙子', 149.00, 'L', '1', 'clothing/裙子/image/4.webp', '未发货');
INSERT INTO `morder` VALUES ('333333', '木茶出品森系复古灯芯绒中长裙日系少女宽松娃娃领刺绣连衣裙秋冬', 159.00, 'L', '1', 'clothing/裙子/image/26.webp', '未发货');
INSERT INTO `morder` VALUES ('333333', '温柔风法式连衣裙设计感气质高端衬衫半裙职业套装裙女春秋两件套', 348.00, 'L', '1', 'clothing/裙子/image/7.webp', '未发货');

-- ----------------------------
-- Table structure for rder
-- ----------------------------
DROP TABLE IF EXISTS `rder`;
CREATE TABLE `rder`  (
  `Uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gprice` decimal(10, 2) NOT NULL,
  `Gsize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gnum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gstate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rder
-- ----------------------------
INSERT INTO `rder` VALUES ('wcj2000', '木茶出品森系复古灯芯绒中长裙日系少女宽松娃娃领刺绣连衣裙秋冬', 159.00, 'XXXL', '5', 'clothing/裙子/image/26.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', 'JHXC 不规则鱼尾裙半身裙女高腰2021秋冬新款中长款显瘦A字百褶裙', 128.00, 'XXL', '2', 'clothing/裙子/image/10.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', '2021秋冬新款裙子中长款高腰不规则半身裙女设计感小众蓬蓬裙半裙', 175.00, 'L', '1', 'clothing/裙子/image/28.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', '2021早秋新款格子衬衫女休闲文艺时尚舒适透气百搭气质长袖上衣', 50.00, 'XL', '1', 'clothing/衬衫/image/14.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', '春秋季潮牌印花长袖衬衫男士胖子宽松加肥加大码学生休闲衬衣外套', 89.00, 'XL', '6', 'clothing/衬衫/image/11.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', '2021秋冬新款裙子中长款高腰不规则半身裙女设计感小众蓬蓬裙半裙', 175.00, 'XXL', '8', 'clothing/裙子/image/28.webp', '未发货');
INSERT INTO `rder` VALUES ('wcj2000', '男士裤子休闲裤男春秋宽松直筒裤男裤长裤工装裤潮牌秋季潮流百搭', 123.00, 'XL', '4', 'clothing/长裤/image/1.webp', '未发货');
INSERT INTO `rder` VALUES ('111111', '春秋季运动裤男潮束脚裤宽松休闲纯棉小脚裤冬季加绒束腿收口卫裤', 101.00, 'XXXL', '1', 'clothing/长裤/image/20.webp', '未发货');
INSERT INTO `rder` VALUES ('111111', '正品哥弟新款长袖气质蕾丝连衣裙秋季专柜名牌小个子收腰减龄裙子', 120.00, 'L', '1', 'clothing/裙子/image/9.webp', '未发货');
INSERT INTO `rder` VALUES ('333333', '安小落 白色提花小白裙女夏法式新款赫本风气质收腰中长连衣裙子', 139.00, 'L', '2', 'clothing/裙子/image/13.webp', '未发货');
INSERT INTO `rder` VALUES ('333333', '安小落法式甜美娃娃领连衣裙早秋2021新款长袖气质中长款小白裙子', 149.00, 'L', '1', 'clothing/裙子/image/4.webp', '未发货');
INSERT INTO `rder` VALUES ('333333', '木茶出品森系复古灯芯绒中长裙日系少女宽松娃娃领刺绣连衣裙秋冬', 159.00, 'L', '1', 'clothing/裙子/image/26.webp', '未发货');
INSERT INTO `rder` VALUES ('333333', '温柔风法式连衣裙设计感气质高端衬衫半裙职业套装裙女春秋两件套', 348.00, 'L', '1', 'clothing/裙子/image/7.webp', '未发货');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `Uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Upassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Usex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Uphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Ureceiving` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Uaddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1008611', '北方', '1008611', '男', '19936641965', '阿萨', '阿松大阿松');
INSERT INTO `user` VALUES ('102551', '爱淘', '111111', '男', '15023246654', '小爱', '福源大道');
INSERT INTO `user` VALUES ('111111', '111111', '111111', '男', '111111', '韦德', '韦德');
INSERT INTO `user` VALUES ('123456', '郑', '123456', '男', '123456', '郑', '重庆');
INSERT INTO `user` VALUES ('333333', '爱淘', '333333', '男', '15023246654', '小爱', '福源大道');
INSERT INTO `user` VALUES ('wcj2000', '北国qaq', '123456', '男', '18842357624', '王昌囧', '重庆市巴南区融汇半岛B区16号');
INSERT INTO `user` VALUES ('zsy1111', 'respect', '666666', '男', '19615924865', '郑老板', '重庆市巴南区龙华大道');

SET FOREIGN_KEY_CHECKS = 1;
