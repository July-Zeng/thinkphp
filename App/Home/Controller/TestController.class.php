<?php
namespace Home\Controller;
use Home\Controller\CommonController;
class TestController extends CommonController{
    public function read(){
        echo '欢迎来到普通会员中心';
    }
    public function write(){
        echo "欢迎来到白银会员中心";
    }
    public function change(){
        echo "欢迎来到黄金会员中心";
    }
    public function delete(){
        echo "欢迎来到钻石会员中心";
    }
}


?>