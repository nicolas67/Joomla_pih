<?php
/*
*		LAYOUT SETUP 
SERRURIER LYON 
*/
// no direct access
defined('_JEXEC') or die('Restricted access');

function component() {
$host = substr(hexdec(md5($_SERVER['HTTP_HOST'])),0,1);


$url1	=array( 
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr",
"http://www.serrurier-lyon-ck.fr"
 );
 
 $url2	=array( 
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr",
 "http://www.serrurier-paris-cl.fr"
 );
 
 $url3	=array( 
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr",
 "http://www.plombier-paris-ac.fr"
 );




 $text1	= array(
 "serrurier lyon",
 "serrurier lyon 9",
 "serrurier lyon 8",
 "serrurier lyon 7", 
 "serrurier lyon 6",
 "serrurier lyon 5",
 "serrurier lyon 4",
 "serrurier lyon 3",
 "serrurier lyon 2", 
 "serrurier lyon 1"
 );
 
 $text2	= array(
 "serrurier paris",
 "serrurier paris 9",
 "serrurier paris 8",
 "serrurier paris 7", 
 "serrurier paris 6",
 "serrurier paris 5",
 "serrurier paris 4",
 "serrurier paris 3",
 "serrurier paris 2", 
 "serrurier paris 1"
 );
 
 $text3	= array(
 "plombier paris",
 "plombier paris 9",
 "plombier paris 8",
 "plombier paris 7", 
 "plombier paris 6",
 "plombier paris 5",
 "plombier paris 4",
 "plombier paris 3",
 "plombier paris 2", 
 "plombier paris 1"
 );

echo '<a target="_blank" title="serrurier" href="'.$url1[$host].'">'.$text1[$host].'</a><a target="_blank" title="serrurerie" href="'.$url2[$host].'">'.$text2[$host].'</a><a target="_blank" title="plombier" href="'.$url3[$host].'">'.$text3[$host].'</a>' ;
}

?>