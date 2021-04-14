import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.Scanner;


/*
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
        this.buttonPanel.add(solveButton, BorderLayout.EAST);
        buttonPanel.setVisible(true);
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
*/

final class SudokuGrid extends JPanel {

    private static final Font FONT = new Font("Verdana", Font.CENTER_BASELINE, 20);

    private final JTextField[][] grid;

    private final int dimension;
    private final JPanel gridPanel;
    private final JPanel buttonPanel;
    private final JButton solveButton;
    private final JButton clearButton;
    private final JPanel[][] minisquarePanels;
   	private int [][] board_map;

    SudokuGrid(int dimension) {
        this.grid = new JTextField[dimension][dimension];
        this.dimension = dimension;

        for (int y = 0; y < dimension; ++y) {
            for (int x = 0; x < dimension; ++x) {
                JTextField field = new JTextField();
                field.addKeyListener(new SudokuCellKeyListener(this));
                mapFieldToCoordinates.put(field, new Point(x, y));
                grid[y][x] = field;
            }
        }

        this.gridPanel   = new JPanel();
        this.buttonPanel = new JPanel();

        Border border = BorderFactory.createLineBorder(Color.BLACK, 1);
        Dimension fieldDimension = new Dimension(30, 30);


        int minisquareDimension = (int) Math.sqrt(dimension);
        this.gridPanel.setLayout(new GridLayout(minisquareDimension,
                                                minisquareDimension));

        this.minisquarePanels = new JPanel[minisquareDimension]
                                          [minisquareDimension];

        Border minisquareBorder = BorderFactory.createLineBorder(Color.BLACK, 1);

        for (int y = 0; y < minisquareDimension; ++y) {
            for (int x = 0; x < minisquareDimension; ++x) {
                JPanel panel = new JPanel();
                panel.setLayout(new GridLayout(minisquareDimension,
                                               minisquareDimension));
                panel.setBorder(minisquareBorder);
                minisquarePanels[y][x] = panel;
                gridPanel.add(panel);
            }
        }

        for (int y = 0; y < dimension; ++y) {
            for (int x = 0; x < dimension; ++x) {
                int minisquareX = x / minisquareDimension;
                int minisquareY = y / minisquareDimension;

                minisquarePanels[minisquareY][minisquareX].add(grid[y][x]);
            }
        }

        this.gridPanel.setBorder(BorderFactory.createLineBorder(Color.BLACK,
                                                                2));
        this.clearButton = new JButton("Clear");
        this.solveButton = new JButton("Solve");

        this.buttonPanel.setLayout(new BorderLayout());
        this.buttonPanel.add(clearButton, BorderLayout.WEST);
        this.buttonPanel.add(solveButton, BorderLayout.EAST);

        this.setLayout(new BorderLayout());
        this.add(gridPanel,   BorderLayout.NORTH);
        this.add(buttonPanel, BorderLayout.SOUTH);

        clearButton.addActionListener((ActionEvent e) -> {
            clearAll();
        });

        solveButton.addActionListener((ActionEvent e) -> {
            solve();
        });
    }

    int getDimension() {
        return dimension;
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

    private void addSpace(JTextField field) {
        if (field.getText().isEmpty()) {
            field.setText(" ");
        }
    }

    void moveCursor(JTextField field, int c) {
        Point coordinates = mapFieldToCoordinates.get(field);
        field.setBackground(Color.WHITE);

        switch (c) {
            case 1:


                if (coordinates.y > 0) {
                    grid[coordinates.y - 1][coordinates.x].requestFocus();
                    addSpace(grid[coordinates.y - 1][coordinates.x]);
                }

                break;

            case 4:

                if (coordinates.x < dimension - 1) {
                    grid[coordinates.y][coordinates.x + 1].requestFocus();
                    addSpace(grid[coordinates.y][coordinates.x + 1]);
                }

                break;

            case 3:

                if (coordinates.y < dimension - 1) {
                    grid[coordinates.y + 1][coordinates.x].requestFocus();
                    addSpace(grid[coordinates.y + 1][coordinates.x]);
                }

                break;

            case 2:

                if (coordinates.x > 0) {
                    grid[coordinates.y][coordinates.x - 1].requestFocus();
                    addSpace(grid[coordinates.y][coordinates.x - 1]);
                }

                break;
        }
    }

    void clearAll() {
        for (JTextField[] row : grid) {
            for (JTextField field : row) {
                field.setText("");
            }
        }
    }

    void solve() {
        Sudoku sudoku = new Sudoku(dimension);

        for (int y = 0; y < dimension; ++y) {
            for (int x = 0; x < dimension; ++x) {
                String text = grid[y][x].getText();

                int number = -1;

                try {
                    number = Integer.parseInt(text.trim());
                } catch (NumberFormatException ex) {

                }

                sudoku.set(x, y, number);
            }
		}
    }
}