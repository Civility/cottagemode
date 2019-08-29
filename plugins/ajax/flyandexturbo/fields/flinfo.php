<?php

/**
 * @package   FL Yandex Turbo Plugin
 * @author    Дмитрий Васюков http://fictionlabs.ru
 * @license   http://www.gnu.org/licenses/gpl.html GNU/GPL
 */
 
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die('Restricted access');
 
jimport('joomla.form.formfield');
 
class JFormFieldFLInfo extends JFormField
{ 
	protected $type = 'flinfo';
 	
 	// Get Label Function 

	protected function getLabel()
	{	
		JFactory::getDocument()->addScriptDeclaration("
	        jQuery(function($) {
	        	$(document).ready(function() {
					$('div[id^=\"attrib-\"]:not(div[id=\"attrib-pro\"], div[id=\"attrib-main\"]) > .control-group > .control-label').hide();
					$('div[id^=\"attrib-\"]:not(div[id=\"attrib-pro\"], div[id=\"attrib-main\"]) > .control-group > .controls').css('margin-left', '0');
					$('ul#flyandexturbo-tabs').closest('.control-label').removeClass('control-label');

					// Fix For Subform layout
					$('.subform-table-sublayout-section-byfieldsets').addClass('form-vertical');
	        	});
	        });");

		$id 	= JFactory::getApplication()->input->getString('extension_id');
		$link 	= JUri::root().'?option=com_ajax&plugin=flyandexturbo&format=raw&code='.$this->getCode($id);

		$html[] = '<ul class="nav nav-pills" id="flyandexturbo-tabs"><li class="active"><a href="#flyandexturbo-main" data-toggle="pill"><i class="icon-list-2"></i> Лента</a></li><li><a href="#flyandexturbo-pro" data-toggle="pill"><i class="icon-plus-circle"></i> Специальные возможности</a></li><li><a href="#flyandexturbo-thanks" data-toggle="pill"><i class="icon-heart"></i> Сказать Спасибо</a></li><li><a href="#flyandexturbo-help" data-toggle="pill"><i class="icon-help"></i> Информация для поддержки</a></li></ul>';
		$html[] = '<div class="tab-content">';
	
		// Tab #1 Start
		$html[] = '<div class="tab-pane active" id="flyandexturbo-main">';
		$html[] = '<div class="alert alert-info">';
		$html[] = '<h4>Лента Яндекс.Турбо</h4>';
		$html[] = '<p><a href="'.$link.'" target="_blank">'.$link.'</a></p>';
		$html[] = '<h4>Лента материалов Яндекс.Турбо</h4>';
		$html[] = '<p><a href="'.$link.'&mode=items" target="_blank">'.$link.'&mode=items</a></p>';
		$html[] = '<h4>Лента категорий Яндекс.Турбо</h4>';
		$html[] = '<p><a href="'.$link.'&mode=categories" target="_blank">'.$link.'&mode=categories</a></p>';
		$html[] = '</div>';
		$html[] = '</div>';
		// Tab #1 End

		// Tab #2 Start
		$html[] = '<div class="tab-pane" id="flyandexturbo-pro">';
		$html[] = '<div class="alert alert-info">';
		$html[] = '<h4>Отображение модулей</h4>';
		$html[] = '<p>До материала - позиция <b>fl-yandex-turbo-top</b></p>';
		$html[] = '<p>После материала - позиция <b>fl-yandex-turbo-bottom</b></p>';
		$html[] = '<h4>Служебные тэги и метки</h4>';
		$html[] = '<p>Отключение формы в определенном материале - добавление в тело материала метки <b>{flyandexturbo_no_form}</b></p>';
		$html[] = '<p>Удаление опеределенного тэга из материала - добавление к тэгу класса <b>noflyandexturbo</b></p>';
		$html[] = '<h4>Пагинация ленты</h4>';
		$html[] = '<p>Для разбиения ленты на страницы к адресу ленты нужно добавить параметр <b>&page=2</b> c номером нужной страницы.</p>';
		$html[] = '<h4>Отображение только материалов</h4>';
		$html[] = '<p>Для того, чтобы в ленту попадали только материалы, без категорий, к адресу ленты нужно добавить параметр <b>&mode=items</b>.</p>';
		$html[] = '<h4>Отображение только категорий</h4>';
		$html[] = '<p>Для того, чтобы в ленту попадали только категории, без материалов, к адресу ленты нужно добавить параметр <b>&mode=categories</b>.</p>';
		$html[] = '<h4>Отображение ленты компонента</h4>';
		$html[] = '<p>Для того, чтобы в ленту попадали только страницы определенного компонента, к адресу ленты нужно добавить параметр <b>&component=content</b>, <b>&component=zoo</b> или <b>&component=k2</b> в зависимости от нужного компонента.</p>';
		$html[] = '<h4>Отображение ленты вручную добавленных страниц</h4>';
		$html[] = '<p>Для того, чтобы в ленту попадали только вручную добавленные страницы, к адресу ленты нужно добавить параметр <b>&component=custom</b>.</p>';
		$html[] = '</div>';
		$html[] = '</div>';
		// Tab #2 End

		// Tab #3 Start
		$html[] = '<div class="tab-pane" id="flyandexturbo-thanks">';
		$html[] = '<iframe src="https://money.yandex.ru/quickpay/shop-widget?writer=seller&targets=%D0%9F%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B6%D0%BA%D0%B0%20FL%20Yandex%20Turbo&targets-hint=&default-sum=200&button-text=12&payment-type-choice=on&hint=&successURL=https%3A%2F%2Ffictionlabs.ru%2Fthank-you&quickpay=shop&account=41001392723045" width="100%" height="222" frameborder="0" allowtransparency="true" scrolling="no"></iframe>';
		$html[] = '</div>';
		// Tab #3 End

		// Tab #4 Start
		$html[] = '<div class="tab-pane" id="flyandexturbo-help">';
		$html[] = '<div class="alert alert-info">';
		$html[] = '<ul>';
		$html[] = '<li><b>Версия Joomla:</b> '.JVERSION.'</li>';
		$html[] = '<li><b>Версия PHP:</b> '.phpversion().'</li>';
		$html[] = '<li><b>Адрес ленты:</b> '.$link.'</li>';
		$html[] = '</ul>';
		$html[] = '<p>Вышеуказанная информация сильно поможет и увеличит Ваши шансы получить бесплатную поддержку, если вдруг у Вас что-то не работает.</p>';
		$html[] = '<p>Бесплатная техническая поддержка по возможности оказывается в комментариях <a href="https://fictionlabs.ru/razrabotka/fl-yandex-turbo" target="_blank">на странице плагина</a>. Платная техническая поддержка, включая поддержку платных расширений плагина, оказывается на личной странице <a href="https://fictionlabs.ru" target="_blank">на сайте автора</a>.</p>';
		$html[] = '</div>';
		$html[] = '</div>';
		// Tab #4 End
		
		$html[] = '</div>';

		return implode('', $html);
	}

	// Get Input Function

	protected function getInput()
	{	
		$id 	= JFactory::getApplication()->input->getString('extension_id');
		$html 	= '<input type="hidden" name="' . $this->name . '" value="' . $this->getCode($id) . '"/>';
		return $html;
	}

	// Get Code

	protected function getCode($value)
	{	
		$code = substr(strrev(md5($value)), 0, 16);

		return $code;
	}
}