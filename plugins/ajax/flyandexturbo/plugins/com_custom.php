<?php
/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */

defined('_JEXEC') or die;

class FLYandexTurboCoreCustom extends FLYandexTurboCore {

	// Construct Class

	function __construct($params)
	{	
		parent::__construct($params);
	}

	// Get Custom Items From Params

	public function getContent($page = 1)
	{	
		$result 		= array();
		$options 		= $this->params->get('custom_options');
		$items 			= $options->items;

		if (!empty($items)) {
			foreach ($items as $item) {
				if ($item->title && $item->content && $item->link) { // Check Required Link, Content And Title
					$date 	= new JDate($item->date);
					$image 	= $item->image ? '<figure><img src="'.JURI::root().$item->image.'" alt="'.$this->clearText($item->title).'" title="'.$this->clearText($item->title).'" /></figure>' : '';

					$result[] = array(
						'title' 		=> $item->title,
						'image'			=> $image,
						'link' 			=> $item->link,
						'date' 			=> $date->toRFC822(true),
						'author' 		=> $item->author,
						'content' 		=> $this->prepareContent($item->content),
						'price' 		=> '',
						'properties' 	=> '',
						'related'		=> array()
					);
				}
				
			}
		}

		return $result;
	}
}