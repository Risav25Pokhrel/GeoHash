import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geohash/core/config/app_colors.dart';
import 'package:geohash/core/controllers/textcontrollers.dart';
import 'package:geohash/core/services/get.dart';
import 'package:geohash/core/shared_widgets/formfields/apptextformfield.dart';
import 'package:geohash/core/shared_widgets/specialwidgets/showdialog.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:geohash/geohashing/domains/riverpods/geohasingnotifier.dart';

pickColor() async {
  Color color = AppColors.indigo;
  await showPlatformDialog(
      context: Get.context,
      builder: (context) => Consumer(
            builder: (_, WidgetRef ref, __) {
              final geo = ref.watch(geoNotifier);
              return Appdialog(
                title: "Pick Color",
                onchanged: () {
                  String colorString = color.toString();
                  String hexString = colorString.split('(0x')[1].split(')')[0];
                  final colorHexValue = int.parse("0x$hexString");
                  geo.updateColors(colorHexValue);
                  Get.pop();
                  getName();
                },
                content: SizedBox(
                    width: 200,
                    child: ColorPicker(
                        color: Color(geo.colorHexValue),
                        onChanged: (pickedColor) {
                          color = pickedColor;
                        })),
              );
            },
          ));
}

getName() async {
  await showPlatformDialog(
    context: Get.context,
    builder: (context) => Consumer(
      builder: (context, ref, child) {
        final geo = ref.watch(geoNotifier);
        final nameController = ref.watch(textController("Name"));
        nameController.text = geo.areaName;
        return Appdialog(
          title: "Enter Area",
          onchanged: () {
            final name = nameController.text;
            geo.updateAreaName(name);
            Get.pop();
          },
          content: AppTextformfield(
              maxCharacter: 10,
              controller: nameController,
              hinttext: "Area Name"),
        );
      },
    ),
  );
}
