package game.scenes;

import awe6.interfaces.EScene;
import awe6.interfaces.IKernel;

/**
 * ...
 * @author bedwardly-down
 */
class Intro extends AScene {
	// passthru constructor needed as workaround for a JS compile time bug
	public function new(p_kernel:IKernel, p_type:EScene, p_isPauseable:Bool = false, p_isMuteable:Bool = true, p_isSessionSavedOnNext:Bool = false) {
		super(p_kernel, p_type, p_isPauseable, p_isMuteable, p_isSessionSavedOnNext);
	}

	override private function _init():Void {
		super._init();
		// extend / addentities
		_title.text = "INTRO";
	}

	override private function _updater(p_deltaTime:Int = 0):Void {
		super._updater(p_deltaTime);
		// example:
		if (_kernel.inputs.keyboard.getIsKeyRelease(_kernel.factory.keyNext)) {
			_kernel.scenes.next();
		}
	}
}
