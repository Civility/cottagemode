<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */
 
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');
 
jimport('joomla.form.formfield');
 
class JFormFieldFLInit extends JFormField
{ 
	protected $type = 'flinit';
 	
 	// Get Label Function 

	protected function getLabel()
	{	
		$lang = JFactory::getLanguage();

		// Init Plugins Languages

		$plgPath    = dirname(dirname(__FILE__)).'/subform/plugins';

		if (is_dir($plgPath)) {
			foreach (JFolder::files($plgPath, '^([-_A-Za-z0-9]+)\.xml$') as $file) {
				$extension = basename($file, '.xml');
				$lang->load($extension, JPATH_SITE.'/plugins/ajax/flyandexturbo', null, true); // Load Language For Plugin

				if ($extension != 'com_custom') {
					$component = str_replace('com_', '', $extension);

					if (!$this->checkComponent($component)) {
						$id = 'attrib-'.$component;

						JFactory::getDocument()->addScriptDeclaration("
					        jQuery(function($) {
					        	$(document).ready(function() {
					        		$('a[href=\"#".$id."\"]').closest('li').remove();
									$('#".$id."').remove();
					        	});
					        });");
					}
				}
			}
		}

		return;
	}

	// Get Input Function

	protected function getInput()
	{	
		return;
	}

	// Check Component

	protected function checkComponent($component) {
		if (JFile::exists(JPATH_ADMINISTRATOR.'/components/com_'.$component.'/'.$component.'.php') && JComponentHelper::getComponent('com_'.$component, true)->enabled) {
			return true;
		}

		return;
	}
}