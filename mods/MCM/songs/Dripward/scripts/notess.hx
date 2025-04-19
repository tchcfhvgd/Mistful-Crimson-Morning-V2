function onNoteCreation(event) {
	event.cancel();
	var note = event.note;

	if (!event.cancel) {
		switch (event.noteType) {
			default:
				note.frames = Paths.getFrames('game/notes/mobile_notes');
				switch (event.strumID % 4) {
					case 0:
						note.animation.addByPrefix('scroll', 'purple0');
						note.animation.addByPrefix('hold', 'purple hold piece');
						note.animation.addByPrefix('holdend', 'pruple end hold');
					case 1:
						note.animation.addByPrefix('scroll', 'blue0');
						note.animation.addByPrefix('hold', 'blue hold piece');
						note.animation.addByPrefix('holdend', 'blue hold end');
					case 2:
						note.animation.addByPrefix('scroll', 'green0');
						note.animation.addByPrefix('hold', 'green hold piece');
						note.animation.addByPrefix('holdend', 'green hold end');
					case 3:
						note.animation.addByPrefix('scroll', 'red0');
						note.animation.addByPrefix('hold', 'red hold piece');
						note.animation.addByPrefix('holdend', 'red hold end');
				}
				note.scale.set(0.7, 0.7);
				note.updateHitbox();
		}
	}
}

function onStrumCreation(event) {
	event.cancel();
	var strum = event.strum;

	if (!event.cancel) {
		strum.frames = Paths.getFrames('game/notes/mobile_notes');
		strum.animation.addByPrefix('green', 'arrowUP');
		strum.animation.addByPrefix('blue', 'arrowDOWN');
		strum.animation.addByPrefix('purple', 'arrowLEFT');
		strum.animation.addByPrefix('red', 'arrowRIGHT');
		strum.antialiasing = true;
		strum.scale.set(0.7, 0.7);

		switch (event.strumID % 4) {
			case 0:
				strum.animation.addByPrefix("static", 'arrowLEFT0');
				strum.animation.addByPrefix("pressed", 'left press', 12, false);
				strum.animation.addByPrefix("confirm", 'left confirm', 24, false);
			case 1:
				strum.animation.addByPrefix("static", 'arrowDOWN0');
				strum.animation.addByPrefix("pressed", 'down press', 12, false);
				strum.animation.addByPrefix("confirm", 'down confirm', 24, false);
			case 2:
				strum.animation.addByPrefix("static", 'arrowUP0');
				strum.animation.addByPrefix("pressed", 'up press', 12, false);
				strum.animation.addByPrefix("confirm", 'up confirm', 24, false);
			case 3:
				strum.animation.addByPrefix("static", 'arrowRIGHT0');
				strum.animation.addByPrefix("pressed", 'right press', 12, false);
				strum.animation.addByPrefix("confirm", 'right confirm', 24, false);
		}
		strum.updateHitbox();
	}
}

function onPostNoteCreation(event) {
	var splashes = event.note;
	splashes.splash = "blank";
}


var foundStrum = false;

var splGroup:FlxTypedGroup;
function create() {
	//splGroup = new FlxTypedGroup();

	PlayState.instance.strumLines.members[1].onHit.add(function(event) {
		var spl = new FlxSprite(0, 0).loadGraphic(Paths.image('game/splashes/mobile'));
		spl.cameras = [camHUD];
		spl.scale.set(0.1,0.1);
		spl.x = -100 + event.direction * 90;
		spl.y = -200;
		spl.alpha = 1;
		spl.velocity.y = 500;
		add(spl);
		FlxTween.tween(spl, {alpha: 0}, 0.8, {ease: FlxEase.sineOut});
		//splGroup.insert(0,spl);
	});
}