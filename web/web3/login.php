<?php 
if(isset($_POST["username"]) && isset($_POST["password"]) ){
	$mysqli = new mysqli('127.0.0.1', 'nuaactf', 'dfasdfgasdfbdsfgsdkmladfkajnsvuasdlasd', 'nuaactf');
	$sql = "select * from web3 where username = '" . $_POST["username"] . "' and password='" . md5($_POST["password"]) . "' Limit 1";
	$result = $mysqli -> query($sql);
	$data = $result->fetch_all(MYSQLI_ASSOC);
	if($data[0]["isadmin"])
	{
		?>
		nuaactf{hApPy_haCk1n9_t0Day}
		<script type="text/javascript">
			location.href="/web4/dbbf7a119b1c35ab39bc0d05f38c7855.php"
		</script>>
		<?php
	} else {
            header('Location: ./login.php');
        }

} else {
?>
<form action="login.php" method=post>
	用户名：<input name="username">
	<br>
	密码：<input name="password" type="password">
	<br>
	<input type="submit">
</form>
<?php
}

?>
