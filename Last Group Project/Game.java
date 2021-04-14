import java.awt.*;
import java.io.*;
import java.awt.event.*;  // Uses AWT's Event Handlers
import javax.swing.*;     // Uses Swing's Container/Components
import java.applet.*;

class Game
{
	public static void main(String[] args)
	{
		Layout testframe = new Layout();
		testframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		testframe.setSize(800,500);
		testframe.setVisible(true);
	}
}