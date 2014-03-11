<?php
	$filename = "/home/skattjak/public_html/appfoundry.se/superherbal/test.txt";
	$handle = fopen($filename, "r");
	$contents = fread($handle, filesize($filename));
	fclose($handle);
	//true means that array is returned
	$fileArray = json_decode($contents,true);
		
	foreach($_POST as $key => $value)
	{	
		$fileArray[$key] = $value;
		echo $value . "<br />";
	}
	$jsonFile = json_encode($fileArray);
	file_put_contents($filename, $jsonFile);
?>