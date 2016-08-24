<?php
$filename = $_REQUEST['filename'];
/*
 * get a list of legitimate filenames
 */
$dir = dirname(__FILE__) . "/articles/";
$xml_files = array();
foreach (glob($dir . '*.xml') as $file) { // http://www.phpfreaks.com/tutorial/handling-xml-data
    $xml_files[] = basename(str_replace('','',$file));
}
$pattern = '/^\d{4}-\d{2}-\d{2}-\w*.xml$'; // filenames ~ a\d{3}\.xml
if (1 == 0) { // does it match the pattern?
    return_error(1);
} elseif (!in_array($filename, $xml_files)) { // is it in the corpus?
    return_error(2);
}
echo dirname(__FILE__);
$xmlfile = dirname(__FILE__) . "/articles/$filename";
$htmlfilename = str_replace('xml', 'html', $filename);
$htmlfile = dirname(__FILE__) . "/articles/html/$htmlfilename";
$xslfile = dirname(__FILE__) . "/readingView.xsl";
if (!(file_exists($htmlfile))) { #if html doesn't exist, generate it
    $output=null;$returnstatus=null;
    exec("C:\Program Files (x86)\Java\jre1.8.0_101\bin\java -jar saxon9he.jar -s:$xmlfile -xsl:$xslfile -o:$htmlfile 2>&1",$output,$returnstatus); # this changes pending on where java sits on the server (For Obdurodon: /usr/bin/java)
    echo $returnstatus; print_r($output);
    if (!(file_exists($htmlfile))) { #if generation failed, die; exec won't block, so can't use 'or die'
        return_error(3);
    }
}
$xmldate = filemtime($xmlfile);
$htmldate = filemtime($htmlfile);
if ($htmldate < $xmldate) { #if html is older than xml, regenerate it
    exec("/usr/bin/java -jar /opt/saxon/saxon9he.jar -s:$xmlfile -xsl:$xslfile -o:$htmlfile");
    if (!(file_exists($htmlfile))) { #if generation failed, die; exec won't block, so can't use 'or die'
        return_error(4);
    }
}
# output buffering required; fails to process css
ob_start();
readfile($htmlfile);
$htmldata = ob_get_contents();
ob_end_clean();
echo $htmldata;

/*
 * error1 = malformed filename; should be a\d{3}\.xml; user error
 * error2 = well-formed filename but not in the corpus; user error
 * error3 = html doesn't exist but couldn't generate it; my fault
 * error4 = html exists but xml is newer, yet couldn't regenerate html; my fault
 */
function return_error($errorno) {
    $msg = "
<html>
<head><title>Error $errorno</title>
    <link type=\"text/css\" href=\"http://obdurodon.org/css/style.css\" rel=\"stylesheet\"/>
</head>
<body>
    <h1>Error $errorno</h1>
    <p>No such file. If you believe that this message results from a bug
    (that is, that the file exists and the system failed to find it), please
    send the url (from the address line in your browsers) to 
    <a href=\"mailto:rjp43@pitt.edu\">rjp43@pitt.edu</a> with the date and
    time (including your time zone) and a note that you received <strong>Error $errorno</strong>.</p>
</body></html>
";
    die($msg);
}

?>


