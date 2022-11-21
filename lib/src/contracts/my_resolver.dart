import 'package:kiwi/kiwi.dart';

abstract class MyResolver {
  late KiwiContainer container;

  /// Resolve instance
  ///

  T resolve<T>([String? name]) {
    return container.resolve<T>(name);
  }
}
