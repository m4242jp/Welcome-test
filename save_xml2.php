<?php

?>
<?php



    session_start();
    if(!isset($_SESSION['hash']) || !isset($_POST['hash']) ){
        echo '不正アクセス';
        return;
    }else if ($_SESSION['hash'] != $_POST['hash']) {
        echo '連続禁止';
        return;
    }
    $uniq = uniqid();
    $_SESSION['hash'] = $uniq;
    $xml_path = $_POST['xml_path'];
    var_dump( $xml_path);
    unset($_POST['xml_path']);

    $xml =  simplexml_load_file($xml_path);
    $data = get_object_vars($xml->quest);
    $save_array = array();
    if(!$data === false){
        foreach($data['item'] as $val){
            $name = $val->attributes()->name;
            array_push($save_array,mb_convert_encoding((string)$name, 'SJIS-win', 'UTF-8'));
        }
    }
    var_dump($save_array);

    $csv_array = array();
    foreach ($save_array as $value) {
        $data = isset($_POST[$value]) ? $_POST[$value] : "";
       array_push($csv_array,mb_convert_encoding($data, 'SJIS-win', 'UTF-8'));
    }
    var_dump($csv_array);


    class crlf_filter extends php_user_filter
    {
        function filter($in, $out, &$consumed, $closing)
        {
            while ($bucket = stream_bucket_make_writeable($in)) {
                // make sure the line endings aren't already CRLF
                $bucket->data = preg_replace("/(?<!\r)\n/", "\r\n", $bucket->data);
                $consumed += $bucket->datalen;
                stream_bucket_append($out, $bucket);
            }
            return PSFS_PASS_ON;
        }
    }
    function arr2csv($file,$fields) {

        try {
            stream_filter_register('crlf', 'crlf_filter');
            $myfile = @fopen($file, "a");
            if(!$myfile){
                return false;
            }

            stream_filter_append($myfile, 'crlf');
            fputcsv($myfile, $fields);
            fclose($myfile);
            return true;
        } catch (Exception $e) {}
        return false;
    }


    $file = 'anser.csv';
    if(!file_exists($file)) {
       $bo =  arr2csv($file, $save_array);
    }
    $bo = arr2csv($file, $csv_array);
if($bo){
    echo '<a href="anser.csv">ありがとん</a>';
}else{
    echo 'NG';
}
?>
