/*
 * Copyright (C) 2025 Mobile Porting Team
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

package mobile.funkin.backend.system.input;

#if TOUCH_CONTROLS
import flixel.system.macros.FlxMacroUtil;

/**
 * A high-level list of unique values for mobile input buttons.
 * Maps enum values and strings to unique integer codes
 * @author Karim Akra
 */
@:runtimeValue
enum abstract MobileInputID(Int) from Int to Int
{
	public static var fromStringMap(default, null):Map<String, MobileInputID> = FlxMacroUtil.buildMap("mobile.funkin.backend.system.input.MobileInputID");
	public static var toStringMap(default, null):Map<MobileInputID, String> = FlxMacroUtil.buildMap("mobile.funkin.backend.system.input.MobileInputID", true);
	// Nothing & Anything
	var ANY = -2;
	var NONE = -1;
	// Touch Pad Buttons
	var A = 0;
	var B = 1;
	var C = 2;
	var D = 3;
	var E = 4;
	var F = 5;
	var G = 6;
	var H = 7;
	var I = 8;
	var J = 9;
	var K = 10;
	var L = 11;
	var M = 12;
	var N = 13;
	var O = 14;
	var P = 15;
	var Q = 16;
	var R = 17;
	var S = 18;
	var T = 19;
	var U = 20;
	var V = 21;
	var W = 22;
	var X = 23;
	var Y = 24;
	var Z = 25;
	// Touch Pad Directional Buttons
	var UP = 26;
	var UP2 = 27;
	var DOWN = 28;
	var DOWN2 = 29;
	var LEFT = 30;
	var LEFT2 = 31;
	var RIGHT = 32;
	var RIGHT2 = 33;
	// Hitbox Hints
	var HITBOX_UP = 34;
	var HITBOX_DOWN = 35;
	var HITBOX_LEFT = 36;
	var HITBOX_RIGHT = 37;
	// Extra Hints
	var EXTRA_1 = 38;
	var EXTRA_2 = 39;

	@:from
	public static inline function fromString(s:String)
	{
		s = s.toUpperCase();
		return fromStringMap.exists(s) ? fromStringMap.get(s) : NONE;
	}

	@:to
	public inline function toString():String
	{
		return toStringMap.get(this);
	}
}
#end