import 'package:weather_app/app/models/schemas/stuff_schema.dart';

import '../app/models/choosing_stuff.dart';

class Mapper {
  static ChoosingStuff mapStuffToChoosingStuff(Stuff stuff) {
    return ChoosingStuff(
        name: stuff.name,
        categoryId: stuff.categoryId,
        filePath: stuff.filePath);
  }
}
