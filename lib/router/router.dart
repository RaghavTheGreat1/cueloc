class Car {
  final String name;

  Car(this.name) {
    print('Initialized $name');
  }
}

void main() {
  Car porsche = Car('Porsche');
  Car bugatti = Car('Porsche');
  print(identical(porsche, bugatti));
}
