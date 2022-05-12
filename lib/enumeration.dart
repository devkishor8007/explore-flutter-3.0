enum Fruits {
  mango("mango", 190, 5),
  orange("orange", 140, 7),
  apple("apple", 200, 5);

  final String name;
  final double price;
  final int day;

  const Fruits(this.name, this.price, this.day);

  String bestFruit() => "apple";
}
