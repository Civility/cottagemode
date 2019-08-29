<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<?php if (!empty($items)) : ?>
    <ul>
        <?php foreach ($items as $item) : ?>
            <?php 
                $link   = $this->getItemLink($item);
                $title  = $this->getItemTitle($item);
            ?>
            
            <li>
                <?php if ($link) : ?>
                    <a href="<?php echo $link; ?>"><?php echo $title; ?></a>
                <?php else : ?>
                    <?php echo $title; ?>
                <?php endif; ?>
            </li>

        <?php endforeach; ?>
    </ul>
<?php endif; ?>