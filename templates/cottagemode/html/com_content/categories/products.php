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
JHtml::_('behavior.core');
?>
<div class="categories-list<?=$this->pageclass_sfx; ?>">
	<div class="card-columns"><?=$this->loadTemplate('items');?></div>
	<?=JLayoutHelper::render('joomla.content.categories_default', $this);?>
</div>
