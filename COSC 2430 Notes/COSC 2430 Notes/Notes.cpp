/*
1/15/19
Data Abstraction, Classes and Abstract Data Types

#include <stdio.h>
#include <iostream>
using namespace std;
#include <stdlib.h>
#include <fstream>
#include <string>
//dayType.h
class dayType
{
private:
	string weekDay;
public:
	static string weekDays[7];
	dayType();
	dayType(string d);
	void setDay(string d);
	string getDay() const;
	void print() const;
	string nextDay() const;
	string prevDay() const;
	void addDay(int nDays);
	int Student();
};

int main(void)
{
	dayType(0);
	return 0;
}


overloaded operator.




Student operator+(student x, int y)
{
	x.gpa /= y;
	return *this;
}

*/

#include <stdlib.h>
#include <iostream>
#include <fstream>
using namespace std;
#include <string>
#include <string.h>

/*
///////////////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <iostream>
using namespace std;

int main(int argc, char * argv[])
{
	if (argc == 1)
		cout << " No Arguments... ";
	else
	{
		cout << "keep printing\n";
		for (int i = 1; i < argc; i++)
			cout << argv[i] << endl;
	}

	system("pause");
	cout << "the name of the program is: " << arg[0] <<endl;

	return 0;
}
*/

/*
pointers are a  hexadecimal
0x17
pointers make compiling faster. Instead of the compiler scanning through all the data to find a variable, a pointer allows the compiler to go
straight to the memory address.
*/
/*
int main(void)
{
	int a = 10;
	int *p = &a;
	cout << a << endl; //slow
	//cout << p << endl; //memory address of p
	cout << *p << endl; //fast
	//cout << &p << endl; //memory address of a
	delete p; //clears the memory addess from p
	p = nullptr;
	p = new int[5];
	int avg= 0;
	for (int i = 0; i < 5; i++)
	{
		*p = i * 7;
		avg += (*p);
		p++;
	}
	cout << avg / 5.0;
	delete[] p;
	system("pause");
}
*/
/*
int main()
{
	int **p;
	p = new int*[17]; //each of the 17 cells 0-16 is a pointer to another array
	char **q = new char *[3];
	string word1 = "hello";
	q[0] = new char[strlen(word1) + 1]; 
	strcpy(q[0], word1);
	char *my = q[0];
	while (*my != '\0')
	{
		cout << *my;
		my++;
	}
	delete[]* q;
	return 0;
}

*/

#include <time.h>
/*
int main(void)
{
	srand((unsigned)time(0));
	int i;
	i = (rand() % 50) + 1;
	cout << i << "\n";
	cout << "" << endl;
	system("pause");
	return 0;
}
*/

/*
"new" gets a space for a new item and stores the item at that memory address
*/
/*
int main(void)
{
	//int *p = new int;
	struct st
	{
		char name[10];
		float gpa;
		int *another;
		st *next;
	};
	st *p = new st;
	(*p).name = "THIS NAME";
	p->name = "OTHER NAME"; //dynamic
	p->another = new int;
	delete p;
	st mike = new st;
	mike.name = "Michael"; //static


	//only way to initialize a pointer is to use new.
	/*

	Linked List::::::::
	What is a list?
	How can we identify a list? ---- By its head
	What is a head? ---- A pointer to 1st node
	What is an ADT(Abstract Data Type) list? ---- What are the functions of the list. Primitive Functions -> Insert, delete, search, print
	List of ______? Pointer to _______
	Write a function to insert at the end of a linked list of point
	
	Struct point
	{
		int x;
		int y;
		Point * next;
	}
	
	Class line
	{
	Private:
		Point * head;
	Public:
		line();
		void insert();
		void delete();
		void search();
	
	}
	void line::insertatend(int a, int b)
	{	
		point * current = head;
	}
	while(current->next != 0)
	{
		current = current -> next;
	}Point *temp = new point;
	Temp -> x = a;
	Temp -> y = b;
	Temp -> next= 0;
	current->next = temp.
	void line::deletefrommid(int loc, int &dx, int &dy)
	{// search for a node
		for(int i = 0; i < loc-1; i++)
		{
			current = current->next;
		}
	}
	point *temp = current->next;
	dx = temp->x;
	dy = temp->y;
	current->next = temp->next //replaces the memory addres
	delete temp;

	
	void line::deletefrom mid(int value, int &dx, int &dy)
	{
	point * current = head;
	While(current->next != value;
	current = current ->next;

	void main()
	{
		line verticalline;
		int a, b;
		verticalline.insertatbeg(17,44);
		verticalline.insertatbeg(7,11);
		verticalline.inseartbeg(18,36);
		verticllline.deletefrom mind(2,a,b)
		cout MM"Node number 2 is deleted" << a << b;
	}


	The first element of the list is called a head. The pointer to the first element is how you identify a list.

	st *first = new st;
	first->name = "batman";
	first->gpa= 4.0;
	first->next = new st;

	st *second = first->next;
	second->name = "robin";
	second ->gpa = 1.0;
	second -> next = new st;

	st *third = second->next;
	third->name = "Chicken";
	third ->gpa = 3.0;
	third -> next = nullptr;

	write a function to insert at the begining

	st *insert = new st;


	

	return 0;
}

void insertatbeg(char *n, float g)
{
	st* temp = new st;
	temp->name = "HEctet";
	temp->gpa = 2.3;
	temp->next = first;
	first = temp;

}

void insertatend(char *n, float g)
{
	st* temp = new st;
	temp->name = n;

	st* current = head;
}


//1-4-2
*/

/*
January 29, 2019


Arrays



*/
/*
struct nb
{
	nb *prev;
	int v;
	nb *next;

};


class counting
{
private:
	nb *head;
	nb *tail;
public:
	counting() 
	{
		head = 0;
		tail = 0;
	}
	bool isempty()
	{
		return (head == 0 ? 1 : 0);
	}
	void tf() //traverse forward
	{
		nb *current = head;
		while (current->next != 0)
		{
			cout << current->v << ""; //value
			current = current->next;
		}
	}
	void tb() //traverse backward
	{
		nb *current = tail;
		while (current->prev != 0)
		{
			cout << current->v << ""; //value
			current = current->prev;
		}
		if (current->prev == 0)
			cout << current->v << "";
	}

	//write a function to determine if a doubly linked list is circular

	bool iscircular()
	{
		if((head->prev == tail) && (tail->next == head))
			return true;
		else
			return false;
	}

	void insertatbeg(int value)
	{
		nb *temp = new nb; //1. create a node
		temp->v = value; //2. fill
		temp->prev = 0;
		temp->next = head;
		//link each one correctly - check each pointer (prev,value,next)
		head->prev = temp; //always make sure to verify the head
		head = temp;
	}	

	void deletefrommid(int key, int &delValue)
	{
		nb *current = head;
		while (current->v != key && current->next != 0)
		{
			current = current->next;
		}
		if (current->next == 0)
			return false;
		nb *temp = current;
		delValue = temp->v;
		temp->prev->next = temp->next;
		temp->next->prev = temp->prev;
		delete temp;
	}
	//extra 1-5-1 linked list
};



int main(void)
{
	int retvalue = 0;
	counting list1;
	if (list1.isempty())
		cout << " list is empty\n";
	for (int i = 0; i < 5; i++)
		list1.insertatbeg(i * 4);
	list1.tf();
	list1.tb();


	system("pause");
	return 0;
}

*/

/*
	arrays - dynamic, pointer to arrays, array manipulation (10 points)
	linked list (single and double) ADT programs (30 points)
	sorting (30 points) bubble selection insertion merge quicksort heapsort
	big O (30 points)


*/
/*
int multiply(int a)
{
	if (a == 10)
		return a;
	else
	{
		return multiply(a+1);
	}
}

int main()
{
	int c = multiply(5);
	cout << c << endl;
	system("pause");
	return 0;

}
*/
/* Link list node */
/*
struct Node
{
	int data;
	struct Node* next;
};

///* Function to reverse the linked list 
void printReverse(struct Node* head)
{
	// Base case   
	if (head == NULL)
		return;

	// print the list after head node 
	printReverse(head->next);

	// After everything else is printed, print head 
	cout << head->data;
}

/*UTILITY FUNCTIONS
/* Push a node to linked list. Note that this function
  changes the head 
void push(struct Node** head_ref, char new_data)
{
	/* allocate node 
	struct Node* new_node =
		(struct Node*) malloc(sizeof(struct Node));

	/* put in the data  
	new_node->data = new_data;

	/* link the old list off the new node 
	new_node->next = (*head_ref);

	/* move the head to pochar to the new node 
	(*head_ref) = new_node;
}

/* Drier program to test above function
int main()
{
	// Let us create linked list 1->2->3->4 
	struct Node* head = NULL;
	push(&head, 4);
	push(&head, 3);
	push(&head, 2);
	push(&head, 1);

	printReverse(head);
	system("pause");
	return 0;
}

*/


/*
the operator use for dereferencing is *



*/
/*
void bubble(int arr[], int n)
{
	for (int i = 0; i < n - 1; i++)
	{
		for (int j = 0; j < n - i - 1; j++)
		{
			if (arr[j] > arr[j + 1])
			{
				int temp = arr[j];
				arr[j] = arr[j + 1];
				arr[j + 1] = temp;
			}
		}
	}
}

int main(void)
{
	int a = NULL;
	int b = 0;
	cout << a << endl << b << endl;
	//int a[] = { 1, 5, 3, 4, 2 };
	//cout << *(a+1) << endl;
	//bubble(a,5);
	//cout << *(a+1) << endl;
	system("pause");
	return 0;
}


*/

#include<climits> 
/*
// Prototype of a utility function to swap two integers 
void swap(int *x, int *y);

// A class for Min Heap 
class MinHeap
{
	int *harr; // pointer to array of elements in heap 
	int capacity; // maximum possible size of min heap 
	int heap_size; // Current number of elements in min heap 
public:
	// Constructor 
	MinHeap(int capacity);

	// to heapify a subtree with the root at given index 
	void MinHeapify(int);

	int parent(int i) { return (i - 1) / 2; }

	// to get index of left child of node at index i 
	int left(int i) { return (2 * i + 1); }

	// to get index of right child of node at index i 
	int right(int i) { return (2 * i + 2); }

	// to extract the root which is the minimum element 
	int extractMin();

	// Decreases key value of key at index i to new_val 
	void decreaseKey(int i, int new_val);

	// Returns the minimum key (key at root) from min heap 
	int getMin() { return harr[0]; }

	// Deletes a key stored at index i 
	void deleteKey(int i);

	// Inserts a new key 'k' 
	void insertKey(int k);
};

// Constructor: Builds a heap from a given array a[] of given size 
MinHeap::MinHeap(int cap)
{
	heap_size = 0;
	capacity = cap;
	harr = new int[cap];
}

// Inserts a new key 'k' 
void MinHeap::insertKey(int k)
{
	if (heap_size == capacity)
	{
		cout << "\nOverflow: Could not insertKey\n";
		return;
	}

	// First insert the new key at the end 
	heap_size++;
	int i = heap_size - 1;
	harr[i] = k;

	// Fix the min heap property if it is violated 
	while (i != 0 && harr[parent(i)] > harr[i])
	{
		swap(&harr[i], &harr[parent(i)]);
		i = parent(i);
	}
}

// Decreases value of key at index 'i' to new_val.  It is assumed that 
// new_val is smaller than harr[i]. 
void MinHeap::decreaseKey(int i, int new_val)
{
	harr[i] = new_val;
	while (i != 0 && harr[parent(i)] > harr[i])
	{
		swap(&harr[i], &harr[parent(i)]);
		i = parent(i);
	}
}

// Method to remove minimum element (or root) from min heap 
int MinHeap::extractMin()
{
	if (heap_size <= 0)
		return INT_MAX;
	if (heap_size == 1)
	{
		heap_size--;
		return harr[0];
	}

	// Store the minimum value, and remove it from heap 
	int root = harr[0];
	harr[0] = harr[heap_size - 1];
	heap_size--;
	MinHeapify(0);

	return root;
}


// This function deletes key at index i. It first reduced value to minus 
// infinite, then calls extractMin() 
void MinHeap::deleteKey(int i)
{
	decreaseKey(i, INT_MIN);
	extractMin();
}

// A recursive method to heapify a subtree with the root at given index 
// This method assumes that the subtrees are already heapified 
void MinHeap::MinHeapify(int i)
{
	int l = left(i);
	int r = right(i);
	int smallest = i;
	if (l < heap_size && harr[l] < harr[i])
		smallest = l;
	if (r < heap_size && harr[r] < harr[smallest])
		smallest = r;
	if (smallest != i)
	{
		swap(&harr[i], &harr[smallest]);
		MinHeapify(smallest);
	}
}

// A utility function to swap two elements 
void swap(int *x, int *y)
{
	int temp = *x;
	*x = *y;
	*y = temp;
}

// Driver program to test above functions 
int main()
{
	MinHeap h(11);
	h.insertKey(3);
	h.insertKey(2);
	h.deleteKey(1);
	h.insertKey(15);
	h.insertKey(5);
	h.insertKey(4);
	h.insertKey(45);
	cout << h.extractMin() << " ";
	cout << h.getMin() << " ";
	h.decreaseKey(2, 1);
	cout << h.getMin();
	system("pause");
	return 0;
}


*/

class node
{
public:
	string s;
	node *left;
	node *right;
	node(string x = "")
	{
		s = x;
		left = right = nullptr;
	}
	void print()
	{
		cout << "Printing .....a node " << s << endl;
	}
};

class Dictionary
{
private:
	node *root;
public:
	Dictionary()
	{
		root = nullptr;
	}
	node *search(node *root, string key)
	{
		if (root == nullptr)
			return nullptr;
		if (key.compare(root->s))
		{
			return root;
		}
		else if (key.compare(root->s) < 0)
			return search(root->left, key);
		else
			return search(root->right, key);
	}
};

node *insert(node *cu, string word)
{
	if (cu == nullptr)
	{
		cu = new node(word);
		cu->print();
		root = cu;
	}
	else if (word < cu->s)
		cu->left = insert(root->left, word);
	else if (word > cu->s)
		cu->left = insert(root->right, word);
	root = cu;
	return cu;
}

void inorder(node *cu)
{
	if (cu != nullptr) 
	{
		inorder(cu->left);
		cout << cu->s << endl;

	}
}

