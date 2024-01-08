import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:weather_app/app/models/schemas/stuff_category.dart';
import 'package:weather_app/app/models/schemas/stuff_schema.dart';
import 'package:weather_app/app/providers/local_db_provider.dart';
import 'package:weather_app/common/ui.dart';
import 'package:weather_app/generated/assets.dart';

import '../../../../common/mapper.dart';
import '../../../models/choosing_stuff.dart';

class StuffManageController extends GetxController {
  final picker = ImagePicker();
  RxList<ChoosingStuff> images = <ChoosingStuff>[].obs;
  RxList<Stuff> choosingStuffs = <Stuff>[].obs;
  RxList<StuffCategory> stuffCategories = <StuffCategory>[].obs;
  Isar localDb = Get.find<LocalDbProvider>().isar;
  RxBool choosingMode = false.obs;
  RxInt choosingAssetImage = 9999.obs;
  StuffCategory? choosingStuffCategoty;

  Future<void> initData() async {
    images.value = localDb.stuffs
        .filter()
        .idBetween(0, 100)
        .findAllSync()
        .map((e) => Mapper.mapStuffToChoosingStuff(e))
        .toList();
  }

  Future<void> initCategory() async {
    var categories =
        localDb.stuffCategorys.filter().idBetween(0, 100).findAllSync();
    if (categories.isEmpty) {
      stuffCategories.value = [
        StuffCategory(
            name: "Loại quần áo của bạn",
            icon: Assets.categoriesTshirt,
            filePaths: [
              Assets.fakeDataPan1,
              Assets.fakeDataPan2,
            ])
      ];

    } else {
      stuffCategories.value = categories;
    }
  }

  Future<void> createCategory(
      BuildContext context, StuffCategory category) async {
    try {
      await localDb.writeTxn(() async => localDb.stuffCategorys.put(category));
      await initData();
      Get.showSnackbar(Ui.SuccessSnackBar(message: "Tạo thành công"));
      notifyChildrens();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Có lỗi xảy ra"));
    }
  }

  Future<void> chooseImage() async {
    try {
      final pickedFile = await picker.pickMultiImage(
          imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
      List<XFile> pickedFiles = pickedFile;
      List<ChoosingStuff> stuffs = <ChoosingStuff>[];
      for (var i in pickedFiles) {
        var stuff = Stuff(
          filePath: i.path,
          name: i.name,
        );
        stuffs.add(Mapper.mapStuffToChoosingStuff(stuff));
        await localDb.writeTxn(() async => localDb.stuffs.put(stuff));
      }
      images.addAll(stuffs);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void changeChooseMode() {
    choosingMode.value = !choosingMode.value;
    for (var i in images) {
      i.key.currentState?.turnOffChoosing();
      i.key.currentState?.chooseMode = choosingMode.value;
    }
    images.addAll(images);
  }

  // @override
  // void dispose() {
  //
  //   super.dispose();
  // }
}
