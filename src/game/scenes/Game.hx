package game.scenes;

import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;
import echo.Echo;
import echo.World;
import game.entities.Test;
import game.entities.Test2;

/**
 * ...
 * @author bedwardly-down
 */
class Game extends AScene {
	private var _world:World;
	private var _test1:Test;
	private var _test2:Test2;

	// passthru constructor needed as workaround for a JS compile time bug
	public function new(p_kernel:IKernel, p_type:EScene, p_isPauseable:Bool = false, p_isMuteable:Bool = true, p_isSessionSavedOnNext:Bool = false) {
		super(p_kernel, p_type, p_isPauseable, p_isMuteable, p_isSessionSavedOnNext);
	}

	override private function _init():Void {
		super._init();
		isPauseable = true;
		// extend / addentities
		_title.text = "GAME";

		var _kf = _kernel.factory;
		_world = Echo.start({
			width: _kf.width,
			height: _kf.height,
			iterations: 2
		});
		_test1 = _assetManager.test1Entity;
		_test2 = _assetManager.test2Entity;

		addEntity(_test1, true, 1);
		addEntity(_test2, true, 1);

		_world.listen(_test1.getBody(), _test2.getBody());
	}

	override private function _updater(dT:Int = 0):Void {
		super._updater(dT);
		_world.step(dT);
		// echo.util.Debug.log(_world);
	}

	override private function _disposer():Void {
		super._disposer();
	}
}
