library dependency_injection;

import 'package:dependency_injection/src/contracts/my_assembly.dart';
import 'package:dependency_injection/src/contracts/my_registrant.dart';
import 'package:dependency_injection/src/contracts/my_resolver.dart';
import 'package:dependency_injection/src/implementations/my_registrant_impl.dart';
import 'package:kiwi/kiwi.dart';

export 'src/contracts/my_assembly.dart';
export 'src/contracts/my_registrant.dart';
export 'src/contracts/my_resolver.dart';

class DependencyInjection with MyRegistrant, MyResolver {
  static DependencyInjection shared = DependencyInjection();

  DependencyInjection() {
    container = KiwiContainer();
  }

  void assemble(List<MyAssembly> assemblies) {
    for (var element in assemblies) {
      element.assemble(
        MyRegistrantImpl(
          container: container,
        ),
      );
    }
  }

  void clear() {
    container.clear();
  }
}
