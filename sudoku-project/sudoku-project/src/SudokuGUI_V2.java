import javax.naming.SizeLimitExceededException;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.Random;
import javax.swing.border.Border;
import java.awt.geom.*;
import javax.swing.JLayeredPane;

/*
 * Sudoku Puzzle Created By: Mohammad Habib and Mubashar Khan
 * COSC 1430 FALL 2018
 * DUE: November 30 @ 11:59 PM
 */


public class SudokuGUI_V2 extends JFrame implements ActionListener
{
    public static final int width = 400;
    public static final int height = 400;
    public static final int dimension = 9;
    private int [][] solution; //stores solution to matrix to compare to use input values.
    private int [][] inputCheck; //to check user input
    private JTextField textField[][] = new JTextField[dimension][dimension];
    private JLabel puzzleSolved;
    private long startTime;
    private long endTime;
	private String[] sudokuFiles = {"samplesudoku1.txt", "samplesudoku2.txt", "samplesudoku3.txt", "samplesudoku4.txt"};

    //Main
    public static void main(String[] args)
    {
        SudokuGUI_V2 gui = new SudokuGUI_V2();
        gui.setVisible(true);
    }

    //GUI

    public SudokuGUI_V2()
    {
        super("SUDOKU");
        setSize(width, height);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setResizable(false);
        setLayout(new BorderLayout());

        //Center Applet Window on Screen
      	Dimension window = Toolkit.getDefaultToolkit().getScreenSize();
	    setLocation((window.width - 400) >> 1,(window.height - 400) >> 1);

        //Creating empty matrix for board
        solution = new int[dimension][dimension];
		inputCheck = new int[dimension][dimension];

		int num = 0;

		Random randomfile = new Random();
		String fileName = sudokuFiles[randomfile.nextInt(4)]; //Chooses a random file from the 4 default Sudoku files we have in the directory
		//For testing with a certain file or a new file -> make sure to comment out the above line: String fileName = sudokuFiles[randomfile.nextInt(5)];
		//String fileName = "samplesudoku1.txt";

		try
		{
			Scanner scanner = new Scanner(new FileReader(fileName));
			while (scanner.hasNext())
			{
	    		for(int i=0; i < dimension; i++)
	    		{
		  	  		for(int j=0; j < dimension; j++)
		    		{
		        		num = scanner.nextInt();
		            	solution[i][j] = num;
		            	inputCheck[i][j] = num;
		        	}
		    	}
			}
			scanner.close();
		}
		catch(FileNotFoundException e)
		{
		    System.exit(1);
        }

        //Creating the grid panel
        JPanel gameBoard = new JPanel();

        gameBoard.setLayout(new GridLayout(dimension, dimension));
        gameBoard.setPreferredSize(new Dimension(300,300));
		gameBoard.setBorder(BorderFactory.createLineBorder(Color.BLACK,3));
		gameBoard.setBackground( Color.BLACK );


//Attempt to create 3x3 inner border design
//////////////////////////////////////////////////////////////////////////////////////
/*
		JPanel biggerGrid = new JPanel();
		biggerGrid.setLayout(new GridLayout(3,3));
		biggerGrid.setPreferredSize(new Dimension(100,100));
		biggerGrid.setBorder(BorderFactory.createLineBorder(Color.BLACK,3));

		JLayeredPane layeredPane = new JLayeredPane();
		layeredPane.setPreferredSize(new Dimension(100, 100));
		layeredPane.setBorder(BorderFactory.createLineBorder(Color.BLACK,3));
		layeredPane.setVisible(true);
*/
//////////////////////////////////////////////////////////////////////////////////////

        //MOVE RIGHT
        Set<AWTKeyStroke> old = gameBoard.getFocusTraversalKeys(KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS);
        HashSet<AWTKeyStroke> keys = new HashSet<AWTKeyStroke> (old);
        AWTKeyStroke ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_RIGHT, 0, true);
        keys.add(ks);
        gameBoard.setFocusTraversalKeys(KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS, keys);


        //MOVE LEFT
        old = gameBoard.getFocusTraversalKeys(KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS);
        keys = new HashSet<AWTKeyStroke> (old);
        ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_LEFT, 0, true);
        keys.add(ks);
        gameBoard.setFocusTraversalKeys(KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS, keys);


		Font font1 = new Font("Verdana", Font.BOLD, 20); //All the fonts look the same, but this does make the numbers bigger

        //filling out textfields with the input matrix
        for (int i = 0; i < dimension; i++)
        {
            for (int j = 0; j < dimension; j++)
            {
				//User input in sudoku grid
                textField[i][j] = new JTextField(2);
				textField[i][j].setFont(font1);
				textField[i][j].setHorizontalAlignment(JLabel.CENTER);

                if(solution[i][j] != 0)
                {
					//Predefined values provided by input file -> All non-zero cells are populated and set to uneditable.
                    textField[i][j].setText(Integer.toString(solution[i][j]));
                    textField[i][j].setHorizontalAlignment(JLabel.CENTER);
                    textField[i][j].setEditable(false);
                }
                else
                {
                    textField[i][j].setText("");
                }

                gameBoard.add(textField[i][j]);
            }
        }

        add(gameBoard,BorderLayout.NORTH);


        //Create buttons for the user to give up and check answers
        JPanel userActions = new JPanel();
        userActions.setLayout(new FlowLayout());

        //Give Up button
        JButton showSolutionButton = new JButton("GIVE UP");
        showSolutionButton.addActionListener(this);
        userActions.add(showSolutionButton);

        //Check button
        JButton checkButton = new JButton("CHECK");
        checkButton.addActionListener(this);
        userActions.add(checkButton);


        //Adding button panel to frame
        add(userActions,BorderLayout.CENTER);

        //Label panel
        JPanel labelPanel = new JPanel();
        labelPanel.setLayout(new FlowLayout());
        puzzleSolved = new JLabel("");
        labelPanel.add(puzzleSolved);
        add(labelPanel, BorderLayout.SOUTH);

        solve_sudoku(solution);//solve sudoku

       //start timer
        startTime = System.currentTimeMillis();
    }

    //valid_Placement method: check if entered number will fit in the puzzle
    public boolean valid_Placement(int value, int a, int b, int[][] puzzle)
    {
        for (int i = 0; i < dimension; i++)
        {
            if (puzzle[i][b] == value)
            {
                return false;
            }
        }

        for (int j = 0; j < dimension; j++)
        {
            if (puzzle[a][j] == value)
            {
                return false;
            }
        }


        int horizPos_1 = 3 * (a / 3);
        int vertiPos_1 = 3 * (b / 3);
        int horizPos_2 = horizPos_1 + 2;
        int vertiPos_2 = vertiPos_1 + 2;

        for (int x = horizPos_1; x <= horizPos_2; x++)
        {
            for (int y = vertiPos_1; y <= vertiPos_2; y++)
            {
                if (puzzle[x][y] == value)
				{
                    return false;
				}
			}
		}
        return true;
    }

    //Auto solve the sudoku puzzle
    public boolean solve_sudoku(int [][]puzzle)
    {
        for (int i = 0; i < 9 ; i++)
        {
            for (int j = 0; j < 9; j++)
            {
                if (puzzle[i][j] == 0)
                {
                    for (int x = 1; x < dimension + 1 ; x++)
                    {
                        if (valid_Placement(x, i, j,puzzle))
                        {
                            puzzle[i][j] = x;
                            if (solve_sudoku(puzzle))
                            {
                                return true;
                            }
                            else
                            {
                                puzzle[i][j] = 0;
                            }
                        }
                    }
                    return false;
                }
            }
        }
        return true;
    }

    public void Solve(int value, int a, int b)
    {
    	if (value == solution[a][b])
        {
            textField[a][b].setBackground(Color.GREEN);
            textField[a][b].setEditable(false);
        }
        else
        {
            Color lightBlue = new Color(66, 229, 244); //Better than default Color.BLUE
            textField[a][b].setBackground(lightBlue);
        }
    }

	//Method to check board when "C" is pressed
	/////////////////////////////////////////////////////////////////////
	public void keyPressed(KeyEvent e) //Does not work as intended.
	{
	    if (e.getKeyCode() == KeyEvent.VK_C)
	    {
			for(int i = 0; i < dimension; i++)
            {
                for (int j =0; j < dimension; j++)
                {
                    String text = textField[i][j].getText();
                    int numVal;
                    if(text.equals(""))
                    {
                        numVal = 0;
                    }
                    else
                    {
                        numVal = Integer.parseInt(text);
                    }
                    if(numVal != inputCheck[i][j])
                    {
                        int value = numVal;
                        int rowIndex = i;
                        int colIndex = j;
                        Solve(value, rowIndex, colIndex);
                    }
                }
            }
	    }
    }
	/////////////////////////////////////////////////////////////////////


    //manages CHECK and GIVE UP buttons
    public void actionPerformed(ActionEvent e)
    {
        String actionCommand = e.getActionCommand();
        if(actionCommand.equals("CHECK"))
        {
            for(int i = 0; i < dimension; i++)
            {
                for (int j =0; j < dimension; j++)
                {
                    String text = textField[i][j].getText();
                    int numVal;
                    if(text.equals(""))
                    {
                        numVal = 0;
                    }
                    else
                    {
                        numVal = Integer.parseInt(text);
                    }
                    if(numVal != inputCheck[i][j])
                    {
                        int value = numVal;
                        int rowIndex = i;
                        int colIndex = j;
                        Solve(value, rowIndex, colIndex);
                    }
                }
            }

            int count = 0;

            for(int i = 0; i < dimension; i++)
            {
                for (int j =0; j < dimension; j++)
                {
                    String text = textField[i][j].getText();
                    int numVal;

                    if(text.equals(""))
                    {
                        numVal = 0;
                    }
                    else
                    {
                        numVal = Integer.valueOf(text);
                    }

                    if( numVal== solution[i][j])
                    {
                        count++;
                    }
                }
            }
            if (count == 81)
            {
                endTime = System.currentTimeMillis();
                long duration = (endTime - startTime);

				long minutes = TimeUnit.MILLISECONDS.toMinutes(duration);
				duration -= TimeUnit.MINUTES.toMillis(minutes);
				long seconds = TimeUnit.MILLISECONDS.toSeconds(duration);

                puzzleSolved.setText("You completed the puzzle in : " + Long.toString(minutes) + " Minutes and " + Long.toString(seconds) + " Seconds");
            }
        }
        else if(actionCommand.equals("GIVE UP"))
        {
            for (int i = 0; i < dimension; i++)
            {
                for (int j = 0; j < dimension; j++)
                {
                    textField[i][j].setText(Integer.toString(solution[i][j]));
                }
            }
        }
    }
}
//END OF PROGRAM