<?php if (!defined('THINK_PATH')) exit();?>
<html>
<head>
    <title>会员首页</title>

</head>
<body>
<table align="center">
    <tr><td><a href="<?php echo U('Test/read');?>">普通会员中心</a></td><td><a href="<?php echo U('Test/write');?>">白银会员中心</a></td></tr>
    <tr><td><a href="<?php echo U('Test/change');?>">黄金会员中心</a></td><td><a href="<?php echo U('Test/delete');?>">钻石会员中心</a></td></tr>
    <tr><td><a href="<?php echo U('Public/login');?>">会员登陆</a></td><td><a href="<?php echo U('Public/Logout');?>">会员退出</a></td></tr>
</table>

</body>
</html>