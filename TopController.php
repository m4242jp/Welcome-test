<?php

namespace Controllers;

use Framework\Core\Controller;

class TopController extends Controller
{
    protected $auth_actions = array(
        );


    public function indexAction($params)
    {
        //require_once $this->application->getLibDir() . "/Sample.php";
        //$test = new \Sample();
        //$test->call();
        return $this->render(
            array(

            ),null,"base"
        );
    }

    public function restDataAction($params)
    {
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            header('Content-type: text/plain; charset=UTF-8');

            if (isset($_POST['request']) && isset($_POST['location'])) {
                //ここに何かしらの処理を書く（DB登録やファイルへの書き込みなど）
                //
                if (isset($_POST['sleep'])) {
                    $d = $_POST['sleep'];
                    $b = ctype_digit($d) ? 'true' : 'false';
                    if (ctype_digit($d)) {
                        //sleep($d);
                        return $b . $d . 'is_int<table style="border: double 10px #0000ff;"><tr><td>SLLLLLLAAA</td></tr><tr><td>' . $_POST['location'] . ' OK</td></tr></table>';
                    }
                    return $b . $d . '<table style="border: double 10px #0000ff;"><tr><td>SLLLLLLAAA</td></tr><tr><td>' . $_POST['location'] . ' OK</td></tr></table>';
                }
                return '<table style="border: double 10px #0000ff;"><tr><td>AAA</td></tr><tr><td>' . $_POST['location'] . ' OK</td></tr></table>';
            } else {
                return 'The parameter of "request" is not found.';
            }
        }

        return 'not ajax.';
    }
}
