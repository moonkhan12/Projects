public class DoublyLinkedList extends HW2
{
	Node head;
	
	class Node
	{
		Node prev;
		Object data;
		Node next;
		int row; //remove after hw2
		int col; //remove after hw2
		
		Node(int d, int rowCount, int colCount) // int rowCount, int colCount
		{
			data = d;
			row = rowCount; //remove row and col
			col = colCount; // remove row and col
		}
	}
	
	int numOfElements;// counts the number of elements in the linked list. Will be update every time an element is added or removed.
	
	void append(int new_data) //adds to the end of the list. If list is empty, creates a new list
	{
		
		Node new_node = new Node(new_data,rowCount,colCount); //remove rowCount,colCount
		Node last = head;
		new_node.next = null;
		
		if (head == null) //checks to see if the list is empty
		{
			new_node.prev = null;
			head = new_node; 
			numOfElements++;
			return; 
		}
		while(last.next != null) //traverses the list until the last element
		{
			last = last.next;
		}
		
		last.next = new_node; 
		new_node.prev = last;
		numOfElements++;
	}
	
	int getSize()  //returns the number of elements in the linked list
	{
		return numOfElements;
	}
	
	public Object getRow(int index)
	// returns the element at the specified position in this list.
	{
		// index must be 1 or higher
		if (index < 0)
			return null;
		Node n = null;
		if (head != null) 
		{
			n = head;
			for (int i = 0; i < index; i++) 
			{
				if (n.next == null)
					return null;
 
				n = n.next;
			}
			return n.row;
		}
		return n;
 
	}
	
	public Object getCol(int index)
	// returns the element at the specified position in this list.
	{
		// index must be 1 or higher
				if (index < 0)
					return null;
				Node n = null;
				if (head != null) 
				{
					n = head;
					for (int i = 0; i < index; i++) 
					{
						if (n.next == null)
							return null;
		 
						n = n.next;
					}
					return n.col;
				}
				return n;
	}
	
	void printForward()
	{
		Node n = head;
		while(n != null)
		{
			if(n.next == null)
				System.out.print(n.data);
			else
				System.out.print(n.data + " ");
			n = n.next;
		}
	}
	
	void printBackword(Node head)
	{
		 if (head == null) 
			 return; 
		 printBackword(head.next); 
		 System.out.print(head.data+" "); 
	}
	
	public Object get(int index) //returns value as type Object
	// returns the element at the specified position in this list.
	{
		// index must be 1 or higher
		if (index < 0)
			return null;
		Node n = null;
		if (head != null) 
		{
			n = head;
			for (int i = 0; i < index; i++) 
			{
				if (n.next == null)
					return null;
 
				n = n.next;
			}
			return n.data;
		}
		return n;
	}
	
	public void set(int index, int new_data) // MIGHT NEED TO FIX THIS ONE
	{
		if (index < 0);
		Node n = null;
		if (head != null) 
		{
			n = head;
			for (int i = 0; i < index; i++) 
			{
				if (n.next == null);
				n = n.next;
			}
			n.data = new_data;
		}
		
	}
	
	
	
	void remove(int position) 
    { 
        // If linked list is empty 
        if (head == null) 
            return; 
  
        // Store head node 
        Node temp = head; 
  
        // If head needs to be removed 
        if (position == 0) 
        { 
            head = temp.next;   // Change head 
            return; 
        } 
  
        // Find previous node of the node to be deleted 
        for (int i=0; temp!=null && i<position-1; i++) 
            temp = temp.next; 
  
        // If position is more than number of ndoes 
        if (temp == null || temp.next == null) 
            return; 
  
        // Node temp->next is the node to be deleted 
        // Store pointer to the next of node to be deleted 
        Node next = temp.next.next; 
  
        temp.next = next;  // Unlink the deleted node from list 
        numOfElements--;
    } 
	
	public boolean isEmpty() 
	{
		Node n = head;
		return (n == null);
	}
	
	//Function swapNode is From Online: NOT USED IN THIS ASSIGNMENT, Will adjust for future use as needed.
	/*
	public void swapNodes(int x, int y) //x and y are values, find a way to switch them to index
    { 
        // Nothing to do if x and y are same 
        if (x == y) return; 
  
        // Search for x (keep track of prevX and CurrX) 
        Node prevX = null, currX = head; 
        while (currX != null && (int)currX.data != x) 
        { 
            prevX = currX; 
            currX = currX.next; 
        } 
  
        // Search for y (keep track of prevY and currY) 
        Node prevY = null, currY = head; 
        while (currY != null && (int)currY.data != y) 
        { 
            prevY = currY; 
            currY = currY.next; 
        } 
  
        // If either x or y is not present, nothing to do 
        if (currX == null || currY == null) 
            return; 
  
        // If x is not head of linked list 
        if (prevX != null) 
            prevX.next = currY; 
        else //make y the new head 
            head = currY; 
  
        // If y is not head of linked list 
        if (prevY != null) 
            prevY.next = currX; 
        else // make x the new head 
            head = currX; 
  
        // Swap next pointers 
        Node temp = currX.next; 
        currX.next = currY.next; 
        currY.next = temp; 
    } */
	
}
