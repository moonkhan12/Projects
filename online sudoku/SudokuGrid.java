//package net.coderodde.sudoku;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.Border;

final class SudokuGrid extends JPanel {
	//SudokuFrame sf = new SudokuFrame();
    private static final Font FONT = new Font("Verdana",
                                              Font.CENTER_BASELINE,
                                              20);

    private final JTextField[][] grid;
    private final Map<JTextField, Point> mapFieldToCoordinates =
            new HashMap<>();

    private final int dimension = 9;
    private final JPanel gridPanel;
    private final JPanel buttonPanel;
    private final JButton solveButton;
    private final JButton clearButton;
    private final JPanel[][] minisquarePanels;

    SudokuGrid(int dimension) {
        this.grid = new JTextField[dimension][dimension];

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
        this.clearButton = new JButton("Give Up");
        this.solveButton = new JButton("Submit");

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
			Sudoku s = new Sudoku();
            s.solve_board();
        });
    }

    private void addSpace(JTextField field) {
        if (field.getText().isEmpty()) {
            field.setText(" ");
        }
    }

    void moveCursor(JTextField field, char c) {
        Point coordinates = mapFieldToCoordinates.get(field);
        field.setBackground(Color.WHITE);

        switch (c) {
            case 'w':
            case 'W':

                if (coordinates.y > 0) {
                    grid[coordinates.y - 1][coordinates.x].requestFocus();
                    addSpace(grid[coordinates.y - 1][coordinates.x]);
                }

                break;

            case 'd':
            case 'D':

                if (coordinates.x < dimension - 1) {
                    grid[coordinates.y][coordinates.x + 1].requestFocus();
                    addSpace(grid[coordinates.y][coordinates.x + 1]);
                }

                break;

            case 's':
            case 'S':

                if (coordinates.y < dimension - 1) {
                    grid[coordinates.y + 1][coordinates.x].requestFocus();
                    addSpace(grid[coordinates.y + 1][coordinates.x]);
                }

                break;

            case 'a':
            case 'A':

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


    /*
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


    }*/
}