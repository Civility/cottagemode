<?php
/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */

defined('_JEXEC') or die;

class FLYandexTurboCoreZoo extends FLYandexTurboCore {

	// Construct Class

	function __construct($params)
	{	
		parent::__construct($params);

		// make sure ZOO exist

		if (!JFile::exists(JPATH_ADMINISTRATOR.'/components/com_zoo/config.php')
				|| !JComponentHelper::getComponent('com_zoo', true)->enabled) {
			return;
		}

		// load zoo config
		require_once (JPATH_ADMINISTRATOR.'/components/com_zoo/config.php');

		// check if Zoo > 2.4 is loaded
		if (!class_exists('App')) {
			return;
		}

		// get the ZOO App instance
		$this->zoo = App::getInstance('zoo');
	}

	// Get COM_ZOO Content

	public function getContent($page = 1)
	{
		// register plugin path
		if ($path = $this->zoo->path->path('root:plugins/ajax/flyandexturbo/')) {
			$this->zoo->path->register($path, 'flyandexturbo');
		}

		$result 		= array();
		$options 		= $this->params->get('zoo_options');
		$image 			= $options->zoo_add_image;
		$items 			= $this->getItems($page);

		if (!empty($items)) {
			foreach ($items as $key => $item) {
				$renderer = $this->zoo->renderer->create('item');
				$date 	  = new JDate($item->created);

				$renderer->addPath(array($this->zoo->path->path('component.site:'), dirname(dirname(__FILE__))));
				$renderer->checkPositions('item.default', $item);

				$content = $renderer->renderPosition('content');

				if (!empty($content)) {
					$content = $this->prepareContent($content);
				}

				$result[] = array(
					'title' 		=> $item->name,
					'image' 		=> $image ? $this->getImage($renderer->getPositionElements('image')) : '',
					'link' 			=> $this->getItemLink($item),
					'date' 			=> $date->toRFC822(true),
					'author' 		=> $this->getAuthor($item->created_by),
					'content' 		=> $content,
					'related'		=> array()
				);
			}
		}

		return $result;
	}

	// Get COM_ZOO Categories

	public function getContentCategories()
	{	
		$result 		= array();
		$options 		= $this->params->get('zoo_options');
		$image 			= $options->zoo_add_image;
		$catImageEnable	= $options->zoo_categories_add_image;
		$itemsEnable 	= $options->zoo_categories_add_items;
		$categories 	= $this->getCategories();

		if (!empty($categories)) {

			foreach ($categories as $category) {
				$catLink = JRoute::_($this->zoo->route->category($category, false).$this->getUtmTags(), false, $this->ssl);
				$image 	 = $catImageEnable ? $this->getCatImage($category) : '';

				// Add Items To Category Content
				if ($itemsEnable) {
					$itemsHtml 	= array();
					$items 		= $this->getItems(1, $category->id);

					// Get Path For Category Items
					$path  = JPluginHelper::getLayoutPath('ajax', 'flyandexturbo', 'default_category_items');

					// Render Template
					ob_start();
					include $path;
					$html = ob_get_clean();

					$category->description .= $html;
				}

				$result[] = array(
					'title' 		=> $category->name,
					'image'			=> $image,
					'link' 			=> $catLink,
					'date' 			=> '',
					'author' 		=> '',
					'content' 		=> $this->prepareContent($category->description),
					'related'		=> array()
				);
			}
		}



		return $result;
	}

	// Get Zoo Items

	public function getItems($page = 1, $category = 0)
	{	
		$options 		= $this->params->get('zoo_options');
		$applications 	= isset($options->zoo_apps) ? $options->zoo_apps : array();
		$types 			= isset($options->zoo_types) ? $options->zoo_types : array();
		$categories 	= isset($options->zoo_catid) ? $options->zoo_catid : array();
		$limit 			= isset($options->zoo_count) ? (int) $options->zoo_count : 500;
		$offset 		= ($page == 1) ? 0 : ($page - 1)*$limit;
		$conditions     = array();
		$join 			= '';

		if ($category) {
			$categories = (array) $category;
			$limit 		= isset($options->zoo_categories_items_count) ? $options->zoo_categories_items_count : 30;
			$offset 	= 0;
		}

		// Only Published
		$conditions[] = 'a.state = 1';

		if ($applications) {
			$conditions[] = "a.application_id IN (".implode(',', $applications).")";
		}

		if ($types) {
			$conditions[] = "a.type IN ('".implode('\',\'', $types)."')";
		}

		if ($categories) {
			$join 			= " LEFT JOIN ".ZOO_TABLE_CATEGORY_ITEM." AS b ON a.id = b.item_id";
            $conditions[] 	= "b.category_id IN (".implode(',', $categories).")";
		}

		$select     = "DISTINCT a.*";
        $from       = ZOO_TABLE_ITEM." AS a".$join;
        $conditions = implode(' AND ', $conditions);
        $order 		= 'created DESC';

        if ($this->params->get('enable_random')) {
			$order 			= 'RAND()';
		}
		
        $result = $this->zoo->table->item->all(compact('select', 'from', 'join', 'conditions', 'order', 'offset', 'limit'));

        return $result;
	}

	// Get Categories

	public function getCategories()
	{	
		$items 			= array();
		$options 		= $this->params->get('zoo_options');
		$catId 			= isset($options->zoo_categories_catid) ? $options->zoo_categories_catid : array();
		$categories 	= array();

		if (!empty($catId)) {
			$categories = $this->zoo->table->category->getById($catId, true);
		} else {
			foreach ($this->zoo->application->getApplications() as $application) {
				$appCategories = $application->getCategories(true);
				$categories    = array_merge($categories, $appCategories);
			}
		}

		return $categories;
	}

	// Get Images From Content

	public function getImage($elements = array())
	{	
		$image = array();

		if (!empty($elements)) {
			$element 	= $elements[0];
			$title 		= $this->clearText($element->getItem()->name);
			$imageData	= $element->data();

            if ($element->config->type == 'image') {
                $image = array(
					'src' 	=> $this->clearText(JURI::root() . str_replace('\\', '/', $imageData['file'])),
					'title' => $imageData['title'] ? $this->clearText($$imageData['title']) : $title,
				);
            }

            if ($element->config->type == 'jbimage' || $element->config->type == 'jbgalleryimage') {
            	$row = $imageData[0];
               
                if (isset($row['file']) && $row['file']) {

                    $image = array(
						'src' 	=> $this->clearText(JURI::root() . str_replace('\\', '/', $row['file'])),
						'title' => (isset($row['title']) && !empty($row['title'])) ? $this->clearText($row['title']) : $title,
					);
                }
            }

            if ($element->config->type == 'jbgallery') {
            	$path = JPATH_ROOT . '/' . trim($element->config->directory, '/'). '/' . trim($imageData['value'], '/');

            	$files = JFolder::files($path, '.', false, true, array('.svn', 'CVS', '.DS_Store'));
		        $files = array_filter(
		            $files, create_function('$file', 'return preg_match("#(\.bmp|\.gif|\.jpg|\.jpeg|\.png)$#i", $file);')
		        );

		        $file = $files[0];

                $image = array(
					'src' 	=> JURI::root().$this->getImageRelativeUrl($file),
					'title' => $title,
				);
        	}

            if (!empty($image)) {
            	return '<figure><img src="'.$image['src'].'" /><figcaption>'.$image['title'].'</figcaption></figure>'; 
            }
		}

		return; 
	}

	// Get Content Image Function

	public function getCatImage($category)
	{	
		$image 		= $category->getParams()->get('content.category_image');

		if ($image) {
			$image = '<figure><img src="'.JURI::root().$image.'" alt="'.$this->clearText($category->name).'" title="'.$this->clearText($category->name).'" /></figure>';

			return $image;
		}

		return; 
	}

	// Get Item Link

	public function getItemLink($item) {
		return JRoute::_($this->zoo->route->item($item, false).$this->getUtmTags(), false, $this->ssl);
	}

	// Get Item Title

	public function getItemTitle($item) {
		return $item->name;
	}
}