import 'package:dependency_injection/src/contracts/my_registrant.dart';

abstract class MyAssembly {
  /// Assemble
  /// To Register bunch of classes in once. Will be helpful to register
  /// all the instances in each modules, to be used by main app.
  ///
  /// @param:
  /// [r] : [ADIRegistrant]

  assemble(MyRegistrant r);
}
