import 'package:flutter/cupertino.dart';

import '../modules/stuff_manage/views/components/stuff_item.dart';

class ChoosingStuff{

  GlobalKey<StuffItemState> key = GlobalKey();

  String? name;

  String? filePath;

  String? categoryId;

  bool isChoose = false;

  ChoosingStuff({this.name, this.filePath, this.categoryId});
}