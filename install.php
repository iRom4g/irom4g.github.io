<?
if (isset($_POST['task']))
{
				$task = $_POST['task'];
}
elseif (isset($_GET['task']))
{
				$task = $_GET['task'];
}
else
{
				$task = "step0";
}
if (isset($_POST['license']))
{
				$license = "Vkontakte.ru (by SpaRòS)";
}
else
{
				$license = "Vkontakte.ru (by SpaRòS)";
}
$result = "";
$success = 0;
$mysql_host = "localhost";
$mysql_db = "";
$mysql_user = "";
$mysql_pass = "";

// SET ERROR REPORTING
error_reporting(E_ALL ^ E_NOTICE);
if ($task != "step0")
{
				$status = "success";
				if ($status == "failure")
				{
								$task = "step0";
								$status = "failure";
				}
}




echo "
<html>
<head>
<title>Install SocialEngine</title>
<style type='text/css'>
body, td, div {
	font-family: \"Trebuchet MS\", tahoma, verdana, arial, serif;
	font-size: 10pt;
	color: #333333;
	line-height: 16pt;
}
h2 {
	font-size: 16pt;
	margin-bottom: 4px;
}
.box {
	padding: 10px 13px 10px 13px; 
	border: 1px dashed #BBBBBB;
}
ul {
	margin-top: 2px;
	margin-bottom: 2px;
}
input.text {
	font-family: \"Trebuchet MS\", tahoma, verdana, arial, serif;
}
input.button {
	background: #EEEEEE;
	font-weight: bold;
	padding: 2px;
	font-family: \"Trebuchet MS\", tahoma, verdana, arial, serif;
}
form {
	margin: 0px;
}
a:link { color: #2078C8; text-decoration: none; }
a:visited { color: #2078C8; text-decoration: none; }
a:hover { color: #3FA4FF; text-decoration: underline; }
</style>
</head>
<body>
";










// STEP 0
if($task == "step0") {
  echo "
  <h2>Install SocialEngine</h2>
  Welcome to the SocialEngine installation program. Installing SocialEngine is easy! To get started, click the button below. If you have questions about the installation process or SocialEngine in general, get in touch with us at <a href='http://www.socialengine.net'>socialengine.net</a>.
  <br><br>
  <div class='box'>
  <b>If you are installing SocialEngine yourself:</b>
  <br>
  Before continuing, please be sure you have reviewed the installation instructions
  provided in install.html. If you are unfamiliar with how to upload files via FTP, setup MySQL databases, or set permissions on files, we suggest that you purchase our professional installation service instead. Most problems that arise post-installation happen because of an improper installation.
  </div>
  <br>
  <div class='box'>
  <b>To install SocialEngine you will need:</b>
  <br>
  <ul>
  <li>One MySQL database</li>
  <li>PHP 4.3 or newer</li>
  <li>PHP Safe Mode OFF</li>
  <li>GD Libaries 2.0 or newer</li>
  </ul>
  <b>For optional \"search engine friendly URLs\" you will need:</b>
  <br>
  <ul>
  <li>Apache webserver with mod_rewrite (ability to use .htaccess files)</li>
  </ul>
  </div>
  ";

  if($status == "failure") {
    echo "<br><table cellpadding='0' cellspacing='0'><tr><td style='padding: 5px; background: #FFEFEF; color: #AB0000;'>You provided an invalid license key.</td></tr></table>";
  }

  echo "
  <br>
  <form action='install.php' method='post'>
  <table cellpadding='0' cellspacing='0'>
  <tr>
  <td style='padding: 20px; border: 1px solid #CCCCCC; background: #F1F1F1;'>
    <b>Enter License Key:</b><br>
    <input id=\"lk\" type=\"text\" class=\"input_text\" name=\"license\" value=\"[iAG] NULLED 2008\" disabled=\"disabled\" readonly=\"readonly\" />
  </td>
  </tr>
  </table>

  <br>
  <input type='submit' class='button' value='Continue...'>
  <input type='hidden' name='task' value='step1'>
  </form>
  ";
}














if($task == "connect") {
  $mysql_host = $_POST['mysql_host'];
  $mysql_db = $_POST['mysql_db'];
  $mysql_user = $_POST['mysql_user'];
  $mysql_pass = $_POST['mysql_pass'];

  $mysql_connect = @mysql_connect("$mysql_host", "$mysql_user", "$mysql_pass");
  $mysql_select = @mysql_select_db("$mysql_db");
  $error = mysql_error();

  if(!$mysql_connect) {
    $success = 0;
    $result = "<br><font color='#FF0000'><b>Failed to Connect to MySQL Server</b></font><br>Please check your login information and try again.<br><font style='font-size: 8pt;'>$error</font>";
  } elseif(!$mysql_select) {
    $success = 0;
    $result = "<br><font color='#FF0000'><b>Failed to Select MySQL Database</b></font><br>Please check your login information and try again.<br><font style='font-size: 8pt;'>$error</font>";
  } else {
    $success = 1;
    $result = "<font color='#0AC92B'><b>Connection Successful</b></font><br>Click the button below to continue.<br><br><form action='install.php' method='post'><input type='submit' class='button' value='Continue...'><input type='hidden' name='task' value='step2'><input type='hidden' name='license' value='$license'></form>";
  }

  if($success == 1) {
    $filename = "./include/database_config.php";
    $somecontent = "<?\n\$database_host = \"$mysql_host\";\n\$database_username = \"$mysql_user\";\n\$database_password = \"$mysql_pass\";\n\$database_name = \"$mysql_db\";\n?>";
    if($handle = fopen($filename, 'w+')) {
      fwrite($handle, $somecontent);
      fclose($handle);
    } else {
      $success = 0;
      $result = "<br><font color='#FF0000'><b>Failed to Create database_config.php</b></font><br>Please be sure the \"include\" directory is set to CHMOD 777 and that you have uploaded install.php and installsql.php to your SocialEngine root directory (NOT in the \"install/\" directory).";
    }
  }


  @mysql_close($mysql_connect);

  $task = "step1";
}






// STEP 1
if($task == "step1") {
  echo "
  <h2>Step 1: Connect to MySQL Database</h2>
  Please provide your MySQL database login information in the fields below. If you do not yet have an available MySQL database, you can most likely create one by accessing your website's control panel (i.e. cPanel or Plesk) or by simply contacting your hosting provider.
  <br><br>
  <form action='install.php' method='post'>
  <table cellpadding='0' cellspacing='0' width='100%'>
  <tr>
  <td class='box' width='150' nowrap='nowrap'>
  <div style='margin-bottom: 10px;'>
  <b>MySQL Hostname</b><br>
  <input type='text' class='text' name='mysql_host' size='30' value='$mysql_host'>
  </div>
  <div style='margin-bottom: 10px;'>
  <b>MySQL Database Name</b><br>
  <input type='text' class='text' name='mysql_db' size='30' value='$mysql_db'>
  </div>
  <div style='margin-bottom: 10px;'>
  <b>MySQL Username</b><br>
  <input type='text' class='text' name='mysql_user' size='30' value='$mysql_user'>
  </div>
  <div>
  <b>MySQL Password</b><br>
  <input type='password' class='text' name='mysql_pass' size='30' value='$mysql_pass'>
  </div>
  </td>
  <td align='center' valign='top' style='padding: 10px 30px 10px 30px;'>
  Please enter your MySQL information in the fields to the left, then click the button below to connect.
  <br><br>
  ";

  if($success == 0) {
    echo "
    <input type='submit' class='button' value='Connect to MySQL Server'>
    <input type='hidden' name='task' value='connect'>
    <input type='hidden' name='license' value='$license'>
    </form>
    ";
  }

  echo "
  $result
  </td>
  </tr>
  </table>
  ";
}







if($task == "step2") {
  echo "
  <h2>Step 2: Finalize Installation</h2>
  Now that your database is ready, we need to fill it with the appropriate tables and default data. Click the button below to complete your SocialEngine installation.
  <br><br>
  <form action='install.php' method='post'>
  <input type='submit' class='button' value='Continue...'>
  <input type='hidden' name='task' value='finalize'>
  <input type='hidden' name='license' value='$license'>
  </form>
  ";
}





if($task == "finalize") {

  function randomkeys($length) {
    $pattern = "abcdefghijklmnopqrstuvwxyz";
    $key  = $pattern{rand(0,36)};
    for($i=1;$i<$length;$i++)
    {
        $key .= $pattern{rand(0,36)};
    }
    return $key;
  }
 
  $randompass = randomkeys(10);
  $admin_password = crypt($randompass, "$1$"."admin123"."$");
  include "./include/database_config.php"; 
  include "./include/class_database.php";
  $database = new se_database($database_host, $database_username, $database_password, $database_name);
  require("installsql.php");
  $task = "step3";
}




if($task == "step3") {
  echo "
  <h2>Installation Complete</h2>
  You have successfully completed the SocialEngine installation process. You can now login to your control panel with the information shown below. After logging in, you can begin changing the system settings to suit your needs.
  <br><br>

  <ol>
  <li><b>Important: You must now delete \"install.php\" and \"installsql.php\" from your server. Failing to delete these files is a serious security risk!</b></li>
  <li>After logging in to your control panel you should visit the \"View Admins\" page and update your admin profile with your name and email address.
  <li>Next, you will most likely want to get started by creating profile fields. Profile fields allow you to decide what will appear on your users' profiles. For example, if you want to create a social network about fitness, you would create fields like \"height\", \"weight\", \"favorite exercise\", etc., while if you wanted to create a social network about business, you might create fields like \"employer\", \"position\", \"education\", and so forth.</li>
  <li>You will also probably want to adjust the signup settings. These settings determine what happens when users create accounts on your social network.</li>
  <li>Finally, you might be ready to add your own style or apply your website's header/footer wrapper to your social network. To accomplish this, visit the HTML Templates page in your control panel. You can also edit your template files by opening them directly from the \"/templates\" directory on your server. Your \"/templates\" directory should already be inaccessible to web users (an included .htaccess file takes care of this) if you're on a Apache server. If you're running Windows IIS or another server platform, you might want to move the \"/templates\" directory to another place on your server so that it's not accessible to web users. If you decide to do this, you will need to update \"/include/smarty/smarty_config.php\" with the new path to your templates directory.</li>
  </ol>

  <table cellpadding='0' cellspacing='0' align='center'>
  <tr>
  <td class='box'>
    <table cellpadding='0' cellspacing='0'>
    <tr>
    <td align='right'><b>Username: &nbsp;</td>
    <td>admin</td>
    </tr>
    <tr>
    <td align='right'><b>Password: &nbsp;</td>
    <td>$randompass</td>
    </tr>
    </table>
  </td>
  </tr>
  </table>

  <br>

  <div style='text-align: center; font-weight: bold;'>
  [ <a href='./admin/admin_login.php' target='_blank'>Login to Control Panel</a> ]
  </div>
  ";
}





echo "
</body>
</html>
";


?>