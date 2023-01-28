import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.readOnly = false,
    this.label,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.controller,
    this.validator,
    this.autofocus = false,
    this.focusNode,
    this.autofillHints,
    this.autocorrect = false,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.scrollPadding = const EdgeInsets.all(20),
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.words,
    this.inputFormatters,
    this.autovalidateMode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String? initialValue;
  final String? label;
  final TextEditingController? controller;

  final bool readOnly;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;

  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  final Iterable<String>? autofillHints;
  final bool enableSuggestions;
  final bool autocorrect;

  final bool obscureText;
  final String obscuringCharacter;

  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;

  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onEditingComplete;

  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 72,
      ),
      child: Center(
        child: TextFormField(
          key: key,
          focusNode: focusNode,
          initialValue: initialValue,
          readOnly: readOnly,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          controller: controller,
          validator: validator,
          autofocus: autofocus,
          autofillHints: autofillHints,
          autocorrect: autocorrect,
          enableSuggestions: enableSuggestions,
          obscureText: obscureText,
          obscuringCharacter: obscuringCharacter,
          scrollPadding: scrollPadding,
          keyboardType: keyboardType,
          autovalidateMode: autovalidateMode,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onChanged: onChanged,
          maxLength: maxLength,
          minLines: minLines,
          maxLines: maxLines,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            isDense: true,

            // filled: true,
            // fillColor: const Color(0xFFFDFDFD),
            contentPadding: prefixIcon == null ? null : EdgeInsets.zero,
            hintText: hintText,
            label: label != null ? Text(label!) : null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            labelStyle: const TextStyle(fontSize: 15),
            alignLabelWithHint: false,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.auto,

            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primaryContainer,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: CustomColors.red,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.tertiary,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1.75,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
