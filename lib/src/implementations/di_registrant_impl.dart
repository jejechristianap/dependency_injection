import 'package:dependency_injection/src/contracts/di_registrant.dart';
import 'package:kiwi/kiwi.dart';

class DIRegistrantImpl with DIRegistrant {
  DIRegistrantImpl({required KiwiContainer container}) {
    this.container = container;
  }
}
