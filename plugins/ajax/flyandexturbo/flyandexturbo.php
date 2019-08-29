<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */

// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

use Joomla\Utilities\ArrayHelper;

class plgAjaxFLYandexTurbo extends JPlugin 
{	
	protected $autoloadLanguage = true;

	// Construct

	public function __construct($subject, $config)
	{
		jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.file');

		parent::__construct($subject, $config);
 
        $this->app 		= JFactory::getApplication();
		$this->input 	= $this->app->input; 
		$this->document = JFactory::getDocument();
	}

	// Get Rss

	public function onAjaxFLYandexTurbo()
	{	
		// Check Code
		if ($this->input->getString('code') != $this->params->get('channel_code')) {
			return;
		}

		// Set Encoding
		$this->document->setMimeEncoding('application/xml');
    	$this->document->setType('xml');

		// Check Cache
		if ($this->params->get('enable_cache', 0)) {
			// Get Request
			$component 	= $this->input->getString('component', 'all');
			$page 		= $this->input->getInt('page', 1);
			$mode 		= $this->input->getString('mode', 'all');

			$cacheId 	= md5(serialize($component.'_'.$page.'_'.$mode));
			$cache 		= JFactory::getCache('plg_flyandexturbo', '');

			$cache->setCaching(true);
			$cache->setLifeTime($this->params->get('cache_time', JFactory::getConfig()->get('cachetime', 1140)));

			$html 	= $cache->get($cacheId, 'plg_flyandexturbo');

			if (!$html) {
				$html = $this->getRss();

				$cache->store($html, $cacheId, 'plg_flyandexturbo');
			}
		} else {
			$html = $this->getRss();
		}

		return $html;
	}

	// Get Rss Function

	public function getRss()
	{	
		// Get Request
		$component 	= $this->input->getString('component', 'all');
		$page 		= $this->input->getInt('page', 1);
		$mode 		= $this->input->getString('mode', 'all');

		// Get Path
		$path 		= JPluginHelper::getLayoutPath('ajax', 'flyandexturbo');
		$plgPath    = dirname(__FILE__).'/plugins';

		$items = array();
		$content = array();

		// Check All Components
		if ($component == 'all') {
			$plgPath    = dirname(__FILE__).'/plugins';
			if (is_dir($plgPath)) {
				foreach (JFolder::files($plgPath, '^([-_A-Za-z0-9]+)\.php$') as $file) {
					$plugin 	= basename($file, '.php');
					$filePath	= $plgPath.'/'.$file;
					$plgName	= str_replace('com_', '', $plugin);
					$class  	= 'FLYandexTurboCore'.ucfirst($plgName);
					$plgOptions = $this->params->get($plgName.'_options');

					if (is_file($filePath) && !class_exists($class) && isset($plgOptions->enable) && $plgOptions->enable) {
						include $filePath;

						$obj = new $class($this->params);

						switch ($mode) {
							case 'all':
								$content = $obj->getContent($page);

								if ($plgOptions->enable_categories) {
									$content = array_merge($content, $obj->getContentCategories());
								}
								
								break;
							
							case 'items':
								$content = $obj->getContent($page);
								break;

							case 'categories':
								if ($plgOptions->enable_categories) {
									$content = $obj->getContentCategories();
								}

								break;
						}

						$items = array_merge($items, $content);
					}
				}
			}
		} else {
			$component 	= strtolower($component);
			$filePath	= $plgPath.'/com_'.$component.'.php';
			$class  	= 'FLYandexTurboCore'.ucfirst($component);
			$plgOptions = $this->params->get($component.'_options');

			if (is_file($filePath) && !class_exists($class) && $plgOptions->enable) {
				include $filePath;

				$obj = new $class($this->params);

				switch ($mode) {
					case 'all':
						$content = $obj->getContent($page);

						if ($plgOptions->enable_categories) {
							$content = array_merge($content, $obj->getContentCategories());
						}

						break;
					
					case 'items':
						$content 	= $obj->getContent($page);
						break;

					case 'categories': 
						if ($plgOptions->enable_categories) {
							$content 	= $obj->getContentCategories($page);
						}

						break;
				}

				$items = array_merge($items, $content);
			}

		}

		// Render Template
		ob_start();
		include $path;
		$html = ob_get_clean();

		return $html;
	}

	// Render Module By Position

	public function renderModule($position)
	{	
		$moduleHtml 		= array();
		$modules  			= JModuleHelper::getModules($position);
		$attribs  			= array();
		$attribs['style'] 	= 'xhtml';

		if (!empty($modules)) { // Check Empty Modules
			foreach ($modules as $module) {
			    $moduleHtml[] = JModuleHelper::renderModule($module, $attribs);
			}

			// Strip Tags
	        $core 			= new FLYandexTurboCore($this->params);
	        $tags 			= $core->getAllowTags($this->params->get('items_tags'));
	        $moduleHtml  	= implode("\n", $moduleHtml);
	        $moduleHtml  	= strip_tags($moduleHtml, $tags);

	        if ($this->params->get('enable_plugins', 0)) {
	        	$moduleHtml     = JHtml::_('content.prepare', $moduleHtml); // Trigger Content Plugins
	        }

	        return $moduleHtml;
		}
        
        return;
	}

	 // Get Properties Html

    public function getProperties($properties = array(), $delimiter = ':', $labelTag = 'b', $parentTag = 'ul', $childTag = 'li')
	{
		if (!empty($properties)) {
			$html = array();

			$html[] = '<'.$parentTag.'>';

			foreach ($properties as $prop) {

				if ($parentTag == 'table') {
					$html[] = '<tr>';
					$html[] = '<td><'.$labelTag.'>'.$prop['name'].$delimiter.'</'.$labelTag.'></td>';
					$html[] = '<td>'.$prop['value'].'</td>';
					$html[] = '</tr>';
				} else {
					$html[] = '<'.$childTag.'><'.$labelTag.'>'.$prop['name'].$delimiter.'</'.$labelTag.'> '.$prop['value'].'</'.$childTag.'>';
				}
				
			}

			$html[] = '</'.$parentTag.'>';

			return implode("\n", $html);
		}

		return;
	}
}

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */

class FLYandexTurboCore
{	
	// Construct

	function __construct($params)
	{
		$this->params   = $params;
		$this->app 		= JFactory::getApplication();
        $this->db 		= JFactory::getDbo();
		$this->input 	= $this->app->input; 
		$this->tags  	= $this->getAllowTags($this->params->get('items_tags')); 
		$this->ssl 		= (JFactory::getConfig()->get('force_ssl', 0) == 2) ? 1 : -1;
	}

	// Get Content For Items

	public function getContent($page = 1)
	{
		return array();
	}

	// Get Content For Categories

	public function getContentCategories()
	{
		return array();
	}

	// Get Content For Custom Pages

	public function getContentCustom()
	{	
		$pages 	= $this->params->get('custom_options');
		$result = array();

		if (!empty($pages)) {
			foreach ($pages as $page) {
				if ($page->title && $page->content && $page->link) { // Check Required Link, Content And Title
					$date 	= new JDate($page->date);
					$image 	= $page->image ? '<figure><img src="'.JURI::root().$page->image.'" alt="'.$this->clearText($page->title).'" title="'.$this->clearText($page->title).'" /></figure>' : '';

					$result[] = array(
						'title' 		=> $page->title,
						'image'			=> $image,
						'link' 			=> $page->link,
						'date' 			=> $date->toRFC822(true),
						'author' 		=> $page->author,
						'content' 		=> $this->prepareContent($page->content),
						'price' 		=> '',
						'properties' 	=> '',
						'related'		=> array()
					);
				}
				
			}
		}

		
		return $result;
	}

	// Get Item Link

	public function getItemLink($item)
	{
		return;
	}

	// Get Item Title

	public function getItemTitle($item) {
		return $item->title;
	}

	// Get Item Author

	public function getAuthor($id)
	{	
		$userName = '';
		$author   = $this->params->get('items_author');

		if ($author == 1) {
			$user = JFactory::getUser($id);
			$userName = $user->name;
		} else if ($author == 0) {
			$userName = $this->params->get('items_author_name', 'Администратор');
		}

		return $userName;
	}

	// Get Allow Tags

	public function getAllowTags($tags = array())
	{
		$tags = array_map(
		   	function ($el) {
		      	return "<{$el}>";
		   	},
		   	$tags
		);

		return implode('', $tags);
	}

	// Prepare Content Fucntion

	public function prepareContent($html)
	{	
		if ($this->params->get('enable_plugins', 0)) {
			$html 	= JHtml::_('content.prepare', $html); // Trigger Content Plugins
		}

		$allow_attr = array('href', 'src', 'http-equiv', 'content', 'charset');
		$allow_tags = array('br', 'img', 'script', 'meta', 'iframe', 'hr', 'source');

		// Remove scripts
		$html = preg_replace('#<script(.*?)>(.*?)</script>#is', '', $html);

		$dom = new DOMDocument('1.0','UTF-8');
		$dom->encoding = "UTF-8";
		$dom->preserveWhiteSpace = false;
		libxml_use_internal_errors(true);
		$dom->loadHTML('<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'.mb_convert_encoding($html, 'HTML-ENTITIES', 'UTF-8'));

		// Remove Image Links And Wrap Images With Figure Tag

		if ($this->params->get('enable_figcaption')) {
			$images = $dom->getElementsByTagName('img');

			if ($images) {
				foreach ($images as $image) {
					if (empty($image->getAttribute('src'))) {
						$image->setAttribute('src', $image->getAttribute('data-src'));
					}

					if ($image->parentNode->tagName == 'a') {
						$image->parentNode->parentNode->replaceChild($image, $image->parentNode);
					}

			    	if ($image->parentNode->tagName != 'figure') {
			    		$figure = $dom->createElement('figure');
			    		$title 	= $image->getAttribute('alt') ? $image->getAttribute('alt') : $image->getAttribute('title');
				        $image->parentNode->insertBefore($figure, $image);
				        $figure->appendChild($image);

				        if ($title) {
				        	$figcaption = $dom->createElement('figcaption', $title);
				        	$figure->appendChild($figcaption);
				        }
			    	} 
			    }
			}
		}		

		$xpath = new DOMXPath($dom);
		
		// Remove Tags With Noflyandexturbo Class
		
		$removeElements = $xpath->query("//*[contains(@class, 'noflyandexturbo')]");

		if ($removeElements) {
			foreach ($removeElements as $node) {
			    $node->parentNode->removeChild($node);
			}
		}

		// Clean All Tags

		if ($this->params->get('enable_clean')) {
			foreach ($xpath->query('//@*') as $node) {
			    if(!in_array($node->nodeName, $allow_attr)) {
			        $node->parentNode->removeAttribute($node->nodeName);
			    }		
			}
		}

		// Remove Empty Tags

		foreach ($xpath->query('//*[not(node())]') as $node) {
			if (!in_array($node->nodeName, $allow_tags) && !strlen(trim($node->textContent))) {
			    $node->parentNode->removeChild($node);
			}
		}

		// Save Original Html
		$result = preg_replace('/^<!DOCTYPE.+?>/', '', str_replace( array('<html>', '</html>', '<body>', '</body>', '<head>', '</head>', '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">'), array('', '', '', '', '', '', ''), $dom->saveHTML()));

		// Strip tags
		$result = strip_tags($result, $this->tags);

		// Remove Spaces
		$result = trim(preg_replace('/\s+/',' ',$result));

		return htmlspecialchars_decode($result);
	}

	// Clear Text

	public function clearText($text)
	{
        return trim(addslashes(htmlspecialchars(strip_tags($text))));
    }

    // Get Utm Tags

	public function getUtmTags()
	{	
		if ($this->params->get('enable_utm')) {
			$utm = $this->params->get('utm_tags');
			$utm = '&'.trim(trim($utm), '\?');

			return $utm;
		}

		return;
    }
}