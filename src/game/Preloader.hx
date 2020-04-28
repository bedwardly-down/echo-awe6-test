package game;

import awe6.core.APreloader;
import awe6.core.drivers.pixijs.extras.gui.Text;
import awe6.interfaces.ETextStyle;
import pixi.core.graphics.Graphics;

/**
 * ...
 * @author bedwardly-down
 */
class Preloader extends APreloader {
	private var _bg:Graphics;
	private var _fg:Graphics;

	override private function _init():Void {
		super._init();
		_bg = new Graphics();
		_bg.beginFill(0x202020);
		_bg.drawRect(-1, -1, 102, 12);
		_fg = new Graphics();
		_fg.beginFill(0xcccccc);
		_fg.drawRect(0, 0, 100, 10);
		_bg.x = _fg.x = (_kernel.factory.width - 100) * .5;
		_bg.y = _fg.y = (_kernel.factory.height - 10) * .5;
		_context.addChild(_bg);
		_context.addChild(_fg);
	}

	override private function _updater(p_deltaTime:Int = 0):Void {
		super._updater(p_deltaTime);
		_fg.scale.x = progress;
	}

	override private function _showAudioHoldMessage():Void {
		var l_text:Text = new Text(_kernel, _kernel.factory.width, 20, _kernel.getConfig("gui.preloaderComplete"),
			_kernel.factory.createTextStyle(ETextStyle.BODY));
		l_text.setPosition(0, _bg.y - 5);
		view.addChild(l_text.view);
		_context.removeChild(_bg);
		_context.removeChild(_fg);
	}
}
