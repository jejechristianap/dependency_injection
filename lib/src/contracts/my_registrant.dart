import 'package:dependency_injection/src/contracts/my_resolver.dart';
import 'package:dependency_injection/src/implementations/my_resolver_impl.dart';
import 'package:kiwi/kiwi.dart';

/// This abstract class primarily created as a mixins which
/// used by the AgriakuDI class and ADIRegistrantImpl class because
/// both should have the same register functionality

abstract class MyRegistrant {
  late KiwiContainer container;

  /// Register
  /// Registering [T] Instance in-scope. Each class which resolve will get
  /// a new instance. So, it's not shared across classes.
  ///
  /// @param:
  /// - [resolver] : [T Function(ADIResolver r)]
  /// - [name] : [String?]

  register<T>(T Function(MyResolver r) resolver, {String? name}) {
    container.registerFactory(
      (c) => resolver(MyResolverImpl(container: c)),
      name: name,
    );
  }

  /// Register Singleton
  /// Registering [T] Instance as a singleton. Every classes which resolve
  /// this type of [T] will get the same instance. So, it'll shared accross
  /// classes
  ///
  /// @param:
  /// - [resolver] : [T Function(ADIResolver r)]
  /// - [name] : [String?]

  registerSingleton<T>(T Function(MyResolver r) resolver, {String? name}) {
    container.registerSingleton(
      (c) => resolver(MyResolverImpl(container: c)),
      name: name,
    );
  }
}
