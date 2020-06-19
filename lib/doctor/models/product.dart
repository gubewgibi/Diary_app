class Product {
  final int id, price;
  final String title, description, image;

  Product({this.id, this.price, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 100,
    title: "Docter A",
    image: "assets/images/D1.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 2,
    price: 200,
    title: "Docter B",
    image: "assets/images/D2.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 3,
    price: 250,
    title: "Docter C",
    image: "assets/images/D3.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,
    price: 400,
    title: "Docter D",
    image: "assets/images/D4.png",
    description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 5,
    price: 325,
    title: "Docter E",
    image: "assets/images/D5.png",
    description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 6,
    price: 150,
    title: "Docter F",
    image: "assets/images/D6.png",
    description:
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
