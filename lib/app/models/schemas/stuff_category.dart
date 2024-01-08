import 'package:isar/isar.dart';

part 'stuff_category.g.dart';

@collection
class StuffCategory {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? name;

  List<String>? filePaths;

  String? icon;

  StuffCategory({this.name, this.filePaths, this.icon});
}
