package funkin.options.categories;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import funkin.backend.MusicBeatState;
import funkin.options.Options;
import lime.system.System as LimeSystem;
#if android
import mobile.funkin.backend.utils.StorageUtil;
#end
#if sys
import sys.io.File;
#end

class MobileOptions extends OptionsScreen {
	var canEnter:Bool = true;

	public override function new() {
		dpadMode = 'LEFT_FULL';
		actionMode = 'A_B';
		super("Mobile", 'Change Mobile Related Things such as Controls alpha, screen timeout....', null, 'LEFT_FULL', 'A_B');
		#if TOUCH_CONTROLS
		add(new ArrayOption(
			"Extra Hints",
			"Select how many extra hints you prefer to have on hitbox",
			['NONE', 'SINGLE', 'DOUBLE'],
			["None", "Single", "Double"],
			'extraHints'));
		add(new NumOption(
			"Hitbox Opacity",
			"Change how opaque the Hitbox should be",
			0.0,
			1.0,
			0.1,
			"hitboxAlpha"));
		add(new Checkbox(
			"Use Old Pad Texture",
			"If checked, the TouchPad will use the old texture it used before",
			"oldPadTexture"));
		add(new NumOption(
			"TouchPad Opacity",
			"Change how opaque the TouchPad should be",
			0.0,
			1.0,
			0.1,
			"touchPadAlpha",
			changeTouchPadAlpha));
		add(new ArrayOption(
			"Hitbox Design",
			"Choose how your Hitbox should look like!",
			['noGradient', 'noGradientOld', 'gradient', 'hidden'],
			["No Gradient", "No Gradient (Old)", "Gradient", "Hidden"],
			'hitboxType'));
		add(new Checkbox(
			"Hitbox Position",
			"If checked, the Hitbox will be put at the bottom of the screen, otherwise will stay at the top.",
			"hitboxPos"));
		#end
		#if mobile
		add(new Checkbox(
			"Allow Screen Timeout",
			"If checked, The phone will enter sleep mode if the player is inactive.",
			"screenTimeOut"));
		#end
	}

	override function changeSelection(el:Int, force:Bool = false) {
		#if mobile
		final lastScreenTimeOut:Bool = Options.screenTimeOut;
		if (lastScreenTimeOut != Options.screenTimeOut) LimeSystem.allowScreenTimeout = Options.screenTimeOut;
		#end
		#if TOUCH_CONTROLS
		final lastOldPadTexture:Bool = Options.oldPadTexture;
		if (lastOldPadTexture != Options.oldPadTexture)
		{
			MusicBeatState.getState().removeTouchPad();
			MusicBeatState.getState().addTouchPad("LEFT_FULL", "A_B");
		}
		#end
		super.changeSelection(el, force);
	}

	function changeTouchPadAlpha(alpha) {
		#if TOUCH_CONTROLS
		MusicBeatState.getState().touchPad.alpha = alpha;
		if (funkin.backend.system.Controls.instance.touchC) {
			FlxG.sound.volumeUpKeys = [];
			FlxG.sound.volumeDownKeys = [];
			FlxG.sound.muteKeys = [];
		} else {
			FlxG.sound.volumeUpKeys = [FlxKey.PLUS, FlxKey.NUMPADPLUS];
			FlxG.sound.volumeDownKeys = [FlxKey.MINUS, FlxKey.NUMPADMINUS];
			FlxG.sound.muteKeys = [FlxKey.ZERO, FlxKey.NUMPADZERO];
		}
		#end
	}
}
