import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/schemas/stuff_schema.dart';


class LocalDbProvider extends GetxService{
  late Isar isar;
  Future<LocalDbProvider> init() async {
    final dir = await getApplicationDocumentsDirectory();
    List<CollectionSchema<dynamic>> schemas= [
      StuffSchema,
    ];
    isar = await Isar.open(
      schemas,
      directory: dir.path,
    );
    return this;
  }

}