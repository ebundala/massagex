import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/find_my_business_services/find_my_business_services_bloc.dart';
import 'package:massagex/graphql/clients/find_user/find_user_bloc.dart';
import 'package:massagex/graphql/clients/update_my_business_profile/update_my_business_profile_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_status.dart';
import 'package:models/enum_business_status_field_update_operations_input.dart';
import 'package:models/service.dart';

class ProviderHomePage extends StatefulWidget {
  const ProviderHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProviderHomePageState createState() => _ProviderHomePageState();
}

class _ProviderHomePageState extends State<ProviderHomePage> {
  int currentPage = 0;
  final controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayoutWidget(
      title: context.app.currentUser?.data?.businessProfile?.businessName ?? '',
      actions: [
        BlocBuilder<FindUserBloc, FindUserState>(
            bloc: context.app.findUserBloc,
            builder: (context, profileState) {
              return BlocBuilder<UpdateMyBusinessProfileBloc,
                      UpdateMyBusinessProfileState>(
                  bloc: context.app.updateMyBusinessProfileBloc,
                  builder: (context, state) {
                    return Row(
                      children: [
                        const Nunito(
                          text: "online",
                          fontSize: 12,
                        ),
                        if (state is UpdateMyBusinessProfileInProgress)
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                        if (state is! UpdateMyBusinessProfileInProgress)
                          Switch(
                              value: context.app.currentUser?.data
                                      ?.businessProfile?.status ==
                                  BusinessStatus.ONLINE,
                              onChanged: (v) {
                                var status = BusinessStatus.OFFLINE;
                                if (v) {
                                  status = BusinessStatus.ONLINE;
                                }
                                final uid = context.app.fauth.currentUser!.uid;
                                context.app.updateMyBusinessProfileBloc!
                                  ..add(UpdateMyBusinessProfileReseted())
                                  ..add(
                                    UpdateMyBusinessProfileExcuted(
                                      id: uid,
                                      status:
                                          EnumBusinessStatusFieldUpdateOperationsInput(
                                              set$: status),
                                    ),
                                  );
                              }),
                      ],
                    );
                  });
            })
      ],
      body: SizedBox.expand(
          child: PageView(
        controller: controller,
        onPageChanged: (i) {
          setState(() {
            currentPage = i;
          });
        },
        children: [
          ServicesListPage(
            onEdited: ((oldService) {
              setState(() {});
            }),
          ),
          Container(color: Colors.green),
          Container(color: Colors.black),
          Container(color: Colors.blueGrey)
        ],
      )),
      floatingActionButton: currentPage != 0
          ? null
          : FloatingActionButton(
              child: const Icon(IconlyLight.plus),
              onPressed: () async {
                await context.navigator.pushNamed(AppRoutes.createService);
                setState(() {});
              }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
            controller.animateToPage(currentPage,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn);
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.notification), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.bag), label: "Service"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile), label: "Profile")
        ],
      ),
    );
  }
}

class ServicesListPage extends StatelessWidget {
  ServicesListPage({
    Key? key,
    this.onEdited,
  }) : super(key: key);
  final void Function(Service oldService)? onEdited;
  bool refreshing = false;
  bool loadingMore = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindMyBusinessServicesBloc>(
        create: (context) => FindMyBusinessServicesBloc(client: context.client)
          ..add(FindMyBusinessServicesReseted())
          ..add(FindMyBusinessServicesExcuted(
              uid: context.app.fauth.currentUser!.uid, take: 1)),
        child: Builder(builder: (context) {
          return NotificationListener<OverscrollNotification>(
            onNotification: ((e) {
              if (e.overscroll > 0) {
                //overscroll bottom
                print("bottom");
                final bloc =
                    BlocProvider.of<FindMyBusinessServicesBloc>(context);
                final loaded =
                    bloc.state.data?.data?.businessProfile?.services?.length ??
                        0;
                final uid = context.app.fauth.currentUser!.uid;
                context.waitForBlocOperation<
                        FindMyBusinessServicesBloc,
                        FindMyBusinessServicesEvent,
                        FindMyBusinessServicesState,
                        FindMyBusinessServicesSuccess,
                        FindMyBusinessServicesFailure,
                        FindMyBusinessServicesError,
                        FindMyBusinessServicesExcuted,
                        FindMyBusinessServicesReseted>(
                    bloc: bloc,
                    excuted: FindMyBusinessServicesExcuted(
                        uid: uid, take: loaded + 1),
                    reseted: FindMyBusinessServicesReseted(),
                    callback: (v) => loadingMore = !loadingMore);
              } else {
                // overscroll start
                print("start");
              }
              return false;
            }),
            child: RefreshIndicator(
              onRefresh: () async {
                final bloc =
                    BlocProvider.of<FindMyBusinessServicesBloc>(context);

                await context.waitForBlocOperation<
                        FindMyBusinessServicesBloc,
                        FindMyBusinessServicesEvent,
                        FindMyBusinessServicesState,
                        FindMyBusinessServicesSuccess,
                        FindMyBusinessServicesFailure,
                        FindMyBusinessServicesError,
                        FindMyBusinessServicesRetried,
                        FindMyBusinessServicesReseted>(
                    bloc: bloc,
                    excuted: FindMyBusinessServicesRetried(),
                    reseted: FindMyBusinessServicesReseted(),
                    callback: (v) => refreshing = !refreshing);
                return;
              },
              child: BlocBuilder<FindMyBusinessServicesBloc,
                  FindMyBusinessServicesState>(builder: (context, state) {
                if (state is FindMyBusinessServicesInProgress && !refreshing) {
                  return const Center(
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                final items = state.data?.data?.businessProfile?.services ?? [];
                return ListView.builder(
                    itemCount: items.length + (loadingMore ? 1 : 0),
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    itemBuilder: ((context, index) {
                      if (items.length == index) {
                        return const Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            height: 32,
                            width: 32,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final item = items[index];
                      return PrimaryCard(
                        borderRadius: 8,
                        color: const Color.fromRGBO(244, 244, 245, 1),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Nunito(
                                    text: item.name ?? "",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  TextsButton(
                                      onPressed: () async {
                                        await context.navigator.pushNamed(
                                            AppRoutes.createService,
                                            arguments: item);
                                        onEdited?.call(item);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(IconlyLight.edit),
                                          Nunito(
                                            text: "Edit",
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Nunito(
                                    text: "Details",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Nunito(text: item.description ?? ""),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child:
                                    Wrap(runSpacing: 8, spacing: 8, children: [
                                  if (item.metadata?.value
                                          .containsKey("extras") ==
                                      true)
                                    ...(item.metadata!.value["extras"] as Map)
                                        .entries
                                        .map((e) => Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  IconlyLight.tick_square,
                                                  size: 24,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Nunito(
                                                    text: e.value,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            ))
                                ]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Nunito(
                                              text: "Duration",
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                    IconlyLight.time_circle),
                                                const SizedBox(
                                                  width: 4,
                                                ),
                                                Nunito(
                                                  fontSize: 13,
                                                  text:
                                                      "${item.metadata?.value["duration"] ?? ""} Minutes",
                                                )
                                              ],
                                            )
                                          ])),
                                  Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        const Nunito(
                                          text: "Price",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Gordita(
                                            text:
                                                "${item.price!.toStringAsFixed(2)}/= ${item.currency ?? ""}")
                                      ]))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              }),
            ),
          );
        }));
  }
}
