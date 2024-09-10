
--
-- Структура таблицы `bike`
--

CREATE TABLE `bike` (
    `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `type_id` mediumint(7) UNSIGNED NOT NULL COMMENT 'Тип мотоцикла',
    `name` varchar(255) NOT NULL COMMENT 'Название',
    `discontinued` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Снять с производства'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `bike`
--

INSERT INTO `bike` (`id`, `type_id`, `name`, `discontinued`) VALUES
     (1, 1, 'Иж Планета', 1),
     (2, 2, 'BAJAJ Pulsar', 0),
     (3, 2, 'BAJAJ Boxer', 0),
     (4, 3, 'Harley-Davidson', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bike_type`
--

CREATE TABLE `bike_type` (
     `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
     `name` varchar(255) NOT NULL COMMENT 'Тип'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `bike_type`
--

INSERT INTO `bike_type` (`id`, `name`) VALUES
       (1, 'Type 1'),
       (2, 'Type 2'),
       (3, 'Type 3');
