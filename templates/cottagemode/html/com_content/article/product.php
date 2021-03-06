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
$modules = JModuleHelper::getModules('dialog');
// Create shortcuts to some parameters.
$params  = $this->item->params;
$images  = json_decode($this->item->images);
$urls    = json_decode($this->item->urls);
$canEdit = $params->get('access-edit');
$user    = JFactory::getUser();
$info    = $params->get('info_block_position', 0);
$app          = JFactory::getApplication();
$sitename = trim($app->getCfg('sitename'));
$tpath		  = '/templates/'.$this->template;
foreach($this->item->jcfields as $field) :
	// данные
	$itemRawValue[$field->name] = $field->rawvalue;
	// значеине
	$itemFieldVal[$field->name] = $field->value;
	// class
	$itemFieldClass[$field->name] = $field->params->get('render_class');
	// заголовок поля
	$itemFieldTitle[$field->name] = $field->title;
	// группаID таблица
	$itemFieldGroup[$field->group_id] = $field->group_id;
	// параметры
	$itemFieldPar[$field->name] = $field->fieldparams;
endforeach;

// Check if associations are implemented. If they are, define the parameter.
$assocParam = (JLanguageAssociations::isEnabled() && $params->get('show_associations'));
JHtml::_('behavior.caption');
?>
<div class="container item-page<?=$this->pageclass_sfx; ?>">
	<meta itemprop="inLanguage" content="<?=($this->item->language === '*') ? JFactory::getConfig()->get('language') : $this->item->language; ?>" />
	<?php if ($this->params->get('show_page_heading')) : ?>
		<h1 class="page-header page-header-menu"><?=$this->escape($this->params->get('page_heading')); ?></h1>
	<?php endif;
	if (!empty($this->item->pagination) && $this->item->pagination && !$this->item->paginationposition && $this->item->paginationrelative)
	{
		echo $this->item->pagination;
	}
	?>

	<?php // Todo Not that elegant would be nice to group the params ?>
	<?php $useDefList = ($params->get('show_modify_date') || $params->get('show_publish_date') || $params->get('show_create_date')
	|| $params->get('show_hits') || $params->get('show_category') || $params->get('show_parent_category') || $params->get('show_author') || $assocParam); ?>

	<?php if (!$useDefList && $this->print) : ?>
		<div id="pop-print" class="btn hidden-print">
			<?=JHtml::_('icon.print_screen', $this->item, $params); ?>
		</div>
		<div class="clearfix"> </div>
	<?php endif; ?>
	<?php if ($params->get('show_title') || $params->get('show_author') || !empty($itemFieldVal['headerh2'])) : ?>
	<div class="page-header">
		<?php if ($params->get('show_title')) : ?>
			<h1 class="page-header-article" itemprop="headline"><?=$this->escape($this->item->title); ?></h1>
		<?php endif; ?>
		<?php if ($this->item->state == 0) : ?>
			<span class="alert alert-warning"><?=JText::_('JUNPUBLISHED'); ?></span>
		<?php endif; ?>
		<?php if (strtotime($this->item->publish_up) > strtotime(JFactory::getDate())) : ?>
			<span class="alert alert-warning"><?=JText::_('JNOTPUBLISHEDYET'); ?></span>
		<?php endif; ?>
		<?php if ((strtotime($this->item->publish_down) < strtotime(JFactory::getDate())) && $this->item->publish_down != JFactory::getDbo()->getNullDate()) : ?>
			<span class="alert alert-warning"><?=JText::_('JEXPIRED'); ?></span>
		<?php endif; ?>
		<?php // Content is generated by content plugin event "onContentAfterTitle" ?>
			<?=$this->item->event->afterDisplayTitle; ?>
	<?php // headerh2 ?>
	<?php if(isset($itemFieldVal['headerh2']) && !empty($itemFieldVal['headerh2'])) : ?>
		<h2 class="page-header-subarticle" itemprop="alternativeHeadline"><?=$itemFieldVal['headerh2']; ?></h2>
	<?php endif; ?>
	</div>
	<?php endif; ?>

	<?php // Content is generated by content plugin event "onContentBeforeDisplay" ?>
	<?=$this->item->event->beforeDisplayContent; ?>
	<?php //start item-body ?>
	<div class="item-body">

	<?php // start aks ; ?>
	<?php $itemRawAccessory = json_decode($itemRawValue['accessory'], true); ?>
	<?php  if (isset($itemRawAccessory) && !empty($itemRawAccessory)) : ?>
		<div class="item-body-section">
			<?php foreach ($itemRawAccessory as $itemAccessory) : ?>
			<div class="accessory-card <?=$itemFieldClass['accessory']; ?>">
				<div class="accessory-row">
				<?php if (!empty($itemAccessory['img']) && !empty($itemAccessory['img']) ): ?>
					<div class="col-img miup">

				<?php // из ссылки вырезаем каталог
					$path_dirname = pathinfo($itemAccessory['img'])['dirname'];
					$path_basename = pathinfo($itemAccessory['img'])['basename'];
					$srcset = $path_dirname.'/big/'.$path_basename;
					if(file_exists($srcset)): ?>
						<a href="<?=$srcset?>" class="link card-link"><img srcset="<?=$itemAccessory['img']; ?>" alt="<?=$itemAccessory['name']; ?>" class="image accessory-img" /></a>
						<?php else : ?>
						<a href="<?=$itemAccessory['img']; ?>" class="link card-link"><img srcset="<?=$itemAccessory['img']; ?>" alt="<?=$itemAccessory['name']; ?>" class="image accessory-img" /></a>
					<?php endif; ?>
					</div>
				<?php endif; ?>
					<div class="col-table">
						<table class="table accessory-table">
						<?php if (!empty($itemAccessory['name']) && !empty($itemAccessory['name']) ): ?>
							<tr>
								<td colspan="2"><?=$itemAccessory['name']; ?></td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['diameter']) && !empty($itemAccessory['diameter']) ): ?>
							<tr>
								<td>Диаметр</td>
								<td><?=$itemAccessory['diameter']; ?> мм</td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['angle']) && !empty($itemAccessory['angle']) ): ?>
							<tr>
								<td>Угол</td>
								<td><?=$itemAccessory['angle']; ?>º</td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['size']) && !empty($itemAccessory['size']) ): ?>
							<tr>
								<td>Размер</td>
								<td><?=$itemAccessory['size']; ?></td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['width']) && !empty($itemAccessory['width']) ): ?>
							<tr>
								<td>Длина</td>
								<td><?=$itemAccessory['width']; ?></td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['weight']) && !empty($itemAccessory['weight']) ): ?>
							<tr>
								<td>Вес</td>
								<td><?=$itemAccessory['weight']; ?> мм</td>
							</tr>
							<?php endif; ?>
							<?php if (!empty($itemAccessory['amount']) && !empty($itemAccessory['amount']) ): ?>
							<tr>
								<td>Количество</td>
								<td><?=$itemAccessory['amount']; ?>  шт.</td>
							</tr>
							<?php endif; ?>
							
							<?php if (!empty($itemAccessory['text']) && !empty($itemAccessory['text']) ): ?>
							<tr>
								<td colspan="2"><?=$itemAccessory['text']; ?></td>
							</tr>
							<?php endif; ?>
						</table>
					</div>
				</div>
			</div>
			<?php endforeach; ?>
		</div>
	<?php endif; ?>
	<?php // end aks ; ?>

	<?php $itemRawValueColor = json_decode($itemRawValue['imgcolors'], true);
	if (isset($itemRawValueColor) && !empty($itemRawValueColor)) : ?>
		<figure class="item-section-imgcolors imgcolors<?=$itemFieldClass['imgcolors']; ?>" role="group">
		<?php foreach ($itemRawValueColor as $key => $itemColor) : ?>
			<figure class="imgcolors-card popup">
				<?php if (!empty($itemColor['big']) && !empty($itemColor['mini']) && !empty($itemColor['title']) || !empty($itemColor['alt'])) : ?>
				<a href="<?=$itemColor['big']; ?>" itemprop="image" class="link imgcolors-link">
					<img src="<?=$itemColor['mini']; ?>" alt="<?=$itemColor['alt']; ?>" title="<?=$itemColor['title']; ?>" class="image item-section-imgcolors_image">
				</a>
				<?php else : ?>
				<a href="<?=$itemColor['mini']; ?>" class="link imgcolors-link" itemprop="image">
					<img src="<?=$itemColor['mini']; ?>" alt="<?=$this->escape($this->item->title); ?>" class="image item-section-imgcolors_image">
				</a>
				<?php endif; ?>
				<?php if($itemColor['title']) : ?>
				<figcaption class="imgcolors-footer"><?=$itemColor['title']; ?></figcaption>
				<?php endif; ?>
			</figure>
		<?php endforeach; ?>
		</figure>
	<?php endif;  ?>

	<div class="item-body-section">
		<?php $itemRawSlider = json_decode($itemRawValue['slider'], true); ?>
		<?php  if (isset($itemRawSlider) && !empty($itemRawSlider)) : ?>
			<div class="item-section<?=$itemFieldClass['slider']; ?>" itemscope itemtype="http://schema.org/ImageObject">
				<div id="panel" class="slider item-section-slider miup">
				<?php foreach ($itemRawSlider as $itemSlider) : ?>
				<?php if (!empty($itemSlider['big']) && !empty($itemSlider['mini']) ): ?>
					<a href="<?=$itemSlider['big']; ?>" class="link slider-link">
						<img src="<?=$itemSlider['mini']; ?>" alt="<?=$itemSlider['alt'] ?>" title="<?=$itemSlider['title']; ?>" class="image item-section-slider_image" itemprop="contentUrl">
					</a>		
				<?php else : ?>
					<a href="<?=$itemSlider['mini']; ?>" class="link slider-link">
						<img src="<?=$itemSlider['mini']; ?>" alt="<?=$this->escape($this->item->title); ?>" class="image item-section-slider_image" itemprop="contentUrl">
					</a>
					<?php endif; ?>
				<?php endforeach; ?>
				</div>
			</div>
		<?php endif; ?>
	
		<?php //if (!empty($itemFieldGroup['2']) || !empty($itemFieldGroup['3'])): ?>
			<div class="item-section">
			<?php $itemRawPoints = json_decode($itemRawValue['points'], true);
			if (isset($itemRawPoints) && !empty($itemRawPoints)) : ?>
				<ul class="item-section-points<?=$itemFieldClass['points']; ?>">
				<?php foreach ($itemRawPoints as $key => $itemDraft) : ?>
					<?php if (!empty($itemDraft['text'])) : ?>
						<li><?=$itemDraft['text']; ?></li>
					<?php endif;
				endforeach; ?>
				</ul>
			<?php endif;  ?>

			<?php // Таблица ?>
			<?php // if (isset($itemFieldGroup['3'])) : ?>
			<table class="table item-section-table">
				<tbody>
				<?php $itemRawSizes = json_decode($itemRawValue['sizes'], true);
				if (isset($itemRawSizes) && !empty($itemRawSizes)) : ?>
					<tr>
						<td><?=$itemFieldTitle['sizes']; ?></td>
						<td><?php foreach ($itemRawSizes as $itemSize) :
							if (!empty($itemSize['size'])) :
								echo $itemSize['size'] . 'мм' . '<br>';
							endif;
						endforeach; ?></td>
					</tr>
				<?php endif; ?>
				<?php if (isset($itemFieldVal['packing']) and !empty($itemFieldVal['packing'])) : ?>
					<tr>
						<td><?=$itemFieldTitle['packing']; ?></td>
						<td><?=$itemFieldVal['packing']; ?></td>
					</tr>
				<?php endif; ?>
				<?php if (isset($itemFieldVal['profile']) and !empty($itemFieldVal['profile'])) : ?>
					<tr>
						<td><?=$itemFieldTitle['profile']; ?></td>
						<td><?=$itemFieldVal['profile']; ?></td>
					</tr>
				<?php endif; ?>
				<?php if (isset($itemFieldVal['texture']) and !empty($itemFieldVal['texture'])) : ?>
					<tr>
						<td><?=$itemFieldTitle['texture']; ?></td>
						<td><?=$itemFieldVal['texture']; ?></td>
					</tr>
				<?php endif; ?>
				<?php if (isset($itemFieldVal['thermo']) and !empty($itemFieldVal['thermo'])) : ?>
					<tr>
						<td><?=$itemFieldTitle['thermo']; ?></td>
						<td><?=$itemFieldVal['thermo']; ?></td>
					</tr>
				<?php endif; ?>
				</tbody>
			</table>
			<?php // endif; ?>
			<?php // чертеж draft ?>
			<?php $itemRawDrafts = json_decode($itemRawValue['drafts'], true);
			if (isset($itemRawDrafts) && !empty($itemRawDrafts)) : ?>
				<div class="item-section-drafts drafts<?=$itemFieldClass['drafts']; ?>" >
				<?php foreach ($itemRawDrafts as $key => $itemDraft) : ?>
					<?php if (!empty($itemDraft['mini']) && !empty($itemDraft['big'])) : ?>
						<a href="<?=$itemDraft['big']; ?>" class="drafts-link">
							<img src="<?=$itemDraft['mini']; ?>" alt="draft-<?=$this->item->title.'-'.$key; ?>" class="image drafts-image">
						</a>
						<?php else : ?>
						<a href="<?=$itemDraft['mini']; ?>" class="drafts-link">
							<img src="<?=$itemDraft['mini']; ?>" alt="draft-<?=$this->item->title.'-'.$key; ?>" class="image drafts-image">
						</a>
					<?php endif;
				endforeach; ?>
				</div>
			<?php endif;  ?>
			<?php // документы pdf ?>
			<?php $itemRawPdf = json_decode($itemRawValue['pdf'], true);
				if (isset($itemRawPdf) && !empty($itemRawPdf)) : ?>
				<ul class="item-section-doc doc<?=$itemFieldClass['pdf']; ?>" >
				<?php foreach ($itemRawPdf as $itemPdf) : ?>
					<?php if (!empty($itemPdf['title']) && !empty($itemPdf['link'])) : ?>
						<li><a href="<?=$itemPdf['link']; ?>" target="_blank"><?=$itemPdf['title']; ?></a></li>
					<?php endif;
				endforeach; ?>
				</ul>
			<?php endif;  ?>
			</div>
		<?php //endif;  ?>
	</div>
	<div class="item-section-fulltext fulltext" itemprop="description">

		<?=$this->item->text; ?>
		
		<?php if (isset($urls) && ((!empty($urls->urls_position) && ($urls->urls_position == '0')) || ($params->get('urls_position') == '0' && empty($urls->urls_position)))
		|| (empty($urls->urls_position) && (!$params->get('urls_position')))) : ?>
			<?=$this->loadTemplate('links'); ?>
		<?php endif; ?>
		<?php if ($params->get('access-view')) : ?>
			<?=JLayoutHelper::render('joomla.content.full_image', $this->item); ?>
		<?php if (!empty($this->item->pagination) && $this->item->pagination && !$this->item->paginationposition && !$this->item->paginationrelative) :
			echo $this->item->pagination;
		endif;?>
		<?php if (isset ($this->item->toc)) :
			echo $this->item->toc;
		endif; ?>
	</div>
	<div class="item-body-section">
		<div class="item-section-buy buy" itemprop="offers" itemscope itemtype="http://schema.org/Offer"><a class="btn" href="index.php?option=com_content&view=article&id=35"><?=JText::_('FIND_DEALER').'<strong> '. $this->item->title .'</strong> '. JText::_('FIND_MAP'); ?></a></div>

	<?php // icons" ?>
	<?php if (isset($itemRawValue['icon']) and !empty($itemRawValue['icon'])) : 
		$fieldOptIcon = $itemFieldPar['icon']->get('options');
		?>
		<div class="item-section-icons icons<?=$itemFieldClass['icon']; ?>" >
		<?php foreach ($fieldOptIcon as $optIcon) : ?>
			<?php foreach($itemRawValue['icon'] as $rawIcon):?>
				<?php if($rawIcon == $optIcon->value): ?>
					<img src="images/icon/<?=$optIcon->value; ?>" data-toggle="tooltip" data-placement="top" title="<?=$optIcon->name; ?>">
				<?php endif; ?>
			<?php endforeach; ?>
		<?php endforeach; ?>
		</div>
	<?php endif; ?>	

	<?php if (isset($itemFieldVal['brand']) and !empty($itemFieldVal['brand'])) : ?>
		<div class="item-section-brand brand<?=$itemFieldClass['brand']; ?>">
			<img src="<?=$itemRawValue['brand']; ?>" alt="brand <?=$this->item->category_title; ?>" class="image item-section-brand_image">
		</div>
	<?php endif; ?>
	</div>
<?php //end item-body ?>
</div>

	<?php if ($info == 1 || $info == 2) : ?>
		<?php if ($useDefList) : ?>
				<?php // Todo: for Joomla4 joomla.content.info_block.block can be changed to joomla.content.info_block ?>
			<?=JLayoutHelper::render('joomla.content.info_block.block', array('item' => $this->item, 'params' => $params, 'position' => 'below')); ?>
		<?php endif; ?>
		<?php if ($params->get('show_tags', 1) && !empty($this->item->tags->itemTags)) : ?>
			<?php $this->item->tagLayout = new JLayoutFile('joomla.content.tags'); ?>
			<?=$this->item->tagLayout->render($this->item->tags->itemTags); ?>
		<?php endif; ?>
	<?php endif; ?>

	<?php
	if (!empty($this->item->pagination) && $this->item->pagination && $this->item->paginationposition && !$this->item->paginationrelative) :
		echo $this->item->pagination;
	?>
	<?php endif; ?>
	<?php if (isset($urls) && ((!empty($urls->urls_position) && ($urls->urls_position == '1')) || ($params->get('urls_position') == '1'))) : ?>
	<?=$this->loadTemplate('links'); ?>
	<?php endif; ?>
	<?php // Optional teaser intro text for guests ?>
	<?php elseif ($params->get('show_noauth') == true && $user->get('guest')) : ?>
	<?=JLayoutHelper::render('joomla.content.intro_image', $this->item); ?>
	<?=JHtml::_('content.prepare', $this->item->introtext); ?>
	<?php // Optional link to let them register to see the whole article. ?>
	<?php if ($params->get('show_readmore') && $this->item->fulltext != null) : ?>
	<?php $menu = JFactory::getApplication()->getMenu(); ?>
	<?php $active = $menu->getActive(); ?>
	<?php $itemId = $active->id; ?>
	<?php $link = new JUri(JRoute::_('index.php?option=com_users&view=login&Itemid=' . $itemId, false)); ?>
	<?php $link->setVar('return', base64_encode(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid, $this->item->language))); ?>
	<p class="readmore">
		<a href="<?=$link; ?>" class="register">
		<?php $attribs = json_decode($this->item->attribs); ?>
		<?php
		if ($attribs->alternative_readmore == null) :
			echo JText::_('COM_CONTENT_REGISTER_TO_READ_MORE');
		elseif ($readmore = $attribs->alternative_readmore) :
			echo $readmore;
			if ($params->get('show_readmore_title', 0) != 0) :
				echo JHtml::_('string.truncate', $this->item->title, $params->get('readmore_limit'));
			endif;
		elseif ($params->get('show_readmore_title', 0) == 0) :
			echo JText::sprintf('COM_CONTENT_READ_MORE_TITLE');
		else :
			echo JText::_('COM_CONTENT_READ_MORE');
			echo JHtml::_('string.truncate', $this->item->title, $params->get('readmore_limit'));
		endif; ?>
		</a>
	</p>
	<?php endif; ?>
	<?php endif; ?>
	<?php
	if (!empty($this->item->pagination) && $this->item->pagination && $this->item->paginationposition && $this->item->paginationrelative) :
		echo $this->item->pagination;
	?>
	<?php endif; ?>

	<?php if (!$this->print) : ?>
		<?php if ($canEdit || $params->get('show_print_icon') || $params->get('show_email_icon')) : ?>
			<?=JLayoutHelper::render('joomla.content.icons', array('params' => $params, 'item' => $this->item, 'print' => false)); ?>
		<?php endif; ?>
	<?php else : ?>
		<?php if ($useDefList) : ?>
			<div id="pop-print" class="btn hidden-print">
				<?=JHtml::_('icon.print_screen', $this->item, $params); ?>
			</div>
		<?php endif; ?>
	<?php endif; ?>

	<?php if ($useDefList && ($info == 0 || $info == 2)) : ?>
		<?php // Todo: for Joomla4 joomla.content.info_block.block can be changed to joomla.content.info_block ?>
		<?=JLayoutHelper::render('joomla.content.info_block.block', array('item' => $this->item, 'params' => $params, 'position' => 'above')); ?>
	<?php endif; ?>

	<?php if ($info == 0 && $params->get('show_tags', 1) && !empty($this->item->tags->itemTags)) : ?>
		<?php $this->item->tagLayout = new JLayoutFile('joomla.content.tags'); ?>

		<?=$this->item->tagLayout->render($this->item->tags->itemTags); ?>
	<?php endif; ?>

	<?php if ($this->item->catid === '12'  &&  $this->item->id === '11') : ?>
		<?=JModuleHelper::renderModule($modules[0]);?>
	<?php endif; ?>

	<?php // Content is generated by content plugin event "onContentAfterDisplay" ?>
	<?=$this->item->event->afterDisplayContent; ?>
</div>
