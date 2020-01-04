-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: final
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `idboard` int(255) NOT NULL AUTO_INCREMENT,
  `courseID` int(255) NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submitTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `feedback` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idboard`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (37,6,'222','5','2020-01-03 18:17:40','NMSL'),(38,6,'222','5','2020-01-03 19:20:54','波囉密好吃'),(46,3,'222','2','2020-01-01 17:30:36','這是第幾頁阿'),(50,5,'222','2','2020-01-01 18:01:04','靠...元旦我在這做這個= ='),(51,5,'222','3','2020-01-01 18:01:46','別哭了自言自語很好玩'),(54,1,'333','2','2020-01-03 21:12:40','明天要辣個辣'),(55,2,'333','2','2020-01-03 21:37:57','今天又要爆肝了嗎'),(56,3,'333','2','2020-01-01 17:31:45','這是第三頁辣'),(57,4,'333','5','2020-01-01 19:13:37','居然忘記這裡了...'),(58,5,'333','5','2020-01-01 18:02:44','樓下都沒去跨年吧:)))'),(59,6,'333','5','2020-01-03 19:54:05','我又回來這一頁了'),(60,7,'123','5','2019-06-15 09:39:33','終於快做完ㄌㄋ!!'),(61,1,'mimi','1','2020-01-03 23:52:30','阿~'),(62,1,'mimi','5','2020-01-03 23:52:37','聽說這個很好吃呢'),(63,2,'123','5','2020-01-04 00:23:42','人生苦短'),(64,2,'123','5','2020-01-04 00:28:22','好淚淚呢'),(65,1,'123','4','2020-01-04 01:26:40','嗯哼'),(66,1,'123','5','2020-01-04 01:26:51','還行'),(67,1,'123456','1','2020-01-04 03:26:15','這應該是最後測試留言了吧痾阿'),(68,1,'123456','5','2020-01-04 03:27:02','好想打電動'),(69,2,'123456','5','2020-01-04 03:28:02','你說我是一隻巴特福來'),(70,3,'123456','5','2020-01-04 03:28:32','第三個了'),(71,4,'123456','5','2020-01-04 03:28:51','等等是不是還要用管理員阿= ='),(72,5,'123456','5','2020-01-04 03:29:13','第五個了什麼時候可以睡覺'),(73,6,'123456','5','2020-01-04 03:29:44','上面的選擇購買數量不可以是負的喔，會被我打屁股');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `idcart` int(255) NOT NULL AUTO_INCREMENT,
  `memberID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseID` int(255) NOT NULL,
  `residual` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(255) NOT NULL,
  `setnumber` int(255) NOT NULL,
  `subtotal` int(255) NOT NULL,
  PRIMARY KEY (`idcart`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `idcounter` int(255) NOT NULL AUTO_INCREMENT,
  `count` int(255) NOT NULL,
  PRIMARY KEY (`idcounter`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,19);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `idcourse` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(255) NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residual` int(255) NOT NULL,
  `avg_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredients` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecturer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_path_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_path_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idcourse`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'黑色派對16球',100,'2020-01-04 11:11:11',96,'3.3','photo/cource','cf.jpg','Dessert','聖誕節，情人節，必備驚喜。在每次的派對都有著不同的驚喜，有幽默的，也可以爆笑的。當每次的打開驚喜之前，懸疑的氣氛層層未知，而當打開一剎那，整個派對似乎都搭著火箭衝向月球。\n這一款巧克力，彷彿是隨著季節不斷輪替的黑色派對，像是一個幸運盒子，每次開盒都有不同的驚喜，松露、黑森林、餅乾巧克力輪番上演，讓你展現盛麗的巧克力派對。',' │ 商品內容 │\n松露巧克力、榛果巧克力、黑森林巧克力、餅乾巧克力...共16球，精美提袋\n \n\n│ 產品成份 │- 比利時巧克力、法國巧克力、法國可可粉、法國鮮奶油、法國餅乾脆片、無糖天然榛果醬、天然覆盆子粉、榛果、堅果、微量酒(蛋奶素)\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一週 ','photo/cource/cf.jpg','photo/cource/c1.jpg'),(2,'皇家古典巧克力蛋糕',150,'2020-01-04 11:11:11',96,'4.2','photo/cource','c3.jpg','Dessert','在繁花盛開的新世紀，許多事情越來越輕薄的毫無重量，輕薄的裝飾取代了厚重的本質，在轉過許多生命的彎曲後，我開始靜下心來想與你分享的是眼前的皇家古典蛋糕。\n \n沒有太多浮華的裝飾，杏仁粉以誠意十足的比例拌和在麵粉之中，誠意使得眼前的蛋糕紮實而濕潤，醇厚的巧克力淋醬沿著蛋糕的邊緣汨汨流下，在新鮮時分進入口中，我似乎還可以感覺到那嬌嫩的彈性…',' │ 商品內容 │\n松露巧克力、榛果巧克力、黑森林巧克力、餅乾巧克力...共16球，精美提袋\n\n│ 產品成分 │ - 比利時巧克力、法國巧克力、法國可可粉、法國鮮奶油、法國餅乾脆片、無糖天然榛果醬、天然覆盆子粉、榛果、堅果、微量酒(蛋奶素)\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一週 ','photo/cource/c3.jpg','photo/cource/c1.jpg'),(3,'搖滾生巧克力蛋糕',140,'2020-01-04 11:11:11',99,'3.0','photo/cource','c4.jpg','Dessert','我相信可可是的飲料，是我們的點心，也是營養的來源，是歡樂之源，他們是重度使用者....歡迎加入巧克力重度使用者俱樂部！',' │ 商品內容 │\n搖滾生巧克力蛋糕、精美提袋\n\n│ 產品成分 │ - 黑巧克力70％ 、法國鮮奶油、白蘭地酒、雞蛋、微量莎娜丁粉 (葷)\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一週 ','photo/cource/c4.jpg','photo/cource/c1.jpg'),(4,'比利時生巧克力65%',120,'2020-01-04 11:11:11',100,'5.0','photo/cource','cc.jpg','Dessert','聖誕節，情人節，必備驚喜。在每次的派對都有著不同的驚喜，有幽默的，也可以爆笑的。當每次的打開驚喜之前，懸疑的氣氛層層未知，而當打開一剎那，整個派對似乎都搭著火箭衝向月球。\n這一款巧克力，彷彿是隨著季節不斷輪替的黑色派對，像是一個幸運盒子，每次開盒都有不同的驚喜，松露、黑森林、餅乾巧克力輪番上演，讓你展現盛麗的巧克力派對。','\n\n│ 商品內容 │\n松露巧克力、榛果巧克力、黑森林巧克力、餅乾巧克力...共16球，精美提袋\n\n│ 產品成分 │ - 比利時巧克力、法國巧克力、法國可可粉、法國鮮奶油、法國餅乾脆片、無糖天然榛果醬、天然覆盆子粉、榛果、堅果、微量酒(蛋奶素)\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一週 ','photo/cource/cc.jpg','photo/cource/c1.jpg'),(5,'玫瑰包種生巧克力65%',130,'2020-01-04 11:11:11',100,'3.8','photo/cource','c5.jpg','Dessert','巧克力的濃郁搭配玫瑰花茶的芬芳，清雅香氣，令人沉浸於優雅浪漫的氣氛裡， 就好像你就在身旁。',' │ 商品內容 │\n玫瑰包種生巧克力25片裝、精美提袋\n\n│ 產品成分 │ - 65%伊那亞巧克力、英國玫瑰包種茶、玫瑰酒、法國鮮奶油\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一週 ','photo/cource/c5.jpg','photo/cource/c1.jpg'),(6,'覆盆子生巧克力',120,'2020-01-04 11:11:11',100,'5.0','photo/cource','c6.jpg','Dessert','為了要制止妳任性的想把胭脂敷上巧克力、然後一口吃掉的慾望，我趕緊奉上了這一款覆盆子生巧克力，滿足了妳的粉紅色偏執。粉紅色+巧克力這樣的組合，彷彿就是女人基因裡天賦的任性，如此的背反常態、卻又異常地誘人。\n酸甜的覆盆子把巧克力中潛藏的熱帶水果氣息完全勾引出來，讓人無法分清楚剛剛吃下的是水果還是巧克力？覆盆子的餘味又悄悄地和巧克力融為一體，讓巧克力的氣味增添了一種馥郁的氣息。',' │ 商品內容 │\n覆盆子生巧克力25片裝、緞帶、提袋\n\n│ 產品成分 │ - 比利時60%苦甜巧克力、比利時70%醇苦巧克力、法國50％覆盆子酒、法國天然覆盆子粉、法國鮮奶油 (蛋奶素)\n品味方式 - 搭配黑咖啡或熱紅茶，慢慢品嘗享用\n訂購需知 - 冷藏保存一周 ','photo/cource/c6.jpg','photo/cource/c1.jpg');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `idmember` int(255) NOT NULL AUTO_INCREMENT,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idmember`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'123','123456','cyim@cycu.com'),(2,'333','333','333@cycu.com'),(26,'ilovechicken','majaja','majiyami@gijoe.com'),(29,'mimi','123','123@cycu.com'),(36,'111','222','1212@gmail.com'),(37,'123456','789','efnaKJ@gmail.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `idorder` int(255) NOT NULL AUTO_INCREMENT,
  `memberID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseID` int(255) NOT NULL,
  `amount` int(255) NOT NULL,
  `submitTime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int(255) NOT NULL,
  PRIMARY KEY (`idorder`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (46,'123',1,1,'2020-01-04 00:10:17',1),(47,'123',3,1,'2020-01-04 00:12:44',2),(48,'123',3,1,'2020-01-04 00:12:44',2),(49,'123',2,1,'2020-01-04 00:20:08',3),(50,'123',2,1,'2020-01-04 00:20:08',3),(51,'123',2,1,'2020-01-04 00:20:08',3),(52,'123456',1,1,'2020-01-04 03:31:49',2),(53,'123456',2,1,'2020-01-04 03:31:49',2),(54,'123',2,2,'2020-01-04 03:58:23',1);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `idtest` int(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idtest`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'a'),(2,'b'),(3,'f'),(4,'d'),(5,'e');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-04  7:56:34
