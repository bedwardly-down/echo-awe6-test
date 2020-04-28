package game.entities;

import awe6.core.Context;
import awe6.core.Entity;
import awe6.interfaces.IKernel;
import awe6.interfaces.EKey;
import echo.Body;
import echo.shape.Circle;
import echo.Shape;
import pixi.core.sprites.Sprite;
import hxmath.math.Vector2;

/**
 * ..
 * @author bedwardly-down
 */
class Test extends Entity {
	private var _context:Context;
	private var _body:Body;
	private var _shape:Circle;
	private var _sprite:Sprite;
	private var _radius:Float = 25;
	private var _rotation:Float = 0.1;

	private var _velX:Float = 5;
	private var _velY:Float = 5;
	private var _offsetX:Float;
	private var _offsetY:Float;

	private var _anchorX:Float = 0.5;
	private var _anchorY:Float = 0.6;

	public function new(p_kernel:IKernel, l_sprite:Sprite) {
		_context = new Context();
		_sprite = l_sprite;
		super(p_kernel, _context);
	}

	override private function _init():Void {
		super._init();
		// extend here

		_offsetX = _radius / 2;
		_offsetY = _radius / 2;

		// Create Shape
		{
			_shape = Shape.circle();
			_shape.radius = _radius;
			// _shape.set_local_position(new Vector2(_anchorX, _anchorY));
		}

		// Create Body
		{
			_body = new Body();
			_body.set_position(_kernel.factory.width / 2, _kernel.factory.height / 2);
			_body.add_shape(_shape);
		}

		// Create Sprite
		{
			_sprite.anchor.x = _anchorX;
			_sprite.anchor.y = _anchorY;
			_sprite.width = _shape.diameter;
			_sprite.height = _shape.diameter;
			_sprite.position.x = _body.x + _offsetX;
			_sprite.position.y = _body.y + _offsetY;
		}

		_context.addChild(_sprite);
	}

	public function getBody():Body {
		return _body;
	}

	override private function _updater(dT:Int = 0):Void {
		super._updater(dT);
		// extend here

		// Rotate Test
		{
			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.LEFT)) {
				_body.shape.rotation -= _rotation;
			}
			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.RIGHT)) {
				_body.shape.rotation += _rotation;
			}

			_sprite.rotation = _body.shape.rotation;
		}

		// Move Forward / Backward
		{
			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.W)) {
				_body.y -= _velY;
			}

			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.S)) {
				_body.y += _velY;
			}
			_sprite.position.y = _body.y + _offsetY;
		}

		// Move Right / Left
		{
			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.A)) {
				_body.x -= _velX;
			}

			if (_kernel.inputs.keyboard.getIsKeyDown(EKey.D)) {
				_body.x += _velX;
			}

			_sprite.position.x = _body.x + _offsetX;
		}

		#if db
		{
			trace("Body Position - " + _body.x + ":" + _body.y);
			trace("Sprite Position - " + _sprite.position.x + ":" + _sprite.position.y);
		}
		#end
	}

	override private function _disposer():Void {
		// extend here
		super._disposer();
	}
}
