CREATE DATABASE  IF NOT EXISTS `db_109403025` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_109403025`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.102    Database: db_109403025
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_Category`
--

DROP TABLE IF EXISTS `tbl_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Category`
--

LOCK TABLES `tbl_Category` WRITE;
/*!40000 ALTER TABLE `tbl_Category` DISABLE KEYS */;
INSERT INTO `tbl_Category` VALUES (1,'科技'),(2,'遊戲'),(3,'教育'),(4,'地方創生'),(5,'空間'),(6,'飲食'),(7,'時尚'),(8,'音樂'),(9,'新春賀喜'),(10,'攝影');
/*!40000 ALTER TABLE `tbl_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Comment`
--

DROP TABLE IF EXISTS `tbl_Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  `member_comment` text NOT NULL,
  `proposer_response` text,
  PRIMARY KEY (`comment_id`,`member_id`,`proposal_id`),
  KEY `comment_member_id_fk_idx` (`member_id`),
  KEY `comment_proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `comment_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `tbl_Member` (`member_id`),
  CONSTRAINT `comment_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_Proposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Comment`
--

LOCK TABLES `tbl_Comment` WRITE;
/*!40000 ALTER TABLE `tbl_Comment` DISABLE KEYS */;
INSERT INTO `tbl_Comment` VALUES (1,9,5,'不好意思，我的贊助編號是P108681B 想問一下什麼時候會收到呢～！ 感謝','您好，禮盒已經送出，和豐店到店，應該已經抵達喔～ 感謝您對募資計畫的支持喔～ :)'),(2,10,1,'GoPlus 已更新連線方式，你們還支援24小時不斷線嗎','丹尼的影片 1 : 40 秒有講解如何連線 GoPlus 功能喔～'),(3,3,1,'請問當寶可夢執行背景應用程式or手機休眠時，247還會持續運作抓怪轉牌嗎?',''),(4,4,5,'讚！！每日寫日記','太棒了，歡迎在我們FB粉絲頁跟大家分享喔～'),(5,8,4,'加油！你的作品很有特色，如果size再完整一些，單價低一些應該很有市場的！','謝謝您的支持與鼓勵！！'),(6,1,10,'上次短褲沒跟到，這次上衣短褲共下買。','謝謝您的支持 : )'),(7,2,1,'我多訂一個能退嘛','要請您寄一封信到 support@zeczec.com'),(8,6,2,'請問軟糖保存期限多久呢？因為同事都是垃圾讓人很需要囤貨 :)','您好，保存期限是一年喔！希望可以陪你平靜渡過被垃圾氣到不行的每一天 :)'),(9,7,1,'有機會可以早點出貨嗎？6/1要等很久',''),(10,1,3,'請問留言tag兩個人的活動我不小心讓他的網頁跳出來該怎麼再操作一次，謝謝。','您好！已另外傳送嘖嘖站內信給您，再請查收');
/*!40000 ALTER TABLE `tbl_Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_FAQ`
--

DROP TABLE IF EXISTS `tbl_FAQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_FAQ` (
  `FAQ_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `last_editor_id` int NOT NULL,
  `question` varchar(1000) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`FAQ_id`,`proposal_id`),
  KEY `FAQ_proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `FAQ_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_Proposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_FAQ`
--

LOCK TABLES `tbl_FAQ` WRITE;
/*!40000 ALTER TABLE `tbl_FAQ` DISABLE KEYS */;
INSERT INTO `tbl_FAQ` VALUES (1,4,8,'要如何下單？','先點擊想要贊助的方案之後，照著以下步驟 1、選擇您想要「信用卡付款」或是「ATM轉帳」2、選擇您要宅配或是超商取貨，並輸入對應的收件資訊 3、確認贊助人資訊，並按下立刻付款。 4、之後會根據付款方式給您相關的付款資料 5、付款後回到嘖嘖頁面，點選右上角選單的贊助紀錄，就可以確認剛剛是否付款成功囉！','2022-05-24 17:13:00'),(2,4,8,'請問何時會出貨？','預計於2022年7月初開始依訂單編號陸續出貨。','2022-05-24 15:03:31'),(3,1,7,'請問有什麼需要注意的呢？','由於新品PVC材質，於生產完成即封裝寄送，初次開啟會有些許味道屬於正常，收到後可先打開放置通風處即可消除。若有需清潔，可用中性清潔劑清洗乾淨並完全晾乾，切勿長時間曝曬於太陽下。 ','2022-05-24 15:03:43'),(4,2,6,'有多入之大宗採購需求該怎麼做？','歡迎加入LINE@好友搜尋「@550yisos」，將會有專人與您接洽喔！','2022-05-23 15:28:00'),(5,7,3,'付款方式有哪些？','目前開放ATM、信用卡。','2022-05-23 15:28:00'),(6,3,4,'可以用信用卡分期嗎？','【台灣的募資平台因應政府規定，均沒有提供分期付款的功能】不過，持卡者如果想以自己信卡來做【分期付款】這樣是可以的。但是，這樣就會有分期利率手續費的衍生（相關利率依每家銀行規範為準）所以，想要以分期付款的朋友，請你先與你持卡銀行確認相關資訊。','2022-05-23 15:18:00'),(7,10,1,'十月才能收到商品嗎？','事實上如果不受疫情或戰爭的影響~八月就能出貨了！目前確定八月最少可以出100組~先下單先拿到喔','2022-05-24 21:30:00'),(8,6,4,'有使用說明嗎?','請至粉絲專頁~魔術吸管~參考一下喔~','2022-05-15 14:36:00'),(9,6,4,'是否有分男女版型呢 ?','我們的版型皆為中性版型，中性版是男女皆適合喔！','2022-05-19 15:06:00'),(10,5,9,'可否寄送到國外？','目前我們的商品可以寄送到下列地區：香港(運費$250) / 澳門(運費$250) / 中國(運費$250) / 美國(運費$800) / 日本(運費$600)','2022-05-19 15:06:00');
/*!40000 ALTER TABLE `tbl_FAQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_FollowingRecord`
--

DROP TABLE IF EXISTS `tbl_FollowingRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_FollowingRecord` (
  `following_record_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`following_record_id`,`member_id`,`proposal_id`),
  KEY `FollowingRecord_proposal_id_fk_idx` (`proposal_id`),
  KEY `FollowingRecord_member_id_fk_idx` (`member_id`),
  CONSTRAINT `FollowingRecord_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `tbl_Member` (`member_id`),
  CONSTRAINT `FollowingRecord_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_Proposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_FollowingRecord`
--

LOCK TABLES `tbl_FollowingRecord` WRITE;
/*!40000 ALTER TABLE `tbl_FollowingRecord` DISABLE KEYS */;
INSERT INTO `tbl_FollowingRecord` VALUES (2,1,10),(3,1,3),(7,1,2),(9,1,7),(8,2,6),(10,3,1),(5,4,8),(4,5,4),(1,6,9),(6,10,1);
/*!40000 ALTER TABLE `tbl_FollowingRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Member`
--

DROP TABLE IF EXISTS `tbl_Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `salt` char(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(64) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Member`
--

LOCK TABLES `tbl_Member` WRITE;
/*!40000 ALTER TABLE `tbl_Member` DISABLE KEYS */;
INSERT INTO `tbl_Member` VALUES (1,'in.consequat@yahoo.com','0oplfZ16tyLX','毛若穎','366 苗栗縣銅鑼鄉民權路31號','0921003614'),(2,'adipiscing.enim.mi@outlook.com','7gB%z9Svg8EW','林芳岑','600 嘉義市東區世賢路24號','0988008346'),(3,'nullam.velit@yahoo.com','JJQF0j%tkx3i','胡素芝','325 桃園市龍潭區淮子埔一路29號','0922830125'),(4,'sed.auctor@hotmail.com','Rv$uGmL&C!%g','童雅婷','540 南投縣南投市三和一路14號','0958351743'),(5,'sagittis.nullam@google.com','XcZg6Be^cU2y','賴麗萍','508 彰化縣和美鎮潭北路15號','0912587773'),(6,'nec.leo.morbi@protonmail.com','aZjy*GvZt@s*','黃志斌','711 臺南市歸仁區崙頂二街11號','0960105109'),(7,'sociosqu.ad@yahoo.com','j8tI5!wG88PM','廖松白','411 臺中市太平區北田路14號','0961749001'),(8,'proin.non@protonmail.com','n7UDOe0uspZk','徐嘉柏','801 高雄市前金區自立二路18號','0928735721'),(9,'arcu.vel.quam@hotmail.com','wlmM33nAD@SR','李麗珠','201 基隆市信義區義四路22號','0968169143'),(10,'dui.quis.accumsan@google.com','&@^ODhk0MH&l','施泓音','622 嘉義縣大林鎮早知31號','0970691667');
/*!40000 ALTER TABLE `tbl_Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_MemberCredential`
--

DROP TABLE IF EXISTS `tbl_MemberCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_MemberCredential` (
  `member_credential_id` int NOT NULL AUTO_INCREMENT,
  `hashed_user_id` int NOT NULL,
  `hashed_pwd_string` varchar(200) NOT NULL,
  PRIMARY KEY (`member_credential_id`,`hashed_user_id`),
  KEY `MemberCreadential_hashed_user_id_fk_idx` (`hashed_user_id`),
  CONSTRAINT `MemberCreadential_hashed_user_id_fk` FOREIGN KEY (`hashed_user_id`) REFERENCES `tbl_Member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_MemberCredential`
--

LOCK TABLES `tbl_MemberCredential` WRITE;
/*!40000 ALTER TABLE `tbl_MemberCredential` DISABLE KEYS */;
INSERT INTO `tbl_MemberCredential` VALUES (1,1,'5459ffea690882061cfa56fa9033278370e48de356c700637aad68d14f2ae0ae'),(2,2,'07703ba76ae595a212c8317146fb292fb773f34314a3708a6f3e916bbf6e499c'),(3,3,'1caf7cfa34bdb90fd7a332dfed5a5e0d1a153d6a164234aa98b7ba611b83abe7'),(4,4,'ea8ced964d6826e1eede67dccaea05e543e4bcf84ff06d6af8f7877413a91538'),(5,5,'7a09363a667de652e1666b0810219bb7886036dca13af909cd755c80df946365'),(6,6,'ccd108b762527fcdcdb8c5b6cad6480e9b81a5d92f29e6793d6865b274bc50dc'),(7,7,'a5c5e74448987538a8bffda3518f59e2f3785cf460d4f882a2c563af654fe13f'),(8,8,'1a4c96ddeda1e2bfc16abd7bd6f8a72dc416c10c824747cbe5b1f9cc20671c40'),(9,9,'e9c59dd5748d8c0be520b37658c8da542720916cc6d7ff627ad2ba0e76237bca'),(10,10,'5ad2e13f01b6c6597301b4dd8fa5b2a055c6e4245e84f63344f6bbb5c0f3c802');
/*!40000 ALTER TABLE `tbl_MemberCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Proposal`
--

DROP TABLE IF EXISTS `tbl_Proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Proposal` (
  `proposal_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(120) NOT NULL,
  `due_date` text,
  `amount` int NOT NULL,
  `status` int NOT NULL,
  `goal` int NOT NULL,
  `content` text NOT NULL,
  `viewed_num` int NOT NULL,
  `create_date` date NOT NULL,
  `is_deactivated` tinyint NOT NULL,
  PRIMARY KEY (`proposal_id`),
  KEY `proposal_category_id_fk_idx` (`category_id`),
  CONSTRAINT `proposal_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `tbl_Category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Proposal`
--

LOCK TABLES `tbl_Proposal` WRITE;
/*!40000 ALTER TABLE `tbl_Proposal` DISABLE KEYS */;
INSERT INTO `tbl_Proposal` VALUES (1,1,'《 247 Catcher 》｜ 最全面的【抓寶 & 打團】輔助道具','2022/07/05',2393696,2,100000,'大家好！我們是 PhotoFast 銀箭資訊。今年，我們創造出了一款能符合 Pokemon GO 玩家需求的抓寶利器！不只能突破現有的連線一小時限制，更讓您能夠在打團戰或攻道館時輕鬆應戰！',1150,'2022-04-06',0),(2,6,'【最後 3 天】台灣首發輕機能舒壓軟糖 ✧ Kimóo 情緒平衡軟糖 ✧ 日本專利「特濃舒壓ＧＡＢＡ」Ｘ「快樂Ｌ色氨酸」，面對再多鳥事也能有平靜好心情！','2022/06/21',377200,2,200000,'喜劇演員的起笑配方！募資前百人實測 → 75.8% 有感回饋：「吃了真的有鬆～」——— 你的心累了嗎？\"Not being O.K. is O.K.\"\" 沒關係，是情緒啊！吃一顆回到內在平靜小宇宙！\"',251,'2022-03-23',0),(3,3,'數感宇宙探索課程｜為國小生打造的生活數學 DIY 影音學習組｜給孩子一堂不一樣的數學課','2022/08/02',3737138,2,500000,'本課程結合數感實驗室逾 10 年數學教育經驗、史丹佛大學「成長型數學思維」理論。內容針對國小中年級以上的孩子，強調具體、跨域、手作、情境。鼓勵孩子探索思考，讓孩子愛上數學。',641,'2022-05-04',0),(4,7,'『Organs without body 2014 S/S 服裝秀』','2013/11/19',5050,3,100000,'「ORGANS WITHOUT BODY 」為 藝術家「安地羊 Andy Yen」2012創立之服裝品牌。',4,'2013-08-21',1),(5,4,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』','2022/03/12',852482,3,50000,'本次募資計畫是由茶品牌 Three Leafs Tea 透過45款茶做為與消費者連結的媒介，結合茶與藝術向世界說台灣。以「人、事、物、學、遊」五個層面介紹清晰易懂的台灣在地文化故事。',194,'2021-12-12',1),(6,5,'樂待STAY 桃園水岸店 on Line 募資企劃-我們讓孩子樂呆 父母樂待','2022/08/23',282244,2,943038,'',63,'2022-05-25',0),(7,3,'謎路⼈Way of Puzzle 2022【It\'s All I Have】專輯發⾏企劃','2022/08/21',45651,2,400000,'',31,'2022-05-23',0),(8,2,'邏輯解謎｜密室逃脫桌遊 破解古老的秘密','',0,1,100000,'益智解謎新視野，結合密室逃脫與立體拼圖的概念，打造一個全新的益智桌遊。你可以舒適地在家中享受愉快的動腦時光，將大腦發揮至極限。',0,'2022-03-22',0),(9,10,'SIRUI 75mm ​變形鏡頭','2021/10/18',532600,3,100000,'還停留在變形鏡頭既沉且大的印象中？還以為變形鏡頭是高昂的貴族鏡頭？不！消費級別的變形鏡頭世界早已誕生——思銳1.33X寬銀幕變形鏡頭！目前，思銳已推出24mm/F2.8、35mm/F1.8、50mm/F1.8三個焦段，其以更小的體積、更高的性價比、更強的電影質感，讓大眾影友真正能無負擔地接觸變形鏡頭。',200,'2021-07-20',1),(10,1,'【 HOMI｜地表最強全情境短袖 & EAM 登山防曬衣 】featuring CORDURA fabric / MIT 設計製造！','2022/08/22',1556942,3,100000,'ㄧ件夏天的短袖可以有什麼不同？CORDURA 柔軟強韌，非塗層物理涼感，抗UV 前所未有的透氣調節，MIT 質感獨家設計製造 # 針對夏天的穿著環境，更舒適的穿著體驗而衍生出 HOMI 的第一件短袖物件 Movement T shirt，利用材料及設計創造出ㄧ件可以在夏日的不同環境下，隨時給你舒適機能與質感外型的短袖！',3148,'2022-05-24',1);
/*!40000 ALTER TABLE `tbl_Proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ProposalMember`
--

DROP TABLE IF EXISTS `tbl_ProposalMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_ProposalMember` (
  `ProposalMember_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`ProposalMember_id`,`member_id`,`proposal_id`),
  UNIQUE KEY `ProposalMember_id_UNIQUE` (`ProposalMember_id`),
  KEY `proposalMember_proposal_id_fk_idx` (`proposal_id`),
  KEY `ProposalMember_member_id_fk_idx` (`member_id`),
  CONSTRAINT `ProposalMember_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `tbl_Member` (`member_id`),
  CONSTRAINT `ProposalMember_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_Proposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ProposalMember`
--

LOCK TABLES `tbl_ProposalMember` WRITE;
/*!40000 ALTER TABLE `tbl_ProposalMember` DISABLE KEYS */;
INSERT INTO `tbl_ProposalMember` VALUES (1,4,8),(2,1,7),(3,2,6),(4,7,3),(5,3,4),(6,10,1),(7,6,4),(8,6,3),(9,5,9),(10,8,2),(11,9,10),(12,10,8);
/*!40000 ALTER TABLE `tbl_ProposalMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ProposalOption`
--

DROP TABLE IF EXISTS `tbl_ProposalOption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_ProposalOption` (
  `proposal_option_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `title` varchar(120) NOT NULL,
  `price` int NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`proposal_option_id`,`proposal_id`),
  KEY `proposalOption_proposal_id_fk_idx` (`proposal_id`),
  CONSTRAINT `proposalOption_proposal_id_fk` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_Proposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ProposalOption`
--

LOCK TABLES `tbl_ProposalOption` WRITE;
/*!40000 ALTER TABLE `tbl_ProposalOption` DISABLE KEYS */;
INSERT INTO `tbl_ProposalOption` VALUES (1,1,'247 早鳥超值組',2290,'內容物包含：247 Catcher x 1 自動點擊器 x 1 usb - C 充電線 x 1 專屬收納包 x 1 247 Catcher 說明書 x 1【重要提醒】台灣本島地區免運費，外島地區收額外運費。全球地區皆可寄，運費於結帳時顯示。若需統編請輸入收件資訊時備註。'),(2,3,'單組 體驗初學',1790,'Ａ數學分析／Ｂ邏輯推演／Ｃ策略規劃：３組擇１ '),(3,9,'【好評追加！超早鳥衣褲組合】',3899,'Movement 全情境短T X1 +  Movement 全情境短褲 X1 +  ▲未來售價：5060，現省1161 '),(4,5,'小資支持 12個月每月茶包禮',800,'【感謝禮】回饋您對我們計畫的支持，我們每個月會寄一包茶葉體驗包 + 電子刊物'),(5,10,'75mm 超級早鳥價格',18800,'75mm F1.8 Anamorphic 1.33X Lens X1 '),(6,8,'【 嘖嘖超早鳥優惠 】 未來售價 $1790｜現省300元',1490,'金字塔、諾克斯碉堡、龍之屋（三選一） ×1 款'),(7,6,'x5 Project 台灣茶葉禮盒 | 邀請您一起用45款台灣茶重新認識『在地』',1888,'想參與STAY最有名的親子活動嗎，此為一大一小體驗邀請，歡迎爸媽帶著你的孩子，或是孩子帶著你最愛的爸媽，參加我們90分鐘的專屬親子派對，和我們一起慶祝STAY桃園水岸店的開幕'),(8,7,'【只想聽歌組】',720,'【謎路人 2022 It\'s All I Have】 概念專輯 1張 '),(9,4,'原畫畫作一件10號',15000,'原畫畫作'),(10,2,'【嘖嘖價】1 入 83 折',690,'Kimóo情緒平衡軟糖 1 盒');
/*!40000 ALTER TABLE `tbl_ProposalOption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_SponsorRecord`
--

DROP TABLE IF EXISTS `tbl_SponsorRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_SponsorRecord` (
  `sponsor_record_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`sponsor_record_id`,`proposal_option_id`,`member_id`),
  KEY `SponsorRecord_member_id_fk_idx` (`member_id`),
  KEY `SponsorRecord_proposal_option_id_fk_idx` (`proposal_option_id`),
  CONSTRAINT `SponsorRecord_member_id_fk` FOREIGN KEY (`member_id`) REFERENCES `tbl_Member` (`member_id`),
  CONSTRAINT `SponsorRecord_proposal_option_id_fk` FOREIGN KEY (`proposal_option_id`) REFERENCES `tbl_ProposalOption` (`proposal_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_SponsorRecord`
--

LOCK TABLES `tbl_SponsorRecord` WRITE;
/*!40000 ALTER TABLE `tbl_SponsorRecord` DISABLE KEYS */;
INSERT INTO `tbl_SponsorRecord` VALUES (1,9,4,800),(2,10,1,2290),(3,3,1,2290),(4,4,4,800),(5,8,9,15000),(6,1,5,18800),(7,2,1,2290),(8,6,10,690),(9,7,1,2290),(10,1,2,1790);
/*!40000 ALTER TABLE `tbl_SponsorRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_109403025'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_CreateProposal`(
	IN inmember_id int,
    IN intitle varchar(120) ,
    IN incontent text,
    IN ingoal int,
    IN incategory_id int,
    OUT outaffected_row_num int
)
BEGIN
	DECLARE affected_num_row_tbl_Proposal int DEFAULT 0;
    DECLARE affected_num_row_tbl_ProposalMember int DEFAULT 0;
    DECLARE input_proposal_id int;
    
	INSERT INTO tbl_Proposal(category_id,title,content,amount,goal,status,viewed_num,create_date,due_date,is_deactivated)
    VALUES 
		(incategory_id,intitle,incontent,'0',ingoal,'2','0',now(),date_add(now(),INTERVAL 90 DAY),'0'
        );
        
	SET input_proposal_id = (SELECT LAST_INSERT_ID());
    SELECT row_count() INTO affected_num_row_tbl_Proposal;
    
    INSERT INTO tbl_ProposalMember(member_id,proposal_id)
    VALUES (inmember_id,input_proposal_id);
    
    SELECT row_count() INTO affected_num_row_tbl_ProposalMember;

	SELECT
		tbl_Proposal.proposal_id,
        tbl_Proposal.title AS proposal_title,
        tbl_Proposal.content AS proposal_content,
        tbl_Proposal.amount,
        tbl_Proposal.goal,
        tbl_Proposal.status,
        tbl_Proposal.viewed_num,
        tbl_Proposal.create_date,
        tbl_Proposal.due_date,
		tbl_Category.category_name AS category
	FROM
		tbl_Category
	INNER JOIN
		tbl_Proposal ON tbl_Category.category_id = tbl_Proposal.category_id
	INNER JOIN tbl_ProposalMember ON tbl_ProposalMember.proposal_id = tbl_Proposal.proposal_id
    
    WHERE member_id = inmember_id AND tbl_Proposal.proposal_id = input_proposal_id;
    
    SELECT (affected_num_row_tbl_Proposal + affected_num_row_tbl_ProposalMember) INTO outaffected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
	IN inmember_id int,
    OUT outnumber_found int
)
BEGIN
	SELECT
		fr.member_id,
		p.title as proposal_title, 
		p.amount as proposal_amount,
		p.goal as proposal_goal
	FROM
		tbl_Proposal p
	INNER JOIN tbl_FollowingRecord fr ON fr.proposal_id = p.proposal_id
    WHERE fr.member_id = inmember_id;
    
    SELECT found_rows() INTO outnumber_found;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetHistorySponsorByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetHistorySponsorByMember`(
	IN inmember_id int,
    OUT outnum_of_rows int
)
BEGIN
	SELECT
		tbl_SponsorRecord.member_id,
		tbl_Proposal.proposal_id,
        tbl_Proposal.title AS proposal_title,
        tbl_ProposalOption.title AS proposal_option_title,
        tbl_SponsorRecord.amount,
        tbl_Proposal.status
	FROM
		tbl_SponsorRecord
	INNER JOIN
		tbl_ProposalOption ON tbl_SponsorRecord.proposal_option_id = tbl_ProposalOption.proposal_option_id
	INNER JOIN
		tbl_Proposal ON tbl_ProposalOption.proposal_id = tbl_Proposal.proposal_id
	WHERE
		member_id = inmember_id;
        
	SELECT found_rows() INTO outnum_of_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
	IN inratio float,
    OUT outnum_of_rows int
)
BEGIN
	SELECT
		proposal_id,
        title AS proposal_title,
        amount,
        goal,
        amount/goal AS ratio
	FROM
		tbl_Proposal
	
	WHERE
		amount/goal > inratio
    ORDER BY
		amount/goal DESC;
        
	SELECT found_rows() INTO outnum_of_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalsByKeyword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetProposalsByKeyword`(
	IN inkeyword VARCHAR(64),
    OUT outnumofrows INT
)
BEGIN
	SELECT 
		proposal_id,
        title,
        due_date,
        amount
	FROM 
		tbl_Proposal
	WHERE title LIKE CONCAT('%' , inkeyword , '%');
    
    SELECT found_rows() INTO outnumofrows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedComments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedComments`(
	IN inmember_id int,
    OUT outnum_of_rows int
)
BEGIN
	SELECT 
		tbl_ProposalMember.member_id,
        tbl_Comment.proposal_id,
        title AS proposal_id,
        comment_id,
        member_comment,
        comment_time,
        proposer_response
	FROM
		tbl_ProposalMember
	INNER JOIN
		tbl_Proposal ON tbl_ProposalMember.proposal_id = tbl_Proposal.proposal_id
	INNER join
		tbl_Comment ON tbl_Proposal.proposal_id = tbl_Comment.proposal_id
	where tbl_ProposalMember.member_id = inmember_id AND proposer_response = '';
    
    SELECT found_rows() INTO outnum_of_rows;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_Login`(
	IN inemail varchar(64),
    IN inhashedpwd varchar(200),
    OUT outstatus_code varchar(64)
)
BEGIN
    DECLARE status_code int DEFAULT 0;
    
	IF inemail IN (SELECT
					email
				  FROM
					tbl_Member
				  WHERE email = inemail) 
		AND 
			inhashedpwd IN (SELECT 
							tbl_MemberCredential.hashed_pwd_string
						  FROM
							tbl_MemberCredential
						  WHERE
							hashed_pwd_string = inhashedpwd) THEN
			SET 
				status_code = 1;

		ELSEIF 
			inemail IN (SELECT
							email
						FROM
							tbl_Member
						WHERE email = inemail) AND
			inhashedpwd NOT IN (SELECT 
								tbl_MemberCredential.hashed_pwd_string
							FROM
								tbl_MemberCredential
							WHERE
								hashed_pwd_string = inhashedpwd) THEN SET status_code = 2;
		ELSE 
			SET status_code = 3;	
	END IF;
                  
	  SELECT status_code INTO outstatus_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
IN inemail varchar(64),
	IN inhashedpwd varchar(200),
    IN insalt char(64),
    IN inname varchar(64),
    IN inaddress varchar(255),
    IN inphone varchar(64),
    OUT outaffect_row_num int

)
BEGIN
	DECLARE affected_row_num_tbl_Member int DEFAULT 0;
    DECLARE affected_row_num_tbl_MemberCredential int DEFAULT 0;
    
	INSERT INTO tbl_Member(email,salt,name,address,phone)
    VALUES
		(inemail,insalt,inname,inaddress,inphone);
        
	SELECT row_count() into affected_row_num_tbl_Member;
    
    INSERT INTO tbl_MemberCredential(hashed_user_id,hashed_pwd_string)
	VALUES
		((SELECT member_id FROM tbl_Member WHERE tbl_Member.salt = insalt) , inhashedpwd);
        
   	SELECT row_count() into affected_row_num_tbl_MemberCredential;
    
	SELECT
		m.member_id,
		m.name,
		m.email,
        mc.hashed_pwd_string AS password,
        m.salt,
        m.phone,
        m.address
    FROM
		tbl_Member m
	INNER JOIN tbl_MemberCredential mc ON mc.hashed_user_id = m.member_id
    WHERE mc.hashed_pwd_string = inhashedpwd;
        
    SET outaffect_row_num = @affected_row_num_tbl_Member + affected_row_num_tbl_MemberCredential;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(
	IN inproposal_id int,
    IN instatus int,
    OUT outaffected_row_num int
)
BEGIN
	UPDATE
		tbl_Proposal
	SET
		status = instatus
	WHERE inproposal_id = proposal_id AND status < instatus;
	
    SELECT row_count() INTO outaffected_row_num; 
    
    SELECT 
		proposal_id,
        status
	FROM
		tbl_Proposal
	WHERE
		proposal_id = inproposal_id;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`109403025`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
	IN inmember_id INT,
    IN inhashedpwd VARCHAR(200),
    IN insalt CHAR(64),
    OUT outaffected_row_num INT
)
BEGIN
	DECLARE affected_row_num__tbl_Member int DEFAULT 0;
    DECLARE affected_row_num_tbl_MemberCredential int DEFAULT 0;
    
	UPDATE 
		tbl_Member 
    SET 
		salt = insalt
	WHERE member_id = inmember_id;
    
    SELECT row_count() INTO @affected_row_num_tbl_Member;
    
    UPDATE
		tbl_MemberCredential 
	SET
		hashed_pwd_string = inhashedpwd
	WHERE hashed_user_id = inmember_id;
    
    SELECT row_count() INTO @affected_row_num_tbl_MemberCredential;
    
    SELECT
		m.member_id,
		m.name,
		m.email,
        mc.hashed_pwd_string AS password,
        m.salt,
        m.phone,
        m.address
    FROM
		tbl_Member m
	INNER JOIN tbl_MemberCredential mc ON mc.hashed_user_id = m.member_id
    WHERE mc.hashed_pwd_string = inhashedpwd;
    
    SET outaffected_row_num = @affected_row_num_tbl_Member + @affected_row_num_tbl_MemberCredential;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 16:14:16
