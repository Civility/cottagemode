<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_related_items
 *
 * @copyright   Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
$moduleTag = htmlspecialchars($params->get('module_tag'), ENT_QUOTES, 'UTF-8');
$headerTag = htmlspecialchars($params->get('header_tag'), ENT_QUOTES, 'UTF-8');
$headerClass = htmlspecialchars($params->get('header_class'), ENT_COMPAT, 'UTF-8');
?>

<<?=$moduleTag;?> class="categories-list-products mod<?=$moduleclass_sfx; ?>">
<<?=$headerTag;?> class="page-header <?=$headerClass;?>"><?=JText::_('OTHER_PRODUCT');?></<?=$headerTag;?>>
<div class="cat-product cat-product-full">
<?php foreach ($list as $item) : ?>
<?php $imgs = json_decode($item->images); ?>
<?php if ($showDate) echo JHtml::_('date', $item->created, JText::_('DATE_FORMAT_LC1')) . ' - '; ?>
<div class="full-row">
	<div class="card">
		<a class="link" href="<?=$item->route; ?>">
			<div class="image">
			<?php  if (isset($imgs->image_intro) and !empty($imgs->image_intro)) : ?>
				<img class="item-image" src="<?=htmlspecialchars($imgs->image_intro);?>" alt="<?php htmlspecialchars($imgs->image_intro_alt);?>">
			<?php endif; ?>
			</div>
			<div class="title-header" >
				<h4><?=$item->title; ?></h4>
			</div>
		</a>
	</div>
</div>
<?php endforeach; ?>
</div>
</<?=$moduleTag;?>>
