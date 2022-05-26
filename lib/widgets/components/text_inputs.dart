import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;

  final Widget? label;

  const PrimaryTextInput(
      {Key? key,
      this.controller,
      this.initialValue,
      this.label,
      this.focusNode,
      this.keyboardType,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlignVertical,
      this.toolbarOptions,
      this.showCursor,
      this.smartDashesType,
      this.smartQuotesType,
      this.maxLengthEnforcement,
      this.minLines,
      this.maxLength,
      this.onChanged,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.enableInteractiveSelection,
      this.selectionControls,
      this.buildCounter,
      this.scrollPhysics,
      this.autofillHints,
      this.autovalidateMode,
      this.scrollController,
      this.restorationId,
      this.mouseCursor,
      this.enableIMEPersonalizedLearning = true,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.cursorWidth = 2.0,
      this.expands = false,
      this.enableSuggestions = true,
      this.decoration = const InputDecoration(),
      this.textCapitalization = TextCapitalization.none,
      this.autocorrect = true,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.readOnly = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultTextStyle(
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    //height: 19,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(128, 128, 128, 1)),
                child: label!),
          ),
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: const TextStyle(
                  color: Color.fromRGBO(22, 10, 49, 1),
                  fontSize: 15,
                  fontFamily: 'Gordita',
                  // height: 1,
                  fontWeight: FontWeight.w400)
              .merge(style),
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlignVertical: textAlignVertical,
          toolbarOptions: toolbarOptions,
          showCursor: showCursor,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          maxLengthEnforcement: maxLengthEnforcement,
          minLines: minLines,
          maxLines: maxLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorColor: cursorColor,
          keyboardAppearance: keyboardAppearance,
          enableInteractiveSelection: enableInteractiveSelection,
          selectionControls: selectionControls,
          buildCounter: buildCounter,
          scrollPhysics: scrollPhysics,
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          scrollController: scrollController,
          restorationId: restorationId,
          mouseCursor: mouseCursor,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          scrollPadding: scrollPadding,
          cursorWidth: cursorWidth,
          expands: expands,
          enableSuggestions: enableSuggestions,
          decoration: decoration,
          textCapitalization: textCapitalization,
          autocorrect: autocorrect,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          textAlign: textAlign,
          autofocus: autofocus,
          readOnly: readOnly,
        ),
      ],
    );
  }
}

class DropdownInput<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final DropdownButtonBuilder? selectedItemBuilder;
  final T? value;
  final Widget? hint;
  final Widget? disabledHint;
  final void Function(T?)? onChanged;
  final VoidCallback? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final InputDecoration? decoration;
  final FormFieldSetter<T>? onSaved;
  final FormFieldValidator<T>? validator;
  final AutovalidateMode? autovalidateMode;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final BorderRadius? borderRadius;

  final Widget? label;

  const DropdownInput(
      {Key? key,
      required this.items,
      this.selectedItemBuilder,
      this.value,
      this.hint,
      this.disabledHint,
      this.onChanged,
      this.onTap,
      this.elevation = 8,
      this.style,
      this.icon,
      this.iconDisabledColor,
      this.iconEnabledColor,
      this.iconSize = 24.0,
      this.isDense = true,
      this.isExpanded = false,
      this.itemHeight,
      this.focusColor,
      this.focusNode,
      this.autofocus = false,
      this.dropdownColor,
      this.decoration,
      this.onSaved,
      this.validator,
      this.autovalidateMode,
      this.menuMaxHeight,
      this.enableFeedback,
      this.alignment = AlignmentDirectional.centerStart,
      this.borderRadius,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DefaultTextStyle(
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(128, 128, 128, 1)),
                child: label!),
          ),
        DropdownButtonFormField<T>(
            items: items,
            selectedItemBuilder: selectedItemBuilder,
            value: value,
            hint: hint,
            disabledHint: disabledHint,
            onChanged: onChanged,
            onTap: onTap,
            elevation: elevation,
            style: const TextStyle(
                    color: Color.fromRGBO(22, 10, 49, 1),
                    fontSize: 15,
                    fontFamily: 'Gordita',
                    fontWeight: FontWeight.w400)
                .merge(style),
            icon: icon ??
                Icon(
                  IconlyLight.arrow_down_2,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            iconDisabledColor: iconDisabledColor,
            iconEnabledColor: iconEnabledColor,
            iconSize: iconSize,
            isDense: isDense,
            isExpanded: isExpanded,
            itemHeight: itemHeight,
            focusColor: focusColor,
            focusNode: focusNode,
            autofocus: autofocus,
            dropdownColor: dropdownColor,
            decoration: decoration,
            onSaved: onSaved,
            validator: validator,
            autovalidateMode: autovalidateMode,
            menuMaxHeight: menuMaxHeight,
            enableFeedback: enableFeedback,
            alignment: alignment,
            borderRadius: borderRadius ?? BorderRadius.circular(8)),
      ],
    );
  }
}

class DatePickerInput extends StatefulWidget {
  final DateTime firstDate;

  final DateTime lastDate;

  final DateTime initialDate;
  final DateTime? selectedDate;

  final void Function(DateTime) onChanged;

  final Widget? label;
  const DatePickerInput(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.initialDate,
      this.selectedDate,
      required this.onChanged,
      this.label})
      : super(key: key);

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  final _focusNode = FocusNode();
  final _textController = TextEditingController();
  void onFocused() async {
    final date = await showDatePicker(
        context: context,
        initialDate: widget.initialDate,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate);
    _focusNode.nextFocus();
    if (date != null) {
      _textController.text = date.toString();
      widget.onChanged(date);
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.selectedDate != null) {
      _textController.text = widget.selectedDate.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryTextInput(
      label: widget.label,
      focusNode: _focusNode,
      controller: _textController,
      onTap: () => onFocused(),
    );
  }
}

class OTPInput extends StatelessWidget {
  const OTPInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class LocationInput extends StatelessWidget {
  const LocationInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class ScheduleInput extends StatelessWidget {
  const ScheduleInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PrimaryTextInput(
      label: const Text(
        "Schedule",
      ),
      onTap: () async {
        await showDateRangePicker(
            context: context,
            firstDate: DateTime(2021),
            lastDate: DateTime.now());
        showTimePicker(context: context, initialTime: TimeOfDay.now());
      },
    );
  }
}

class PhoneInput extends StatelessWidget {
  const PhoneInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class FilledTextInput extends StatelessWidget {
  const FilledTextInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

@WidgetbookUseCase(name: "primary", type: PrimaryTextInput)
Widget getTextField(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PrimaryTextInput(
          label: Text(
            "Your name here",
          ),
        ),
      ),
    );

@WidgetbookUseCase(name: "Dropdown", type: DropdownInput)
Widget getTextField1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: DropdownInput<int>(
          label: const Text(
            "Your name here",
          ),
          onChanged: (v) {},
          items: [1, 2, 3]
              .map((e) => DropdownMenuItem(
                  value: e, child: SizedBox(height: 30, child: Text("$e"))))
              .toList(),
        ),
      ),
    );

@WidgetbookUseCase(name: "datepicker", type: DatePickerInput)
Widget getTextField2(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: Center(
        child: DatePickerInput(
          label: const Text(
            "Birthdate",
          ),
          firstDate: DateTime(1970),
          initialDate: DateTime(2022),
          lastDate: DateTime(2022, 5, 24),
          selectedDate: DateTime.now(),
          onChanged: (date) {},
        ),
      ),
    );

@WidgetbookUseCase(name: "OTP", type: OTPInput)
Widget getTextField3(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: OTPInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "Search", type: SearchInput)
Widget getTextField4(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: SearchInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "schedule", type: ScheduleInput)
Widget getTextField5(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: ScheduleInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "location", type: LocationInput)
Widget getTextField6(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: LocationInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "Phone", type: PhoneInput)
Widget getTextField7(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: PhoneInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "filled", type: FilledTextInput)
Widget getTextField8(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: FilledTextInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );
