public class Test {

	public static void main(String[] args) {
	Cart cart = new Cart();


		String test = "";


		System.out.println("");


		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 1 (Item class constrcutor and method formattedOutput)";
		Item item = new Item("Banana",1.01);

        if(item.formattedOutput().equals("Banana,1.01")){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Item class! Item was created as Item(\"Apple\",1.01)");
			System.out.println("Formatted Output: "+item.formattedOutput()+" should be Apple,1.01 ");
         }
		 System.out.println("");


		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 2 (Item class mutator)";
		Item item2 = new Item("Apple",1.99);
		item2.setName("Organic Banana");
		item2.setPrice(2.01);
		item2.setPrice(-2.99);

        String name1 = item2.getName();
        double price1 = item2.getPrice();

        if(name1.equals("Organic Banana") && (price1 > 2.00 && price1 < 2.1) ){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Item class! Item name was set to \"Organic Banana\" and price to 2.01. Tried to set price to -2.99");
            System.out.println("Found name:"+name1+", price="+price1);
         }
		 System.out.println("");



		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 3 (Electronics class constrcutor and method formattedOutput)";
		Electronics e = new Electronics("ChromeBook",799.99,"Google",2018);



        if(e.formattedOutput().equals("ChromeBook,799.99,Google,2018")){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Electronics class! Item was created as Electronics(\"ChromeBook\",799.99,\"Google\",2018)");
            System.out.println("Formatted Output: "+e.formattedOutput()+" should be ChromeBook,799.99,Google,2018 ");

         }
		 System.out.println("");


		 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		 test = "Test 4 (Electronics class mutator)";
		 Electronics e2 = new Electronics("ChromeBook",799.99,"Google",2018);
		 e2.setName("Tower");
		 e2.setPrice(1399.99);
		 e2.setModel("Dell");
		 e2.setYear(2019);
		 e2.setYear(-20);

		String name2 = e2.getName();
        double price2 = e2.getPrice();
        String model2 = e2.getModel();
        int year2 = e2.getYear();

		 if(name2.equals("Tower") && (price2 > 1399.98 && price2 < 1400.0) && model2.equals("Dell") && year2==2019){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Electronics class! Item name was set to \"Tower\", price 399.99, model \"Dell\", year 2019");
            System.out.println("Found name:"+name2+", price="+price2+", make="+model2+", year="+year2);

         }
		 System.out.println("");


		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 5 (Food class constrcutor and method formattedOutput)";
		Food f = new Food("Meat",14.49,13.99, "lb");

        if(f.formattedOutput().equals("Meat,14.49,13.99,lb")){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			 System.out.println("Error in Food class! Item was created as Food(\"Meat\",14.49,13.99,\"lb\")");
           System.out.println("Formatted Output: "+f.formattedOutput()+" should be Meat,14.49,13.99,lb ");
         }
		 System.out.println("");



		 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		 test = "Test 6 (Food class mutator)";
		 Food f2 = new Food("Meat",4.49,3.99, "kg");
		 f2.setName("Chicken");
		 f2.setPrice(11.49);
		 f2.setWeight(31.00);
		 f2.setWeightUnit("kg");
		 f2.setPrice(-12.00);

		String name3 = f2.getName();
        double price3 = f2.getPrice();
        String weightUnit3 = f2.getWeightUnit();
        double weight3 = f2.getWeight();


		 if(name3.equals("Chicken") && (price3 > 11.48 && price3 < 11.5) && weightUnit3.equals("kg") && (weight3>29.99 && weight3 <31.01)){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			 System.out.println("Error in Electronics class! Item was set to \"Chicken\",11.49, 31.00, \"kg\")");
            System.out.println("Found name:"+name3+", price="+price3+", weight="+weight3+", weightUnit="+weightUnit3);
         }
		 System.out.println("");


		 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 7 (Dress class constrcutor and method formattedOutput)";
		Dress d = new Dress("Polo Shirt",9.99,"XL", "Mixed");

       if(d.formattedOutput().equals("Polo Shirt,9.99,XL,Mixed")			){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Dress class! Item was created as Dress(\"Polo Shirt\",9.99,\"XL\",\"Mixed\")");
            System.out.println("Formatted Output: "+d.formattedOutput()+" should be Polo Shirt,9.99,XL,Mixed ");
         }
		 System.out.println("");


		 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 8 (Dress class mutators)";
		Dress d2 = new Dress("Polo Shirt",9.99,"XL", "Mixed");
		d2.setName("Skirt");
		d2.setPrice(110.49);
		d2.setSize("Small");
		d2.setFabric("Cotton");

         String name4 = d2.getName();
        double price4 = d2.getPrice();
        String size4 = d2.getSize();
		String fabric4 = d2.getFabric();


        if(name4.equals("Skirt") && (price4 > 110.48 && price4 < 110.5) && size4.equals("Small") && fabric4.equals("Cotton") ){
           System.out.println("PASSED "+test);
         }
         else{
            System.out.println("FAILED >>>"+test);
			System.out.println("Error in Dress class! Item was set to (\"Skirt\",110.49,\"Small\",\"Cotton\")");
            System.out.println("Found name:"+name4+", price="+price4+", size="+size4+", fabric"+fabric4);
         }
		 System.out.println("");




		test = "Test 9 (Cart class constructor, accessors and methods )";

		Electronics e3 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f3 = new Food("Meat",14.01,10.01, "lb");
		Dress d3 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart1 = new Cart();
		Cart cart2 = new Cart(5);
		cart2.add(e3,1);
		cart2.add(d3,1);
		double totalPrice1 = cart2.getTotalPrice();
		int totalQuantity1 = cart2.getTotalQuantity();

		if((totalPrice1 > 820.0 && totalPrice1 < 821.0) && totalQuantity1 == 2){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart2.getTotalPrice()+" it should be 820.02");
			System.out.println("Cart totalQuantity: "+cart2.getTotalQuantity()+" it should be 2");

         }
		System.out.println("");




		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 10 (Cart class constructor, add method and accessors, trying add items when cart is full)";

		int CARTSIZE = 8;
		Cart cart3 = new Cart(CARTSIZE);

		Item items[] = new Item[CARTSIZE] ;

		items[0] = new Food("Apple",10.00,2.5,"Lb");
		items[2] = new Food("Milk",20.00,0.5,"Gal");
		items[1] = new Dress("T-Shirt",100.00,"M","Cotton");
		items[4] = new Dress("Shorts",50.00,"L","Mixed");
		items[3] = new Dress("Polo Shirts",150.00,"L","Mixed");
		items[6] = new Electronics("Probook",800.00,"HP",2018);
		items[5] = new Electronics("ThinkPad",1000.00,"Lenovo",2019);
		items[7] = new Electronics("Mac",2000.00,"Apple",2017);


		int itemQuatities[] = {1,1,1,12,3,1,2,1};

		for(int i=0;i<CARTSIZE;i++){
			cart3.add(items[i], itemQuatities[i]);
		}
		Food extra = new Food("Meat",14.01,10.01, "lb");
		cart3.add(extra,1);
		double totalPrice101 = cart3.getTotalPrice();
		int totalQuantity101 = cart3.getTotalQuantity();

		if((totalPrice101 > 6679 && totalPrice101 < 6681) && totalQuantity101 == 22){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart3.getTotalPrice()+" it should be 6680");
			System.out.println("Cart totalQuantity: "+cart3.getTotalQuantity()+" it should be 22");

         }
		System.out.println("");



		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 11 (Cart class add method, trying to add same item twice)";
		Dress d11 = new Dress("Polo Shirt",20.01,"XL", "Mixed");
		Cart cart11 = new Cart(2);
		cart11.add(d11,3);
		cart11.add(d11,1);

		double totalPrice11 = cart11.getTotalPrice();
		int totalQuantity11 = cart11.getTotalQuantity();

		if((totalPrice11 > 80.0 && totalPrice11 < 80.1) && totalQuantity11 == 4 && (cart11.getItemCount() == 2 || cart11.getItemCount()==1) ){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart11.getTotalPrice()+" it should be 80.04");
			System.out.println("Cart totalQuantity: "+cart11.getTotalQuantity()+" it should be 4");
			System.out.println("Cart itemCount: "+cart11.getItemCount()+" it should be 2 or 1");

         }
		System.out.println("");






		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 12 (Cart class add method, trying invalid number of items to add)";
		Cart cart12 = new Cart(2);
		Dress d12 = new Dress("Polo Shirt",20.01,"XL", "Mixed");
		Food f12 = new Food("Meat",14.01,10.01, "lb");

		cart12.add(d12,2);
		cart12.add(f12,-2);

		int itemCount2 = cart12.getItemCount();
		int totalQuantity2 = cart12.getTotalQuantity();
		double totalPrice2 = cart12.getTotalPrice();
		if((totalPrice2 > 40.0 && totalPrice2 < 41) && totalQuantity2 == 2 && itemCount2==1){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart12.getTotalPrice()+" it should be 40.02 	");
			System.out.println("Cart totalQuantity: "+cart12.getTotalQuantity()+" it should be 2");
			System.out.println("Cart itemCount: "+cart12.getItemCount()+" it should be 1");
         }
		System.out.println("");






		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 13 (Cart class remove method, removing some quantity of a item from cart)";

		Electronics e13 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f13 = new Food("Meat",14.01,10.01, "lb");
		Dress d13 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart13 = new Cart(5);
		cart13.add(e13,1);
		cart13.add(d13,3);
		cart13.remove(d13,1);
		//cart2.remove(d,-11);
		int itemCount13 = cart13.getItemCount();
		int totalQuantity13 = cart13.getTotalQuantity();
		double totalPrice13 = cart13.getTotalPrice();
		if((totalPrice13 > 840.0 && totalPrice13 < 841.0) && totalQuantity13 == 3 && itemCount13==2){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart13.getTotalPrice()+" it should be 840.03	");
			System.out.println("Cart totalQuantity: "+cart13.getTotalQuantity()+" it should be 3");
			System.out.println("Cart itemCount: "+cart13.getItemCount()+" it should be 2");
         }
		System.out.println("");





		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 14 (Cart class remove method, removing all quantity of a item from cart)";

		Electronics e14 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f14 = new Food("Meat",14.01,10.01, "lb");
		Dress d14 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart14 = new Cart(5);
		cart14.add(d14,2);
		cart14.add(f14,10);
		cart14.remove(f14,10);
		if((cart14.getTotalPrice() > 40.0 && cart14.getTotalPrice()< 41.0) && cart14.getTotalQuantity() == 2 && cart14.getItemCount()==1){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart14.getTotalPrice()+" it should be 40.02	");
			System.out.println("Cart totalQuantity: "+cart14.getTotalQuantity()+" it should be 2");
			System.out.println("Cart itemCount: "+cart14.getItemCount()+" it should be 1");
         }
		System.out.println("");




		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 15 (Cart class remove method, trying to remove more quantities of a item then it is actually present in the cart)";

		Electronics e15 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f15 = new Food("Meat",14.01,10.01, "lb");
		Dress d15 = new Dress("Polo Shirt",20.01,"XL", "Mixed");


		Cart cart5 = new Cart(2);
		cart5.add(d15,2);
		cart5.add(f15,10);
		cart5.remove(f15,100);
		if((cart5.getTotalPrice() > 40.0 && cart5.getTotalPrice()< 41.0) && cart5.getTotalQuantity() == 2 && cart5.getItemCount()==1){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart5.getTotalPrice()+" it should be 40.02	");
			System.out.println("Cart totalQuantity: "+cart5.getTotalQuantity()+" it should be 2");
			System.out.println("Cart itemCount: "+cart5.getItemCount()+" it should be 1");
         }
		System.out.println("");






		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 16 (Cart class remove method, trying to remove item not in the cart)";

		Electronics e16 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f16 = new Food("Meat",14.01,10.01, "lb");
		Dress d16 = new Dress("Polo Shirt",20.01,"XL", "Mixed");


		Cart cart16 = new Cart(2);
		cart16.add(d16,2);
		cart16.remove(f16,1);
		int itemCount16 = cart16.getItemCount();
		int totalQuantity16 = cart16.getTotalQuantity();
		double totalPrice16 = cart16.getTotalPrice();
		if((totalPrice16 > 40 && totalPrice16 < 41) && totalQuantity16 == 2 && itemCount16==1){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cart16.getTotalPrice()+" it should be 40.02	");
			System.out.println("Cart totalQuantity: "+cart16.getTotalQuantity()+" it should be 2");
			System.out.println("Cart itemCount: "+cart16.getItemCount()+" it should be 1");
         }
		System.out.println("");






		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 17 (Cart class mutator, setting cartSize<0 or cartSize<itemCount)";
		Electronics e17 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f17 = new Food("Meat",14.01,10.01, "lb");
		Dress d17 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart17 = new Cart(5);
		cart17.add(f17,1);
		cart17.add(e17,1);
		cart17.add(d17,1);

		cart17.setCartSize(-1);
		cart17.setCartSize(2);
		if(cart17.getCartSize()==5){
				 System.out.println("PASSED "+test);
		}else {
			System.out.println("Error in Cart class!");
			System.out.println("Cart size is: "+cart17.getCartSize()+" it should be 5");
			System.out.println("FAILED >>>"+test);
         }
		System.out.println("");





		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 18 (Cart class mutator, reducing cart size >= itemcount)";
		Electronics e18 = new Electronics("ChromeBook",800.01,"Google",2018);
        Food f18 = new Food("Meat",14.01,10.01, "lb");
		Dress d18 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart18 = new Cart(5);
		cart18.add(f18,1);
		cart18.add(e18,1);
		cart18.add(d18,1);
		cart18.setCartSize(4);
		if(cart18.getCartSize()==4){
				 System.out.println("PASSED "+test);
		}else {
			System.out.println("Error in Cart class!");
			System.out.println("Cart size is: "+cart18.getCartSize()+" it should be 4");
			System.out.println("FAILED >>>"+test);
         }
		System.out.println("");






		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 19 (Cart class mutator, increasing cart size)";
		Electronics e19 = new Electronics("ChromeBook",800.01,"Google",2019);
        Food f19 = new Food("Meat",14.01,10.01, "lb");
		Dress d19 = new Dress("Polo Shirt",20.01,"XL", "Mixed");

		Cart cart19 = new Cart(5);
		cart19.add(f19,1);
		cart19.add(e19,1);
		cart19.add(d19,1);
		cart19.setCartSize(20);
		if(cart19.getCartSize()==20 ){
				 System.out.println("PASSED "+test);
		}else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart size is: "+cart19.getCartSize()+" it should be 20");
         }
		System.out.println("");





		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Test 20 (Polymorphism, checking overridden method formattedOutput)";
		Item itemZ = new Electronics("Laptop",999.99,"Mac",2018);

		if(itemZ.formattedOutput().equals("Laptop,999.99,Mac,2018")){
				 System.out.println("PASSED "+test);
		}else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Test class!");
			System.out.println("FormattedOutput is : "+itemZ.formattedOutput()+" it should be \"Laptop,999.99,Mac,2018\" without the quotes 	");

         }
		System.out.println("");





		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Bonus 1";
		Item itemA = new Electronics("Desktop",1500,"HP",2018);
		Item itemB = new Electronics("Desktop",1700,"Asus",2019);
		Item itemC = new Electronics("Desktop",1800,"Asus",2019);
		Cart cartA = new Cart(3);
		cartA.add(itemA,1);
		cartA.add(itemB,1);
		cartA.add(itemC,1);

		if((cartA.getTotalPrice() > 4999.99 && cartA.getTotalPrice()< 5000.01) && cartA.getTotalQuantity() == 3 && cartA.getItemCount()==3){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cartA.getTotalPrice()+" it should be 5000.00	");
			System.out.println("Cart totalQuantity: "+cartA.getTotalQuantity()+" it should be 3");
			System.out.println("Cart itemCount: "+cartA.getItemCount()+" it should be 3");
         }
		System.out.println("");





		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		test = "Bonus 2";
		Item itemX = new Electronics("Desktop",1500,"HP",2018);
		Item itemY = new Electronics("Desktop",1700,"Asus",2018);
		Cart cartB = new Cart(2);
		cartB.add(itemX,1);
		cartB.remove(itemY,1);
		if((cartB.getTotalPrice() > 1499.99 && cartB.getTotalPrice()< 1500.01) && cartB.getTotalQuantity() == 1 && cartB.getItemCount()==1){
			 System.out.println("PASSED "+test);
		}
		else {
			System.out.println("FAILED >>>"+test);
			System.out.println("Error in Cart class!");
			System.out.println("Cart totalPrice: "+cartB.getTotalPrice()+" it should be 1500.00	");
			System.out.println("Cart totalQuantity: "+cartB.getTotalQuantity()+" it should be 1");
			System.out.println("Cart itemCount: "+cartB.getItemCount()+" it should be 1");
         }
		System.out.println("");

	}

}