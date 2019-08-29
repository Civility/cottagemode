<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('bootstrap.tooltip');
$lang  = JFactory::getLanguage();

/*if ($this->maxLevelcat != 0 && count($this->items[$this->parent->id]) > 0) : */ ?>
<?php if ($this->maxLevelcat != 0 && count($this->items[$this->parent->id]) > 0) : ?>
	<?php foreach ($this->items[$this->parent->id] as $id => $item) : ?>
	<?php 
		if ($this->params->get('show_empty_categories_cat') || $item->numitems || count($item->getChildren())) : ?>	
		<div class="card">
			<!-- <div class="card-link"> -->

			<picture>
			<?php // из ссылки вырезаем каталог
				$path_dirname = pathinfo($item->getParams()->get('image'))['dirname'];
				$path_basename = pathinfo($item->getParams()->get('image'))['basename'];
				$srcset = $path_dirname.'/mini/'.$path_basename;
			if(file_exists($srcset)): ?>
				<source srcset="<?=$srcset; ?>" media="<?=JFactory::getApplication()->getUserState('maxWidth')?>">
			<?php endif; ?>
			<?php if ($this->params->get('show_description_image') && $item->getParams()->get('image')) : ?>
				<source srcset="<?=$item->getParams()->get('image'); ?>">
				<img srcset="<?=$item->getParams()->get('image'); ?>" alt="<?=htmlspecialchars($item->getParams()->get('image_alt'), ENT_COMPAT, 'UTF-8'); ?>" class="card-img" />
			</picture>
			<?php endif; ?>
			<?php if($item->numitems !=1) : ?>
				<a href="<?=JRoute::_(ContentHelperRoute::getCategoryRoute($item->id, $item->language)); ?>" class="card-link">
			<?php else : 
				$db = JFactory::getDBO();
				$query = $db->getQuery(true);
				$query = 'SELECT `alias` FROM `#__content` WHERE `catid`='.$item->id.' AND `state`>0';
				$db->setQuery($query);
				$res= $db->loadObjectList();
				foreach ($res as $articles) { ?>
				<a href="<?=JRoute::_(ContentHelperRoute::getCategoryRoute($item->slug, $item->language)) .'/'.$articles->alias; ?>" class="card-link">
			<?php } endif; ?>
				<h3 class="card-overlay page-header">
					<div class="page-header-title"><?=$this->escape($item->title); ?></div>
					<div class="page-header-alt"><?=htmlspecialchars($item->getParams()->get('image_alt'), ENT_COMPAT, 'UTF-8'); ?></div>
					<?php if ($this->params->get('show_cat_num_articles_cat') == 1) :?>
						<span class="badge badge-info tip hasTooltip" title="<?=JHtml::_('tooltipText', 'COM_CONTENT_NUM_ITEMS_TIP'); ?>">
							<?=JText::_('COM_CONTENT_NUM_ITEMS'); ?>&nbsp;
							<?=$item->numitems; ?>
						</span>
					<?php endif; ?>
					<?php if (count($item->getChildren()) > 0 && $this->maxLevelcat > 1) : ?>
						<a id="category-btn-<?=$item->id; ?>" href="#category-<?=$item->id; ?>"
							data-toggle="collapse" data-toggle="button" class="btn btn-mini pull-right" aria-label="<?=JText::_('JGLOBAL_EXPAND_CATEGORIES'); ?>"><span class="icon-plus" aria-hidden="true"></span></a>
					<?php endif; ?>
				</h3>
				
				<?php if ($this->params->get('show_subcat_desc_cat') == 1) : ?>
					<?php if ($item->description) : ?>
						<div class="category-desc">
							<?=JHtml::_('content.prepare', $item->description, '', 'com_content.categories'); ?>
						</div>
					<?php endif; ?>
				<?php endif; ?>
				<?php if (count($item->getChildren()) > 0 && $this->maxLevelcat > 1) : ?>
					<div class="collapse fade" id="category-<?=$item->id; ?>">
					<?php
					$this->items[$item->id] = $item->getChildren();
					$this->parent = $item;
					$this->maxLevelcat--;
					echo $this->loadTemplate('items');
					$this->parent = $item->getParent();
					$this->maxLevelcat++;
					?>
					</div>
				<?php endif; ?>
				</a>
			<!-- </div> -->
		</div>
		<?php endif; ?>
	<?php endforeach; ?>
<?php endif; ?>
