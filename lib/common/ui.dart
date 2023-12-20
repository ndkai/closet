import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetSnackBar SuccessSnackBar(
      {String title = 'Thành công', required String message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(
          TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(
          TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: Icon(
          Icons.check_circle_outline, size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
    );
  }

  static GetSnackBar ErrorSnackBar(
      {String title = 'Lỗi', required String message}) {
    Get.log("[$title] $message", isError: true);
    Get.closeAllSnackbars();
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(
          TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(
          TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: Icon(
          Icons.remove_circle_outline, size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  static GetSnackBar RemindSnackBar(
      {String title = 'Nhắc nhở', required String message}) {
    Get.log("[$title] $message", isError: true);
    Get.closeAllSnackbars();
    return GetSnackBar(

      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(
          const TextStyle(color: Colors.white))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(
          const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.orange,
      icon: const Icon(Icons.info_outline, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }

  static GetSnackBar defaultSnackBar(
      {String title = 'Cảnh báo', required String message}) {
    Get.log("[$title] $message", isError: false);
    Get.closeAllSnackbars();
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(
          const TextStyle(color: Colors.black))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(
          const TextStyle(color: Colors.black))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(
          Icons.warning_amber_rounded, size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar notificationSnackBar(
      {String title = 'Notification', required String message, OnTap? onTap, Widget? mainButton}) {
    Get.log("[$title] $message", isError: false);
    Get.closeAllSnackbars();
    return GetSnackBar(
      onTap: onTap,
      mainButton: mainButton,
      titleText: Text(title.tr, style: Get.textTheme.headline6!.merge(
          TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message, style: Get.textTheme.caption!.merge(
          TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: Icon(
          Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF"))).withOpacity(
          opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static String mapWeatherToImage(String weather){
    switch(weather.toLowerCase()) {
      case "clouds":
        return "assets/weather_icons/cloudy.png";
      case "rain":
        return "assets/weather_icons/rain.png";
      case "clear":
        return "assets/weather_icons/sunny.png";
      default:
        return "assets/weather_icons/sunny.png";
    }

  }

  static String mapWeatherToBackground(String weather){
    switch(weather.toLowerCase()) {
      case "clouds":
        return "assets/background_states/hc.jpg";
      case "rain":
        return "assets/background_states/lr.jpg";
      case "clear":
        return "assets/background_states/lc.jpg";
      default:
        return "assets/background_states/c.jpg";
    }

  }

  static TextStyle smallTextStyle(){
    return const TextStyle(
        color: Colors.white, fontSize: 16
    );
}


  static TextStyle titleTextStyle(){
    return const TextStyle(
        color: Colors.white, fontSize: 16
    );
  }

  static TextStyle mediumTextStyle(){
    return const TextStyle(
        color: Colors.white, fontSize: 18
    );
  }

  static void showLoadingDialog(BuildContext context){
    Size size = MediaQuery.of(context).size;
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(size.width! * 0.05))
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: size.width! * 0.35),
          content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height! * 0.4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/loading_gif.gif", width: size.width! * 0.15,),
              ],
            ),
          ),
        );
      },
    );
  }
}