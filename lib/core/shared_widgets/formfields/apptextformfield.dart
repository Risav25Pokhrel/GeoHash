import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../config/app_colors.dart';
import '../../services/get.dart';
import '../botton/appicon.dart';

class AppTextformfield extends StatelessWidget {
  const AppTextformfield(
      {super.key,
      this.tohide = false,
      this.controller,
      this.hinttext,
      this.textInputType,
      this.inputFormatters,
      this.icon,
      this.validator,
      this.onchanged,
      this.maxline = 1,
      this.suffixIcon,
      this.autofocus = false,
      this.readOnly = false,
      this.maxCharacter,
      this.title,
      this.fillColor,
      this.direction,
      this.suggestions,
      this.contentPadding,
      this.node,
      this.height,
      this.isDense = false,
      this.radius = 13,
      this.onSubmitted});

  final bool tohide;
  final TextEditingController? controller;
  final String? hinttext;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final bool autofocus;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final int? maxline;
  final Function(String)? onchanged;
  final bool readOnly;
  final Widget? suffixIcon;
  final int? maxCharacter;
  final String? title;
  final Color? fillColor;
  final TextDirection? direction;
  final EdgeInsetsGeometry? contentPadding;
  final double radius;
  final double? height;
  final bool isDense;
  final FocusNode? node;
  final List<String>? suggestions;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final obscure = ValueNotifier<bool>(true);
    final inputCharacterLength =
        ValueNotifier(controller != null ? controller?.text.length : '0');
    final border = OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(radius).r);
    final padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4).r;
    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 7).r,
      child: SizedBox(
          width: (Get.width - 50).w,
          height: height,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              if (title != null)
                Padding(
                    padding: padding,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title!, style: Get.headlineMedium))),
              const Spacer(),
              if (maxCharacter != null)
                Padding(
                    padding: padding,
                    child: ValueListenableBuilder(
                      valueListenable: inputCharacterLength,
                      builder: (context, length, child) => Align(
                          alignment: Alignment.centerRight,
                          child: Text('$length/$maxCharacter',
                              style: Get.headlineMedium.px10)),
                    ))
            ]),
            TypeAheadField<String>(
                controller: controller,
                autoFlipDirection: true,
                hideOnEmpty: true,
                hideOnError: true,
                debounceDuration: Durations.short4,
                suggestionsCallback: (query) {
                  return List<String>.of(suggestions ?? []).where((suggest) {
                    final suggestData = suggest.toLowerCase();
                    final queryState = query.toLowerCase();
                    return suggestData.contains(queryState);
                  }).toList();
                },
                itemBuilder: (context, value) => suggestions != null
                    ? ListTile(title: Text(value))
                    : const SizedBox.shrink(),
                builder: (context, controller, focusNode) =>
                    ValueListenableBuilder(
                      valueListenable: obscure,
                      builder: (context, hide, child) {
                        final bool obs = tohide && hide;
                        return TextFormField(
                            key: Get.key(controller),
                            readOnly: readOnly,
                            scrollPhysics: Get.scrollPhysics,
                            keyboardAppearance: Get.brightness,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            focusNode: node ?? focusNode,
                            textDirection: direction ?? TextDirection.ltr,
                            enableSuggestions: true,
                            enableInteractiveSelection: true,
                            magnifierConfiguration:
                                TextMagnifier.adaptiveMagnifierConfiguration,
                            undoController: UndoHistoryController(
                                value: const UndoHistoryValue(
                                    canUndo: true, canRedo: true)),
                            textAlign: TextAlign.justify,
                            autofocus: autofocus,
                            obscuringCharacter: '*',
                            controller: controller,
                            onFieldSubmitted: onSubmitted,
                            obscureText: obs,
                            spellCheckConfiguration: SpellCheckConfiguration(
                                spellCheckService: DefaultSpellCheckService(),
                                misspelledSelectionColor: Get.primaryColor),
                            inputFormatters: inputFormatters ??
                                (maxCharacter != null
                                    ? [
                                        LengthLimitingTextInputFormatter(
                                            maxCharacter)
                                      ]
                                    : null),
                            autocorrect: true,
                            expands: maxline == null,
                            showCursor: !readOnly,
                            keyboardType: textInputType,
                            selectionControls: Get.selectionControl,
                            validator: validator,
                            cursorColor: Get.primaryColor,
                            onChanged: onchanged ??
                                (p0) => inputCharacterLength.value =
                                    p0.length.toString(),
                            maxLines: maxline,
                            decoration: InputDecoration(
                                isDense: isDense,
                                contentPadding: contentPadding ??
                                    const EdgeInsets.all(15).r,
                                iconColor: AppColors.grey,
                                fillColor: fillColor,
                                filled: true,
                                suffixIconColor: Get.disabledColor.o6,
                                prefixIconColor: Get.disabledColor.o6,
                                enabledBorder: border,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Get.primaryColor, width: 1),
                                    borderRadius:
                                        BorderRadius.circular(radius).r),
                                focusedErrorBorder: border,
                                focusedBorder: border,
                                prefixIcon: icon != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 5)
                                            .r,
                                        child: icon)
                                    : tohide
                                        ? AppIcon(Get.padLock)
                                        : null,
                                hintText: hinttext,
                                alignLabelWithHint: true,
                                hintStyle: Get.bodyMedium.px13.disabledO5,
                                suffixIconConstraints:
                                    BoxConstraints(minHeight: 8.h),
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.start,
                                suffixIcon: tohide
                                    ? AppIcon(
                                        onTap: () => obscure.value = !hide,
                                        padding:
                                            const EdgeInsets.only(right: 8).r,
                                        hide
                                            ? Get.visibilityOff
                                            : Get.visibilityOn)
                                    : suggestions != null
                                        ? AppIcon(
                                            Get.dropDown,
                                            color: Get.primaryColor,
                                            padding:
                                                const EdgeInsets.only(right: 5)
                                                    .r,
                                          )
                                        : suffixIcon));
                      },
                    ),
                onSelected: (String value) => controller?.text = value)
          ])),
    );
  }
}
