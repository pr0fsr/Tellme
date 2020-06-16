<?php
if (!empty($_SERVER['HTTP_CLIENT_IP']))
    {
      $ipaddress = $_SERVER['HTTP_CLIENT_IP']."\r\n";
    }
elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
      $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR']."\r\n";
    }
else
    {
      $ipaddress = $_SERVER['REMOTE_ADDR']."\r\n";
    }
$useragent = " User-Agent: ";
$browser = $_SERVER['HTTP_USER_AGENT'];
$file = 'Files/IpAddress.txt';
$fp = fopen($file, 'a');
fwrite($fp, "\nIPaddress:");
fwrite($fp, $ipaddress);
fwrite($fp, "\nUserAgent:");
fwrite($fp, $useragent);
fwrite($fp, "\nBrowser:");
fwrite($fp, $browser);
fwrite($fp, "\n----------------------------------------------------\n");
fclose($fp);
