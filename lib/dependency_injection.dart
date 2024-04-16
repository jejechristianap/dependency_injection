library dependency_injection;

import 'package:dependency_injection/src/contracts/di_assembly.dart';
import 'package:dependency_injection/src/contracts/di_registrant.dart';
import 'package:dependency_injection/src/contracts/di_resolver.dart';
import 'package:dependency_injection/src/implementations/di_registrant_impl.dart';
import 'package:kiwi/kiwi.dart';

export 'src/contracts/di_assembly.dart';
export 'src/contracts/di_registrant.dart';
export 'src/contracts/di_resolver.dart';

class DependencyInjection with DIRegistrant, DIResolver {
  static DependencyInjection shared = DependencyInjection();

  DependencyInjection() {
    container = KiwiContainer();
  }

  void assemble(List<DIAssembly> assemblies) {
    for (var element in assemblies) {
      element.assemble(
        DIRegistrantImpl(
          container: container,
        ),
      );
    }
  }

  void clear() {
    container.clear();
  }
}
