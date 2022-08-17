import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/find_many_business/find_many_businesses_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business_mode.dart';
import 'package:models/gender.dart';
import 'package:place_picker/entities/location_result.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

int currentPage = 0;
final controller = PageController(initialPage: 0);

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageLayoutWidget(
      title:
          "Hello, ${context.app.currentUser?.data?.displayName?.split(" ").first ?? ''}",
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
      body: SizedBox.expand(
        child: PageView(
          controller: controller,
          onPageChanged: (i) {
            setState(() {
              currentPage = i;
            });
          },
          children: [
            const HomePage(),
            Container(color: Colors.green),
            Container(color: Colors.black),
            Container(color: Colors.blueGrey)
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationResult? location;
  Gender? gender;
  bool isRefreshing = false;
  bool isLoadingMore = false;

  final genderItems = Gender.values
      .map(
        (e) => DropdownMenuItem<Gender>(
          value: e,
          child: Nunito(
            text: e.friendlyName,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      )
      .toList();

  BusinessMode mode = BusinessMode.MOBILE$MODE;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(
                child: Nunito(text: "location"),
              ),
              SliverToBoxAdapter(
                child: StatefulBuilder(builder: (context, setState) {
                  return Row(
                    children: [
                      Icon(IconlyLight.location,
                          color: Theme.of(context).colorScheme.primary),
                      Expanded(
                          child: Nunito(
                        text: location?.formattedAddress ?? "",
                        overflow: TextOverflow.ellipsis,
                        color: const Color.fromRGBO(22, 10, 49, 1),
                        fontSize: 16,
                      )),
                      TextsButton(
                        color: Theme.of(context).backgroundColor,
                        child: const Nunito(text: "Change"),
                        onPressed: () async {
                          final result = await context.showPlacePicker();
                          if (result != null) {
                            setState(
                              () {
                                location = result;
                              },
                            );
                          }
                        },
                      )
                    ],
                  );
                }),
              ),
              SliverToBoxAdapter(
                  child: Row(
                children: [
                  const Expanded(flex: 2, child: SearchInput()),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: DropdownInput<Gender>(
                    fontSize: 14,
                    value: gender,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                        fillColor: Color.fromRGBO(242, 243, 242, 1),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)))),
                    onChanged: (v) {
                      setState(
                        () {
                          gender = v;
                        },
                      );
                    },
                    items: genderItems,
                  ))
                ],
              )),
              const SliverToBoxAdapter(
                child: SizedBox(height: 8),
              ),
              SliverToBoxAdapter(
                child: TabBar(
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    labelColor: Theme.of(context).colorScheme.onBackground,
                    onTap: (v) {
                      setState(() {
                        mode = v == 0
                            ? BusinessMode.MOBILE$MODE
                            : BusinessMode.OFFICE$MODE;
                      });
                    },
                    tabs: const [
                      Tab(
                        text: "Mobile",
                      ),
                      Tab(
                        text: "Office",
                      )
                    ]),
              )
            ];
          },
          floatHeaderSlivers: true,
          body: BlocProvider<FindManyBusinessesBloc>(
            create: (context) =>
                FindManyBusinessesBloc(client: context.app.client!)
                  ..add(FindManyBusinessesReseted())
                  ..add(FindManyBusinessesExcuted(take: 2)),
            child: Builder(builder: (context) {
              return BlocBuilder<FindManyBusinessesBloc,
                  FindManyBusinessesState>(builder: (context, state) {
                final loading = state is FindManyBusinessesInProgress;
                final loadingMore =
                    state is FindManyBusinessesLoadMoreInProgress;

                final items = state.data?.data ?? [];
                if (items.isEmpty &&
                    loading &&
                    !isRefreshing &&
                    !isLoadingMore) {
                  return const Center(
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return NotificationListener<OverscrollNotification>(
                  onNotification: (e) {
                    if (e.overscroll > 0) {
                      final bloc =
                          BlocProvider.of<FindManyBusinessesBloc>(context);
                      final loaded = state.data?.data?.length ?? 0;

                      context.waitForBlocOperation<
                              FindManyBusinessesBloc,
                              FindManyBusinessesEvent,
                              FindManyBusinessesState,
                              FindManyBusinessesSuccess,
                              FindManyBusinessesFailure,
                              FindManyBusinessesError,
                              FindManyBusinessesMoreLoaded,
                              FindManyBusinessesReseted>(
                          bloc: bloc,
                          excuted: FindManyBusinessesMoreLoaded(
                              skip: loaded, take: 2),
                          reseted: FindManyBusinessesReseted(),
                          callback: (v) => isLoadingMore = !isLoadingMore);
                    }
                    return false;
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      final bloc =
                          BlocProvider.of<FindManyBusinessesBloc>(context);
                      await context.waitForBlocOperation<
                              FindManyBusinessesBloc,
                              FindManyBusinessesEvent,
                              FindManyBusinessesState,
                              FindManyBusinessesSuccess,
                              FindManyBusinessesFailure,
                              FindManyBusinessesError,
                              FindManyBusinessesRetried,
                              FindManyBusinessesReseted>(
                          bloc: bloc,
                          excuted: FindManyBusinessesRetried(),
                          reseted: FindManyBusinessesReseted(),
                          callback: (v) => isRefreshing = !isRefreshing);
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          sliver: SliverToBoxAdapter(
                            child: Nunito(
                                color: const Color.fromRGBO(128, 128, 128, 1),
                                fontSize: 16,
                                text: mode == BusinessMode.MOBILE$MODE
                                    ? "Massage Therapist will come where you are"
                                    : "You will go to Massage Therapist center"),
                          ),
                        ),
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            final item = items[index];
                            return PrimaryCard(
                              color: Theme.of(context).backgroundColor,
                              borderRadius: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ProfileTile(
                                      avatorWidth: 60,
                                      avator:
                                          "assets/images/intro_picture_1.png",
                                      displayName: item.owner?.displayName ??
                                          item.businessName!,
                                      rating: 4,
                                      starSize: 14,
                                      spaceBetween: 4,
                                      bottom: DistanceChip(
                                        fontSize: 16,
                                        label: Nunito(
                                          text: 500000.0.kilometers,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Nunito(
                                        text: item.about ?? '',
                                        fontSize: 14,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Expanded(
                                          child: Gordita(
                                            text: "50000/Tsh",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: PrimaryButton(
                                              height:
                                                  kMinInteractiveDimension - 16,
                                              onPressed: () {},
                                              child:
                                                  const Nunito(text: "View")),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }, childCount: items.length),
                        ),
                        if (loadingMore)
                          const SliverToBoxAdapter(
                            child: Center(
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              });
            }),
          ),
        ),
      ),
    );
  }
}
