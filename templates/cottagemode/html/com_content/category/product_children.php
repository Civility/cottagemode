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

$lang   = JFactory::getLanguage();
$user   = JFactory::getUser();
$groups = $user->getAuthorisedViewLevels();

if ($this->maxLevel != 0 && count($this->children[$this->category->id]) > 0) : ?>
	<?php foreach ($this->children[$this->category->id] as $id => $child) : ?>
		<?php // Check whether category access level allows access to subcategories. ?>
		<?php if (in_array($child->access, $groups)) : ?>
			<?php if ($this->params->get('show_empty_categories') || $child->numitems || count($child->getChildren())) : ?>
			<?php if($this->category->level != 1):?>
				<div class="subchildren-row">
			<?php endif; ?>
			<div class="card">
			<?php if(count($this->children[$this->category->id]) != 1 ) : ?>
				<div class="image image-max">
			<?php else: ?>
				<div class="image">
			<?php endif; ?>
				<picture>
					<?php
						$path_dirname = pathinfo($child->getParams()->get('image'))['dirname'];
						$path_basename = pathinfo($child->getParams()->get('image'))['basename'];
						$srcset = $path_dirname.'/mini/mini-'.$path_basename;
						if(file_exists($srcset)): ?>
					<source srcset="<?=$srcset; ?>" media="<?=JFactory::getApplication()->getUserState('maxWidth')?>">
						<?php endif; ?>
					<source srcset="<?=$srcset; ?>">
					<img src="<?=$srcset; ?>" alt="<?=htmlspecialchars($child->getParams()->get('image_alt'), ENT_COMPAT, 'UTF-8'); ?>"/>
				</picture>
				</div>
				<?php if ($lang->isRtl()) : ?>
				
				<h3 class="card-overlay page-header">
					<?php if ( $this->params->get('show_cat_num_articles', 1)) : ?>
						<span class="badge badge-info tip hasTooltip" title="<?=JHtml::_('tooltipText', 'COM_CONTENT_NUM_ITEMS_TIP'); ?>">
							<?=$child->getNumItems(true); ?>
						</span>
					<?php endif; ?>
					<a href="<?=JRoute::_(ContentHelperRoute::getCategoryRoute($child->id)); ?>">
					<?=$this->escape($child->title); ?></a>

					<?php if ($this->maxLevel > 1 && count($child->getChildren()) > 0) : ?>
						<a href="#category-<?=$child->id; ?>" data-toggle="collapse" data-toggle="button" class="btn btn-mini pull-right" aria-label="<?=JText::_('JGLOBAL_EXPAND_CATEGORIES'); ?>"><span class="icon-plus" aria-hidden="true"></span></a>
					<?php endif; ?>
				</h3>
				<?php else : ?>
				<h3 class="card-overlay page-header">
				<?php if($child->numitems !=1) : ?>
					<a href="<?=JRoute::_(ContentHelperRoute::getCategoryRoute($child->id)); ?>" class="link card-link">
				<?php else :
				$db = JFactory::getDBO();
				$query = $db->getQuery(true);
				$query = 'SELECT `alias` FROM `#__content` WHERE `catid`='.$child->id.' AND `state`>0';
				$db->setQuery($query);
				$res= $db->loadObjectList();
				foreach ($res as $articles) { ?>
					<a href="<?php echo JRoute::_(ContentHelperRoute::getCategoryRoute($child->slug, $item->language)) .'/'.$articles->alias; ?>" class="link card-link">
				<?php } endif; ?>
					<?php if($this->category->level == 1 ):?>
						<div class="page-header-title"><?=$this->escape($child->title); ?></div>
					<?php endif; ?>
					<?php if($child->getParams()->get('image_alt')) : ?>
					<div class="page-header-alt"><?=htmlspecialchars($child->getParams()->get('image_alt'), ENT_COMPAT, 'UTF-8');?></div>
					<?php endif; ?>
					</a>
				<?php if ( $this->params->get('show_cat_num_articles', 1)) : ?>
					<span class="badge badge-info tip hasTooltip" title="<?=JHtml::_('tooltipText', 'COM_CONTENT_NUM_ITEMS_TIP'); ?>">
						<?=JText::_('COM_CONTENT_NUM_ITEMS'); ?>&nbsp;
						<?=$child->getNumItems(true); ?>
					</span>
				<?php endif; ?>

				<?php if ($this->maxLevel > 1 && count($child->getChildren()) > 0) : ?>
					<a href="#category-<?=$child->id; ?>" data-toggle="collapse" data-toggle="button" class="btn btn-mini pull-right" aria-label="<?=JText::_('JGLOBAL_EXPAND_CATEGORIES'); ?>"><span class="icon-plus" aria-hidden="true"></span></a>
				<?php endif; ?>
			</h3>
				<?php endif; ?>

				<?php if ($this->params->get('show_subcat_desc') == 1) : ?>
					<?php if ($child->description) : ?>
						<div class="category-desc">
							<?=JHtml::_('content.prepare', $child->description, '', 'com_content.category'); ?>
						</div>
					<?php endif; ?>
				<?php endif; ?>

				<?php if ($this->maxLevel > 1 && count($child->getChildren()) > 0) : ?>
					<div class="collapse fade" id="category-<?=$child->id; ?>">
						<?php
						$this->children[$child->id] = $child->getChildren();
						$this->category = $child;
						$this->maxLevel--;
						echo $this->loadTemplate('children');
						$this->category = $child->getParent();
						$this->maxLevel++;
						?>
					</div>
				<?php endif; ?>
			</div>
			<?php if($this->category->level != 1):?>
			</div>
			<?php endif; ?>
			<?php endif; ?>
		<?php endif; ?>
	<?php endforeach; ?>

<?php endif; ?>