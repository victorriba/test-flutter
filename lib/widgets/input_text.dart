import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  final bool? dark;
  final double? width;
  final bool? password;
  final Widget? prefix;
  final Widget? suffix;
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final Function? onValidate;
  final Function? onChange;
  final TextInputType? keyboard;
  final TextInputFormatter? formatter;

  const InputText({
    Key? key,
    this.dark,
    this.width,
    this.password,
    this.prefix,
    this.suffix,
    this.label,
    this.placeholder,
    this.controller,
    this.onValidate,
    this.onChange,
    this.keyboard,
    this.formatter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _colorText = (dark == true ? Colors.white : primaryColor);
    return TextFormField(
      keyboardType: keyboard ?? TextInputType.text,
      obscureText: password ?? false,
      textInputAction: TextInputAction.next,
      cursorColor: dark == true ? Colors.white : Colors.black26,
      controller: controller,
      validator: (value) => onValidate!(value),
      onChanged: (value) {
        onChange != null ? onChange!(value) : null;
      },
      style: TextStyle(color: _colorText),
      inputFormatters: [if (formatter != null) formatter!],
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: width ?? 300),
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        hintText: placeholder,
        hintStyle: const TextStyle(color: Color(0xFFABABAB)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor, width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(4.0))
        ),
      ),
    );
  }
}
