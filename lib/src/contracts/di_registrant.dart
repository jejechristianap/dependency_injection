import 'package:dependency_injection/src/contracts/di_resolver.dart';
import 'package:dependency_injection/src/implementations/di_resolver_impl.dart';
import 'package:kiwi/kiwi.dart';

/// This abstract class primarily created as a mixins which
/// used by the AgriakuDI class and ADIRegistrantImpl class because
/// both should have the same register functionality

mixin DIRegistrant {
  late KiwiContainer container;

  /// Register
  /// Registering [T] Instance in-scope. Each class which resolve will get
  /// a new instance. So, it's not shared across classes.
  ///
  /// @param:
  /// - [resolver] : [T Function(ADIResolver r)]
  /// - [name] : [String?]

  register<T>(T Function(DIResolver r) resolver, {String? name}) {
    container.registerFactory(
      (c) => resolver(DIResolverImpl(container: c)),
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

  registerSingleton<T>(T Function(DIResolver r) resolver, {String? name}) {
    container.registerSingleton(
      (c) => resolver(DIResolverImpl(container: c)),
      name: name,
    );
  }
}
