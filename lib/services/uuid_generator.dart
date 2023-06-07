import 'package:uuid/uuid.dart';

class UuidGenerator {
  static String getId() {
    const Uuid uuid = Uuid();
    return uuid.v1();
  }
}
