<?php
//Каталог
$current_directory = isset($_GET['dir']) ? $_GET['dir'] : '';
//Текущее расположение файла file.php
$path_file_manager = realpath('./') . '/';
//Путь, по которому будем сканировать папки и файлы
$path = realpath($path_file_manager . $current_directory) . '/';

//Проверяем что находимся внутри нашего каталога
$pos = strpos($path, $path_file_manager);
if ($pos === false) {
    $path = $path_file_manager;
    $current_directory = '';
}

$directories = scandir($path);

if (isset($directories)) {
    //directories
    foreach ($directories as $directory) {
        if (($directory == '..') && ($path_file_manager != $path)) {
            //Составляем путь к предыдущему каталогу
            $current_directory_explode = explode('/', $current_directory);
            array_pop($current_directory_explode);
            $prev_directory = implode('/', $current_directory_explode);

            echo '<p><strong><a href="?dir=' . $prev_directory . '">[ .. ]</a></strong></p>';
        }
        if ($directory != '.' && $directory != '..') {
            if (is_dir($path . $directory)) {
                echo '<p><strong><a href="?dir=' . (!empty($current_directory)? $current_directory . '/' : '') . $directory  . '">[ ' . $directory . ' ]</a></strong></p>';
            }
        }
    }
    //files
    foreach ($directories as $file) {
        if ($file != '.' && $file != '..') {
            //Если файл и картинка, то отображаем
            if (!is_dir($path . $file) && getimagesize($path . $file)) {
                echo '<p>' . $file . '</p>';
            }
        }
    }
}
