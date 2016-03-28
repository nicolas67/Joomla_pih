<?php

/**
 * @copyright	CdricKEIFLIN
 * httpwww.joomlack.fr
 * Template made with the joomla component Template Creator CK - http://www.joomlack.fr
 * agricol
 * @license GNUGPL
 * @version 1.0.0
 * */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
<head>
	<jdoc:include type="head" />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
		<?php JHtml::_('bootstrap.framework'); ?>
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/bootstrap.css" type="text/css" />
	<?php JHtmlBootstrap::loadCss($includeMaincss = false, $this->direction); ?>
	<?php if ($this->direction == 'rtl') { ?>
		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template_rtl.css" type="text/css" />
	<?php } else { ?>
		<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" />
	<?php } ?>
	<?php if ($this->params->get('useresponsive','1')) { ?>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/mobile.css" type="text/css" />
	<?php } ?>
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/custom.css" type="text/css" />
    <?php if ($this->params->get('usecsspie','1')) { ?><!--[if lte IE 8]>
  	<style type="text/css">
  	#nav > div.inner ul.menu ul { behavior: url(<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/pie.htc) }
  	</style>
  	<![endif]--><?php } ?>
<?php
$nbmodules9 = (bool)$this->countModules('position-8') + (bool)$this->countModules('position-9') + (bool)$this->countModules('position-10') + (bool)$this->countModules('position-11');
?>

<?php
$mainclass = "";
if (!$this->countModules('position-7')) { $mainclass .= " noleft";}
if (!$this->countModules('position-6')) { $mainclass .= " noright";}
$mainclass = trim($mainclass); ?>

<!--[if lte IE 7]>
<style type="text/css">
#nav > div.inner ul.menu > li {
	display: inline !important;
	zoom: 1;
}
</style>
<![endif]-->

</head>
<body>
<div id="wrapper_slideshow">
	<div class="inner ui-sortable">
	<?php if ($this->countModules('position-2')) : ?>
	<div id="slideshow">
		<div class="inner clearfix">
			<jdoc:include type="modules" name="position-2" style="xhtml" />
		</div>
	</div>
	<?php endif; ?>

	</div>
</div>
<div id="wrapper_header">
	<div class="container-fluid inner ui-sortable">
	<div id="banner">
		<div class="inner clearfix">
			<div id="bannerlogo" class="logobloc">
				<div class="inner clearfix">
					<?php if ($this->params->get('bannerlogo_logolink')) { ?>
					<a href="<?php echo htmlspecialchars($this->params->get('bannerlogo_logolink')); ?>">
					<?php } ?>
						<img src="<?php echo $this->params->get('bannerlogo_logoimgsrc', $this->baseurl . '/templates/' . $this->template . '/images/your_logo_here.png') ?>" width="<?php echo $this->params->get('bannerlogo_logowidth', '216px') ?>" height="<?php echo $this->params->get('bannerlogo_logoheight', '53px') ?>" alt="<?php echo htmlspecialchars($this->params->get('bannerlogo_logotitle',''));?>" />
					<?php if ($this->params->get('bannerlogo_logolink')) { ?>
					</a>
					<?php } ?>
					<?php if ($this->params->get('bannerlogo_logodescription')) { ?>
					<div class="bannerlogodesc">
						<div class="inner clearfix"><?php echo htmlspecialchars($this->params->get('bannerlogo_logodescription'));?></div>
					</div>
					<?php } ?>
				</div>
			</div>
			<?php if ($this->countModules('position-1')) : ?>
			<div id="nav" class="logobloc">
				<div class="inner clearfix">
<label for="nav-mobileck" class="mobileckhambuger_togglerlabel" style="display:none;">&#x2261</label><input id="nav-mobileck" class="mobileckhambuger_toggler" type="checkbox" style="display:none;"/>					<jdoc:include type="modules" name="position-1" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
		<div class="clr"></div>
		</div>
	</div>
	</div>
</div>
<div id="wrapper">
	<div class="container-fluid inner ui-sortable">
	<?php if ($nbmodules9) : ?>
	<div id="modulestop">
		<div class="inner clearfix <?php echo 'n'.$nbmodules9 ?>">
			<?php if ($this->countModules('position-8')) : ?>
			<div id="modulestopmod1" class="flexiblemodule ">
				<div class="inner clearfix">
					<jdoc:include type="modules" name="position-8" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-9')) : ?>
			<div id="modulestopmod2" class="flexiblemodule ">
				<div class="inner clearfix">
					<jdoc:include type="modules" name="position-9" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-10')) : ?>
			<div id="modulestopmod3" class="flexiblemodule ">
				<div class="inner clearfix">
					<jdoc:include type="modules" name="position-10" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-11')) : ?>
			<div id="modulestopmod4" class="flexiblemodule ">
				<div class="inner clearfix">
					<jdoc:include type="modules" name="position-11" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<div class="clr"></div>
		</div>
	</div>
	<?php endif; ?>

	<?php if ($this->countModules('position-4')) : ?>
	<div id="module1">
		<div class="inner clearfix">
			<jdoc:include type="modules" name="position-4" style="xhtml" />
		</div>
	</div>
	<?php endif; ?>

	<div id="maincontent" class="maincontent <?php echo $mainclass ?>">
		<div class="inner clearfix">
		<?php if ($this->countModules('position-7')) : ?>
			<div id="left" class="column column1">
				<div class="inner clearfix">
					<jdoc:include type="modules" name="position-7" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<div id="main" class="column main row-fluid">
				<div class="inner clearfix">
							<div id="center" class="column center ">
								<div class="inner">
											<jdoc:include type="message" />
											<jdoc:include type="component" />
								</div>
							</div>
							<?php if ($this->countModules('position-6')) : ?>
							<div id="right" class="column column2">
								<div class="inner clearfix">
									<jdoc:include type="modules" name="position-6" style="xhtml" />
								</div>
							</div>
							<?php endif; ?>

				</div>
			</div>
			<div class="clr"></div>
		</div>
	</div>
	<?php if ($this->countModules('position-5')) : ?>
	<div id="modulebas">
		<div class="inner clearfix">
			<jdoc:include type="modules" name="position-5" style="xhtml" />
		</div>
	</div>
	<?php endif; ?>

	</div>
</div>
<div id="wrapper1">
	<div class="container-fluid inner ui-sortable">
	<?php if ($this->countModules('position-3')) : ?>
	<div id="footer">
		<div class="inner clearfix">
			<jdoc:include type="modules" name="position-3" style="xhtml" />
		</div>
	</div>
	<?php endif; ?>


    </div>
</div>
<jdoc:include type="modules" name="debug" />
</body>
</html>