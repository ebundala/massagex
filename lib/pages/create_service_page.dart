import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:massagex/graphql/clients/create_service/create_service_bloc.dart';
import 'package:massagex/graphql/clients/update_service/update_service_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/scalars/json_object.dart';
import 'package:models/service.dart';

class CreateServicePage extends StatefulWidget {
  const CreateServicePage({Key? key, this.service}) : super(key: key);
  final Service? service;
  @override
  _CreateServicePageState createState() => _CreateServicePageState();
}

class _CreateServicePageState extends State<CreateServicePage> {
  final serviceNameCtr = TextEditingController();
  final detailsCtr = TextEditingController();
  final priceCtr = TextEditingController();
  final inputHeight = 114.0;

  Duration? duration;
  final durations = List.generate(
    10,
    ((index) {
      final v = Duration(minutes: 15 * (index + 1));
//showTimePicker(context: context, initialTime: initialTime)
      return DropdownMenuItem(
          value: v,
          child: Nunito(
            text: v.inHours > 0
                ? "${(v.inMinutes / 60).toStringAsFixed(2)} Hours"
                : "${v.inMinutes} Minutes",
          ));
    }),
  );

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.service != null) {
      serviceNameCtr.text = widget.service!.name ?? "";
      detailsCtr.text = widget.service!.description ?? "";
      priceCtr.text = widget.service!.price?.toStringAsFixed(2) ?? "";
      if (widget.service?.metadata != null) {
        final _duration =
            int.tryParse(widget.service!.metadata?.value["duration"]);
        if (_duration != null) {
          duration = Duration(minutes: _duration);
        }
      }
    }
    super.initState();
  }

  bool get isSaved => widget.service?.isSaved ?? false;

  @override
  Widget build(BuildContext context) {
    return PageLayoutWidget(
      title: "Massage Services",
      children: [
        MultiBlocProvider(
          providers: [
            BlocProvider<CreateServiceBloc>(
              create: ((context) =>
                  CreateServiceBloc(client: context.app.client!)),
            ),
            BlocProvider<UpdateServiceBloc>(
              create: ((context) =>
                  UpdateServiceBloc(client: context.app.client!)),
            )
          ],
          child: Builder(builder: (context) {
            return BlocBuilder<CreateServiceBloc, CreateServiceState>(
                builder: (context, cState) {
              return BlocBuilder<UpdateServiceBloc, UpdateServiceState>(
                builder: (context, uState) {
                  final loading = cState is CreateServiceInProgress ||
                      uState is UpdateServiceInProgress;
                  final success = cState is CreateServiceSuccess ||
                      uState is UpdateServiceSuccess;
                  final cError = cState is CreateServiceError ||
                      cState is CreateServiceFailure;
                  final uError = uState is UpdateServiceError ||
                      uState is UpdateServiceFailure;

                  return Form(
                      key: formKey,
                      child: ListBody(children: [
                        const SizedBox(
                          height: 40,
                        ),
                        ValueListenableBuilder<TextEditingValue>(
                            valueListenable: serviceNameCtr,
                            builder: (context, v, _) {
                              return Nunito(
                                text: v.text.isEmpty ? "Service name" : v.text,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              );
                            }),
                        const Nunito(
                          text: "Please edit details of your service",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        PrimaryCard(
                          borderRadius: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: ListBody(
                              children: [
                                SizedBox(
                                  height: inputHeight,
                                  child: PrimaryTextInput(
                                    label: const Nunito(text: "Service name"),
                                    controller: serviceNameCtr,
                                    validator: (v) {
                                      if (v == null || v.isEmpty == true) {
                                        return "Service name is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: inputHeight + 40,
                                  child: PrimaryTextInput(
                                    label: const Nunito(text: "Details"),
                                    maxLines: 3,
                                    controller: detailsCtr,
                                    validator: (v) {
                                      if (v == null || v.isEmpty == true) {
                                        return "Details is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: inputHeight + 7,
                                  child: DropdownInput<Duration>(
                                      items: durations,
                                      label: const Nunito(text: "Duration"),
                                      validator: (v) {
                                        if (v == null) {
                                          return "Duration is required";
                                        }
                                        return null;
                                      },
                                      onChanged: (v) {
                                        setState(() {
                                          duration = v;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  height: inputHeight,
                                  child: PrimaryTextInput(
                                    label: const Nunito(text: "Price"),
                                    maxLines: 1,
                                    keyboardType: TextInputType.number,
                                    controller: priceCtr,
                                    validator: (v) {
                                      if (v == null ||
                                          v.isEmpty == true ||
                                          double.tryParse(v) == null) {
                                        return "Price is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                PrimaryButton(
                                    onPressed: loading
                                        ? null
                                        : () {
                                            if (formKey.currentState
                                                    ?.validate() ==
                                                true) {
                                              final price =
                                                  double.parse(priceCtr.text);
                                              final name = serviceNameCtr.text;
                                              final description =
                                                  detailsCtr.text;
                                              final durationInMinutes =
                                                  duration!.inMinutes;
                                              final uid = context
                                                  .app.fauth.currentUser!.uid;
                                              if (!isSaved) {
                                                final bloc = BlocProvider.of<
                                                    CreateServiceBloc>(context);
                                                bloc
                                                  ..add(CreateServiceReseted())
                                                  ..add(CreateServiceExcuted(
                                                      uid: uid,
                                                      name: name,
                                                      price: price,
                                                      description: description,
                                                      metadata: JSONObject({
                                                        "duration":
                                                            durationInMinutes
                                                      })));
                                              } else {
                                                final bloc = BlocProvider.of<
                                                    UpdateServiceBloc>(context);
                                                bloc
                                                  ..add(UpdateServiceReseted())
                                                  ..add(UpdateServiceExcuted(
                                                      uid: uid,
                                                      name: name,
                                                      serviceId:
                                                          widget.service!.id!,
                                                      price: price,
                                                      description: description,
                                                      metadata: JSONObject({
                                                        "duration":
                                                            durationInMinutes
                                                      })));
                                              }
                                            }
                                          },
                                    child: loading
                                        ? SizedBox(
                                            height: 32,
                                            width: 32,
                                            child: CircularProgressIndicator(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary),
                                          )
                                        : const Nunito(
                                            text: "Save",
                                          )),
                                const SizedBox(
                                  height: 8,
                                ),
                                if (success) ...[
                                  const Nunito(
                                      text: "SUCCESS", color: Colors.green),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                                if (cError) ...[
                                  Nunito(
                                      text: cState.message ??
                                          cState.data?.message ??
                                          "Error",
                                      color: Colors.red),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                                if (uError) ...[
                                  Nunito(
                                      text: uState.message ??
                                          uState.data?.message ??
                                          "Error",
                                      color: Colors.red),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ]
                              ],
                            ),
                          ),
                        )
                      ]));
                },
              );
            });
          }),
        )
      ],
    );
  }
}
