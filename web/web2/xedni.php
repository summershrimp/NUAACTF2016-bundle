
<?php 
	if(isset($_GET["password"]) && md5($_GET["password"]) == "0e731198061491163073197128363787")
		echo file_get_contents("flag.txt");
	else 
		echo file_get_contents("xedni.php");
?>