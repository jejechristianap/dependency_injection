import 'package:dependency_injection/src/contracts/my_resolver.dart';
import 'package:kiwi/kiwi.dart';

class MyResolverImpl with MyResolver {
  MyResolverImpl({required KiwiContainer container}) {
    this.container = container;
  }
}
