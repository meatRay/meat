import meatbox.window;
//import meatbox.textbox;
import meatbox.imagebox;
import std.stdio;
import derelict.sdl2.sdl;

void main()
{
	auto wndw =new GameWindow("wndw", 300, 300, 600, 450);
	wndw.image =new Imagebox( `C:\D\Projects\winda\Actor.png` );
	wndw.image.x =20;
	wndw.image.y =20;
	
	wndw.run();
}

class GameWindow: Window
{
public:
	Imagebox image;
	/++Construct a new GameWindow, with a title, position, and size.+/
	this( string title, int x, int y, int width, int height)
		{ 
			super( title, x, y, width,height); 
		}
protected:
	/++
	+ Begin openGl, and ask the Grid to render.
	+ See_Also: meat.window.Window.render()
	+/
	override void render()
	{
		glClear( GL_COLOR_BUFFER_BIT );
		Imagebox.startRender();
		image.render();
		Imagebox.endRender();
	}
	/++
	+ Calculate openGl matrices.
	+ See_Also: meat.window.Window.load()
	+/
	override void load()
	{
		debug writefln( "Beginning load");
		
		glClearColor( 0.317, 0.639, 0.152, 1.0);
		
		glViewport( 0, 0, width, height);
		glMatrixMode( GL_PROJECTION);
		glLoadIdentity();
		glOrtho(0, width, height, 0, -1f, 1f);
		glMatrixMode( GL_MODELVIEW);
	}
	/++
	+ Recalulate openGl matrices.
	+ See_Also: meat.window.Window.resize()
	+/
	override void resize()
	{
		debug writefln( "resizing to  %d, by %d. Ratio of %2f", width, height, aspectRatio );
		glViewport( 0, 0, width, height );
		glMatrixMode( GL_PROJECTION );
		glLoadIdentity();
		glOrtho(0, width, height, 0, -1f, 1f);
		glMatrixMode( GL_MODELVIEW );
	}
}
