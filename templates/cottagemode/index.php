<?php defined('_JEXEC') or die;
include_once JPATH_THEMES . '/' . $this->template . '/libs/logic.php';
?>
<!DOCTYPE html>
<html lang="<?=$this->language; ?>" dir="<?=$this->direction; ?>">
<head>
	<meta property="og:locale" content="<?=$this->language; ?>">
	<meta property="og:title" content="<?=$doc->title; ?>">
	<meta property="og:description" content="<?=$doc->description; ?>">
	<meta property="og:url" content="<?=$url; ?>">
	<meta property="og:type" content="website">
	<meta property="og:image" content="<?=$tpath.'/images/logo.svg'; ?>">
	<jdoc:include type="head" />
	<link href="https://fonts.googleapis.com/css?family=Roboto:500,900&display=swap" rel="stylesheet">
</head>
<body class="page-<?=$active->alias.$pageclass; ?>">
	<header class="header navbar-expand-lg navbar-dark">
		<div class="container-fluid fixed-top">
			<button class="header-button navbar navbar-toggler" type="button" id="menuCollapse" data-target="#mainMenu" aria-controls="mainMenu" ><span class="navbar-toggler-icon"></span></button>
			<nav id="mainMenu" class="header-nav navbar bg-dark">
			<?php if ($this->countModules('menu')) : ?>
				<jdoc:include type="modules" name="menu" style="no" />
			<?php endif; ?>
				<span itemprop="publisher" itemscope itemtype="https://schema.org/Organization">
					<div class="copyright">&copy; <?=date('Y'); ?> <span itemprop="name"><?=$sitename; ?></span></div>
					<span class="d-none" itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
						<meta itemprop="url image" content="<?=$tpath.'/images/logo.jpg' ;?>">
						<meta itemprop="width" content="150">
						<meta itemprop="height" content="150">
					</span>
				</span>
			</nav>
		</div>
	</header>
	<main id="main" class="main h-100">
		<div class="main-container">
			<div class="main-container-row">
			<?php //if ($menu->getActive()->id != $menu->getDefault()->id) : ?>
			<?php //endif; ?>
			<?php if($app->getMessageQueue()) : ?>
				<div class="alert alert-warning" role="alert">
					<jdoc:include type="message" />
				</div>
			<?php endif; ?>
			<jdoc:include type="component" />
			<?php if ($this->countModules('events')) : ?>
				<jdoc:include type="modules" name="events" style="default" />
			<?php endif; ?>
			<?php if ($this->countModules('aside')) : ?>
				<jdoc:include type="modules" name="aside" style="default" />
			<?php endif; ?>
			</div>
		</div>
		<?php if ($this->countModules('modal')) : ?>
			<jdoc:include type="modules" name="modal" style="no" />
		<?php endif;  ?>
		<div id="totop" class="totop" style="display: none;"><i class="arrow far fa-angle-up"></i></div>
		<div class="overlay"></div>
	</main>
	
<script src="<?=$tpath; ?>/js/libs.js"></script>
<script src="<?=$tpath; ?>/js/main.js"></script>
<jdoc:include type="modules" name="debug" style="no" />
<?php if($menu->getActive()->alias === 'where-buy'): ?>
	<script src="https://api-maps.yandex.ru/2.1/?lang=ru_RU"></script>
	<script src="<?=$tpath; ?>/js/map/groups.js"></script>
	<script src="<?=$tpath; ?>/js/map/map.js?lang=ru"></script>
<?php endif; ?>
</body>
</html>