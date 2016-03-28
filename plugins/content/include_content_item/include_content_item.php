<?php
/**
* include_content_item plugin
* This plugin allows you to insert or include one content item
* into another content item.
* Author: kksou
* Copyright (C) 2006-2008. kksou.com. All Rights Reserved
* License: GNU/GPL http://www.gnu.org/copyleft/gpl.html
* Website: http://www.kksou.com/php-gtk2
* v1.5 May 3, 2008
* v1.6.10 July 8, 2011 support for Joomla 1.6
*/

defined( '_JEXEC' ) or die( 'Direct Access to this location is not allowed.' );

jimport( 'joomla.event.plugin' );
jimport( 'joomla.language.helper');

$lib = dirname(__FILE__).'/include_content_item/include_content_item.lib.php';
require_once($lib);

class plgContentinclude_content_item extends JPlugin {

	function plgContentinclude_content_item( &$subject, $params ) {
		parent::__construct( $subject, $params );
 	}

	function onContentPrepare( $context, &$row, &$params, $limitstart=0 ) {

		// Check for Joomla version ! JH
		if (!class_exists('JVersion')) {
			// Joomla 1.5 and 1.6 compatibility (jimport needed) covers also 1.0 ??
			jimport ( 'joomla.version' );
		}
		$jversion = new JVersion ();
		$ver = $jversion->getShortVersion();
		#print "<pre>"; print_r($jversion); print "</pre>";
		#print "bp101. ver($ver)<br>";

		$plugin = new Plugin_IncludeContentItem($row, $ver);

		return true;
	}
}

?>
