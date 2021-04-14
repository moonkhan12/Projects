import java.util.Scanner;

/**
 * This class implements a command line utility for solving sudokus.
 */
public class App {

    /**
     * Default dimension of the input sudoku.
     */
    public static void main(String[] args) {
			        Sudoku Sudoku_newgame = new Sudoku();
			        Sudoku_newgame.printMap();
			        new SudokuFrame();

        }

}