-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2026 a las 06:34:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tatis_shop_online`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add categoria', 7, 'add_categoria'),
(26, 'Can change categoria', 7, 'change_categoria'),
(27, 'Can delete categoria', 7, 'delete_categoria'),
(28, 'Can view categoria', 7, 'view_categoria'),
(29, 'Can add proveedor', 8, 'add_proveedor'),
(30, 'Can change proveedor', 8, 'change_proveedor'),
(31, 'Can delete proveedor', 8, 'delete_proveedor'),
(32, 'Can view proveedor', 8, 'view_proveedor'),
(33, 'Can add producto', 9, 'add_producto'),
(34, 'Can change producto', 9, 'change_producto'),
(35, 'Can delete producto', 9, 'delete_producto'),
(36, 'Can view producto', 9, 'view_producto'),
(37, 'Can add pedido', 10, 'add_pedido'),
(38, 'Can change pedido', 10, 'change_pedido'),
(39, 'Can delete pedido', 10, 'delete_pedido'),
(40, 'Can view pedido', 10, 'view_pedido'),
(41, 'Can add lote', 11, 'add_lote'),
(42, 'Can change lote', 11, 'change_lote'),
(43, 'Can delete lote', 11, 'delete_lote'),
(44, 'Can view lote', 11, 'view_lote'),
(45, 'Can add detalle pedido', 12, 'add_detallepedido'),
(46, 'Can change detalle pedido', 12, 'change_detallepedido'),
(47, 'Can delete detalle pedido', 12, 'delete_detallepedido'),
(48, 'Can view detalle pedido', 12, 'view_detallepedido'),
(49, 'Can add favorito', 13, 'add_favorito'),
(50, 'Can change favorito', 13, 'change_favorito'),
(51, 'Can delete favorito', 13, 'delete_favorito'),
(52, 'Can view favorito', 13, 'view_favorito'),
(53, 'Can add reseña', 14, 'add_reseña'),
(54, 'Can change reseña', 14, 'change_reseña'),
(55, 'Can delete reseña', 14, 'delete_reseña'),
(56, 'Can view reseña', 14, 'view_reseña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$PV3mUSBUhUyrp9r40Qc7SO$pcz780SJFlWapitI7CH6RmCbP3zoNoPcXHU2QoKH+Uo=', '2026-04-09 04:20:24.743436', 1, 'erandi', '', '', '', 1, 1, '2026-03-22 23:45:28.130365'),
(2, 'pbkdf2_sha256$600000$re6p1wdFV7qcfu8uo6b8cj$RGA+0JqTxG5W0tU5QQXvvx5tE5M3JaGR7v7vNdMmfXo=', '2026-04-09 03:32:32.821203', 0, 'abril_castro', '', '', 'olveracastroa3@gmail.com', 0, 1, '2026-03-23 01:47:10.125974'),
(3, 'pbkdf2_sha256$600000$xEr7u2N4j3DbI0XvJ7S47z$J6A1s04u7lqtop5nbC0RBxSAGrozJaL/O7GLfxDBNAM=', '2026-04-09 04:22:11.279511', 0, 'sonia', '', '', 'sonia@gmail.com', 0, 1, '2026-03-26 19:00:23.714276');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`, `imagen`) VALUES
(1, 'Blazers', NULL),
(2, 'pantalones', NULL),
(3, 'Accesorios', NULL),
(4, 'Calzado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_detallepedido`
--

CREATE TABLE `core_detallepedido` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_detallepedido`
--

INSERT INTO `core_detallepedido` (`id`, `cantidad`, `precio_unitario`, `pedido_id`, `producto_id`) VALUES
(1, 1, 1500.00, 1, 1),
(2, 1, 300.00, 1, 3),
(3, 1, 1500.00, 2, 1),
(4, 1, 400.00, 3, 2),
(5, 1, 1500.00, 3, 1),
(6, 1, 300.00, 4, 3),
(7, 1, 300.00, 5, 3),
(8, 2, 400.00, 6, 2),
(9, 3, 500.00, 7, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_pedido`
--

CREATE TABLE `core_pedido` (
  `id` bigint(20) NOT NULL,
  `fecha_creacion` datetime(6) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(255) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_pedido`
--

INSERT INTO `core_pedido` (`id`, `fecha_creacion`, `total`, `metodo_pago`, `estado`, `usuario_id`) VALUES
(1, '2026-03-23 02:11:53.567066', 1800.00, 'Envío a: Avda. de Andalucía, 4. CP: 29451', 'Pendiente', 2),
(2, '2026-03-23 17:02:51.754653', 1500.00, 'Envío a: Priv. los Arcos. CP: 50904', 'Pendiente', 1),
(3, '2026-03-23 19:02:41.677830', 1900.00, 'Envío a: privada los arcos. CP: 50945', 'Pendiente', 1),
(4, '2026-04-09 01:30:32.265961', 300.00, 'Envío a: Avda. de Andalucía, 4', 'Completado', 1),
(5, '2026-04-09 01:32:33.088156', 300.00, 'Envío a: Avda. de Andalucía, 4', 'Completado', 2),
(6, '2026-04-09 03:42:00.921357', 800.00, 'Envío a: Av. Independencia #245, Toluca, Estado de México. CP: 50000. Tel: 722 987 6543', 'Completado', 3),
(7, '2026-04-09 03:55:23.909315', 1500.00, 'Envío a: Av. Independencia #245, Toluca, Estado de México. CP: 50000. Tel: 635 533 263', 'Completado', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_reseña`
--

CREATE TABLE `core_reseña` (
  `id` bigint(20) NOT NULL,
  `comentario` longtext NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `core_reseña`
--

INSERT INTO `core_reseña` (`id`, `comentario`, `calificacion`, `fecha`, `producto_id`, `usuario_id`) VALUES
(1, 'buen producto', 5, '2026-03-23 03:52:26.493843', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2026-03-23 01:26:15.479346', '1', 'Blazers', 1, '[{\"added\": {}}]', 7, 1),
(2, '2026-03-23 01:30:17.013555', '1', 'Americana dos botones lana extrafina', 1, '[{\"added\": {}}]', 9, 1),
(3, '2026-03-23 01:35:51.114391', '2', 'pantalones', 1, '[{\"added\": {}}]', 7, 1),
(4, '2026-03-23 01:36:57.149934', '2', 'BTFBM - Pantalones de vestir elegantes para mujer', 1, '[{\"added\": {}}]', 9, 1),
(5, '2026-03-23 01:38:48.308920', '3', 'Accesorios', 1, '[{\"added\": {}}]', 7, 1),
(6, '2026-03-23 01:39:40.214109', '3', 'Pulsera de trébol de cuatro hojas para mujer, joyería ajustable chapada en oro con encanto delicado', 1, '[{\"added\": {}}]', 9, 1),
(7, '2026-04-09 01:28:01.603661', '3', 'Pulsera de trébol de cuatro hojas para mujer, joyería ajustable chapada en oro con encanto delicado', 2, '[{\"changed\": {\"fields\": [\"Stock Actual\"]}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'categoria'),
(12, 'core', 'detallepedido'),
(13, 'core', 'favorito'),
(11, 'core', 'lote'),
(10, 'core', 'pedido'),
(9, 'core', 'producto'),
(8, 'core', 'proveedor'),
(14, 'core', 'reseña'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-03-22 23:44:56.894816'),
(2, 'auth', '0001_initial', '2026-03-22 23:44:57.196939'),
(3, 'admin', '0001_initial', '2026-03-22 23:44:57.274887'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-03-22 23:44:57.286982'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-22 23:44:57.298750'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-03-22 23:44:57.350875'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-03-22 23:44:57.397346'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-03-22 23:44:57.419562'),
(9, 'auth', '0004_alter_user_username_opts', '2026-03-22 23:44:57.433204'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-03-22 23:44:57.471241'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-03-22 23:44:57.476621'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-03-22 23:44:57.487082'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-03-22 23:44:57.512867'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-03-22 23:44:57.537826'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-03-22 23:44:57.557188'),
(16, 'auth', '0011_update_proxy_permissions', '2026-03-22 23:44:57.572017'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-03-22 23:44:57.585250'),
(19, 'sessions', '0001_initial', '2026-03-22 23:44:57.838877'),
(20, 'core', '0001_initial', '2026-03-23 00:29:24.536899'),
(21, 'core', '0002_alter_detallepedido_table_alter_pedido_table_and_more', '2026-03-23 02:59:42.965303'),
(22, 'core', '0003_reseña', '2026-03-23 03:46:58.428205'),
(23, 'core', '0004_alter_categoria_options_alter_favorito_options_and_more', '2026-04-08 23:06:00.352993'),
(24, 'core', '0005_alter_favorito_options_alter_reseña_options_and_more', '2026-04-09 01:23:04.359871'),
(25, 'core', '0006_alter_favorito_options_alter_reseña_options_and_more', '2026-04-09 01:26:36.000255'),
(26, 'core', '0007_categoria_imagen', '2026-04-09 04:02:56.266985');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3lqah47vsl8zbyweug8s5ynhahzzl5s3', '.eJxVjk1ugzAQha8SeY0MNjGF7No9Z0Az9hDcgo1so1aNuHtNmkjtaqT38725sQG2NA1bpDBYwy5MsOKvhqA_yB2GeQd39Vx7l4JFfkT4w42894bmt0f2H2CCOOU2nJV8QaUqHBV0okVsZVN1dT0aI8V4loS1rqjppJBU646aUTWmJo1tI5WWGaohBJs8u9yYGPrjrMGbTSd__1wUzPkFA-W114WC1eDgZHw8oU_eUTzNh0BfKcBoHWTiGkjbDBSqqnhVsATzDLne39dcsgZ-wXaBK7nslAsZC-VzOJY4wzcFxz8J19yKGyafMU_mvu8_2zV0kg:1w5qX4:ckO-eaFgci787pgl1uxa9SQvpxG6SXZzpFMtXUKhEn0', '2026-03-26 20:08:18.825478'),
('5klbrg647pr84ps6wo32s8uevovbqpvi', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9Bht:eyT9Na26JaU1Uw_FWLoqX9WXfDXofRglnh5WXfuW-l8', '2026-04-05 01:21:17.031319'),
('7t7ndaxyuyrq4g9izz2aqk1qk8jrtrwu', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9lr0:m8gH-rvSG1lfIpOFPzUbXoZrTBbICDUhD3hfj5VAd0M', '2026-04-06 15:57:06.043482'),
('ahaxdfrlxekz7cyupj43m0k887oy76n8', '.eJw1jUsKwzAMRK8StA75LLrJrgfIGYJsq0VgW8FWaEnI3atQshqY4b05wGMprALTAeMyX7EWCZtXWTjANLaQJblCMMEzUWGPGZsgtXGikqk28SroqwVfnBFa48mzCcfHMHRDC4oxouGzbUYrB_yLOeGbsi19osDY38e1dxF3Krn7kFuNqptTMc3tPM_zB3gAPZI:1w9lzO:n49Tci9T1QuaVkTCOcUq4PfC8hChVsAnGehvYB3jQUY', '2026-04-06 16:05:46.337023'),
('iassmv0nbcwblvgq7r4cgr2zkbz2b9qz', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9lqz:9KFUcq-C_RUk2Z6nTnz8vNKjhfn5POlaL1IxrxNfkg0', '2026-04-06 15:57:05.959964'),
('lcehsuazrd1jc2bstv6to09te1o7kmi6', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9BPv:aQUO-bvZ_FCdZtMhwyGcwBtrBHM_YcQgerjepSNp0LU', '2026-04-05 01:02:43.733569'),
('mtseh44calrkl16l1ktzr0w4pqomsa5v', '.eJxVjMsOwiAQRf-FtSE8p-DSvd9AYBikaiAp7cr479qkC93ec859sRC3tYZt0BLmzM5MsdPvliI-qO0g32O7dY69rcuc-K7wgw5-7Zmel8P9O6hx1G-Nhshj8VEaVVzECRJYcga0JiGK12jBeZtAJZFJgbNGFgBp_ZSydsjeH-rZN5E:1w9lr0:F8mDfvT7GWP7Vd9YtLeRefNjnqP1rUPEniXcyc_IXww', '2026-04-06 15:57:06.027933'),
('r3faz6ui0dcqkjgxnxutqex3k06cgr34', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9DGk:mgeX-hMwxoxS-LJd2nrE6PS7zmiVpjc-qrlW-Mx4Vts', '2026-04-05 03:01:22.737857'),
('tocwv7fuohvjave7uo368xz7jnjgyq1j', '.eJxVjMsOwiAQRf-FtSFQHoMu3fsNZIYBqRqalHZl_HfbpAvd3nPOfYuI61Lj2vMcRxYXYcTpdyNMz9x2wA9s90mmqS3zSHJX5EG7vE2cX9fD_Tuo2OtWZwCvLKcAyvpiFOkMJoFNZ0UEBjW6YNC4zEUVDiU40sMWKU7eDgTi8wXafzfT:1wAh3Y:isr5r2IIaF05ZqAzC66589GjlAn9Z8SE5t4pGYU4OlE', '2026-04-09 05:01:52.683905'),
('wv4a14yfwoldmtjjs6jfjnorn59lp847', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1w9lqz:9KFUcq-C_RUk2Z6nTnz8vNKjhfn5POlaL1IxrxNfkg0', '2026-04-06 15:57:05.977326'),
('x2mamz5b25eu0yux86snra4r18q0f1g8', '.eJxVjEEOwiAQRe_C2hAYCoJL9z1DMwODVA0kpV0Z765NutDtf-_9l5hwW8u0dV6mOYmL0OL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiXY0v8vB7u30HBXr41DhbOZK2ibDFoT-TBqWBMTgl0HoDJRMUugAY2MbDL1iXDkbwDG0G8P9mqN80:1wAd88:_xUI5m_WIdcHWyzkifX370EtikyEH4Mg503PdM_BZhs', '2026-04-09 00:50:20.128795'),
('y0tw5txt5xhpxwdcl6w6v52my2kivydf', '.eJxVjMsOwiAQRf-FtSE8p-DSvd9AYBikaiAp7cr479qkC93ec859sRC3tYZt0BLmzM5MsdPvliI-qO0g32O7dY69rcuc-K7wgw5-7Zmel8P9O6hx1G-Nhshj8VEaVVzECRJYcga0JiGK12jBeZtAJZFJgbNGFgBp_ZSydsjeH-rZN5E:1w4int:SRNPTtsUlKFFV0MPAseZ4Ka-MuQXrVWImbDQwuzy5q4', '2026-03-23 17:41:01.069151');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorito`
--

CREATE TABLE `favorito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `fecha_agregado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favorito`
--

INSERT INTO `favorito` (`id`, `usuario_id`, `producto_id`, `fecha_agregado`) VALUES
(1, 2, 1, '2026-03-23 03:14:59'),
(11, 3, 4, '2026-04-09 04:16:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `id_lote` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'SOLICITADO',
  `fecha_solicitud` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`id_lote`, `cantidad`, `id_producto`, `id_proveedor`, `estado`, `fecha_solicitud`) VALUES
(1, 30, 1, 2, 'ENTREGADO', '2026-04-08 23:50:18'),
(2, 20, 2, 2, 'ENTREGADO', '2026-04-08 23:50:51'),
(3, 18, 3, 2, 'ENTREGADO', '2026-04-09 00:01:02'),
(4, 25, 1, 2, 'ENTREGADO', '2026-04-09 00:05:58'),
(5, 16, 2, 2, 'ENTREGADO', '2026-04-09 00:06:19'),
(6, 5, 2, 2, 'ENTREGADO', '2026-04-09 00:14:46'),
(7, 10, 3, 2, 'ENTREGADO', '2026-04-09 01:07:34'),
(8, 10, 2, 2, 'SOLICITADO', '2026-04-09 02:42:29'),
(9, 3, 4, 2, 'ENTREGADO', '2026-04-09 03:03:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `descripcion`, `precio`, `talla`, `color`, `imagen`, `fecha_creacion`, `id_categoria`, `stock`) VALUES
(1, 'Americana dos botones lana extrafina', 'Americana confeccionada en tejido principal 100% lana. Cuello con solapa de muesca. Manga larga con puño abotonado. Cierre mediante dos botones. Dos bolsillos con solapa. Forro interior. Esta prenda forma parte de un traje.', 1500.00, 'm', 'negro', 'productos/blazern.webp', '2026-03-23 01:30:16.957381', 1, 25),
(2, 'BTFBM - Pantalones de vestir elegantes para mujer', 'Plisados en la parte delantera, cintura alta, casual, pierna ancha, sueltos, con bolsillos \r\nCaracterísticas: S = EE.UU. 4-6, M = EE.UU. 8-10, L = EE.UU. 12-14, XL = EE.UU. 16-18 / Pantalones Palazzo para mujer, cintura alta, elástico lateral, trabillas para cinturón, cierre de cierre trasera, bolsillos laterales, pierna ancha, ajuste holgado\r\nMaterial: los pantalones largos Palazzo son agradables de llevar gracias a su calidad suave y fluida. El elástico en ambos lados tiene una buena elasticidad para adaptarse a diferentes tamaños de cintura\r\nDiseños: los pantalones casuales están diseñados con detalles plisados, muy exquisitos para mostrar un encanto femenino. El dobladillo ancho acampanado de la pierna puede ocultar tus defectos y revolotea suavemente con tu movimiento', 400.00, 'm', 'negro', 'productos/pantalones_.jpg', '2026-03-23 01:36:57.135874', 2, 3),
(3, 'Pulsera de trébol de cuatro hojas para mujer, joyería ajustable chapada en oro con encanto delicado', 'Acerca de este artículo\r\n\r\n    【Símbolo de suerte y felicidad】Inspirada en el legendario trébol de cuatro hojas, esta pulsera aporta buena suerte y positividad. Cada hoja representa amor, salud, reputación y riqueza, perfecta para ti o alguien especial.\r\n    【Ajuste ajustable para la mayoría de muñecas】Con una medida de 6.41\" con una cadena de extensión de 1.9\", esta pulsera se adapta fácilmente a diferentes tamaños de muñeca, asegurando un ajuste cómodo y seguro.\r\n    【Acero Inoxidable Premium Chapado en Oro de 18K】Elaborada con acero inoxidable de alta calidad y chapado en oro de 18K, esta pulsera es duradera, resistente a la decoloración e hipoalergénica—segura para el uso diario sin decoloración.\r\n    Regalo ideal para seres queridos: esta delicada pulsera de trébol de cuatro hojas es un regalo maravilloso para esposas, novias, madres e hijas en Acción de Gracias, día de la madre, Navidad, cumpleaños, día de San Valentín y otras ocasiones especiales.\r\n    【Satisfacción garantizada】Disfruta de una garantía de devolución de dinero de 90 días para compras sin preocupaciones. Nuestro equipo profesional de servicio al cliente está listo para ayudar con cualquier pregunta o inquietud.', 300.00, NULL, NULL, 'productos/pulcera.jpg', '2026-03-23 01:39:40.201423', 3, 26),
(4, 'Zapatos de Tacón Bajo con Punta Puntiaguda para Mujer', 'Sandalias de Tacón con Correa al Tobillo para Mujer Zapatos de Tacon Dama Tacón Alto 5cm ', 500.00, NULL, NULL, 'productos/calzado.jpg', '2026-04-09 03:02:55.395187', 4, 0),
(5, 'Hobemty - Chaquetas blazer de un botón para mujer,', 'de manga larga, para trabajo, oficina, 2025 ', 1200.00, NULL, NULL, 'productos/BLAZERS.jpg', '2026-04-09 04:21:52.967394', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_marca`, `contacto`, `telefono`, `email`, `direccion`) VALUES
(2, 'Distribuidora Alimentos del Valle', 'María Fernanda Gómez', '55 8123 4567', 'ventas@alimentosdelvalle.com', 'Av. Las Torres No. 450, Col. San Sebastián, Toluca, Estado de México.\r\nProveedor de frutas, verduras y abarrotes. Entregas diarias por la mañana.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `core_detallepedido`
--
ALTER TABLE `core_detallepedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_detallepedido_pedido_id_1e562fb4_fk_core_pedido_id` (`pedido_id`),
  ADD KEY `core_detallepedido_producto_id_45e0e2e2_fk_producto_id_producto` (`producto_id`);

--
-- Indices de la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pedido_usuario_id_2aebb526_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `core_reseña`
--
ALTER TABLE `core_reseña`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_reseña_producto_id_a73dee1d_fk_producto_id_producto` (`producto_id`),
  ADD KEY `core_reseña_usuario_id_00adaf91_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`,`producto_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `lote_id_producto_267029d4_fk_producto_id_producto` (`id_producto`),
  ADD KEY `fk_lote_proveedor_new` (`id_proveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `producto_id_categoria_710ea567_fk_categoria_id_categoria` (`id_categoria`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `core_detallepedido`
--
ALTER TABLE `core_detallepedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `core_reseña`
--
ALTER TABLE `core_reseña`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `favorito`
--
ALTER TABLE `favorito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `lote`
--
ALTER TABLE `lote`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_detallepedido`
--
ALTER TABLE `core_detallepedido`
  ADD CONSTRAINT `core_detallepedido_pedido_id_1e562fb4_fk_core_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `core_pedido` (`id`),
  ADD CONSTRAINT `core_detallepedido_producto_id_45e0e2e2_fk_producto_id_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `core_pedido`
--
ALTER TABLE `core_pedido`
  ADD CONSTRAINT `core_pedido_usuario_id_2aebb526_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `core_reseña`
--
ALTER TABLE `core_reseña`
  ADD CONSTRAINT `core_reseña_producto_id_a73dee1d_fk_producto_id_producto` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `core_reseña_usuario_id_00adaf91_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `favorito`
--
ALTER TABLE `favorito`
  ADD CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `fk_lote_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lote_proveedor_new` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `lote_id_producto_267029d4_fk_producto_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_id_categoria_710ea567_fk_categoria_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
