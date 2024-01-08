import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/models/schemas/stuff_category.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';
import 'package:weather_app/common/app_constant.dart';
import 'package:weather_app/common/size_config.dart';

class AddCategoryView extends GetView<StuffManageController>{
  @override
  Widget build(BuildContext context) {
    StuffCategory stuffCategory = StuffCategory();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Thêm loại vật dụng",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Text("Tên loại vật dụng:", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              const Gap(10),
              TextFormField(
                  onChanged: (s){
                    stuffCategory.name = s;
                  },
                  decoration: const InputDecoration(
                    hintText: "Nhập tên loại vật dụng"
                  )
              ),
              const Gap(20),
              const Text("Chọn hình đại diện:", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              const Gap(10),
              SizedBox(
               height: 200,
               child:  GridView.builder(
                   itemCount: AppConstants.stuffCategoryIcons.length,
                   gridDelegate:
                   const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 6, // Number of columns in the grid
                     crossAxisSpacing: 3.0, // Spacing between columns
                     mainAxisSpacing: 3.0, // Spacing between rows
                   ),
                   itemBuilder: (context, index) {
                     return InkWell(
                       onTap: (){
                         controller.choosingAssetImage.value = index;
                         stuffCategory.icon = AppConstants.stuffCategoryIcons[index];
                       },
                       child: Obx(
                         () => Container(
                           decoration: BoxDecoration(
                               color: controller.choosingAssetImage.value != index ? Colors.grey.withOpacity(.2) : Colors.blue,
                               borderRadius: BorderRadius.circular(5)
                           ),
                           padding: const EdgeInsets.all(8),
                           child: Image.asset(AppConstants.stuffCategoryIcons[index], width: 10, height: 10,),
                         ),
                       ),
                     );
                   }),
              ),
              const Gap(20),
              Center(
                child: Container(
                  width: SizeConfig.screenWidth! * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: InkWell(
                    onTap: () async {
                      if(stuffCategory.name!.isNotEmpty){
                        await controller.createCategory(context, stuffCategory);
                      } else {

                      }


                    },
                    child: const Center(
                      child: Text("Xác nhận", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  
}