import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;


public class HW5 
{
	public static void main(String[] args) throws IOException
	{
		switch(args[0]) 
		{
		case "2":
			HW5 itp = new HW5(); // create an object cause program wasn't working without it.
			String expression1 = itp.infixToPostfix(args[1]);
			//System.out.println("The Postfix expression for " + args[1] + " is : " + expression1);
			BufferedWriter writer1 = new BufferedWriter(new FileWriter(args[2]));
			writer1.write(expression1);
			writer1.close();
			break;
		case "3": //Checks to see if input is acceptable. If it is, then does the mathematical calculation.
			HW5 pti = new HW5();
			String expression2 = pti.postfixToInfix(args[1]);
			//System.out.println("The Infix expression for " + args[1] + " is : " + expression2);
			if (expression2 == "nv")
			{
				BufferedWriter writer2 = new BufferedWriter(new FileWriter(args[2])); // open file
				writer2.write("nv");// No reason not to just hc this
				writer2.close();
			}
			else
			{
				double calculation = calculate(expression2);
				//System.out.println("The output for " + args[1] + " is : " + calculation);
				BufferedWriter writer = new BufferedWriter(new FileWriter(args[2]));
				writer.write(calculation+"");
				writer.close();
			}
			break;
		default: //Don't need
			break;
		}
	}
	
	public String infixToPostfix(String inFix) //go backwards
	{
		stack stack = new stack();
		String[] exp = inFix.split("");// Separate input string to character array
		String postFix = "";//output string
		for (String character : exp)
		{
			if (operator(character))
			{
				if (")".equals(character)) //check to see if closed parenthesis is in stack
				{
					while (!stack.isEmpty() && !"(".equals(stack.top())) 
					{
						postFix += stack.pop();
					}
					if (!stack.isEmpty()) 
					{
						stack.pop();
					}
				} 
				else 
				{
					if (!stack.isEmpty() && !pemdas(character, stack.top())) 
					{
						stack.add(character); //if order of operations allows it, add the operator to the stack
					} 
					else 
					{
						while (!stack.isEmpty() && pemdas(character, stack.top())) 
						{
							String lastOnStack = stack.pop();
							if (!"(".equals(lastOnStack)) 
							{
								postFix += lastOnStack;
							}
						}
						stack.add(character);
					}
				}
			} 
			else 
			{
				postFix += character;
			}
		}
		while (!stack.isEmpty()) //reverse all items in the stack and store them for output
		{
			postFix += stack.pop();
		}

		return postFix;
	}

	private boolean pemdas(String operator, String stackOperator) 
	{
		switch (operator) 
		{
		case "+":
			return !("+".equals(stackOperator) || "(".equals(stackOperator));
		case "-":
			return !("-".equals(stackOperator) || "(".equals(stackOperator));

		case "*":
			return "/".equals(stackOperator) || "^".equals(stackOperator) || "(".equals(stackOperator);
		case "/":
			return "*".equals(stackOperator) || "^".equals(stackOperator) || "(".equals(stackOperator);

		case "^":
			return "(".equals(stackOperator);

		case "(":
			return false;

		default:
			return false;
		}

	}
	
	public String postfixToInfix(String postfix)
	{
		try
		{
			stack stack = new stack();  
			for(int i = 0; i < postfix.length(); i++)
			{
				char operator = postfix.charAt(i);
				if(isOperator(operator))
				{
					String b = stack.pop();
					String a = stack.pop();
					if (operator == '^')
						stack.add("("+a+")"+operator+b); //not sure why this works, but it does....
					else
						stack.add(""+a+operator+b+"");
				}
				else
					stack.add(""+operator);
			}
			return stack.pop();
		}catch (Exception e)
		{
			return "nv";
		}
		
	}
	
	private boolean isOperator(char operator) //Needed because of different type inputs and I don't want to use <T> 
	{
		return (operator == '+' || operator == '-' || operator == '*' || operator =='/' || operator == '^');
	}

	private boolean operator(String operator) 
	{
		return "+".equals(operator) || "-".equals(operator) || "*".equals(operator) || "/".equals(operator) || "^".equals(operator) || "(".equals(operator) || ")".equals(operator);
	}

	
	
	
	//Found this function online. Modified to my use as needed. There are extra features in this code that I don't need for this project.
	public static double calculate(String expression) //https://stackoverflow.com/questions/3422673/how-to-evaluate-a-math-expression-given-in-string-form
	{
		return new Object() 
		{
	        int pos = -1, ch;

	        void nextChar() 
	        {
	            ch = (++pos < expression.length()) ?expression.charAt(pos) : -1;
	        }

	        boolean eat(int charToEat) 
	        {
	            while (ch == ' ') 
	            	nextChar();
	            if (ch == charToEat) 
	            {
	                nextChar();
	                return true;
	            }
	            return false;
	        }

	        double parse() 
	        {
	            nextChar();
	            double x = parseExpression();
	            if (pos <expression.length()) 
	            	throw new RuntimeException("Unexpected: " + (char)ch);
	            return x;
	        }

	        double parseExpression() 
	        {
	            double x = parseTerm();
	            for(;;) //while(true) // not as clear
	            {
	                if(eat('+')) 
	                	x += parseTerm(); // addition
	                else if (eat('-')) 
	                	x -= parseTerm(); // subtraction
	                else 
	                	return x;
	            }
	        }

	        double parseTerm() 
	        {
	            double x = parseFactor();
	            for (;;) 
	            {
	                if (eat('*')) 
	                	x *= parseFactor(); // multiplication
	                else if (eat('/'))
	                	x /= parseFactor(); // division
	                else 
	                	return x;
	            }
	        }

	        double parseFactor() 
	        {
	            if (eat('+')) return parseFactor(); // unary plus
	            if (eat('-')) return -parseFactor(); // unary minus

	            double x;
	            int startPos = this.pos;
	            if (eat('(')) 
	            { // parentheses
	                x = parseExpression();
	                eat(')');
	            } 
	            else if ((ch >= '0' && ch <= '9') || ch == '.') 
	            { // numbers
	                while ((ch >= '0' && ch <= '9') || ch == '.') 
	                	nextChar();
	                x = Double.parseDouble(expression.substring(startPos, this.pos));
	            } 
	            else if (ch >= 'a' && ch <= 'z') //Probably could remove this whole section if I wasn't so lazy
	            { // functions
	                while (ch >= 'a' && ch <= 'z') 
	                	nextChar();
	                String func =expression.substring(startPos, this.pos);
	                x = parseFactor();
	                if (func.equals("sqrt")) x = Math.sqrt(x);
	               // else if (func.equals("sin")) x = Math.sin(Math.toRadians(x));
	               // else if (func.equals("cos")) x = Math.cos(Math.toRadians(x));
	               // else if (func.equals("tan")) x = Math.tan(Math.toRadians(x));
	                else throw new RuntimeException("Unknown function: " + func);
	            } 
	            else 
	            {
	                throw new RuntimeException("Unexpected: " + (char)ch);
	            }

	            if (eat('^')) x = Math.pow(x, parseFactor()); // exponentiation

	            return x; //cant comment this out, some issue with if above^^
	        }
	    }.parse();
	}
}