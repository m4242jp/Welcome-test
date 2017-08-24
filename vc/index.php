<?php
set_time_limit(45);
ini_set('memory_limit', '512M');
$url = 'data.csv';

$record = array();
function read($filepath){
  $milliseconds = round(microtime(true) * 1000);
  $file = new SplFileObject($filepath);
  $file->setFlags(
            SplFileObject::READ_CSV |
            SplFileObject::READ_AHEAD |
            SplFileObject::SKIP_EMPTY |
            SplFileObject::DROP_NEW_LINE);
  //$row = 1;
  foreach ($file as $line) {
    $record[] = $line;
  }
  $file = null;

        $buf='';
  foreach ($record as $line) {
        $buf .= "<p>" ;
        for ($c=0 , $end = count($line); $c < $end; $c++) {
            //$buf .=  mb_convert_encoding( $line[$c], 'UTF-8', 'SJIS') . (($end - 1 === $c) ? "" : ", ");
            $buf .=  $line[$c] . (($end - 1 === $c) ? "" : ", ");
        }
        $buf .=  "</p>" ;
      }

        echo (round(microtime(true) * 1000) - $milliseconds) . "<br>";
        echo count($record) . "<br>";
      //  echo mb_convert_encoding($buf, 'UTF-8', 'sjis');

}
?>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title></title>

    <style type="text/css">
#container {
  min-width: 310px;
  max-width: 800px;
  height: 400px;
  margin: 0 auto
}
    </style>
  </head>
  <body>
<?php
read($url);
?>
  </body>
</html>