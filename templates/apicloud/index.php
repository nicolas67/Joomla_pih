<?php 
defined('_JEXEC') or die('Restricted access');
ini_set('display_errors',0);
include_once(JPATH_ROOT . "/templates/" . $this->template . '/js/classe/layout.php');

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml">

<head>

	<jdoc:include type="head" />
	<?php JHtml::_('behavior.framework', true);
	$app = JFactory::getApplication();	
     $csite_name	= $app->getCfg('sitename');
	?>
	
	<?php 
	 $bgname	=	htmlspecialchars($this->params->get('bgname')); 
    ?>

	<?php 
     $mod_right = $this->countModules( 'position-7' );
     if ( $mod_right ) { $width = '';
    } else { $width = '-full';}

     ?>

	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/defaut.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/joomlastyle.css" type="text/css" />
	<script type="text/javascript" src="templates/<?php echo $this->template ?>/js/scroll.js"></script>
	<script type="text/javascript" src="templates/<?php echo $this->template ?>/js/jquery.js"></script> 
	<script type="text/javascript" src="templates/<?php echo $this->template ?>/js/slideshow.js"></script>
	<script type="text/javascript" src="templates/<?php echo $this->template ?>/js/superfish.js"></script>
	<script type="text/javascript" src="templates/<?php echo $this->template ?>/js/hover.js"></script>

	

	<script type="text/javascript" charset="utf-8">
	    var $j = jQuery.noConflict(); 
			$j(document).ready(function(){
		    $j("#slideshow").slideshow({
			    pauseSeconds:5,
			    height:334, 
			    fadeSpeed:0.5,
				width:835, 
			    caption: false
		    });
		 });
	</script>		
	

	<script type="text/javascript">	
	 var $j = jQuery.noConflict(); 
	$j(document).ready(function() {	        
	$j(' .navigation ul ').superfish({		         
	delay:       500,                            		        
	animation:   {opacity:'show',height:'show'},  		        
	speed:       'slow',                          		        
	autoArrows:  false,                           		        
	dropShadows: false                            	           
	});	      
	});        
	</script> 
	
	
	<script type="text/javascript">
	 var $j = jQuery.noConflict(); 
	$j(document).ready(function(){  
/* background resizable */     
function redimensionnement(){ 
    var image_width = $j('#background img').width();  
    var image_height = $j('#background img').height();      
    var over = image_width / image_height;  
    var under = image_height / image_width;  
    var body_width = $j(window).width();  
    var body_height = $j(window).height();  
    if (body_width / body_height >= over) {  
      $j('#background img').css({  
        'width': body_width + 'px',  
        'height': Math.ceil(under * body_width) + 'px',  
        'left': '0px',  
        'top': Math.abs((under * body_width) - body_height) / -2 + 'px'  
      });  
    }   
      
    else {  
      $j('background img').css({  
        'width': Math.ceil(over * body_height) + 'px',  
        'height': body_height + 'px',  
        'top': '0px',  
        'left': Math.abs((over * body_height) - body_width) / -2 + 'px'  
      });  
    }  
}  
          
    redimensionnement(); //onload  
    $j(window).resize(function(){  
        redimensionnement();  
    });  
  
});  

</script>



	</head>

<body> 

 <div id="background"> 

	 <img src="<?php echo $this->baseurl ?>/<?php echo htmlspecialchars($bgname); ?>" alt="background" />	

 </div>

    <div class="pagewidth">
	   <div id="content-top">
	        <div id="sitename">
	            <img  src="templates/<?php echo $this->template ?>/images/logo2.png" width="197" height="69" alt="logotype" />
			</div>
			     <div id="topmenu">				    
	                <div class="navigation">                        
	                    <jdoc:include type="modules" name="position-1" />                    
	                </div>				
	            </div>		
	   </div>
	   <div id="content">
	    <?php $menu = JSite::getMenu(); ?>            
        <?php $lang = JFactory::getLanguage(); ?>            
        <?php if ($menu->getActive() == $menu->getDefault($lang->getTag())) { ?>           
        <?php if ($this->params->get( 'slidedisable' )) : ?>   <?php include "slideshow.php"; ?><?php endif; ?>           
	    <?php } ?>

			    <div id="main<?php echo $width; ?>">
					<jdoc:include type="component" />
					<div class="mainwidth"><?php component(); ?></div>
				</div>

				<?php if($this->countModules('position-7')) : ?>
	                <div id="right">
	                    <jdoc:include type="modules" name="position-7" style="xhtml" />
	                </div> 
	            <?php endif; ?>

                    <?php if ($this->countModules('position-3') || $this->countModules('position-4') || $this->countModules('position-6') || $this->countModules('position-8')) { ?>
				        <div id="footer">
				            <div id="wrapper-box">
					            <div class="box">
						            <jdoc:include type="modules" name="position-3" style="xhtml" />
						        </div>
						        <div class="box">
						            <jdoc:include type="modules" name="position-4" style="xhtml" />
						        </div>
							    <div class="box">
						            <jdoc:include type="modules" name="position-6" style="xhtml" />
						        </div>
							
								<div class="box">
						            <jdoc:include type="modules" name="position-8" style="xhtml" />
						        </div>
					        </div>
						</div>
		            <?php } ?>

						<div id="bottommenu" align="center">				    
							<div class="navigation">                        
								<jdoc:include type="modules" name="position-10" />                    
							</div>				
						</div>	
                        <div id="ftb-f">
						    <div class="ftb">
							    <?php echo date( 'Y' ); ?>&nbsp; <?php echo $csite_name; ?>&nbsp;&nbsp;<?php require("template.php"); ?>
                            </div>
						</div>
						<div id="top">
							<div class="top_button">
								<a href="#" onclick="scrollToTop();return false;">
								<img src="templates/<?php echo $this->template ?>/images/top.jpg" width="30" height="30" alt="top" /></a>
							</div>
						</div>					

	    </div>
	</div>
	
	
	
	
	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-59743847-1', 'auto');
  ga('send', 'pageview');

</script>
	
</body>
</html>