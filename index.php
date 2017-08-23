<?php $this->setLayoutVar('title', "TEST");?>
<div>
<?php

       var_dump($lib_url);
       require_once $lib_url . "/Sample.php";
        $test = new \Sample();
        $test->call();
        ?>
</div>
<div id="result"></div>
<div id="result1" name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div id="result3" name="loader" data-loads="aaa3" >Loading</div>
<div id="result2" name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div name="loader" data-loads="aaa3" >Loading</div>
<div name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div id="result1" name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div id="result3" name="loader" data-loads="aaa3" >Loading</div>
<div id="result2" name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div name="loader" data-loads="aaa3" >Loading</div>
<div name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div id="result1" name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div id="result3" name="loader" data-loads="aaa3" >Loading</div>
<div id="result2" name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div name="loader" data-loads="aaa3" >Loading</div>
<div name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div id="result1" name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div id="result3" name="loader" data-loads="aaa3" >Loading</div>
<div id="result2" name="loader" data-loads="aaa2" data-sleep="6">Loading</div>
<div name="loader" data-loads="aaa3" data-sleep="2">Loading</div>
<div name="loader" data-loads="aaa3" >Loading</div>

<script type="text/javascript">

function loadData(elm, data){
    if(data != null && typeof data === 'string'){
          $.ajax({
           type: "POST",
           url: "ttt",
           data: "request=John&location=" + data + "&sleep=" + elm.dataset.sleep,
           timeout: 10000
         }).done(function(msg){
            console.log(elm);
            elm.innerHTML=msg;
            console.log("Data Saved: " + msg);
          })
          .fail(function(msg) {
            if(msg.statusText === "timeout"){
                elm.innerHTML="タイムアウト";
            }else{
                elm.innerHTML="error";
            }
            console.log(msg);
          })/*
          .always(function() {
            console.log("complete");
          })*/;
    }
};
$(document).ready(function(){

    var loaders = document.getElementsByName("loader");
    Array.prototype.forEach.call(loaders, function(elm) {
        if(elm instanceof HTMLElement){
            loadData(elm,elm.dataset.loads);
        }
     });
});

</script>