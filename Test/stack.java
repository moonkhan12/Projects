import java.util.ArrayList;

public class stack extends Test
{
	private ArrayList<String> arr;
	//private String arr[];
	//private int top;
	//private int capacity;
	private int MAXSIZE;
	//private int numOfElements;

	// Constructor to initialize stack
	public stack()
	{
		arr = new ArrayList<String>();
		//arr = new String[size];
		//capacity = size;
		//top = -1;
		MAXSIZE = 1000;
	}

	// Utility function to add an element x in the stack
	public void add(String x)
	{
		//System.out.println("Inserting " + x);
		arr.add(x);
		//arr[++top] = x;
		//numOfElements++;
	}

	// Utility function to pop top element from the stack
	public String pop()
	{
		// check for stack underflow
		if (isEmpty())
		{
			//System.out.println("UnderFlow\nProgram Terminated");
			//System.exit(1);
			//return null;
		}

		//System.out.println("Removing " + top());

		// decrease stack size by 1 and (optionally) return the popped element
		//numOfElements--;
		String removedValue = arr.get(arr.size()-1);
		arr.remove(arr.size()-1);
		
		return removedValue; //arr[top--];
	}

	// Utility function to return top element in a stack
	public String top()
	{
		if (!isEmpty())
			return arr.get(arr.size()-1); //arr[top];
		else
			return null;
			//System.exit(1);
			//return null;
	}

	// Utility function to return the size of the stack
	public int size()
	{
		return arr.size();//top + 1;
	}

	// Utility function to check if the stack is empty or not
	public Boolean isEmpty()
	{
		return arr.size() == 0;	// or return size() == 0;
	}

	// Utility function to check if the stack is full or not
	public Boolean isFull()
	{
		return arr.size() == MAXSIZE;	// or return size() == capacity;
	}

}