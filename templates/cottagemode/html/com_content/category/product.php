<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');

JHtml::_('behavior.caption');

$dispatcher = JEventDispatcher::getInstance();

$this->category->text = $this->category->description;
$dispatcher->trigger('onContentPrepare', array($this->category->extension . '.categories', &$this->category, &$this->params, 0));
$this->category->description = $this->category->text;

$results = $dispatcher->trigger('onContentAfterTitle', array($this->category->extension . '.categories', &$this->category, &$this->params, 0));
$afterDisplayTitle = trim(implode("\n", $results));

$results = $dispatcher->trigger('onContentBeforeDisplay', array($this->category->extension . '.categories', &$this->category, &$this->params, 0));
$beforeDisplayContent = trim(implode("\n", $results));

$results = $dispatcher->trigger('onContentAfterDisplay', array($this->category->extension . '.categories', &$this->category, &$this->params, 0));
$afterDisplayContent = trim(implode("\n", $results));

foreach($this->category->jcfields as $field) :
	$fieldVal[$field->name] = $field->value;
	$fieldRaw[$field->name] = $field->rawvalue;
	$fieldClass[$field->name] = $field->params->get('render_class');
endforeach;
?>
<div class="categories-list<?=$this->pageclass_sfx; ?>" itemscope itemtype="http://schema.org/Blog">
	<meta itemprop="datePublished" content="<?=$this->category->created_time; ?>">
	<meta itemprop="dateModified" content="<?=$this->category->modified_time; ?>">
	<?php if ($this->params->get('show_page_heading')) : ?>
		<h1 class="page-header page-header-menu" itemprop="headline">
			<?=$this->escape($this->params->get('page_heading')); ?>
		</h1>
	<?php endif; ?>
	<?php if ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) : ?>
		<h1 class="page-header page-header-category" itemprop="name"><?php if(!empty($fieldVal['titleh1']) && isset($fieldVal['titleh1'])) : echo ($fieldVal['titleh1']);
			else :
			echo $this->escape($this->params->get('page_subheading'));
				if ($this->params->get('show_category_title')) : 
					echo $this->category->title; 
				endif;
			endif; ?></h1>
	<?php endif; ?>
	<?php if(!empty($fieldVal['titleh2']) && isset($fieldVal['titleh2'])) : ?>
		<h2 class="page-header page-header-title" itemprop="alternativeHeadline"><?=($fieldVal['titleh2']);?></h2>
	<?php endif; ?>
	<?=$afterDisplayTitle; ?>

	<?php if ($this->params->get('show_cat_tags', 1) && !empty($this->category->tags->itemTags)) : ?>
		<?php $this->category->tagLayout = new JLayoutFile('joomla.content.tags'); ?>
		<?=$this->category->tagLayout->render($this->category->tags->itemTags); ?>
	<?php endif; ?>
	
	<?php if (empty($this->lead_items) && empty($this->link_items) && empty($this->intro_items)) : ?>
		<?php if ($this->params->get('show_no_articles', 1)) : ?>
			<p><?=JText::_('COM_CONTENT_NO_ARTICLES'); ?></p>
		<?php endif; ?>
	<?php endif; ?>

<?php //start no accesories  ?>
<?php if ($this->category->alias != 'products') : ?>
	<?php $leadingcount = 0; ?>
	<?php if (!empty($this->lead_items)) : ?>
		<div class="cat-product cat-product-full">
			<?php foreach ($this->lead_items as &$item) : ?>
				<div class="full-row product-<?=$leadingcount; ?><?=$item->state == 0 ? ' system-unpublished' : null; ?>">
					<div class="card" itemprop="blogPosts" itemscope itemtype="http://schema.org/BlogPosting">
					<?php
					$this->item = &$item;
					echo $this->loadTemplate('item');
					?>
					</div>
				</div>
				<?php $leadingcount++; ?>
			<?php endforeach; ?>
		</div>
	<?php endif; ?>

	<?php
	$introcount = count($this->intro_items);
	$counter = 0;
	?>

	<?php if (!empty($this->intro_items)) : ?>
		<?php foreach ($this->intro_items as $key => &$item) : ?>
			<?php $rowcount = ((int) $key % (int) $this->columns) + 1; ?>
			<?php if ($rowcount === 1) : ?>
				<?php $row = $counter / $this->columns; ?>
				<div class="cat-product cat-product-row cols-<?=(int) $this->columns; ?> <?='row-' . $row; ?>">
			<?php endif; ?>
				<div class="row-col col-12 col-md-6 col-lg-<?=round(12 / $this->columns); ?>">
					<div class="card column-<?=$rowcount; ?><?=$item->state == 0 ? ' system-unpublished' : null; ?>" itemprop="blogPosts" itemscope itemtype="http://schema.org/BlogPosting">
					<?php
					$this->item = &$item;
					echo $this->loadTemplate('item');
					?>
					</div>
				<?php $counter++; ?>
				</div>
			<?php if (($rowcount == $this->columns) or ($counter == $introcount)) : ?>
				</div>
			<?php endif; ?>
		<?php endforeach; ?>
	<?php endif; ?>
<?php //end no accesories ?>
<?php endif; ?>

	<?php if (!empty($this->link_items)) : ?>
		<div class="items-more">
			<?=$this->loadTemplate('links'); ?>
		</div>
	<?php endif; ?>


	<?php if ($this->maxLevel != 0 && !empty($this->children[$this->category->id])) : ?>
			<div class="<?=$item->state ? 'cat-subchildren' : 'cat-children card-columns' ;?>">
			<?php if ($this->params->get('show_category_heading_title_text', 1) == 1) : ?>
				<h3> <?=JText::_('JGLOBAL_SUBCATEGORIES'); ?> </h3>
			<?php endif; ?>
			<?=$this->loadTemplate('children'); ?></div>
	<?php endif; ?>

	<?php if ($beforeDisplayContent || $afterDisplayContent || $this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
	
		<?=$beforeDisplayContent; ?>
		<?=$this->category->description ? '<div class="category-desc" itemprop="description">' : '' ; ?>
			<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
				<img src="<?=$this->category->getParams()->get('image'); ?>" alt="<?=htmlspecialchars($this->category->getParams()->get('image_alt'), ENT_COMPAT, 'UTF-8'); ?>"/>
			<?php endif; ?>
			
			<?php if ($this->params->get('show_description') && $this->category->description) : ?>
				<?=JHtml::_('content.prepare', $this->category->description, '', 'com_content.category'); ?>
			<?php endif; ?>
		<?=$this->category->description ? '</div>' : ''; ?>
		<?=$afterDisplayContent; ?>
	<?php endif; ?>

	<?php if (($this->params->def('show_pagination', 1) == 1 || ($this->params->get('show_pagination') == 2)) && ($this->pagination->get('pages.total') > 1)) : ?>
		<div class="pagination">
			<?php if ($this->params->def('show_pagination_results', 1)) : ?>
				<p class="counter pull-right"> <?=$this->pagination->getPagesCounter(); ?> </p>
			<?php endif; ?>
			<?=$this->pagination->getPagesLinks(); ?> </div>
	<?php endif; ?>
	<?php if (isset($fieldVal['catbrand']) && !empty($fieldVal['catbrand'])) : ?>
		<div class="brand<?=$fieldClass['catbrand']; ?>">
			<img src="<?=$fieldRaw['catbrand']; ?>" alt="brand <?=$this->category->title; ?>">
		</div>
	<?php endif; ?>
</div>
