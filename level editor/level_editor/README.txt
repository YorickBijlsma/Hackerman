This aims to be a compact reference guide for the level editor.


	Usage:				Keyboard:
					press 'r', 'g', 'b' to switch colours (red, green, blue)
	To design levels,		press 'c' to clear the screen if any rectangles get stuck (known glitch)
	you can define rectangles.	press 'q' to quit, and receive all coordinates you defined



	Clicking anywhere in the screen once defines the x and y coordinate of your new rect.

	It is very important to remember that rectangles are drawn from the top left corner,
	so your first click will define the position of the top left corner of your rectangle.

	The second click defines the width, so move your mouse to the right, and click wherever
	you want the horizontal length of your rectangle to end.

	The third and last click defines the height. Move your mouse down, and click to complete
	the rectangle.

	A quick way to do this, is to click once to define the upper left corner, then move your mouse
	to the right and downwards, and click twice on a square. This will define the width and height
	to match the square to where you clicked.

	Right click on any rectangle to remove it.



		Player definition:

		Press 'p' to switch to editing Player. The first Player rectangle you define will be
		the position the Main Player rectangle has to be in to complete the level. It will be
		distinguished by a unique colour.

		The second Player rectangle you define will be the position of the Main Player rectangle.
		This is the most important rectangle of Player. Its coordinates will be compared against the
		requirement coordinates defined in the first Player rectangle. If they are the same, it is
		certain the player is in the correct spot, and the level is done.

		The rest of the slots in the playerCoords array can be filled with rectangles to make the Player
		look more complex. These rectangles will look and move the same as the Main Player rectangle,
		giving the impression the whole shape is checked.

	
	tips:
		zorg er voor dat de vorm die je voor Player maakt past in de puzzelvorm die je maakt.
		zorg er voor dat de Main rectangle van Player past in de requirement rectangle.
		zorg er voor dat, als de puzzel af is, de hele Player vorm goed past in je puzzel.

gl m8
		