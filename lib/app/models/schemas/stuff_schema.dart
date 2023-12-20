import 'package:isar/isar.dart';

part 'stuff_schema.g.dart';

@collection
class Stuff {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;

  String? filePath;

  String? categoryId;

  Stuff({this.name, this.filePath, this.categoryId});
}
