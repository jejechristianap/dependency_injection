import 'package:dependency_injection/src/contracts/my_registrant.dart';
import 'package:kiwi/kiwi.dart';

class MyRegistrantImpl with MyRegistrant {
  MyRegistrantImpl({required KiwiContainer container}) {
    this.container = container;
  }
}
