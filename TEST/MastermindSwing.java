import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MastermindSwing extends Canvas implements MouseListener, ActionListener
{
  private static final int ROWS = 20;
  private int dw, dh, currentColor, currentRow;
  private Color colors[] = { Color.white, Color.black, Color.blue, Color.gray, Color.green, Color.yellow, Color.magenta, Color.orange, Color.pink, Color.red }; //Color.red, Color.green, Color.blue, Color.cyan, Color.magenta, Color.yellow };
  private String colorName[] = {"WHITE","BLACK","BLUE","GRAY","GREEN","YELLOW","MAGENTA","ORANGE","PINK","RED"};
  private Color guesses[][] = new Color[ROWS][6];

  public void actionPerformed( ActionEvent e )
  {
    currentRow++;
  }

  public void mousePressed( MouseEvent e )
  {
    int x = e.getX(), y = e.getY();
    if (y < dh*(ROWS+1)+dh/2)
    {           // click in a column to
      x = (x - dw) / dw;                  // place a color
      guesses[currentRow][x] = colors[currentColor];
      repaint();
    }
  }
  public void mouseEntered(  MouseEvent e ) { }
  public void mouseExited(   MouseEvent e ) { }
  public void mouseClicked(  MouseEvent e ) { }
  public void mouseReleased( MouseEvent e ) { }

  public void paint( Graphics g )
  {
    dw = (int) 30;
    dh = (int) 30;
    fillBoard( g );
    drawBoard( g );
  }

  private void fillBoard( Graphics g )
  {
    for (int i=0; i <= currentRow; i++)
      for (int j=0; j < 6; j++)
      {
        g.setColor( guesses[i][j] );
        g.fillRect( dw*(j+1), dh*(i+1), 40, 20 );
  	  }
  }

  private void drawBoard( Graphics g )
  {
    g.setColor( Color.gray );
    // draw the rows
    Graphics2D g2 = (Graphics2D) g;
    g2.setStroke(new BasicStroke(5));
    for (int i=0; i < ROWS+1; i++)
      g2.drawLine( dw, dh*(i+1), 6*dw, dh*(i+1) );
    // draw the columns
    for (int i=0; i <=  6; i++)
      g2.drawLine( dw*(i+1), dh, dw*(i+1), (ROWS+1)*dh );

    // draw the color palette
    for (int i=0; i < 5; i++)
    {
      g.setColor( colors[i] );
      g.drawRect( i*90, 10, 80, 40 );
      g.setColor(Color.black);
      g.drawString(colorName[i],i*90+20, 35);
  	}
  	for (int i=5; i < 10; i++)
	{
	   g.setColor( colors[i] );
	   g.drawRect( (i-5)*90, 60, 80, 40 );
	   g.setColor(Color.black);
	   g.drawString(colorName[i],(i-5)*90+20, 85);
  	}
  }

  public MastermindSwing()
  {
    for (int i=0; i < guesses.length; i++)
      for (int j=0; j < 6; j++)
        guesses[i][j] = Color.white;

    JFrame frame = new JFrame( "Mastermind" );
    frame.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
    setBackground( Color.white );

    JButton submit = new JButton( "Submit guess" );
    submit.addActionListener( this );
    addMouseListener( this );

    frame.getContentPane().add( this );
    frame.getContentPane().add( submit, BorderLayout.SOUTH );

    frame.setSize( new Dimension( 800, 800 ) );
    frame.setVisible( true );
  }

  public static void main( String[] args )
  {
    new MastermindSwing();
  }
}
