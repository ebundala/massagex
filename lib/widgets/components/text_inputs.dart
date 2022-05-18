import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class PrimaryTextInput extends StatelessWidget {
  const PrimaryTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        decoration: ,
      
    );
  }
}

class DropdownInput extends StatelessWidget {
  const DropdownInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField();
  }
}

class DatePickerInput extends StatelessWidget {
  const DatePickerInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField();
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
    return TextFormField();
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
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "Dropdown", type: DropdownInput)
Widget getTextField1(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: DropdownInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
            ),
      ),
    );

@WidgetbookUseCase(name: "datepicker", type: DatePickerInput)
Widget getTextField2(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.background,
      height: 500,
      width: 500,
      child: const Center(
        child: DatePickerInput(
            // onPressed: () {},
            // child: const Gordita(text: text),
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
