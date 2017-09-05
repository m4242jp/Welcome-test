<?php

$dom = new DOMDocument('1.0', 'UTF-8');
$dom->load("ssss.xml");
$dom->preserveWhiteSpace = false;
$dom->formatOutput = true;
$root = $dom->documentElement;


$d = $root->getElementsByTagName("item");
foreach ($d as $sampleNode) {
    $s = $sampleNode->getElementsByTagName("key");
    if ($s != null && $s->item(0)->nodeValue === "1") {

        $fileName = "AAAAAAAAAAAA.xml";
        $doc = new DOMDocument('1.0', 'UTF-8');
        $doc->preserveWhiteSpace = false;
        $doc->formatOutput = true;
        $root = $doc->createElement('root');
        $root->appendChild($doc->importNode($sampleNode,true));
        $doc->appendChild($root);
       // $doc->save("saf.xml");

        header("Content-disposition: attachment; filename=" . $fileName);
        header("Content-type: application/octet-stream; name=" . $fileName);

        // DomXMLをXML形式で出力
        echo $doc->saveXML();
        exit;
        break;
    }
}
