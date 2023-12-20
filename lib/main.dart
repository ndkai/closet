import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/app/services/translation_service.dart';

import 'app/providers/remote_data_provider.dart';
import 'app/routes/theme1_app_page.dart';
import 'app/providers/local_db_provider.dart';
import 'app/services/setting_service.dart';

Future<void> initServices() async {
  Get.log('starting service ...');
  await GetStorage.init();
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => LocalDbProvider().init());
  // await Get.putAsync(() => SettingProvider().init());
  // await Get.putAsync(() => FirebaseProvider().init());
  // await Get.putAsync(() => SettingsService().init());
  await Get.putAsync(() => RemoteDataProvider().init());
  Get.log('all service started ...');
}

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initServices();

  SystemChrome.restoreSystemUIOverlays();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      GetMaterialApp(
        title: "Weather app",
        initialRoute: Theme1AppPages.INITIAL,
        onReady: () async {},
        getPages: Theme1AppPages.routes,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: Get.find<TranslationService>().supportedLocales(),
        translationsKeys: Get.find<TranslationService>().translations,
        locale: Get.find<SettingsService>().getLocale(),
        fallbackLocale: Get.find<TranslationService>().fallbackLocale,
        debugShowCheckedModeBanner: false,
        color: Colors.black,
        defaultTransition: Transition.cupertino,
        themeMode: Get.find<SettingsService>().getThemeMode(),
        theme: Get.find<SettingsService>().getLightTheme(),
        darkTheme: Get.find<SettingsService>().getDarkTheme(),
      ),
    );
  });
}
