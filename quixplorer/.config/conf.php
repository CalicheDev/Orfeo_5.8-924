<?php
//------------------------------------------------------------------------------
// Configuration Variables
    
    // login to use QuiXplorer: (true/false)
    $GLOBALS["require_login"] = false;
    
    // language: (en, de, es, fr, nl, ru)
    $GLOBALS["language"] = "es";
    
    // the filename of the QuiXplorer script: (you rarely need to change this)
    $GLOBALS["script_name"] = "https://".$GLOBALS['__SERVER']['HTTP_HOST'].$GLOBALS['__SERVER']["PHP_SELF"];
    
    // allow Zip, Tar, TGz -> Only (experimental) Zip-support
    $GLOBALS["zip"] = false;    //function_exists("gzcompress");
    $GLOBALS["tar"] = false;
    $GLOBALS["tgz"] = false;
    
        // QuiXplorer version:
        $GLOBALS["version"] = "2.3";
//------------------------------------------------------------------------------
// Global User Variables (used when $require_login==false)
    
    // the home directory for the filemanager: (use '/', not '\' or '\\', no trailing '/')
    $GLOBALS["home_dir"] = "/home/skina/public_html/pruebas/quixplorer/orfeo";
    
    // the url corresponding with the home directory: (no trailing '/')
    //$GLOBALS["home_url"] = "/orfeo-5.5/quixplorer/orfeo";
    $GLOBALS["home_url"] = "/orfeo/quixplorer/orfeo";
    
    // show hidden files in QuiXplorer: (hide files starting with '.', as in Linux/UNIX)
    $GLOBALS["show_hidden"] = true;
    
    // filenames not allowed to access: (uses PCRE regex syntax)
    $GLOBALS["no_access"] = "^\.ht";
    
    // user permissions bitfield: (1=modify, 2=password, 4=admin, add the numbers)
    $GLOBALS["permissions"] = 7;
//------------------------------------------------------------------------------

        // The title which is displayed in the browser
        $GLOBALS["site_name"] = "Plantillas del Cliente";


/* NOTE:
    Users can be defined by using the Admin-section, 
    or in the file ".config/.htusers.php".
    For more information about PCRE Regex Syntax,
    go to http://www.php.net/pcre.pattern.syntax
*/
//------------------------------------------------------------------------------
?>
