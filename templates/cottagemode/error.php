<?php 
defined('_JEXEC') or die;
jimport('joomla.application.module.helper'); 
$this->setGenerator(null);
$this->_script = $this->_scripts = array();
JHtml::_('jquery.framework', false);
$doc= JFactory::getDocument();
$app= JFactory::getApplication();
$tpath= '/templates/'.$this->template;
?>
<!DOCTYPE html>
<html lang="<?=$doc->language; ?>" dir="<?=$doc->description; ?>">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta property="og:locale" content="<?=$this->language; ?>">
	<meta property="og:title" content="<?=$doc->title; ?>">
	<meta property="og:description" content="<?=$doc->description; ?>">
	<meta property="og:url" content="<?=$url; ?>">
	<meta property="og:type" content="website">
	<meta property="og:image" content="<?=$tpath.'/images/logo.svg'; ?>">
	<title>Ошибка <?=$this->error->getCode()." — "; echo htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8');?></title>
	<link href="<?=$tpath.'/favicon.ico';?>" rel="shortcut icon" type="image/vnd.microsoft.icon">
	<link rel="stylesheet" href="<?=$tpath . '/css/app.css';?> "/>
	<link rel="stylesheet" href="<?=$tpath . '/css/style.css';?> "/>
</head>
<body>
<header class="header navbar-expand-lg navbar-dark">
		<div class="container-fluid fixed-top">
			<button class="header-button navbar navbar-toggler" type="button" id="menuCollapse" data-target="#mainMenu" aria-controls="mainMenu" ><span class="navbar-toggler-icon"></span></button>
			<nav id="mainMenu" class="header-nav navbar bg-dark">
			<?php $modules =JModuleHelper::getModules('menu');
				foreach ($modules as $module){ echo JModuleHelper::renderModule($module); } 
			?>
				<span itemprop="publisher" class="text-center w-100" itemscope itemtype="https://schema.org/Organization">
					<div class="copyright ">&copy; <?=date('Y'); ?> <span itemprop="name"><?=$sitename; ?></span></div>
					<span class="d-none" itemprop="logo" itemscope itemtype="https://schema.org/ImageObject">
						<meta itemprop="url image" content="<?=$tpath.'/images/logo.jpg' ;?>">
						<meta itemprop="width" content="150">
						<meta itemprop="height" content="150">
					</span>
				</span>
			</nav>
		</div>
	</header>
	<main class="main">
		<div class="container  vh-100">
			<div class="row no-gutters text-dark d-flex justify-content-centrer align-items-center h-100">
				<div class="col-md-6">
					<img src="<?=$tpath.'/images/404.jpg';?>" alt="<?=$sitename; ?>" class="card-img ">
				</div>
				<div class="col-md-6">
					<div class="card-body text-shadow">
						<h1 class="display-1">Ошибка <?=$this->error->getCode(); ?></h1>
						<p class="display-3 "><?=htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8');?></p>
						<div class="my-3">
							<a class="btn btn-dark btn-lg" href="<?=JUri::base(); ?>" role="button">Вернуться на главную страницу</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
<script src="<?=$tpath; ?>/js/libs.js"></script>
<script src="<?=$tpath; ?>/js/main.js"></script>

</body>
</html>