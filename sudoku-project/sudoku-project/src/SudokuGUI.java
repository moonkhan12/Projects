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

/*
 * Sudoku Puzzle Created By: Mohammad Habib and Mubashar Khan
 * COSC 1430 FALL 2018
 * DUE: November 30
 */


public class SudokuGUI extends JFrame implements ActionListener
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
        SudokuGUI gui = new SudokuGUI();
        gui.setVisible(true);
    }

    //GUI

    public SudokuGUI()
    {
        super("SUDOKU");
        setSize(width, height);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setResizable(false);
        setLayout(new BorderLayout());
      	Dimension window = Toolkit.getDefaultToolkit().getScreenSize();
	    setLocation((window.width - 400) >> 1,(window.height - 400) >> 1);

        //Creating empty matrix for board
        solution = new int[dimension][dimension];
		inputCheck = new int[dimension][dimension];
		int num = 0;

		Random randomfile = new Random();
		String fileName = sudokuFiles[randomfile.nextInt(4)];
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
			System.out.println(e.getMessage());
		    System.out.println(e);
		    System.exit(1);
        }

        //Creating the grid panel
        JPanel gridPanel = new JPanel();

        gridPanel.setLayout(new GridLayout(dimension, dimension));
        gridPanel.setPreferredSize(new Dimension(300,300));
		gridPanel.setBorder(BorderFactory.createLineBorder(Color.BLACK,3));
		gridPanel.setBackground( Color.BLACK );

		JPanel biggerGrid = new JPanel();
		biggerGrid.setLayout(new GridLayout(3,3));
		biggerGrid.setPreferredSize(new Dimension(300,300));
		biggerGrid.setBorder(BorderFactory.createLineBorder(Color.BLACK,3));


        //MOVE RIGHT
        Set<AWTKeyStroke> old = gridPanel.getFocusTraversalKeys(KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS);
        HashSet<AWTKeyStroke> keys = new HashSet<AWTKeyStroke> (old);
        AWTKeyStroke ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_RIGHT, 0, true);
        keys.add(ks);
        gridPanel.setFocusTraversalKeys(KeyboardFocusManager.FORWARD_TRAVERSAL_KEYS, keys);


        //MOVE LEFT
        old = gridPanel.getFocusTraversalKeys(KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS);
        keys = new HashSet<AWTKeyStroke> (old);
        ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_LEFT, 0, true);
        keys.add(ks);
        gridPanel.setFocusTraversalKeys(KeyboardFocusManager.BACKWARD_TRAVERSAL_KEYS, keys);

        //MOVE DOWN
        /* //Not Working as Intended
        old = gridPanel.getFocusTraversalKeys(KeyboardFocusManager.DOWN_CYCLE_TRAVERSAL_KEYS);
        keys = new HashSet<AWTKeyStroke> (old);
        ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_DOWN, 0, true);
        keys.add(ks);
        gridPanel.setFocusTraversalKeys(KeyboardFocusManager.DOWN_CYCLE_TRAVERSAL_KEYS, keys);
		*/

        //MOVE UP
        /* //Not Working as Intended
        old = gridPanel.getFocusTraversalKeys(KeyboardFocusManager.UP_CYCLE_TRAVERSAL_KEYS);
        keys = new HashSet<AWTKeyStroke> (old);
        ks = AWTKeyStroke.getAWTKeyStroke(KeyEvent.VK_UP, 0, true);
        keys.add(ks);
        gridPanel.setFocusTraversalKeys(KeyboardFocusManager.UP_CYCLE_TRAVERSAL_KEYS, keys);
		*/

		Font font1 = new Font("Verdana", Font.BOLD, 20);

        //filling out textfields with the input matrix
        for (int i = 0; i < dimension; i++)
        {
            for (int j = 0; j < dimension; j++)
            {
                textField[i][j] = new JTextField(2);
				textField[i][j].setFont(font1);
				textField[i][j].setHorizontalAlignment(JLabel.CENTER);

                if(solution[i][j] != 0)
                {
                    textField[i][j].setText(Integer.toString(solution[i][j]));
                    textField[i][j].setHorizontalAlignment(JLabel.CENTER);
                    textField[i][j].setEditable(false);
                }
                else
                {
                    textField[i][j].setText("");
                }

                gridPanel.add(textField[i][j]);
            }
        }

        add(gridPanel,BorderLayout.NORTH);


        //adding Button Panel
        JPanel buttonPanel = new JPanel();
        buttonPanel.setLayout(new FlowLayout());

        //Give Up button
        JButton showSolutionButton = new JButton("GIVE UP");
        showSolutionButton.addActionListener(this);
        buttonPanel.add(showSolutionButton);

        //Check button
        JButton checkButton = new JButton("CHECK");
        checkButton.addActionListener(this);
        buttonPanel.add(checkButton);


        //Adding button panel to frame
        add(buttonPanel,BorderLayout.CENTER);

        //Label panel
        JPanel labelPanel = new JPanel();
        labelPanel.setLayout(new FlowLayout());

        puzzleSolved = new JLabel("");
        labelPanel.add(puzzleSolved);

        //Adding label panel to frame
        add(labelPanel, BorderLayout.SOUTH);

        //solve sudoku
        backtrackSolve(solution);

       //start timer
        startTime = System.currentTimeMillis();
    }


    //isValid method: check if entered number will fit the puzzle
    public boolean isValid(int value, int a, int b, int[][] puzzle)
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


        int x1 = 3 * (a / 3);
        int y1 = 3 * (b / 3);
        int x2 = x1 + 2;
        int y2 = y1 + 2;

        for (int x = x1; x <= x2; x++)
            for (int y = y1; y <= y2; y++)
                if (puzzle[x][y] == value)
                    return false;
        return true;
    }

    //backtrackSolve method: solve the sudoku puzzle
    public boolean backtrackSolve(int [][]puzzle) {

        for (int i = 0; i < 9 ; i++) {
            for (int j = 0; j < 9; j++) {
                if (puzzle[i][j] == 0) {

                    // isThereEmptyCell = true;

                    for (int x = 1; x < dimension + 1 ; x++)
                    {
                        if (isValid(x, i, j,puzzle))
                        {
                            puzzle[i][j] = x;
                            if (backtrackSolve(puzzle))
                            {
                                return true;
                            }
                            else
                            {
                                puzzle[i][j] = 0;
                            }// We've failed.
                        }

                    }
                    return false; // Backtracking
                }
            }
        }
        return true;
    }

    //Solve method: compare the answer with the solved puzzle
    public void Solve(int value, int a, int b)
    {
    	if (value == solution[a][b])
        {
            textField[a][b].setBackground(Color.GREEN);
            textField[a][b].setEditable(false);
        }
        else
        {
            Color lightBlue = new Color(66, 229, 244);
            textField[a][b].setBackground(lightBlue);


        }
    }

	public void keyPressed(KeyEvent e)
	{
	    int key = e.getKeyCode();
	    if (key == KeyEvent.VK_C)
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
                        int rowloc = i;
                        int colloc = j;
                        Solve(value, rowloc, colloc);
                    }
                }
            }
	    }
	}

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
                        numVal = Integer.parseInt(text);
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