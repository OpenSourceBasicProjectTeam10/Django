-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- cbnu_portal 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `cbnu_portal` /*!40100 DEFAULT CHARACTER SET euckr COLLATE euckr_korean_ci */;
USE `cbnu_portal`;

-- 테이블 cbnu_portal.auth_group 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_group:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.auth_group_permissions 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_group_permissions:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.auth_permission 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_permission:~24 rows (대략적) 내보내기
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session');

-- 테이블 cbnu_portal.auth_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_user:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.auth_user_groups 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_user_groups:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.auth_user_user_permissions 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.auth_user_user_permissions:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `b_idx` int(11) DEFAULT NULL,
  `board_code` varchar(50) DEFAULT NULL COMMENT '게시판 코드',
  `b_title` varchar(50) DEFAULT NULL COMMENT '게시판 제목',
  `b_content` varchar(50) DEFAULT NULL COMMENT '게시판 내용',
  `b_content_img` varchar(50) DEFAULT NULL COMMENT '게시판 내용 중 사진',
  `b_category` varchar(50) DEFAULT NULL COMMENT '카테고리',
  `b_name` varchar(50) DEFAULT NULL COMMENT '게시글 작성자',
  `b_reserve_type` varchar(50) DEFAULT NULL COMMENT '모집 타입(공모전 / 풋볼장,농구장 등 타입)',
  `b_reserve_statue` varchar(50) DEFAULT NULL COMMENT '모집상태(진행/종료/보류)',
  `b_reserve_title` varchar(50) DEFAULT NULL COMMENT '공모전명',
  `b_reserve_site` varchar(50) DEFAULT NULL COMMENT '공모전 및 풋볼장,농구장 등 장소',
  `b_reserve_date` varchar(50) DEFAULT NULL COMMENT '모집 기간',
  `b_reserve_meeting` varchar(50) DEFAULT NULL COMMENT '진행 시간(공모전 일정/풋볼장,농구장 만남 일정)',
  `b_reserve_btn` varchar(50) DEFAULT NULL COMMENT '팀원모집글 내 예약버튼',
  `b_member_status` varchar(50) DEFAULT NULL COMMENT '작성자 정보가 기본 익명이며 b_reserve_btn클릭 시 정보확인가능(작성자이름, 학과, 전화번호 확인가능)',
  `b_reserve_count` int(11) DEFAULT NULL COMMENT '팀원모집 카운트'
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.board:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.calender 구조 내보내기
CREATE TABLE IF NOT EXISTS `calender` (
  `r_idx` int(11) DEFAULT NULL,
  `r_reserve_view_type` varchar(50) DEFAULT NULL COMMENT '개인일정조회/팀일정조회',
  `r_reservation_type` varchar(50) DEFAULT NULL COMMENT '예약타입(공모전 / 풋볼장,농구장 등 타입)',
  `r_reservation_status` varchar(50) DEFAULT NULL COMMENT '예약현황',
  `r_reservation_name` varchar(50) DEFAULT NULL COMMENT '예약자명',
  `r_reserve_beginTime` int(11) DEFAULT NULL COMMENT '예약 시작시간',
  `r_reserve_endTime` int(11) DEFAULT NULL COMMENT '예약 종료시간',
  `r_date_reservation` int(11) DEFAULT NULL COMMENT '원하는날짜 예약'
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.calender:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.django_admin_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.django_admin_log:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.django_content_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.django_content_type:~6 rows (대략적) 내보내기
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');

-- 테이블 cbnu_portal.django_migrations 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.django_migrations:~18 rows (대략적) 내보내기
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-05-19 02:09:29.589385'),
	(2, 'auth', '0001_initial', '2024-05-19 02:09:29.977614'),
	(3, 'admin', '0001_initial', '2024-05-19 02:09:30.097595'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-05-19 02:09:30.109112'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-05-19 02:09:30.120008'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-05-19 02:09:30.190650'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-05-19 02:09:30.219390'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-05-19 02:09:30.270348'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-05-19 02:09:30.281360'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-05-19 02:09:30.327678'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-05-19 02:09:30.330689'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-05-19 02:09:30.341101'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-05-19 02:09:30.370726'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-05-19 02:09:30.393378'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-05-19 02:09:30.440503'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-05-19 02:09:30.451919'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-05-19 02:09:30.479357'),
	(18, 'sessions', '0001_initial', '2024-05-19 02:09:30.513622');

-- 테이블 cbnu_portal.django_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.django_session:~0 rows (대략적) 내보내기

-- 테이블 cbnu_portal.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `m_idx` int(11) DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL COMMENT '회원 아이디',
  `member_pass` varchar(50) DEFAULT NULL COMMENT '회원 비밀번호',
  `member_email` varchar(50) DEFAULT NULL COMMENT '이메일',
  `member_department` varchar(50) DEFAULT NULL COMMENT '학과',
  `member_tel` int(11) DEFAULT NULL COMMENT '전화번호',
  `member_birthday` int(11) DEFAULT NULL COMMENT '생년월일'
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_korean_ci;

-- 테이블 데이터 cbnu_portal.member:~0 rows (대략적) 내보내기

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
