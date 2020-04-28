package game.entities;

import awe6.core.Context;
import awe6.core.Entity;
import awe6.interfaces.IKernel;
import echo.Body;
import echo.Shape;
import echo.shape.Rect;
import pixi.core.sprites.Sprite;

/**
 * ...
 * @author bedwardly-down
 */
class Test2 extends Entity {
	private var _context:Context;
	private var _x:Float = 100;
	private var _y:Float = 50;
	private var _w:Float = 25;
	private var _body:Body;
	private var _shape:Rect;
	private var _sprite:Sprite;

	public function new(p_kernel:IKernel, l_sprite:Sprite) {
		_context = new Context();
		_sprite = l_sprite;
		super(p_kernel, _context);
	}

	override private function _init():Void {
		super._init();
		// extend here

		// Create Shape
		{
			_shape = Shape.rect();
			_shape.width = _w;
			_shape.height = _w;
		}

		// Create Body
		{
			_body = new Body();
			_body.set_position(_x, _y);
			_body.add_shape(_shape);
		}

		// Create Sprite
		{
			_sprite.width = _shape.width;
			_sprite.height = _shape.height;
			_sprite.position.x = _body.x;
			_sprite.position.y = _body.y;
		}

		_context.addChild(_sprite);
	}

	public function getBody():Body {
		return _body;
	}

	override private function _updater(p_deltaTime:Int = 0):Void {
		super._updater(p_deltaTime);
		// extend here
		_sprite.position.x = _body.x;
		_sprite.position.y = _body.y;
	}

	override private function _disposer():Void {
		// extend here
		super._disposer();
	}
}
