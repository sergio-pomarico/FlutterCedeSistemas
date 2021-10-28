import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Input extends StatefulWidget {
  Input(
      {required this.controller,
      required this.label,
      this.placeholder = '',
      this.error,
      this.icon,
      this.enable = true,
      this.autocorrect = false,
      this.autofocus = false,
      this.enableAutoSuggestions = false,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      required this.onChange,
      this.sufix,
      this.multiline = false,
      Key? key})
      : super(key: key);

  final TextEditingController controller;
  final String label;
  final String? error;
  final String placeholder;
  final IconData? icon;
  final Widget? sufix;
  final bool enable;
  final bool autocorrect;
  final bool autofocus;
  final bool enableAutoSuggestions;
  final bool multiline;
  final void Function(String) onChange;
  final TextInputType keyboardType;
  final bool isPassword;

  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  InputDecoration getDecorator() => InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: widget.error != null ? Colors.red[200] : textColor,
        ),
        hintText: widget.placeholder,
        prefixIcon: Icon(
          widget.icon,
          color: widget.error != null ? Colors.red[200] : textColor,
        ),
        suffix: widget.sufix,
        errorText: widget.error,
        errorMaxLines: 2,
      );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return TextFormField(
      // TODO: Input formaters agregar logica
      //inputFormatters: [],
      controller: widget.controller,
      enabled: widget.enable,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableAutoSuggestions,
      decoration: getDecorator(),
      onChanged: widget.onChange,
      obscureText: widget.isPassword,
    );
  }
}
