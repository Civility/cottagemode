<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_articles_category
 *
 * @copyright   Copyright (C) 2005 - 2019 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

?>
<div class="articles-m<?=$mclass_sfx; ?>">
	<?php if ($grouped) : ?>
		<?php foreach ($list as $group_name => $group) : ?>
		<dl>
			<div class="m-articles-group"><?=JText::_($group_name); ?></div>
			<div>
				<?php foreach ($group as $item) : ?>
					<dl>
					<?php if($item->displayHits || $params->get('show_author') || $item->displayCategoryTitle || $item->displayDate || $item->tags->itemTags): ?>
						<dt>
					<?php endif; ?>
						<?php if ($item->displayHits) : ?>
							<span class="hits m-articles-hits">(<?=$item->displayHits; ?>)</span>
						<?php endif; ?>

						<?php if ($params->get('show_author')) : ?>
							<span class="author m-articles-writtenby"><?=$item->displayAuthorName; ?></s>
						<?php endif; ?>

						<?php if ($item->displayCategoryTitle) : ?>
							<span class="page-header m-articles">(<?=$item->displayCategoryTitle; ?>)</span>
						<?php endif; ?>

						<?php if ($item->displayDate) : ?>
							<span class="date m-articles-date"><?=$item->displayDate; ?></span>
						<?php endif; ?>

						<?php if ($params->get('show_tags', 0) && $item->tags->itemTags) : ?>
							<span class="tags m-articles-tags"><?=JLayoutHelper::render('joomla.content.tags', $item->tags->itemTags); ?></span>
						<?php endif; ?>
					<?php if($item->displayHits || $params->get('show_author') || $item->displayCategoryTitle || $item->displayDate || $item->tags->itemTags): ?>
						</dt>
					<?php endif; ?>
						<dd>
						<?php if ($params->get('link_titles') == 1) : ?>
							<h4 class="title-header m-articles-title"><a class="m-title-link<?=$item->active; ?>" href="<?=$item->link; ?>"><?=$item->title; ?></a></h4>
						<?php else : ?>
							<h4 class="title-header"><?=$item->title; ?></h4>
						<?php endif; ?>
						<?php if ($params->get('show_introtext')) : ?>
							<p class="introtext m-articles-introtext"><?=$item->displayIntrotext; ?></p>
						<?php endif; ?>
						
						<?php if ($params->get('show_readmore')) : ?>
							<p class="readmore m-articles-readmore">
								<a class="btn m-articles-btn <?=$item->active; ?>" href="<?=$item->link; ?>">
									<?php if ($item->params->get('access-view') == false) : ?>
										<?=JText::_('MOD_ARTICLES_CATEGORY_REGISTER_TO_READ_MORE'); ?>
									<?php elseif ($readmore = $item->alternative_readmore) : ?>
										<?=$readmore; ?>
										<?=JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
											<?php if ($params->get('show_readmore_title', 0) != 0) : ?>
												<?=JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
											<?php endif; ?>
									<?php elseif ($params->get('show_readmore_title', 0) == 0) : ?>
										<?=JText::sprintf('MOD_ARTICLES_CATEGORY_READ_MORE_TITLE'); ?>
									<?php else : ?>
										<?=JText::_('MOD_ARTICLES_CATEGORY_READ_MORE'); ?>
										<?=JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
									<?php endif; ?>
								</a>
							</p>
						<?php endif; ?>
						</dd>
					</dl>
				<?php endforeach; ?>
			</div>
		</dl>
		<?php endforeach; ?>
	<?php else : ?>
		<?php foreach ($list as $item) : ?>
			<dl class="media">
				<?php if($item->displayHits || $params->get('show_author') || $item->displayCategoryTitle || $item->displayDate || $item->tags->itemTags): ?>
				<dt>
				<?php endif; ?>
				<?php if ($item->displayHits) : ?>
					<span class="hits m-articles-hits">(<?=$item->displayHits; ?>)</span>
				<?php endif; ?>

				<?php if ($params->get('show_author')) : ?>
					<span class="author m-articles-writtenby"><?=$item->displayAuthorName; ?></span>
				<?php endif; ?>

				<?php if ($item->displayCategoryTitle) : ?>
					<span class="page-header m-articles">(<?=$item->displayCategoryTitle; ?>)</span>
				<?php endif; ?>

				<?php if ($item->displayDate) : ?>
					<span class="date m-articles-date"><?=$item->displayDate; ?></span>
				<?php endif; ?>

				<?php if ($params->get('show_tags', 0) && $item->tags->itemTags) : ?>
					<span class="tags m-articles-tags"><?=JLayoutHelper::render('joomla.content.tags', $item->tags->itemTags); ?></span>
				<?php endif; ?>
				<?php if($item->displayHits || $params->get('show_author') || $item->displayCategoryTitle || $item->displayDate || $item->tags->itemTags): ?>
				</dt>
				<?php endif; ?>
				<dd class="media-body">
				<?php if ($params->get('link_titles') == 1) : ?>
					<h4 class="title-header m-articles-title"><a class="m-title-link<?=$item->active; ?>" href="<?=$item->link; ?>"><?=$item->title; ?></a></h4>
				<?php else : ?>
					<h4 class="title-header"><?=$item->title; ?></h4>
				<?php endif; ?>
				<?php if ($params->get('show_introtext')) : ?>
					<p class="introtext m-articles-introtext"><?=$item->displayIntrotext; ?></p>
				<?php endif; ?>
				
				<?php if ($params->get('show_readmore')) : ?>
					<p class="readmore m-articles-readmore">
						<a class="btn m-articles-btn <?=$item->active; ?>" href="<?=$item->link; ?>">
							<?php if ($item->params->get('access-view') == false) : ?>
								<?=JText::_('MOD_ARTICLES_CATEGORY_REGISTER_TO_READ_MORE'); ?>
							<?php elseif ($readmore = $item->alternative_readmore) : ?>
								<?=$readmore; ?>
								<?=JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
							<?php elseif ($params->get('show_readmore_title', 0) == 0) : ?>
								<?=JText::sprintf('MOD_ARTICLES_CATEGORY_READ_MORE_TITLE'); ?>
							<?php else : ?>
								<?=JText::_('MOD_ARTICLES_CATEGORY_READ_MORE'); ?>
								<?=JHtml::_('string.truncate', $item->title, $params->get('readmore_limit')); ?>
							<?php endif; ?>
						</a>
					</p>
				<?php endif; ?>
				</dd>
			</dl>
		<?php endforeach; ?>
	<?php endif; ?>
</div>
<?php if($params->get('show_readmore') !=1 ): ?>
<p class="readmore m-articles-readmore">
	<a class="btn m-articles-btn" href="<?=$item->displayCategoryLink; ?>"><?php echo JText::_('ALL_NEWS'); ?></a>
</p>
<?php endif;?>
