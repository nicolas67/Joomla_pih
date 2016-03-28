<?php
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
    <jdoc:include type="head" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" />

    <?php
    $nbmodulesrowHaut = (bool)$this->countModules('module-haut-1') + (bool)$this->countModules('module-haut-2') + (bool)$this->countModules('module-haut-3') + (bool)$this->countModules('module-haut-4');
    ?>
    <?php
    $nbmodulesrowBas = (bool)$this->countModules('module-bas-1') + (bool)$this->countModules('module-bas-2') + (bool)$this->countModules('module-bas-3') + (bool)$this->countModules('module-bas-4');
	?>
    <?php
	// verifies si on a besoin des colonnes
	/*
	$nbmodulesrowCentre = 0;
    if (!$this->countModules('module-gauche'))
    {
		$nbmodulesrowCentre++;
    }
    if (!$this->countModules('module-droit') || $app->input->getCmd('task', '') == 'edit')
    {
		$nbmodulesrowCentre++;
    }
	$nbmodulesrowCentre2 = 12;
	switch($nbmodulesrowCentre)
	{
		case 1 : $nbmodulesrowCentre2 = 8;$nbmodulesrowCentre=9;break;
		case 2 : $nbmodulesrowCentre2 = 4;$nbmodulesrowCentre=6;break;
		default : $nbmodulesrowCentre2 = 12;$nbmodulesrowCentre=12;
	}
	*/
	$mainclass = '';
	if (!$this->countModules('module-gauche'))
	{
		$mainclass .= " noleft";
	}
	if (!$this->countModules('module-droit') || $app->input->getCmd('task', '') == 'edit')
	{
		$mainclass .= " noright";
	}
	$mainclass = trim($mainclass);
    ?>
    
</head>
<body>

<!-- 
<div id="background"> 
	<img src="templates/<?php echo $this->template ?>/images/bandeau.jpg" alt="background" />	
</div>
-->

<!-- debut wrapper 1 -->
<div class="container-fluid"> 
<div class="row">
<div class="col-sm-offset-2 col-sm-8 pa-no-h">
    <!-- ***************************************** -->
    <!-- barre de recherche -->  
    <div class="row pa-no-h">
        <div class="col-sm-offset-2 col-sm-8 pa-no-h">
            <jdoc:include type="modules" name="recherche" style="none" />
        </div>
    </div>
	
    <!-- en-tête -->
    <div id="header" class="row white">
        <!-- logo -->
        <div id="logo" class="col-xs-12 col-sm-4 col-md-3 pa-no-h">
            <a href="<?php echo $this->baseurl; ?>">
                <img src="<?php echo JURI::root() ?>templates/<?php echo $this->template ?>/img/logo.png" alt="<?php echo JFactory::getApplication()->getCfg('sitename') ?>" /> 
            </a>
        </div>
        <!-- menu principal -->
        <?php if ($this->countModules('menu-haut')): ?>
        <div id="nav" class="col-xs-12 col-sm-8 col-md-9 pa-no-h">
            <jdoc:include type="modules" name="menu-haut" style="none" />
        </div>
        <?php endif; ?>
    </div>
	
    <!-- ***************************************** -->
    <!-- 4 modules : images / animations / annonce succincte... -->
    <?php if ($nbmodulesrowHaut): ?>
	<div class="row">
		<?php if ($this->countModules('module-haut-1')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowHaut); ?> white">
			<jdoc:include type="modules" name="module-haut-1" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-haut-2')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowHaut); ?> white">
			<jdoc:include type="modules" name="module-haut-2" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-haut-3')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowHaut); ?> white">
			<jdoc:include type="modules" name="module-haut-3" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-haut-4')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowHaut); ?> white">
			<jdoc:include type="modules" name="module-haut-4" style="xhtml" />
		</div>
		<?php endif; ?>
	</div>
    <?php endif; ?>

    <!-- ***************************************** --> 
    <!-- centre --> 
    <!-- menu-gauche et centre -->
    <div class="row ">
	</div>
	
	
    <div id="conteneur" class="row clearfix <?php echo $mainclass ?>">
	
		
		<?php if ($this->countModules('module-gauche')): ?>
		<!-- <div class="white gauche col-sm-4 col-md-3"> -->
		<div id="gauche" class="white gauche">
			<jdoc:include type="modules" name="module-gauche" style="xhtml" />
		</div>
		<?php endif; ?>
		
		
		
		<?php
		/*
		<div class="col-sm-<?php echo $nbmodulesrowCentre2; ?> col-md-<?php echo $nbmodulesrowCentre; ?>">
		*/
		?>
		<div id="milieu" class="white milieu">
		
    <!-- file d'ariane : position haute -->
			<?php if ($this->countModules('ariane')): ?>
			<div id="ariane" class="">
				<jdoc:include type="modules" name="ariane" style="xhtml" />
			</div>
			<?php endif; ?>
			
			
			<!-- slide show : présentation / offre / ... -->
			<jdoc:include type="modules" name="slideshow" style="xhtml" />

			<!-- message : alerte / infos / ... -->
			<jdoc:include type="message" />
			<!-- contenu -->
			<jdoc:include type="component" />

			<!-- file d'ariane : position basse -->
			<?php if ($this->countModules('ariane-bas')): ?>
			<jdoc:include type="modules" name="ariane-bas" style="xhtml" />
			<?php endif; ?>
		</div>
		
		
		<?php if ($this->countModules('module-droit')) : ?>
		<div id="droit" class="white droit">
			<jdoc:include type="modules" name="module-droit" style="xhtml" />
		</div>
		<?php endif; ?>
		
		
    </div>

    <!-- ***************************************** -->
    <!-- bas de page -->
	<?php if ($nbmodulesrowBas): ?>
    <div id="footer" class="row">
	<!-- 4 modules : menu bas de page / images / ... -->
		<?php if ($this->countModules('module-bas-1')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowBas); ?> white">
			<jdoc:include type="modules" name="module-bas-1" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-bas-2')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowBas); ?> white">
			<jdoc:include type="modules" name="module-bas-2" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-bas-3')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowBas); ?> white">
			<jdoc:include type="modules" name="module-bas-3" style="xhtml" />
		</div>
		<?php endif; ?>
		<?php if ($this->countModules('module-bas-4')) : ?>
		<div class="<?php echo 'col-xs-'.(12/$nbmodulesrowBas); ?> white">
			<jdoc:include type="modules" name="module-bas-4" style="xhtml" />
		</div>
		<?php endif; ?>
	</div>
	<?php endif; ?>
		
	<!-- menu bas de page / liens / ... -->
	<?php if ($this->countModules('menu-bas')): ?>
	<div class="row">
		<div id="nav2" class="col-xs-12 white">
			<jdoc:include type="modules" name="menu-bas" style="none" />
		</div>
	</div>
	<?php endif; ?>

	<!-- informations site, copyright, société, ... -->
	<div class="row">
		<div class="col-sm-12">
			<jdoc:include type="modules" name="informations" style="none" />
		</div>
	</div>
	
<!-- fin wrapper 1 -->
</div>
</div>
</div>
<!-- pour debugger -->
<jdoc:include type="modules" name="debug" style="none" />
</body>
</html>