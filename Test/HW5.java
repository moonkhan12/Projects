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
			HW5 itp = new HW5();
			String expression1 = itp.infixToPostfix(args[1]);
			//System.out.println("The Postfix expression for " + args[1] + " is : " + expression1);
			BufferedWriter writer1 = new BufferedWriter(new FileWriter(args[2]));
			writer1.write(expression1);
			writer1.close();
			break;
		case "3": //Checks to see if input is acceptable. If it is, then does the mathematical calculation.
			HW5 pti = new HW5();
			String expression2 = pti.postfixToInfix(args[1]);
			//System.out.println("The Infix expression for " + args[1] + " is : " + expression);
			if (expression2 == "nv")
			{
				BufferedWriter writer2 = new BufferedWriter(new FileWriter(args[2])); // open file
				writer2.write("nv");
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
		default:
			break;
		}
	}
	
	public String infixToPostfix(String str) 
	{
		stack stack = new stack();
		String[] st = str.split("");
		String result = "";
		for (String s : st) {
			if (operator(s)) {
				if (")".equals(s)) 
				{
					while (!stack.isEmpty() && !"(".equals(stack.top())) {
						result += stack.pop();
					}
					if (!stack.isEmpty()) {
						stack.pop();
					}
				} 
				else 
				{
					if (!stack.isEmpty() && !isLowerPrecedence(s, stack.top())) 
					{
						stack.add(s);
					} 
					else 
					{
						while (!stack.isEmpty() && isLowerPrecedence(s, stack.top())) 
						{
							String top = stack.pop();
							if (!"(".equals(top)) 
							{
								result += top;
							}
						}
						stack.add(s);
					}
				}
			} 
			else 
			{
				result += s;
			}
		}
		while (!stack.isEmpty()) 
		{
			result += stack.pop();
		}

		return result;
	}

	private boolean isLowerPrecedence(String s, String s1) 
	{
		switch (s) 
		{
		case "+":
			return !("+".equals(s1) || "(".equals(s1));
		case "-":
			return !("-".equals(s1) || "(".equals(s1));

		case "*":
			return "/".equals(s1) || "^".equals(s1) || "(".equals(s1);
		case "/":
			return "*".equals(s1) || "^".equals(s1) || "(".equals(s1);

		case "^":
			return "(".equals(s1);

		case "(":
			return false;

		default:
			return false;
		}

	}
	
	public String postfixToInfix(String postfix) //TEST SHOULD BE na
	{
		try
		{
			stack s = new stack();  
			for(int i = 0; i < postfix.length(); i++)
			{
				char c = postfix.charAt(i);
				if(isOperator(c))
				{
					String b = s.pop();
					String a = s.pop();
					if (c == '^')
						s.add("("+a+")"+c+b);
					else
						s.add(""+a+c+b+"");
				}
				else
					s.add(""+c);
			}
			return s.pop();
		}catch (Exception e)
		{
			return "nv";
		}
		
	}
	
	private boolean isOperator(char c)
	{
		if(c == '+' || c == '-' || c == '*' || c =='/' || c == '^')
			return true;
		return false;
	}

	private boolean operator(String s) 
	{
		return "+".equals(s) || "-".equals(s) || "*".equals(s) || "/".equals(s) || "^".equals(s) || "(".equals(s) || ")".equals(s);
	}

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

	        // Grammar:
	        // expression = term | expression `+` term | expression `-` term
	        // term = factor | term `*` factor | term `/` factor
	        // factor = `+` factor | `-` factor | `(` expression `)`
	        //        | number | functionName factor | factor `^` factor

	        double parseExpression() 
	        {
	            double x = parseTerm();
	            for (;;) 
	            {
	                if      (eat('+')) x += parseTerm(); // addition
	                else if (eat('-')) x -= parseTerm(); // subtraction
	                else return x;
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
	            else if (ch >= 'a' && ch <= 'z') 
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

	            return x;
	        }
	    }.parse();
	}
}