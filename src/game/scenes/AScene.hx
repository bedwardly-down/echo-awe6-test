package game.scenes;

import awe6.core.Scene;
import awe6.core.drivers.pixijs.extras.gui.Text;
import awe6.interfaces.ETextStyle;
import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import game.AssetManager;
import game.Session;

/**
 * ...
 * @author bedwardly-down
 */
class AScene extends Scene {
	private var _assetManager:AssetManager;
	private var _session:Session;
	private var _title:Text;

	// passthru constructor needed as workaround for a JS compile time bug
	public function new(p_kernel:IKernel, p_type:EScene, p_isPauseable:Bool = false, p_isMuteable:Bool = true, p_isSessionSavedOnNext:Bool = false) {
		super(p_kernel, p_type, p_isPauseable, p_isMuteable, p_isSessionSavedOnNext);
	}

	override private function _init():Void {
		super._init();
		_assetManager = cast(_kernel.assets, AssetManager);
		_session = cast(_kernel.session, Session);
		addEntity(_title = new Text(_kernel, _kernel.factory.width - 10, 35, "", _kernel.factory.createTextStyle(ETextStyle.HEADLINE)), true);
		_title.setPosition(10, _kernel.factory.height - _title.height);
	}
}
