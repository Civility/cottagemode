<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */
error_reporting(0);

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<header>
    <?php echo $item['image'] ? $item['image'] : ''; ?>

    <h1><?php echo $item['title'] ?></h1>
</header>

<?php echo $moduleTop; // Module Position Top ?>

<?php echo $advert_place_1; //A ds Place #1 ?>

<?php if ($item['price']) : // Price ?>
    <h2><?php echo JText::_('PLG_FLYANDEXTURBO_PRICE')?>: <?php echo $item['price']; ?></h2>
<?php endif; ?>

<?php if ($item['properties']) : // Properties ?>
    <h2><?php echo JText::_('PLG_FLYANDEXTURBO_PROPS')?></h2>
    <?php echo $this->getProperties($item['properties']); ?>
<?php endif; ?>

<?php echo $item['content']; // Content ?>

<?php echo $callbackHtml; // Callback Buttons ?>

<?php echo $pageFormHtml; // Callback Form ?>

<?php echo $socialHtml; // Social Buttons ?>

<?php echo $advert_place_2; // Ads Place #2 ?>

<?php echo $moduleBottom; // Module Position Bottom ?>