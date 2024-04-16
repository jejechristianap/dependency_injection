import 'package:dependency_injection/src/contracts/di_resolver.dart';
import 'package:kiwi/kiwi.dart';

class DIResolverImpl with DIResolver {
  DIResolverImpl({required KiwiContainer container}) {
    this.container = container;
  }
}
