package game;

import awe6.core.AAssetManager;
import awe6.core.Context;
import awe6.core.View;
import awe6.interfaces.IView;
import pixi.core.sprites.Sprite;
import game.entities.Test;
import game.entities.Test2;

/**
 * ...
 * @author bedwardly-down
 */
class AssetManager extends AAssetManager {
	public var test1Entity(default, null):Test;
	public var test2Entity(default, null):Test2;
	public var overlayBackground(default, null):IView;
	public var overlayBackOver(default, null):IView;
	public var overlayBackUp(default, null):IView;
	public var overlayMuteOver(default, null):IView;
	public var overlayMuteUp(default, null):IView;
	public var overlayPauseOver(default, null):IView;
	public var overlayPauseUp(default, null):IView;
	public var overlayUnmuteOver(default, null):IView;
	public var overlayUnmuteUp(default, null):IView;
	public var overlayUnpauseOver(default, null):IView;
	public var overlayUnpauseUp(default, null):IView;

	override private function _init():Void {
		super._init();
		test1Entity = _createTest1Entity();
		test2Entity = _createTest2Entity();
		overlayBackground = _createView(OVERLAY_BACKGROUND);
		overlayBackUp = _createView(OVERLAY_BACK_UP);
		overlayBackOver = _createView(OVERLAY_BACK_OVER);
		overlayMuteUp = _createView(OVERLAY_MUTE_UP);
		overlayMuteOver = _createView(OVERLAY_MUTE_OVER);
		overlayUnmuteUp = _createView(OVERLAY_UNMUTE_UP);
		overlayUnmuteOver = _createView(OVERLAY_UNMUTE_OVER);
		overlayPauseUp = _createView(OVERLAY_PAUSE_UP);
		overlayPauseOver = _createView(OVERLAY_PAUSE_OVER);
		overlayUnpauseUp = _createView(OVERLAY_UNPAUSE_UP);
		overlayUnpauseOver = _createView(OVERLAY_UNPAUSE_OVER);
	}

	private function _createTest1Entity():Test {
		var l_sprite:Sprite = new Sprite(_kernel.assets.getAsset(Assets.entities_player__png).texture);
		return new Test(_kernel, l_sprite);
	}

	private function _createTest2Entity():Test2 {
		var l_sprite:Sprite = new Sprite(_kernel.assets.getAsset(Assets.entities_crate__png).texture);
		return new Test2(_kernel, l_sprite);
	}

	private function _createView(p_type:EAsset):IView {
		var l_context:Context = new Context();
		var l_url:String = switch (p_type) {
			case OVERLAY_BACKGROUND: Assets.overlay_OverlayBackground__png;
			case OVERLAY_BACK_UP: Assets.overlay_buttons_BackUp__png;
			case OVERLAY_BACK_OVER: Assets.overlay_buttons_BackOver__png;
			case OVERLAY_MUTE_UP: Assets.overlay_buttons_MuteUp__png;
			case OVERLAY_MUTE_OVER: Assets.overlay_buttons_MuteOver__png;
			case OVERLAY_UNMUTE_UP: Assets.overlay_buttons_UnmuteUp__png;
			case OVERLAY_UNMUTE_OVER: Assets.overlay_buttons_UnmuteOver__png;
			case OVERLAY_PAUSE_UP: Assets.overlay_buttons_PauseUp__png;
			case OVERLAY_PAUSE_OVER: Assets.overlay_buttons_PauseOver__png;
			case OVERLAY_UNPAUSE_UP: Assets.overlay_buttons_UnpauseUp__png;
			case OVERLAY_UNPAUSE_OVER: Assets.overlay_buttons_UnpauseOver__png;
		}
		var l_sprite = new Sprite(_kernel.assets.getAsset(l_url).texture);
		l_context.addChild(l_sprite);
		return new View(_kernel, l_context);
	}
}

enum EAsset {
	OVERLAY_BACKGROUND;
	OVERLAY_BACK_UP;
	OVERLAY_BACK_OVER;
	OVERLAY_MUTE_UP;
	OVERLAY_MUTE_OVER;
	OVERLAY_UNMUTE_UP;
	OVERLAY_UNMUTE_OVER;
	OVERLAY_PAUSE_UP;
	OVERLAY_PAUSE_OVER;
	OVERLAY_UNPAUSE_UP;
	OVERLAY_UNPAUSE_OVER;
}
