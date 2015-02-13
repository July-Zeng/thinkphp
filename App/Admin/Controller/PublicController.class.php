<?php
namespace Admin\Controller;
use Think\Controller;
use Org\Util\Rbac;
class PublicController extends Controller{
    public function checkLogin() {
        if(empty($_POST['username'])) {
            $this->error('帐号错误！');
        }elseif (empty($_POST['password'])){
            $this->error('密码必须！');
        }/*elseif (empty($_POST['verify'])){
            $this->error('验证码必须！');
        }*/
        //生成认证条件
        $map            =   array();
        // 支持使用绑定帐号登录
        $map['password']	= md5($_POST['password']);
        $map['username']    =$_POST['username'];
//        $map["status"]	=	array('gt',0);
        /*if(session('verify') != md5($_POST['verify'])) {
            $this->error('验证码错误！');
        }*/
        $authInfo = Rbac::authenticate($map);
        //使用用户名、密码和状态的方式进行认证
        if(false === $authInfo) {
            $this->error('帐号不存在或已禁用！');
        }else {
            if($authInfo['password'] != md5($_POST['password'])) {
                $this->error('密码错误！');
            }
            $_SESSION[C('USER_AUTH_KEY')]	=	$authInfo['user_id'];
//            $_SESSION['email']	=	$authInfo['email'];
//            $_SESSION['loginUserName']		=	$authInfo['nickname'];
//            $_SESSION['lastLoginTime']		=	$authInfo['createed_time'];
//            $_SESSION['login_count']	=	$authInfo['login_count'];
            if($authInfo['username']=='admin') {
                $_SESSION['administrator']		=	true;
            }
            //保存登录信息
            /*  $User	=	M('user_info');
              $ip		=	get_client_ip();
              $time	=	time();
              $data = array();
              $data['user_id']	=	$authInfo['user_id'];
              $data['last_login_time']	=	$time;
              $data['login_count']	=	array('exp','login_count+1');
              $data['last_login_ip']	=	$ip;
              $User->save($data);*/

            // 缓存访问权限
            Rbac::saveAccessList();
            $this->success('登录成功！',U('Index/index'));

        }
    }
    public function logout() {
        if(isset($_SESSION[C('USER_AUTH_KEY')])) {
            unset($_SESSION[C('USER_AUTH_KEY')]);
            unset($_SESSION);
            session_destroy();
            $this->success('登出成功！',U('Public/login'));
        }else {
            $this->error('已经登出！',U('Public/login'));
        }
    }
    public function login() {
        if(!isset($_SESSION[C('USER_AUTH_KEY')])) {
            $this->display();
        }else{
            $this->redirect('Index/index');
        }
    }
}

?>