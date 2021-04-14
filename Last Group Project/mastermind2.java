// Simulation of the Mastermind game
import java.awt.*;
import java.io.*;
import java.applet.*;

public class mastermind2 extends Applet
{
   private Button Game1,Game2;
   final int INITIAL_MODE = 1;
   final int PLAYER_GUESSES = 2;
   final int COMPUTER_GUESSES1 = 3;
   final int COMPUTER_GUESSES2 = 4;
   final int COMPUTER_GUESSES3 = 5;
   private int mode = INITIAL_MODE;
   static final Font textFont=new Font("Helvetica", Font.PLAIN, 14);
   int actual = 0;         // The actual combination

   // These variables are used when the player makes an attempt at a colour combination
   int colourChosen = 0;   // Which colour the player has chosen when assembly his/her try
   int[] choice = new int[4];
   int numBlacks, numWhites;
   int guessesSoFar[] = new int[20];    // Previous guesses by the user are stored here
   int scoresSoFar[] = new int[20];       // ... along with the scores they elicited
   int numSoFar = -1;                            // The number of previous guesses stored (-1 means "none")
   boolean found = false;

   // These variables are used when the computer makes an attempt at a colour combination
   int myGuess;
   boolean firstTime = true;
   int possibles[] = new int[700];        // Store the possible combination identities ready for pruning
   int numPossibles = 0;
   int base = 0;                   // Base index when displaying list of possible combinations

   public void init ()
   { setBackground(Color.white);
     setFont(textFont);
     Game1 = new Button("I try to guess your combination");
     add(Game1);
     Game2 = new Button("You try to guess my combination");
     add(Game2);
     for (int i = 0; i < 4; i++)
       choice[i] = 0;
   }

//////////////// THE FOLLOWING METHODS HANDLE THE DISPLAY SCREENS //////////////

   public void paint (Graphics g)
   { switch (mode)
     { case INITIAL_MODE : display_initial_screen(g); break;
       case COMPUTER_GUESSES1 : display_computer_guesses_screen1(g); break;
       case COMPUTER_GUESSES2 : display_computer_guesses_screen2(g); break;
       case COMPUTER_GUESSES3 : display_computer_guesses_screen3(g); break;
       case PLAYER_GUESSES : display_player_guesses(g); break;
     }
   }

   public void display_initial_screen (Graphics g)
   { g.drawString("Please click on one of the icons above.",100,100);
     g.drawString("The left icon lets you think of a combination,",100,130);
     g.drawString("and then the computer tries to guess it.",100,150);
     g.drawString("The right icon gets the computer to think",100,180);
     g.drawString("of a combination and you have to guess it.",100,200);
   }

   // This is the initial screen telling the player to pick a combination
   public void display_computer_guesses_screen1 (Graphics g)
   { g.drawString("Right, please think of a combination of four colours.",30,100);
     g.drawString("You can use",30,115);
     g.drawString("You can the colours more than once.",30,130);
     g.drawString("When you have thought of your combination, write it down",30,190);
     g.drawString("and click here!",100,220);
     g.drawRect(98,205,100,20);
     g.setColor(Color.red);
     g.drawString("red",120,115);
     g.setColor(Color.yellow);
     g.drawString("yellow",160,115);
     g.setColor(Color.green);
     g.drawString("green",200,115);
     g.setColor(Color.blue);
     g.drawString("blue",240,115);
     g.setColor(Color.magenta);
     g.drawString("pink",280,115);
     g.setColor(Color.gray);
     g.drawString("grey",320,115);
   }

   // This is the screen where the computer displays its guess of the player's combination
   public void display_computer_guesses_screen2 (Graphics g)
   {  displayPattern(g,myGuess,200,50);
      g.setColor(Color.black);
      g.drawString("Here's my guess. Please tell me what it scores.",300,65);
      g.drawString("You increase/decrease the number of black and white pegs",200,100);
      g.drawString("using the arrows. Click on Done when the figures are right.",200,115);
      g.drawString("Black pegs (right colour in the right place)",200,150);
      leftArrow(g,500,135);
      //g.drawRect(500,135,20,20);
      //g.drawLine(520,135,500,145);
      //g.drawLine(500,145,520,155);
      rightArrow(g,550,135);
      //g.drawRect(550,135,20,20);
      //g.drawLine(550,135,570,145);
      //g.drawLine(570,145,550,155);
      g.drawString(Integer.toString(numBlacks),535,150);
      g.drawString("White pegs (right colour in the wrong place)",200,180);
      leftArrow(g,500,165);
      // g.drawRect(500,165,20,20);
      //g.drawLine(520,165,500,175);
      //g.drawLine(500,175,520,185);
      rightArrow(g,550,165);
      //g.drawRect(550,165,20,20);
      //g.drawLine(550,165,570,175);
      //g.drawLine(570,175,550,185);
      g.drawString(Integer.toString(numWhites),535,180);
      g.drawString("Done",540,210);
      g.drawRect(538,197,40,16);
      if (firstTime == false)
        displayGuesses(g);
   }

   // Draw a left-pointing arrow at a given top-left x,y co-ordinate
   public void leftArrow (Graphics g, int x, int y)
   { g.drawRect(x,y,20,20);
     g.drawLine(x+20,y,x,y+10);
     g.drawLine(x,y+10,x+20,y+20);
   }
   // Ditto a right-pointing arrow
   public void rightArrow (Graphics g, int x, int y)
   { g.drawRect(x,y,20,20);
     g.drawLine(x,y,x+20,y+10);
     g.drawLine(x+20,y+10,x,y+20);
   }

   // Display the (still) compatible possibility list. The player can click on Done to move on
   public void display_computer_guesses_screen3 (Graphics g)
   { g.setColor(Color.black);
     switch (numPossibles)
     { case 1 : g.drawString("Hooray! I have found it!",200,50);
                      displayPattern(g,possibles[0],400,50);
                      g.setColor(Color.black);
                      g.drawString("If this isn't your combination, you must have made a mistake!",200,100);
                      g.drawString("Please click on a button above to play another game.",200,150);
                      break;
       case 0 : g.drawString("You must have made a mistake!",200,100);
                      g.drawString("Please click on a button above to play another game.",200,150);
                      break;
       default :
          g.drawString("I have ruled it down to " + Integer.toString(numPossibles) + " possibilities.",200,50);
          // Display the first X possible combinations
          for (int x = 0; x < 4; x++)
            for (int y = 0; y < 6; y++)
             { int which = x*6 + y;
               if (which + base < numPossibles)
                 displayPattern(g,possibles[which + base], 200 + 95 * x, 60 + 32 * y);
             }
          g.setColor(Color.black);
          if (numPossibles > 24)
           { leftArrow(g,200,255);
             rightArrow(g,480,255);
             g.drawString("Click on the arrows to see more, or on Done to continue",200,295);
           }
          else
             g.drawString("Click on Done to continue",200,295);
          g.drawString("Done",320,270);
          g.drawRect(317,257,40,16);
          displayGuesses(g);
     }
   }

   public void display_player_guesses (Graphics g)
   { int i;
     g.drawString("I have thought of a combination. Can you work it out?",10,50);
     for (i = 0; i < 4; i++)
       { g.setColor(Color.black);
         g.drawRect(300+20*i,100,20,20);
         if (choice[i] > 0)
           { setTheColor(g,choice[i]);
             g.fillRect(301+20*i,101,18,18);
           }
       }
     if (found == false)
       { g.setColor(Color.black);
         g.drawString("Click on colours below,",300,140);
         g.drawString("then on the squares",300,155);
         g.drawString("above to set the pattern",300,170);
         g.drawString("Then click on Done.",300,185);
         for (i = 1; i < 7; i++)
          { setTheColor(g,i);
            g.fillRect(280+20*i,200,20,20);
          }
         g.setColor(Color.black);
         g.drawString("Done",302,238);
         g.drawRect(300,225,40,16);
         if (colourChosen > 0)
           { int x = 280+20*colourChosen;
             g.drawLine(x,200,x+20,220);
             g.drawLine(x,220,x+20,200);
           }
       }
     else
       { g.setColor(Color.black);
         g.drawString("Well done! You have found",300,140);
         g.drawString("my combination.",300,155);
         g.drawString("Click on one of the buttons",300,170);
         g.drawString("above to play again.",300,185);
       }
     displayGuesses(g);    // Display any previous guesses the player has made.
   }

   // Display the list of guesses tried so far together with their scores
   public void displayGuesses (Graphics g)
   {  if (numSoFar > -1)
        { g.setColor(Color.black);
          if (mode < COMPUTER_GUESSES1)
            g.drawString("Your guess       Score",10,70);
          else
            g.drawString("My guess          Score",10,70);
          for (int i = 0; i <= numSoFar; i++)
            { displayPattern(g,guessesSoFar[i],10,75 + 28 * i);
              displayScore(g,scoresSoFar[i],110,78 + 28 * i);
            }
        }
   }

   // Display a chosen pattern encoded as a number at a given x,y position
   public void displayPattern (Graphics g, int value, int x, int y)
   { int v[] = new int[4];
     int i;
     // Firstly decode the encoded pattern
     for (i = 0; i < 4; i++)
       { v[i] = value % 10;
         value /= 10;
       }
     g.setColor(Color.black);
     g.drawRect(x,y,90,24);
     // Now draw the spots themselves
     for (i = 0; i < 4; i++)
      if (v[i] > 0)
        { setTheColor(g,v[i]);
          g.fillOval(x + 2 + 22 * i,y + 2,20,20);
        }
   }

   // Display a score encoded in the form of 10*blacks+whites at position x,y
   public void displayScore (Graphics g, int value, int x, int y)
   { int b = value / 10, w = value % 10;
     int i;
     g.setColor(Color.black);
     for (i = 0; i < b+w; i++)
       if (i < b)
         g.fillOval(x+i*10 + 3,y+5,8,8);
       else
         g.drawOval(x+i*10 + 3,y+5,8,8);
     g.drawRect(x,y,45,18);
   }

   public void setTheColor (Graphics g, int colour)
   { switch (colour)
     { case 1 : g.setColor(Color.red); break;
       case 2 : g.setColor(Color.yellow); break;
       case 3 : g.setColor(Color.green); break;
       case 4 : g.setColor(Color.blue); break;
       case 5 : g.setColor(Color.magenta); break;
       case 6 : g.setColor(Color.lightGray); break;
     }
   }

///// END OF THE DISPLAY METHODS. THE FOLLOWING METHODS HAND BUTTON CLICKS ////////

   public boolean action (Event e, Object arg)
   { if (e.target == Game1)
       { mode = COMPUTER_GUESSES1;
         myGuess = randomCombination();     // The computer's first guess is always random
         firstTime = true;      // The computer behaves differently for the first guess
         numSoFar = -1;     // Computer stores its guesses just as the human does
         repaint();
       }
     if (e.target == Game2)
       { mode = PLAYER_GUESSES;
         actual = randomCombination();
         numSoFar = -1;
         found = false;
         for (int i = 0; i < 4; i++)
           choice[i] = 0;
         repaint();
       }
     return true;
   }

   // The exact function of this method depends on the screen mode
   public boolean mouseDown (Event event,int x, int y)
   { switch (mode)
      { case COMPUTER_GUESSES1 : cgMouseDown1(x,y); break;
        case COMPUTER_GUESSES2 : cgMouseDown2(x,y); break;
        case COMPUTER_GUESSES3 : if (numPossibles > 1)
                                                                      cgMouseDown3(x,y); break;
        case PLAYER_GUESSES : pgMouseDown(x,y); break;
      }
     return true;
   }

   // Deal with button clicks when the computer is guessing the pattern. This tackles the initial
   // screen telling the player to pick a combination. There is only one place the player can click
   public void cgMouseDown1 (int x, int y)
   { if (x > 98 && y > 205 && x < 198 && y < 225)
       { mode = COMPUTER_GUESSES2;
         numBlacks = numWhites = 0;
         repaint();
       }
   }

   // Get the player to click on arrows to specify the number of blacks and whites, then on Done
   public void cgMouseDown2 (int x, int y)
   { boolean redraw = false;  // True if the screen needs to be redrawn as a result of this
     if (x > 500 && y > 135 && x < 520 && y < 155 && numBlacks > 0)
       { numBlacks--;
         redraw = true;
       }
     if (x > 550 && y > 135 && x < 570 && y < 155 && numBlacks+numWhites < 4)
       { numBlacks++;
         redraw = true;
       }
     if (x > 500 && y > 165 && x < 520 && y < 185 && numWhites > 0)
       { numWhites--;
         redraw = true;
       }
     if (x > 550 && y > 165 && x < 570 && y < 185 && numBlacks+numWhites < 4)
       { numWhites++;
         redraw = true;
       }
     if (x > 538 && y > 197 && x < 578 && y < 213)
       { mode = COMPUTER_GUESSES3;    // Moved on to the next stage
         redraw = true;
         storeGuess(myGuess);   // Store the guess ready for displaying next time
         if (firstTime == true)
           constructListOfPossibles();
         else
           pruneListOfPossibles();
         firstTime = false;
         base = 0;                // Ready for next display
       }
     if (redraw == true)
       repaint();
   }

   // The players is viewing the list of possibles, click on the arrows to move or on Done
   public void cgMouseDown3 (int x, int y)
   { boolean redraw = false;
     if (x > 200 && y > 255 && x < 220 && y < 275 && base > 23)   // Left arrow
       { base -= 24;
         redraw = true;
       }
     int lim = (numPossibles / 24) * 24;    // numPossibles rounded down to nearest multiple of 24
     if (x > 480 && y > 255 && x < 500 && y < 275 && base < lim)   // Right arrow
       { base += 24;
         redraw = true;
       }
     if (x > 320 && y > 260 && x < 360 && y < 376)   // Clicked on Done, so present new combination
       { mode = COMPUTER_GUESSES2;
         myGuess = possibles[0];         // New combination is first of the possible list
         redraw = true;
       }
     numBlacks = numWhites = 0;      // Ready for the next guess
     if (redraw == true)
       repaint();
   }

   // Construct the list of possible combinations based on myGuess, numBlacks and numWhites
   public void constructListOfPossibles ()
   { numPossibles = 0;
     int tempBlacks = numBlacks;           // Keep a copy of these as numBlacks, numWhites will be changed
     int tempWhites = numWhites;
     for (int col1 = 1; col1 <= 6; col1++)
       for (int col2 = 1; col2 <= 6; col2++)
         for (int col3 = 1; col3 <= 6; col3++)
           for (int col4 = 1; col4 <= 6; col4++)
             { int encoded = 1000 * col1 + 100 * col2 + 10 * col3 + col4;
               compare(encoded,myGuess);   // Is my current guess compatible with that combination?
               if (numBlacks == tempBlacks && numWhites == tempWhites)
                { numPossibles++;    // If so, add it to the list
                  possibles[numPossibles-1] = encoded;
                }
             }
     numBlacks = tempBlacks;     // Restore these values
     numWhites = tempWhites;
   }

   // Prune the existing list of possible combinations based on myGuess, numBlacks and numWhites
   public void pruneListOfPossibles ()
   { int index = 0;
     int tempBlacks = numBlacks, tempWhites = numWhites;   // Store copy as originals will be changed
     while (index < numPossibles)
      { compare(possibles[index],myGuess);
        if (tempBlacks != numBlacks || tempWhites != numWhites)  // Not compatible, so delete
          { if (index < numPossibles-1)   // If not at end of list, shuffling necessary
              for (int x = index; x < numPossibles-1; x++)
                possibles[x] = possibles[x+1];
            numPossibles--;     // One fewer item on the list
          }
        else
         index++;      // Otherwise, move to next item and compare that
      }
     numBlacks = tempBlacks;   // Restore original values
     numWhites = tempWhites;
   }

   // Deal with button clicks when the player is guessing the pattern
   public void pgMouseDown (int x, int y)
   { // Firstly decide whether the mouse has been clicked on the colour palette
     int i;
     boolean redraw = false;   // True if the screen has to be redrawn
     for (i = 1; i < 7; i++)
       if (x > 280+20*i && y > 200 && x < 300+20*i && y < 320 && found == false)
         { colourChosen = i;
           redraw = true;
         }
     // Now decide if it has been clicked over place where player's choice is built up
     for (i = 0; i < 4; i++)
       if (x > 300+20*i && y > 100 && x < 320+20*i && y < 120 && colourChosen > 0 && found == false)
         { choice[i] = colourChosen;
           redraw = true;
         }
     // Detect whether mouse has been clicked over Done. If so, encode the player's pattern,
     // perform the comparison, and display the results
     if (x > 300 && y > 225 && x < 340 && y < 241 && found == false)
       { int encoded = 1000 * choice[3] + 100 * choice[2] + 10 * choice[1] + choice[0];
         compare(actual,encoded);
         storeGuess(encoded);   // Add the pattern and the score to the list of guesses and scores so far
         if (numBlacks == 4)
           found = true;
         redraw = true;
       }
     if (redraw == true)
       repaint();
   }

   // Add the guess and score, whether human's or computer's, to the list of guesses & scores so far.
   public void storeGuess (int encoded)
   { if (numSoFar < 7)
       numSoFar++;
     else
       for (int i = 0; i < 7; i++)   // Reached the end so shuffle them all up
         { guessesSoFar[i] = guessesSoFar[i+1];
           scoresSoFar[i] = scoresSoFar[i+1];
         }
     guessesSoFar[numSoFar] = encoded;
     scoresSoFar[numSoFar] = 10 * numBlacks + numWhites;
   }

///// END OF THE BUTTON CLICK METHODS. THE FOLLOWING HANDLE THE GAME ITSELF ////////////

   // Compare the actual and a test combination
   // The number of blacks and whites are stored as global variables as Java doesn't seem to have
   // reference variable passing &likethis.
   public void compare (int actual, int test)
   { // Firstly decode actual and test patterns
     int a[] = new int[4];
     int t[] = new int[4];
     int i,j;
     for (i = 0; i < 4; i++)
       { a[i] = actual % 10;
         actual /= 10;
         t[i] = test % 10;
         test /= 10;
       }
     // Check for blacks
     numBlacks = 0;
     for (i = 0; i < 4; i++)
       if (a[i] == t[i])
         { numBlacks++;
           a[i] = 43;         // Dummy values
           t[i] = 159;
         }
     // Check for whites
     numWhites = 0;
     for (i = 0; i < 4; i++)
      for (j = 0; j < 4; j++)
       if (a[i] == t[j])
        { numWhites++;
          a[i] = 197;
          t[j]  = 253;
        }
   }

   public int randomCombination ()
   { int v = 0;
     for (int i = 0; i < 4; i++)
       v = v * 10 + (int)(Math.random() * 6 + 1);
     return v;
    }

}