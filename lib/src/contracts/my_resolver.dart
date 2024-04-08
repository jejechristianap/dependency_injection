import 'package:kiwi/kiwi.dart';

mixin MyResolver {
  late KiwiContainer container;

  /// Resolve instance
  ///

  T resolve<T>([String? name]) {
    return container.resolve<T>(name);
  }
}
