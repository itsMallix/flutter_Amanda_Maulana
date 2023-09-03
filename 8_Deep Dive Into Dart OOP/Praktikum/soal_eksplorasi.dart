abstract class Shape {
  void getArea();
  void getPerimeter();
}

class Circle implements Shape {
  int radius;
  Circle(this.radius);
  @override
  void getArea() {
    print("Area = ${3.14 * radius * radius}");
  }

  @override
  void getPerimeter() {
    print("Perimeter = ${2 * 3.14 * radius}");
  }
}

class Square implements Shape {
  int side;
  Square(this.side);
  @override
  void getArea() {
    print("Area = ${side * side}");
  }

  @override
  void getPerimeter() {
    print("Perimeter = ${4 * side}");
  }
}

class Rectangle implements Shape {
  int width;
  int height;
  Rectangle(this.width, this.height);
  @override
  void getArea() {
    print("Area = ${width * height}");
  }

  @override
  void getPerimeter() {
    print("Perimeter = ${2 * (width + height)}");
  }
}

void main() {
  Circle circle = Circle(10);
  circle.getArea();
  circle.getPerimeter();
  print(" ");
  Square square = Square(10);
  square.getArea();
  square.getPerimeter();
  print(" ");
  Rectangle rectangle = Rectangle(10, 20);
  rectangle.getArea();
  rectangle.getPerimeter();
  print(" ");
}
