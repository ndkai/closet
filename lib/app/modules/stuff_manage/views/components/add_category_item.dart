import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/size_config.dart';

class AddCategoryItem extends StatefulWidget {
  final Function callback;
  const AddCategoryItem({super.key, required this.callback});

  @override
  State<AddCategoryItem> createState() => _AddCategoryItemState();
}

class _AddCategoryItemState extends State<AddCategoryItem> {
  bool editMode = false;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
            onTap: () {

              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.6,
                  child: TextField(
                    focusNode: _focusNode,
                    onSubmitted: (s){

                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                        hintText:  "Thêm loại vật dụng của bạn",
                      hintStyle: GoogleFonts.sourceSans3(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.check),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
