import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    DependencyInjection.shared.clear();
  });

  test("Test Manual Registration", () {
    DependencyInjection.shared.register<Animal>((c) => Dog());
    Animal animal = DependencyInjection.shared.resolve();

    expect(animal, isInstanceOf<Dog>());
  });

  test("Test Assembly Registration", () {
    DependencyInjection.shared.assemble([
      Assembler(),
    ]);
    Animal animal = DependencyInjection.shared.resolve();

    expect(animal, isInstanceOf<Cat>());
  });

  test("Test Scoped Registration", () {
    DependencyInjection.shared.register<Animal>((c) => Dog());
    Animal animal1 = DependencyInjection.shared.resolve();
    Animal animal2 = DependencyInjection.shared.resolve();

    expect(animal1, isNot(animal2));
    expect(animal1 == animal2, false);
  });

  test("Test Singleton Registration", () {
    DependencyInjection.shared.registerSingleton<Animal>((c) => Cat());
    Animal animal1 = DependencyInjection.shared.resolve();
    Animal animal2 = DependencyInjection.shared.resolve();

    expect(animal1, animal2);
    expect(animal1 != animal2, false);
  });

  test("Test Nested Resolver", () {
    DependencyInjection.shared.assemble([
      Assembler(),
    ]);

    Person person = DependencyInjection.shared.resolve();
    expect(person.pet, isInstanceOf<Cat>());
  });

  test("Test Named Registration and Resolver", () {
    DependencyInjection.shared.register<Animal>((r) => Dog(), name: "DOG");
    DependencyInjection.shared.register<Animal>((r) => Cat(), name: "CAT");
    Animal cat = DependencyInjection.shared.resolve("CAT");
    Animal dog = DependencyInjection.shared.resolve("DOG");

    expect(cat, isInstanceOf<Cat>());
    expect(dog, isInstanceOf<Dog>());
  });

  test("Test Named Registration and Resolver for Singleton", () {
    DependencyInjection.shared.registerSingleton<Animal>((r) => Dog(), name: "DOG");
    DependencyInjection.shared.registerSingleton<Animal>((r) => Cat());
    Animal dog1 = DependencyInjection.shared.resolve("DOG");
    Animal dog2 = DependencyInjection.shared.resolve("DOG");
    Animal cat = DependencyInjection.shared.resolve();

    expect(cat, isInstanceOf<Cat>());
    expect(dog1, dog2);
    expect(dog1 == cat, false);
  });
}

/// Dummy classes to support the Unit Test

abstract class Animal {}

class Cat implements Animal {}

class Dog implements Animal {}

class Person {
  Animal pet;

  Person({required this.pet});
}

class Assembler implements MyAssembly {
  @override
  assemble(MyRegistrant r) {
    r.register<Animal>((c) => Cat());
    r.register<Person>((c) => Person(pet: c.resolve()));
  }
}