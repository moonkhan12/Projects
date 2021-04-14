import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import javax.swing.JTextField;
import java.util.*;
import java.io.*;

class SudokuCellKeyListener implements KeyListener {

    private final SudokuGrid grid;

    SudokuCellKeyListener(SudokuGrid grid) {
        this.grid = grid;
    }

    @Override
    public void keyTyped(KeyEvent e) {
        char c = e.getKeyChar();
        JTextField textField = (JTextField) e.getSource();
		int a = 0;
		if ( e.getKeyCode() == KeyEvent.VK_LEFT){
		     a = 2;
		}


		if ( e.getKeyCode() == KeyEvent.VK_RIGHT){
		     a = 4;
		}


		if ( e.getKeyCode() == KeyEvent.VK_UP){
		     a = 1;
		}

		if ( e.getKeyCode() == KeyEvent.VK_DOWN){
		     a = 3;
		}
        switch (c) {
            case 1:
            case 2:
            case 3:
            case 4:
                e.consume();
                grid.moveCursor(textField, c);
        }

        String s = "" + grid.getDimension();
        int digits = s.length();

        if (textField.getText().length() >= digits) {
            e.consume();
        }
    }

    @Override
    public void keyPressed(KeyEvent e) {

    }

    @Override
    public void keyReleased(KeyEvent e) {

    }
}