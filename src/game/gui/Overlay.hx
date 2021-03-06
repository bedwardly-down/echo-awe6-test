package game.gui;

import awe6.core.BasicButton;
import awe6.interfaces.EOverlayButton;
import awe6.interfaces.IKernel;
import game.AssetManager;

/**
 * ...
 * @author bedwardly-down
 */
class Overlay extends awe6.core.Overlay {
	private var _assetManager:AssetManager;
	private var _buttonSize:Float;

	// private var _buttonRestart:BasicButton;

	public function new(p_kernel:IKernel) {
		_assetManager = cast(p_kernel.assets, AssetManager);
		_buttonSize = 30;
		super(p_kernel, _buttonSize, _buttonSize, _assetManager.overlayBackground, _assetManager.overlayBackUp, _assetManager.overlayBackOver,
			_assetManager.overlayMuteUp, _assetManager.overlayMuteOver, _assetManager.overlayUnmuteUp, _assetManager.overlayUnmuteOver,
			_assetManager.overlayPauseUp, _assetManager.overlayPauseOver, _assetManager.overlayUnpauseUp, _assetManager.overlayUnpauseOver);
	}

	override private function _init():Void {
		super._init();
		var l_x:Float = _kernel.factory.width - 10 - (3 * _buttonSize);
		var l_y:Float = _kernel.factory.height - _buttonSize;
		positionButton(BACK, l_x, l_y);
		positionButton(PAUSE, l_x += _buttonSize, l_y);
		positionButton(UNPAUSE, l_x, l_y);
		positionButton(MUTE, l_x += _buttonSize, l_y);
		positionButton(UNMUTE, l_x, l_y);
		// extend - e.g:
		// _buttonRestart = new BasicButton( _kernel, _assetManager.overlayRestartUp, _assetManager.overlayRestartOver, _buttonSize, _buttonSize, 0, 0, null, callback( activateButton, EOverlayButton.SUB_TYPE( "RESTART" ) ) );
		// addEntity( _buttonRestart, true, 20 );
	}

	override private function _getButton(p_type:EOverlayButton):BasicButton {
		switch (p_type) {
			case SUB_TYPE(p_value):
				switch (p_value) {
					// case "RESTART" :
					//	return _buttonRestart;
					default:
						p_value;
						null;
				}
			default:
				null;
		}
		return super._getButton(p_type);
	}

	override public function hideButtons():Void {
		super.hideButtons();
		// extend
	}

	override public function activateButton(p_type:EOverlayButton):Void {
		switch (p_type) {
			case SUB_TYPE(p_value):
				switch (p_value) {
					// case "RESTART" : if ( _buttonPause.view.isInViewStack )
					// {
					// 	_kernel.scenes.restart();
					// }
					default:
						p_value;
						null;
				}
			default:
				null;
		}
		super.activateButton(p_type);
	}
}
