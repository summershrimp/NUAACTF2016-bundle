0nly welc0me pe0ple who c0me from http://cs.nuaa.edu.cn

<?php
	if(isset($_SERVER['HTTP_ORIGIN']) && stristr($_SERVER['HTTP_ORIGIN'], "http://cs.nuaa.edu.cn"))
	{
		if(isset($_SERVER['HTTP_X_FORWARDED_FOR']) && stristr($_SERVER['HTTP_X_FORWARDED_FOR'], "202.119.64.86"))
		{
			echo "nuaactf{C0ndrulation!_y0u_f1n1shed_a11_web_quest}";
		}
	}
?>
