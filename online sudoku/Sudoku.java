//package net.coderodde.sudoku;

/**
 * This class represents a sudoku matrix. It may be of any dimension and may
 * contain arbitrary values at each cells.
 *
 * @author Rodion "rodde" Efremov
 * @version 1.6 (Feb 25, 2016)
 */
 /*
public class Sudoku {

    public static final int MINIMUM_DIMENSION = 9;
    private final int[][] matrix;

    public Sudoku(int dimension) {
        checkDimension(dimension);
        this.matrix = new int[dimension][dimension];
    }

    public Sudoku(Sudoku sudoku) {
        this(sudoku.matrix.length);

        for (int y = 0; y < sudoku.matrix.length; ++y) {
            this.matrix[y] = sudoku.matrix[y].clone();
        }
    }

    public int get(int x, int y) {
        return matrix[y][x];
    }

    public void set(int x, int y, int value) {
        matrix[y][x] = value;
    }

    public int getDimension() {
        return matrix.length;
    }

    public boolean isValid() {
        int dimension = getDimension();
        int minisquareDimension = getMinisquareDimension();
        IntSet[] rowSetArray    = new IntSet[dimension];
        IntSet[] columnSetArray = new IntSet[dimension];
        IntSet[][] minisquareSetMatrix = new IntSet[minisquareDimension]
                                                   [minisquareDimension];

        for (int i = 0; i < dimension; ++i) {
            rowSetArray[i]    = new IntSet(dimension + 1);
            columnSetArray[i] = new IntSet(dimension + 1);
        }

        for (int squareY = 0; squareY < minisquareDimension; ++squareY) {
            for (int squareX = 0; squareX < minisquareDimension; ++squareX) {
                minisquareSetMatrix[squareY]
                                   [squareX] = new IntSet(dimension + 1);
            }
        }

        for (int y = 0; y < dimension; ++y) {
            for (int x = 0; x < dimension; ++x) {
                int currentValue = get(x, y);

                if (rowSetArray[y].contains(currentValue)
                        || columnSetArray[x].contains(currentValue)) {
                    return false;
                }

                int squareX = x / minisquareDimension;
                int squareY = y / minisquareDimension;

                if (minisquareSetMatrix[squareY]
                                       [squareX].contains(currentValue)) {
                    return false;
                }
            }
        }

        return true;
    }

    @Override
    public String toString() {
        String maximumCellValueString = "" + matrix.length;
        int fieldLength = maximumCellValueString.length();
        StringBuilder sb = new StringBuilder();

        for (int y = 0; y < matrix.length; ++y) {
            sb.append(rowToString(y, fieldLength));
            sb.append('\n');
        }

        return sb.toString();
    }

    private String rowToString(int y, int fieldLength) {
        StringBuilder sb = new StringBuilder();

        for (int x = 0; x < matrix.length; ++x) {
            sb.append(String.format("%" + fieldLength + "d", get(x, y)));

            if (x < matrix.length - 1) {
                sb.append(' ');
            }
        }

        return sb.toString();
    }

    private void checkDimension(int dimension) {
        if (dimension < MINIMUM_DIMENSION) {
            throw new IllegalArgumentException(
                    "The input dimension is too low: " + dimension +
                    ", should be at least " + MINIMUM_DIMENSION + ".");
        }
    }

    private int getMinisquareDimension() {
        int i = 1;
        int dimension = getDimension();

        while (i * i < dimension) {
            ++i;
        }

        if (i * i > dimension) {
            throw new IllegalStateException(
                    "Impossible to form minisquares: " +
                    "the dimension of this sudoku (" + dimension + ") is not " +
                    "a square of a positive integer");
        }

        return i;
    }
}
*/

import java.io.*;
import java.util.*;


public class Sudoku {
    private int [][] game_map;

// default constructor, making the sudoku map and putting it into virtual matrix... I just set the read file into one specific file of
// don't really know how to make it read different files every time, plus project did not ask for it.
    public Sudoku(){

        game_map = new int[9][9];
        /*
        	RANDOM FILE::
        	File[] files = dir.listFiles();
		//Filter files so that it only has .txt files which is assumed to be the only type of file containing sudoku matrix values.



			Random rand = new Random();

			File fileName = files[rand.nextInt(files.length)];

        */
        String fileName = "samplesudoku3.txt";
        try {

                Scanner scanner = new Scanner(new FileReader(fileName));
                while (scanner.hasNext()){
                    for(int i=0; i < 9; i++){
                        for(int j=0; j < 9; j++){
                            game_map[i][j] = scanner.nextInt();
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
// shows map
    public void printMap(){
        for(int i=0; i < 9; i++){
            for(int j=0; j < 9; j++){
                System.out.print(game_map[i][j]);
            }
            System.out.println();
        }


    }
    // checks placement of value for sudoku
    public boolean valid_Placement(int val, int ii, int jj){
        // is value used in the same row?
        for (int i=0; i<9; i++){
            if (game_map[i][jj] == val){
                return false;
            }
        }
        // is value used in the same column?
        for (int j=0; j<9; j++){
            if (game_map[ii][j] == val){
                return false;
            }
        }

        // is value used in the 3x3 box?
        int boxRow = ii - (ii % 3);
        int boxColumn = jj - (jj % 3);

        for (int i = 0; i < 3; i++)
            for (int j = 0 ; j < 3; j++)
                if (game_map[boxRow + i][boxColumn + j] == val)
                    return false;

        return true;
    }

    public void solution(int value, int n, int m){

        if (valid_Placement(value, n, m)){
            game_map[n][m] = value;
        }
    }
    // auto-solving board using BackTracking: implementing numbers in board until they are all true. Used when user gives up
     public boolean solve_board() {
        for (int row = 0; row < 9; row++) {
         for (int col = 0; col < 9; col++) {
          // search an empty cell
          if (game_map[row][col] == 0) {
            // try possible numbers
            for (int number = 1; number <= 9; number++) {
              if (valid_Placement(number,row, col)) {
                // number ok.
                game_map[row][col] = number;
                 if (solve_board()) { // start backtracking recursively
                  return true;
                } else { // if not a solution, empty the cell and continue
                  game_map[row][col] = 0; //board
                }
             }
            }

            return false; // we return false
           }
          }
         }

         return true; // sudoku solved
	}

}