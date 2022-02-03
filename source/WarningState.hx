package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class WarningState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";
	public static var currChanges:String = "dk";
	
	private var bgColors:Array<String> = [
		'#314d7f',
		'#4e7093',
		'#70526e',
		'#594465'
	];
	private var colorRotation:Int = 1;

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('warning_screen', 'shared'));
		bg.scale.x *= 1.00;
		bg.scale.y *= 1.00;
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);
		
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"\n\nWatch out!\n\n"
			+ "\nThis mod contains flashing lights"
			+ "\nAnd you can't turn them off"
			+ "\nPlay at your own risk!\n"
			+ "\n\nPress ENTER to continue\n\n",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);

    }
	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxG.camera.fade(FlxColor.BLACK, 0.95, false);
			new FlxTimer().start(0.95, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new MainMenuState());
				});
		}
		super.update(elapsed);
	}
}