SELECT `bike_type`.`name`, count(`bike`.`id`)
FROM `bike_type`
         LEFT JOIN `bike` ON `bike_type`.`id` = `bike`.`type_id` AND `bike`.`discontinued` = 0
GROUP BY `bike_type`.`id`;