import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.*;
import java.util.*;



public class SudokuGUI extends JFrame  {

    private final JFrame frame = new JFrame("Sudoku solver");
    private SudokuGrid grid;
    private JTextField textField[][] = new JTextField[9][9];

    public SudokuGUI() {
        frame.getContentPane().add(grid = new SudokuGrid(9));
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        //buildMenu();
        frame.pack();
        frame.setResizable(false);
        centerView();
        frame.setVisible(true);
    }
    private void centerView() {
	        Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
	        Dimension frameSize = frame.getSize();

	        frame.setLocation((screen.width - frameSize.width) >> 1,
	                          (screen.height - frameSize.height) >> 1);
    }
}

public class SudokuGUI extends JFrame {//implements ActionListener {

    public static final int WIDTH = 600;
    public static final int HEIGHT = 600;
    private int [][] board_map;
    private final JPanel buttonPanel;
    private final JButton solveButton;
    private final JButton clearButton;

    private JPanel gridPanel;
    private JTextField textField[][] = new JTextField[9][9];

    public static void main(String[] args){

        SudokuGUI gui = new SudokuGUI();
        gui.setVisible(true);


    }
    // creates a GUI for the Sudoku grid
    public SudokuGUI() {

        super("SUDOKU");
        setSize(WIDTH, HEIGHT);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new FlowLayout());

        gridPanel = new JPanel();
        gridPanel.setLayout(new GridLayout(9, 9));
		this.buttonPanel = new JPanel();

		this.clearButton = new JButton("Clear");
        this.solveButton = new JButton("Give Up");
        this.buttonPanel.setLayout(new BorderLayout());
		this.buttonPanel.add(clearButton, BorderLayout.WEST);

        //uploading data to the sudoku grid
        readFile();

        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {

                textField[i][j] = new JTextField(2);
                // sets all integers that are given as part of the game to strings, and makes them not editable
                if(board_map[i][j] != 0) {
                    textField[i][j].setText(Integer.toString(board_map[i][j]));
                    textField[i][j].setEditable(false);
                }
                // if the spaces are meant to be filled in they are set blank
                else {
                    textField[i][j].setText("");
                }

                gridPanel.add(textField[i][j]);
            }
        }

        add(gridPanel);
    }

    public void readFile(){

        board_map = new int[9][9];

        String fileName = "samplesudoku3.txt";

        try {

            Scanner scanner = new Scanner(new FileReader(fileName));
            while (scanner.hasNext()){
                for(int i=0; i < 9; i++){
                    for(int j=0; j < 9; j++){
                        board_map[i][j] = scanner.nextInt();
                    }
                }
            }
            scanner.close();

        }
        catch (FileNotFoundException e){
            System.out.println(e.getMessage());
            System.out.println(e);
            System.exit(1);
        }


    }
}
