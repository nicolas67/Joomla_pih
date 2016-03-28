<?php
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
    <jdoc:include type="head" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/template.css" type="text/css" />

    <?php
    $nbmodulesrow0 = (bool)$this->countModules('position-6') + (bool)$this->countModules('position-7') + (bool)$this->countModules('position-8') + (bool)$this->countModules('position-9');
    ?>
    <?php
    $nbmodulesrow1 = (bool)$this->countModules('position-13') + (bool)$this->countModules('position-14') + (bool)$this->countModules('position-15') + (bool)$this->countModules('position-16');
    ?>

    <style type="text/css">
    body
    {
    background-color: <?php echo $this->params->get('styleBackgroundColor');?>;
    color: <?php echo $this->params->get('styleTextColor');?>;
    }
    <?php if($this->params->get('styleBoxGradient') == '1') { ?>
    div.wrapper > div
    {
        --background:-moz-linear-gradient(top, <?php echo $this->params->get('styleBoxColor1');?>, <?php echo $this->params->get('styleBoxColor2');?>);
    }
    <?php } else { ?>
    div.wrapper > div
    {
        --background-color: <?php echo $this->params->get('styleBoxColor1');?>;
    }
    <?php } ?>
    </style>
    
</head>
<body>
<!-- debut wrapper 1 -->
<div class="wrapper">
    <!-- ***************************************** -->
    <!-- en-tête -->
    <div id="header" class="clearfix">
        <!-- logo -->
        <div>
            <a id="logo" href="<?php echo $this->baseurl; ?>">
                <img src="<?php echo JURI::root() ?>templates/<?php echo $this->template ?>/img/logo.png" alt="<?php echo JFactory::getApplication()->getCfg('sitename') ?>" /> 
            </a>
        </div>

        <!-- barre de recherche -->      
        <div id="headermodule">
            <jdoc:include type="modules" name="position-0" style="none" />
        </div>
        
        <!-- menu principal -->
        <?php if ($this->countModules('position-1')): ?>
        <div id="nav" class="clearfix rounded white">
            <jdoc:include type="modules" name="position-1" style="none" />
        </div>
        <?php endif; ?>
        
        <!-- file d'arriane : position haute -->
        <div id="file1">
            <?php if ($this->countModules('position-2')): ?>
            <jdoc:include type="modules" name="position-2" style="xhtml" />
            <?php endif; ?>
        </div>

    </div>
    <!-- ***************************************** -->
    <!-- 4 modules : images / animations / annonce succincte... -->
    <?php if ($nbmodulesrow1): ?>
    <div id="row1modules" class="clearfix <?php echo 'n'.$nbmodulesrow1 ?>">
        <?php if ($this->countModules('position-13')) : ?>
        <div class="row1module">
             <div class="inner rounded white">
                 <jdoc:include type="modules" name="position-13" style="xhtml" />
             </div>
        </div>
        <?php endif; ?>
        <?php if ($this->countModules('position-14')) : ?>
        <div class="row1module">
             <div class="inner rounded white">
                <jdoc:include type="modules" name="position-14" style="xhtml" />
             </div>
        </div>
        <?php endif; ?>
        <?php if ($this->countModules('position-15')) : ?>
        <div class="row1module">
             <div class="inner rounded white">
                <jdoc:include type="modules" name="position-15" style="xhtml" />
             </div>
        </div>
        <?php endif; ?>
        <?php if ($this->countModules('position-16')) : ?>
        <div class="row1module">
             <div class="inner rounded white">
                <jdoc:include type="modules" name="position-16" style="xhtml" />
             </div>
        </div>
        <?php endif; ?>
    </div>
    <?php endif; ?>

    <!-- ***************************************** --> 
    <!-- centre --> 
    <!-- menu-gauche et centre -->
    
    <?php
    $mainclass = '';
    if (!$this->countModules('position-10'))
    {
     $mainclass .= " noleft";
    }
    if (!$this->countModules('position-11') || $app->input->getCmd('task', '') == 'edit')
    {
     $mainclass .= " noright";
    }
    $mainclass = trim($mainclass);
    ?>
    
    
    <div id="main" class="clearfix <?php echo $mainclass ?>">
    <?php if ($this->countModules('position-10')): ?>
    <div id="left">
        <div class="inner rounded white">
            <jdoc:include type="modules" name="position-10" style="xhtml" />
        </div>
    </div>
    <?php endif; ?>
    <div id="center">
        <div class="inner rounded white">
            <!-- slide show : présentation / offre / ... -->
            <jdoc:include type="modules" name="position-12" style="xhtml" />
            
            <!-- message : alerte / infos / ... -->
            <jdoc:include type="message" />
            <!-- contenu -->
            <jdoc:include type="component" />

            <!-- file d'arriane : position basse -->
            <?php if ($this->countModules('position-3')): ?>
            <jdoc:include type="modules" name="position-3" style="xhtml" />
            <?php endif; ?>
        </div>
    </div>
    <?php if ($this->countModules('position-11')) : ?>
    <div id="right">
        <div class="inner rounded white">
            <jdoc:include type="modules" name="position-11" style="xhtml" />
        </div>
    </div>
    <?php endif; ?>
    </div>

    <!-- ***************************************** -->
    <!-- bas de page -->
    <div id="footer">

        <!-- 4 modules : menu bas de page / images / ... -->
        <?php if ($nbmodulesrow0): ?>
        <div id="row2modules" class="clearfix <?php echo 'n'.$nbmodulesrow1 ?>">
            <?php if ($this->countModules('position-6')) : ?>
            <div class="row2modules">
                 <div class="inner rounded white">
                     <jdoc:include type="modules" name="position-6" style="xhtml" />
                 </div>
            </div>
            <?php endif; ?>
            <?php if ($this->countModules('position-7')) : ?>
            <div class="row2modules">
                 <div class="inner rounded white">
                    <jdoc:include type="modules" name="position-7" style="xhtml" />
                 </div>
            </div>
            <?php endif; ?>
            <?php if ($this->countModules('position-8')) : ?>
            <div class="row2modules">
                 <div class="inner rounded white">
                    <jdoc:include type="modules" name="position-8" style="xhtml" />
                 </div>
            </div>
            <?php endif; ?>
            <?php if ($this->countModules('position-9')) : ?>
            <div class="row2modules">
                 <div class="inner rounded white">
                    <jdoc:include type="modules" name="position-9" style="xhtml" />
                 </div>
            </div>
            <?php endif; ?>
        </div>
        <?php endif; ?>
        
        <!-- menu bas de page / liens / ... -->
        <?php if ($this->countModules('position-4')): ?>
        <div id="nav2" class="clearfix rounded white">
            <jdoc:include type="modules" name="position-4" style="none" />
        </div>
        <?php endif; ?>
        
        <!-- informations site, copyright, société, ... -->
        <jdoc:include type="modules" name="position-5" style="none" />
        
    </div>
<!-- fin wrapper 1 -->
</div>
<!-- pour debugger -->
<jdoc:include type="modules" name="debug" style="none" />
</body>
</html>