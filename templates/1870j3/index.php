<?php
/**
 * @copyright	Copyright (C) 2012 Cedric KEIFLIN alias ced1870
 * http://www.joomlack.fr - http://www.template-creator.com
 * @license		GNU/GPL
 * */

defined('_JEXEC') or die;
$app = JFactory::getApplication();
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<jdoc:include type="head" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" />
	<?php
	if ($this->params->get('templateColor'))
	{
	?>
		<style type="text/css">
			body
			{
				background-color: <?php echo $this->params->get('templateBackgroundColor');?>
			}
		</style>
	<?php
	}
	?>
	<?php
	// verifies si on a besoin des colonnes
	$mainclass = '';
	if (!$this->countModules('position-7'))
	{
		$mainclass .= " noleft";
	}
	if (!$this->countModules('position-6') || $app->input->getCmd('task', '') == 'edit')
	{
		$mainclass .= " noright";
	}
	$mainclass = trim($mainclass);
	?>
	<?php
	$nbmodulesrow1 = (bool)$this->countModules('position-8') + (bool)$this->countModules('position-9') + (bool)$this->countModules('position-10') + (bool)$this->countModules('position-11');
	?>
	<?php
	$nbmodulesrow2 = (bool)$this->countModules('position-12') + (bool)$this->countModules('position-13') + (bool)$this->countModules('position-14') + (bool)$this->countModules('position-15');
	?>
	<?php
	$nbmodulesrow3 = (bool)$this->countModules('position-16') + (bool)$this->countModules('position-17') + (bool)$this->countModules('position-18') + (bool)$this->countModules('position-19');
	?>
</head>
<body>
	<div class="wrapper">
		<?php if ($this->countModules('position-1')): ?>
		<div id="nav" class="clearfix rounded white">
			<jdoc:include type="modules" name="position-1" style="none" />
		</div>
		<?php endif; ?>
		<div id="header" class="clearfix">
			<a id="logo" href="<?php echo $this->baseurl; ?>">
				<img src="<?php echo JURI::root() ?>templates/<?php echo $this->template ?>/images/logo.png" alt="<?php echo $app->getCfg('sitename') ?>" /> <?php if ($this->params->get('sitedescription')) { echo '<div class="site-description">'. htmlspecialchars($this->params->get('sitedescription')) .'</div>'; } ?>
			</a>
			<div id="headermodule">
				<jdoc:include type="modules" name="position-0" style="none" />
			</div>
		</div>
		<?php if ($nbmodulesrow1): ?>
		<div id="row1modules" class="clearfix <?php echo 'n'.$nbmodulesrow1 ?>">
			<?php if ($this->countModules('position-8')) : ?>
			<div class="row1module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-8" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-9')) : ?>
			<div class="row1module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-9" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-10')) : ?>
			<div class="row1module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-10" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-11')) : ?>
			<div class="row1module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-11" style="perso" />
				</div>
			</div>
			<?php endif; ?>
		</div>
		<?php endif; ?>
		<div id="slideshow">
			<jdoc:include type="modules" name="position-3" style="xhtml" />
		</div>
		<div id="main" class="clearfix <?php echo $mainclass ?>">
			<?php if ($this->countModules('position-7')): ?>
			<div id="left">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-7" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
			<div id="center">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-5" style="xhtml" />
					<jdoc:include type="message" />
					<jdoc:include type="component" />
					<jdoc:include type="modules" name="position-2" style="xhtml" />
				</div>
			</div>
			<?php if ($this->countModules('position-6')) : ?>
			<div id="right">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-6" style="xhtml" />
				</div>
			</div>
			<?php endif; ?>
		</div>
		<?php if ($nbmodulesrow2): ?>
		<div id="row2modules" class="clearfix <?php echo 'n'.$nbmodulesrow2 ?>">
			<?php if ($this->countModules('position-12')) : ?>
			<div class="row2module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-12" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-13')) : ?>
			<div class="row2module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-13" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-14')) : ?>
			<div class="row2module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-14" style="perso" />
				</div>
			</div>
			<?php endif; ?>
			<?php if ($this->countModules('position-15')) : ?>
			<div class="row2module">
				<div class="inner rounded white">
					<jdoc:include type="modules" name="position-15" style="perso" />
				</div>
			</div>
			<?php endif; ?>
		</div>
		<?php endif; ?>
	</div>
	<div id="body2">
		<div class="wrapper">
			<?php if ($nbmodulesrow3): ?>
			<div id="row3modules" class="clearfix <?php echo 'n'.$nbmodulesrow2 ?>">
					<?php if ($this->countModules('position-16')) : ?>
					<div class="row3module">
						<div class="inner">
							<jdoc:include type="modules" name="position-16" style="xhtml" />
						</div>
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('position-17')) : ?>
					<div class="row3module">
						<div class="inner">
							<jdoc:include type="modules" name="position-17" style="xhtml" />
						</div>
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('position-18')) : ?>
					<div class="row3module">
						<div class="inner">
							<jdoc:include type="modules" name="position-18" style="xhtml" />
						</div>
					</div>
					<?php endif; ?>
					<?php if ($this->countModules('position-19')) : ?>
					<div class="row3module">
						<div class="inner">
							<jdoc:include type="modules" name="position-19" style="xhtml" />
						</div>
					</div>
					<?php endif; ?>
			</div>
			<?php endif; ?>
			<div id="footer">
				<jdoc:include type="modules" name="position-4" style="none" />
			</div>
		</div>
	</div>
	<jdoc:include type="modules" name="debug" style="none" />
</body>
</html>
