<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_custom
 *
 * @copyright   Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>
<div class="custom" <?php if ($params->get('backgroundimage')) : ?> style="background-image:url(<?=$params->get('backgroundimage'); ?>)"<?php endif; ?> >
	<?=$module->content; ?>
</div>
