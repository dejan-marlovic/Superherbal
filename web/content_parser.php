<?php
	//$filename = "/home/skattjak/public_html/appfoundry.se/superherbal/content.json";
	$filename = "/var/www/superherbal/content.json";
	$handle = fopen($filename, "r");
	$contents = fread($handle, filesize($filename));
	fclose($handle);
	//true means that array is returned
	$fileArray = json_decode($contents,true);
		
	foreach($_POST as $key => $value)
	{	
		$fileArray[$key] = $value;
	}
	$jsonFile = json_encode($fileArray);
	file_put_contents($filename, $jsonFile);
?>