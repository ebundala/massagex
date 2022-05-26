import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryTextInput extends StatelessWidget {
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

  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final InputCounterWidgetBuilder? buildCounter;
  final TextEditingController? controller;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final InputDecoration? decoration;
  final bool enableIMEPersonalizedLearning;
  final bool? enableInteractiveSelection;
  final bool enableSuggestions;
  final bool? enabled;
  final bool expands;
  final FocusNode? focusNode;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final Widget? label;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final MouseCursor? mouseCursor;
  final bool obscureText;
  final String obscuringCharacter;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final String? restorationId;
  final ScrollController? scrollController;
  final EdgeInsets scrollPadding;
  final ScrollPhysics? scrollPhysics;
  final TextSelectionControls? selectionControls;
  final bool? showCursor;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final StrutStyle? strutStyle;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final ToolbarOptions? toolbarOptions;
  final FormFieldValidator<String>? validator;

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

  final void Function(T?)? onChanged;
  final AlignmentGeometry alignment;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final BorderRadius? borderRadius;
  final InputDecoration? decoration;
  final Widget? disabledHint;
  final Color? dropdownColor;
  final int elevation;
  final bool? enableFeedback;
  final Color? focusColor;
  final FocusNode? focusNode;
  final Widget? hint;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final List<DropdownMenuItem<T>>? items;
  final Widget? label;
  final double? menuMaxHeight;
  final FormFieldSetter<T>? onSaved;
  final VoidCallback? onTap;
  final DropdownButtonBuilder? selectedItemBuilder;
  final TextStyle? style;
  final FormFieldValidator<T>? validator;
  final T? value;

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
  const DatePickerInput(
      {Key? key,
      required this.firstDate,
      required this.lastDate,
      required this.initialDate,
      this.selectedDate,
      required this.onChanged,
      this.label})
      : super(key: key);

  final DateTime firstDate;
  final DateTime initialDate;
  final Widget? label;
  final DateTime lastDate;
  final void Function(DateTime) onChanged;
  final DateTime? selectedDate;

  @override
  State<DatePickerInput> createState() => _DatePickerInputState();
}

class _DatePickerInputState extends State<DatePickerInput> {
  final _focusNode = FocusNode();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.selectedDate != null) {
      formatDate(widget.selectedDate!);
    }
  }

  void onFocused() async {
    final date = await showDatePicker(
        context: context,
        initialDate: widget.initialDate,
        firstDate: widget.firstDate,
        lastDate: widget.lastDate);
    _focusNode.nextFocus();
    if (date != null) {
      formatDate(date);

      widget.onChanged(date);
    }
  }

  void formatDate(DateTime date) {
    final splited = date.toString().split(" ");
    if (splited.length == 2) {
      final date = splited.first;

      _textController.value = TextEditingValue(text: date);
    } else {
      _textController.value = TextEditingValue.empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryTextInput(
      label: widget.label,
      focusNode: _focusNode,
      controller: _textController,
      inputFormatters: [
        TextInputFormatter.withFunction((oldValue, newValue) {
          final splited = newValue.text.split(" ");
          if (splited.length == 2) {
            final date = splited.first;

            return TextEditingValue(text: date);
          }
          return TextEditingValue.empty;
        })
      ],
      onTap: () => onFocused(),
    );
  }
}

class OTPInput extends StatefulWidget {
  const OTPInput({Key? key, this.length = 4}) : super(key: key);

  final int length;

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  final List<TextEditingController> controllers = [];
  final List<FocusNode> _focusNodes = [];
  InputDecoration getDecoration(radius) => InputDecoration(
      //  focusColor: const Color.fromRGBO(255, 138, 0, 1),
      isDense: true,
      // hintText: "*",
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      isCollapsed: true,
      counter: const SizedBox(
        height: 0,
        width: 0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color.fromRGBO(255, 138, 0, 1)),
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
      border: OutlineInputBorder(
        // borderSide: BorderSide(color: Color.fromRGBO(255, 138, 0, 1)),

        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ));

  @override
  void initState() {
    controllers.addAll(
        List.generate(widget.length, (index) => TextEditingController()));
    _focusNodes.addAll(
      List.generate(
        widget.length,
        (index) => FocusNode(
          onKeyEvent: (node, event) => onKeyEvent(node, event, index),
        ),
      ),
    );

    super.initState();
  }

  KeyEventResult onKeyEvent(FocusNode node, KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        index != 0 &&
        event.logicalKey.keyLabel == "Backspace" &&
        controllers[index].text.isEmpty) {
      _focusNodes[index - 1].requestFocus();
      return KeyEventResult.handled;
    }
    if (event.character?.contains(RegExp('^[a-zA-Z0-9]*\$')) == true &&
        index + 1 < widget.length) {
      controllers[index].text = event.character!;
      _focusNodes[index + 1].requestFocus();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  TextEditingValue textFormator(
      TextEditingValue oldValue, TextEditingValue newValue, int index) {
    if (oldValue.text != newValue.text &&
        newValue.text.length > 1 &&
        index == 0) {
      var v;
      final len = newValue.text.characters.length;
      if (len > 0) {
        for (var i = 0; i < widget.length; i++) {
          if (i < len) {
            final character = newValue.text.characters.elementAt(i);
            if (i != index) {
              controllers[i].value = TextEditingValue(text: character);
            } else {
              v = TextEditingValue(text: character);
            }
          }
        }
        return v ?? newValue;
      }
    }
    return newValue;
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
        fontFamily: 'Gordita',
        fontWeight: FontWeight.w700,
        // textBaseline: TextBaseline.ideographic,
        fontSize: 24,
        height: 1.625);

    return Row(
      children: [
        for (var i = 0; i < widget.length; i++)
          SizedBox(
              height: 66,
              width: 66,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  child: LayoutBuilder(builder: (context, constraints) {
                    final radius = constraints.maxHeight / 2;
                    return TextFormField(
                      // obscureText: true,
                      controller: controllers[i],
                      focusNode: _focusNodes[i],
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) =>
                            textFormator(oldValue, newValue, i))
                      ],
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      onEditingComplete: () {
                        _focusNodes[i].nextFocus();
                      },
                      style: style,
                      decoration: getDecoration(radius),
                      maxLength: 1,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    );
                  }),
                ),
              )),
      ],
    );
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
