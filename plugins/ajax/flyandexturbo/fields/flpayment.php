<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */
 
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');
 
jimport('joomla.form.formfield');
 
class JFormFieldFLPayment extends JFormField
{ 
	protected $type = 'flpayment';
 	
 	// Get Label Function 

	protected function getLabel()
	{	
		$component = $this->element->attributes()->component;

		JFactory::getDocument()->addScriptDeclaration("
	        jQuery(function($) {
	        	$(document).ready(function() {
					$('#flyandexturbo-payment-".$component."').closest('.control-label').removeClass('control-label');
	        	});
	        });");

		$html   = array();
		$html[] = '<div id="flyandexturbo-payment-'.$component.'" class="alert alert-info">';
		$html[] = '<h3>'.$component.'</h3>';
		$html[] = '<p>Расширение плагина <b>FL Yandex Turbo</b> для работы с компонентом <b>'.$component.'</b> производится на коммерческой основе.</p>';
		$html[] = '<p>Приобрести расширение плагина можно со страницы плагина по ссылке ниже.</p>';
		$html[] = '<p><a class="btn btn-success btn-large" href="https://fictionlabs.ru/razrabotka/fl-yandex-turbo" target="_blank"><i class="icon-thumbs-up"></i> Приобрести</a></p>';
		$html[] = '</div>';

		return implode('', $html);
	}

	// Get Input Function

	protected function getInput()
	{	
		return;
	}
}