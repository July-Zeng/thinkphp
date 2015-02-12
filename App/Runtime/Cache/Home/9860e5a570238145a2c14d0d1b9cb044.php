<?php if (!defined('THINK_PATH')) exit();?>
<html>
<head>
    <title>会员首页</title>

</head>
<body>
<form action="<?php echo U('Public/checkLogin');?>" method="post" align="center">
   <input type="text" name="username"><br/>
    <input type="password" name="password"><br/>
    <input type="submit" name='submit'>
</form>
</body>
</html>