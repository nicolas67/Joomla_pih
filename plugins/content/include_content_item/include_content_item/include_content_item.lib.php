<?php
/**
* include_content_item plugin
* This plugin allows you to insert or include one content item
* into another content item.
* Author: kksou
* Copyright (C) 2006-2008. kksou.com. All Rights Reserved
* License: GNU/GPL http://www.gnu.org/copyleft/gpl.html
* Website: http://www.kksou.com/php-gtk2
* v1.0 May 3, 2008
* v1.51 June 21, 2008
* v1.52 July 23, 2008 added display of content item title
* v1.53 July 31, 2008 added new tag {include_intro} {include_fulltext}
* v1.54 Aug 17, 2008 added support for joomfish
* v1.55 Dec 25, 2008 added new parameter {include_content_item readmore=1} and new tag {include_title_only}
* v1.56 May 5, 2009 support for recursive include. Also change to .lib version.
* v1.57 Jun 14, 2009 added fadein of entire article
* v1.58 Jun 26, 2009 redo the entire algorithm for nested include
* v1.59 May 06, 2010 conforms to joomla.org guidelines
*   - added support for type=button
*   - added fadein/out of fulltext
*   - added nested=0/1
*   - added level=2 - nesting will stop at level 2
* v1.5.10 Jul 8, 2011
*   - support for Joomla 1.6
*   - use latest jquery library: jquery-1.6.2.js
*   - article will only be included if it is published
* v1.6.11 August 17, 2011 added $allow_multiple - Allow the same article to be included multiple times within the same article
* v3.0.11 Jul 4, 2013 support for Joomla 3.0
* v3.0.12 May 31, 2014 support for Joomla 3.3.0 - Thanks to Jörgen @ Kreativ Fotografi for contributing to the code: http://www.kksou.com/php-gtk2/index.php?option=com_fireboard&func=view&catid=21&id=6173#6173
* Also change $() to jQuery() so that jQuery function works with Joomla 3.3
*/

class Plugin_IncludeContentItem {

	function Plugin_IncludeContentItem( &$row, $ver='1.5' ) {
		$regex_base = '\{(include_content_item|include_intro|include_fulltext|include_title_only|include_title_only_h4)\s+(([a-zA-Z]{2})?\s*(\d+)\s*(.*?))\}';
		$regex = "/(.*?)$regex_base(.*)/si";
		$regex2 = "/$regex_base/si";

		if ($ver=='1.0') $id = mosGetParam( $_REQUEST, 'id', '' );
		else $id = JRequest::getCmd('id');
		if (preg_match('/^(\d+)/', $id, $matches)) $id = $matches[1];

		$this->ver = $ver;
		$this->processed = array($id);
		$nested = 1;

		$output = '';
		$contents = $row->text;
		$found = preg_match($regex, $contents, $matches);
		if (!$found) return true;

		$level = 0;
		while ($found) {

			if (preg_match('/nested=0/', $matches[3], $str3)) $nested = 0;
			if ($level==0) unset($maxlevel);
			if (preg_match('/level=(\d+)/i', $matches[3], $str3) && $level==0) $maxlevel = $str3[1];

			$include_id = $matches[5];
			$lang = $matches[4];
			$str = '';

			$allow_multiple = 0;
			if (preg_match('/allow_multiple=1/', $matches[3], $str3)) $allow_multiple = 1;

			if ($allow_multiple) {
				$str = $this->process(array('', $matches[2], $matches[3]));
			} else {
				if (in_array($include_id, $this->processed)) {
				} else {
					$this->processed[] = $include_id;
					$str = $this->process(array('', $matches[2], $matches[3]));
				}
			}

			$output .= $matches[1];
			$output .= $str;
			$contents = $matches[7];
			$found = preg_match($regex, $contents, $matches);
			if ($nested==0) {
			} else {
				if (!$found) {
					++$level;
					if (isset($maxlevel) && $level>=$maxlevel) break;
					$found = preg_match($regex, $output.$contents, $matches);
					if ($found) {
						$output = '';
					}
				}
			}
		}
		$output .= $contents;
		$row->text = $output;
		$row->text = preg_replace( $regex2, '', $row->text );
		return true;
	}

	function process($matches) {
		$show_title = 0;
		$link_title = 0;
		$matches[2] = str_replace('&nbsp;', ' ', $matches[2]);
		$lang = '';

		if ($this->ver=='1.0') {
			global $mosConfig_live_site;
			$this->base = $mosConfig_live_site.'/mambots/content';
		} else {
			$this->base = JURI::base().'plugins/content';
		}

		/*if ($this->ver=='1.0') {
			global $mosConfig_lang;
			$lang = $mosConfig_lang;
		} else {
			$lang2 =& JFactory::getLanguage();
			$lang21 = $lang2->_lang;
		}*/

		if (preg_match('/^\s*([a-zA-Z]{2})\s+(.*)/', $matches[2], $str)) {
			$lang = $str[1];
			$matches[2] = $str[2];
		} else {
			if ($this->ver=='1.0') {
				$lang = strval( mosGetParam( $_REQUEST, 'lang', '' ) );
			} else {
				$lang = JRequest::getCmd('lang');
			}
		}

		if (preg_match('/^\s*(\d+)\s+(0|1)\s+(0|1)/', $matches[2], $str)) {
			$content_id = $str[1];
			$show_title = $str[2];
			$link_title = $str[3];
		} elseif (preg_match('/^\s*(\d+)\s+(0|1)/', $matches[2], $str)) {
			$content_id = $str[1];
			$show_title = $str[2];
		} elseif (preg_match('/^\s*(\d+)/', $matches[2], $str)) {
			$content_id = $str[1];
		}

		if ($matches[1]=='include_title_only' || $matches[1]=='include_title_only_h4') {
			$show_title = 1;
			$link_title = 0;
		}

		if ($this->ver=='1.0') {
			global $database;
		} else {
			#$database =& JFactory::getDBO();
			$database = JFactory::getDBO();
		}

		$title = '';
		$use_default = 1;
		$num_rows = 0;

		$readmore_label_show = '';
		$readmore_label_hide = '';

		if ($lang!='') {

			$query = "SELECT jf.reference_field, jf.value ".
			"FROM #__jf_content jf ".
			"LEFT JOIN #__languages lang ON jf.language_id = lang.id ".
			"WHERE jf.reference_id='$content_id' ".
			"AND jf.reference_table='content' ";

			if ($this->ver=='1.0') {
				$query .= "AND (lang.iso='$lang' OR lang.shortcode='$lang')";
			} else {
				$query .= "AND (lang.shortcode='$lang' OR lang.code LIKE '%$lang%')";
			}

			$database->setQuery( $query );
			$result = $database->query();
			if ($result==null) $num_rows = 0;
			else $num_rows = $database->getNumRows($result);

			if ($num_rows>0) {
				$rows = $database->loadObjectList();
				$r = new stdClass();
				foreach($rows as $item) {
					$field = $item->reference_field;
					$r->$field = $item->value;
				}
				$use_default = 0;
			}
		}

		if ($use_default) {
			if ($this->ver < '3.0') {
				$query = "SELECT sectionid, catid, title, introtext,`fulltext`, state"
				. "\n FROM #__content"
				. "\n WHERE id=$content_id";
			} else {
				$query = "SELECT catid, title, introtext,`fulltext`, state"
				. "\n FROM #__content"
				. "\n WHERE id=$content_id";
			}
			$database->setQuery( $query );
			$result = $database->query();
			if ($result==null) $num_rows = 0;
			else $num_rows = $database->getNumRows($result);
			if ($num_rows>0) {
				$rows = $database->loadObjectList();
				$r = $rows[0];
			}
		}

		if ($num_rows==0) {
			echo "Warning >>> there is no article with id = $content_id<br>";
			return '';
		}

		$state = $r->state;
		#print "bp101. state ($content_id) = $state<br>";
		if ($state==0) return '';

		if ($show_title){
			if ($link_title){
				if ($this->ver=='1.0') {
					global $mosConfig_live_site;
					$Itemid = mosGetParam( $_REQUEST, 'Itemid', 0 );
					$link = $mosConfig_live_site."/index.php?option=com_content&task=view&id=$content_id&Itemid=$Itemid";
				} else {
					if ($this->ver < '3.0') {
						$link = JRoute::_(ContentHelperRoute::getArticleRoute($content_id, $r->catid, $r->sectionid));
					} else {
						$link = JRoute::_(ContentHelperRoute::getArticleRoute($content_id, $r->catid));
					}
				}

				if ($matches[1]=='include_title_only_h4') {
					$title = '<h4><a href="'. $link.'" class="contentpagetitle">'.  $r->title . '</a></h4>';
				} else {
          			$title = '<div class="contentheading"><a href="'. $link.'" class="contentpagetitle">'.  $r->title . '</a></div>';
				}
			}else{
				if ($matches[1]=='include_title_only_h4') {
					$title = '<h4>'.$r->title.'</h4>';
				} else {
					$title = '<div class="contentheading">'.$r->title.'</div><br />';
				}
			}
		}

		if (preg_match('/readmore=/', $matches[2]) || preg_match('/readmore_gif=/', $matches[2])) {
			if ($this->ver=='1.0') {
				global $mosConfig_live_site;
				$Itemid = mosGetParam( $_REQUEST, 'Itemid', 0 );
				$link = $mosConfig_live_site."/index.php?option=com_content&task=view&id=$content_id&Itemid=$Itemid";
			} else {
				if ($this->ver < '3.0') {
				$link = JRoute::_(ContentHelperRoute::getArticleRoute($content_id, $r->catid, $r->sectionid));
				} else {
					$link = JRoute::_(ContentHelperRoute::getArticleRoute($content_id, $r->catid));
				}
			}

			$matches[2] = str_replace('&#39;', "'", $matches[2]);
			$matches[2] = str_replace('&quot;', '"', $matches[2]);
			$matches[2] = str_replace('"', "'", $matches[2]);
			$this->link = $link;

			if (preg_match('/readmore=/', $matches[2]) || preg_match("/readmore_gif='(.*?)'/", $matches[2])) {

				$this->id = $this->get_new_id();

				$this->class = 'readon';
				if ($this->ver=='1.0') $this->label = _READ_MORE;
				else $this->label = JText::_('Read more...');
				$this->label_hide = 'Hide details';
				$this->style = '';
				$this->align = '';
				$this->gif = '';
				$this->gif_hide = '';
				$this->property = 'innerHTML';
				$this->type = 'ahref';
				$this->css = '';

				if (preg_match('/type=button/', $matches[2], $str3)) {
					$this->type = 'button';
					$this->class = '';
					$this->property = 'value';
				}

				if (preg_match('/class=([^\s]+)/', $matches[2], $str3)) {
					$this->class = str_replace(array("'", "\""), '', $str3[1]);
				}

				if (preg_match("/readmore=\d+/", $matches[2], $str2)) {
				} elseif (preg_match("/readmore='(.*?)'/", $matches[2], $str2)) {
					$this->label = $str2[1];
					if (strpos($this->label, '|') !== false) list($this->label, $this->label_hide) = explode('|', $this->label);
				}

				if (preg_match('/align=([^\s]+)/', $matches[2], $str3)) {
					$this->align = str_replace(array("'", "\""), '', $str3[1]);
				}

				if (preg_match("/readmore_gif='(.*?)'/", $matches[2], $str2)) {
					$this->gif = $str2[1];
					if (strpos($this->gif, '|') !== false) list($this->gif, $this->gif_hide) = explode('|', $this->gif);
				}

				if ($this->class!='') $this->css = "class=\"$this->class\"";
				if ($this->align!='') $this->align = "align=\"$this->align\"";

				if ($this->gif!='') {
					$readmore = "<a href=\"$this->link\" id=\"readmore{$this->id}\" $this->css><img src=\"$this->gif\" border=0 $this->align></a>";
					$this->type = 'gif';
				} elseif ($this->type=='button') {
					$readmore = "<input type=\"button\" id=\"readmore{$this->id}\" $this->css value=\"$this->label\"></p>";
				} else {
					$readmore = "<a href=\"$this->link\" id=\"readmore{$this->id}\" $this->css $this->align>$this->label</a>";
				}

			}
		}

		if ($matches[1]=='include_title_only' || $matches[1]=='include_title_only_h4') {
			$output = $title;
		} elseif ($matches[1]=='include_intro') {
			$output = $title . $r->introtext;
		} elseif ($matches[1]=='include_fulltext') {
			$output = $title . $r->fulltext;
		} elseif (preg_match('/readmore=/', $matches[2]) || preg_match("/readmore_gif='(.*?)'/", $matches[2])) {
			$output = $title . $r->introtext;
			$has_readmore = 1;
			if (preg_match('/readmore=0/', $matches[2])) $has_readmore = 0;
			if ($has_readmore && preg_match('/fadein=1/', $matches[2])) $output .= $this->add_jquery_lib();
			if (preg_match('/br_before=1/', $matches[2])) $output .= "<br clear=all>";
			if ($has_readmore && trim($r->fulltext)!='') $output .= $readmore;
			if (preg_match('/br=1/', $matches[2])) {
				$output .= "<br clear=all>";
			}
			if ($has_readmore) $this->fulltext = $r->fulltext;
			if ($has_readmore && trim($r->fulltext)!='' && preg_match('/fadein=1/', $matches[2])) $output .= $this->add_fadein();
		} else {
			$output = $title . $r->introtext . $r->fulltext;
		}
		#$row->text = str_replace($matches[0], $output, $row->text);
		return $output;
	}

	function get_new_id() {
		$GET_var = 'include_content_item';
		if (!isset($_GET[$GET_var])) $_GET[$GET_var] = 131;
		$id = $_GET[$GET_var]++;
		return $id;
	}

	// add_jquery_lib
	function add_jquery_lib() {
		$js_lib = $this->base."/include_content_item/include_content_item/jquery-1.11.1.min.js";
		$output = "
<script type=\"text/javascript\">
if (typeof jQuery == 'undefined') {
	document.write('<script type=\"text/javascript\" src=\"$js_lib\"><\/script>');
}
</script>
";
		return $output;
	}

	function add_fadein() {
		if ($this->type=='gif') {
			$value_show = "<img src=\"$this->gif\" border=0 $this->align>";
			$gif_hide = $this->gif_hide;
			if ($gif_hide=='') $gif_hide = $this->gif;
			$value_hide = "<img src=\"$gif_hide\" border=0 $this->align>";
		} else {
			$value_show = $this->label;
			$value_hide = $this->label_hide;
		}
		$output = "
<script type=\"text/javascript\">
jQuery(function(){
	jQuery('#main{$this->id}').hide();
	jQuery('#readmore{$this->id}').toggle(function() {
		jQuery('#main{$this->id}').fadeIn('slow');
		jQuery('#readmore{$this->id}')[0].$this->property = '$value_hide';
	},
	function() {
		jQuery('#main{$this->id}').fadeOut('slow');
		jQuery('#readmore{$this->id}')[0].$this->property = '$value_show';
	}
	)
});
</script>
";

		$output .= "<div id=\"main{$this->id}\" style=\"display:block\">$this->fulltext</div>";
		return $output;
	}
}

?>
