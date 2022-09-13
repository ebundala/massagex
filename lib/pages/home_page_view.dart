import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/find_many_business/find_many_businesses_bloc.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/enum_business_mode_filter.dart';
import 'package:models/enum_gender_filter.dart';
import 'package:models/lat_lon.dart' as m;
import 'package:models/business_mode.dart';
import 'package:models/business_where_input.dart';
import 'package:models/gender.dart';
import 'package:models/location_relation_filter.dart';
import 'package:models/location_where_input.dart';
import 'package:models/query_mode.dart';
import 'package:models/string_filter.dart';
import 'package:models/user_relation_filter.dart';
import 'package:models/user_where_input.dart';

import 'package:place_picker/place_picker.dart' hide SearchInput;

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
  final searchCtr = TextEditingController(text: "");
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
  final whereChangeStrem = StreamController<BuildContext>();

  @override
  void initState() {
    final loc = context.app.currentUser?.data?.location;

    if (loc?.lat != null && loc?.lon != null) {
      final latlng = LatLng(loc!.lat!, loc.lon!);
      location = LocationResult()
        ..name = loc.name ?? ""
        ..formattedAddress = loc.name ?? ""
        ..latLng = latlng;
    }

    whereChangeStrem.stream.listen((event) {
      _reloadData(event);
    });
    super.initState();
  }

  @override
  void dispose() {
    whereChangeStrem.close();
    super.dispose();
  }

  BusinessWhereInput? computeWhere() {
    return BusinessWhereInput(
        owner: gender == null || gender == Gender.UNSPECIFIED
            ? null
            : UserRelationFilter(
                is$: UserWhereInput(
                  gender: EnumGenderFilter(equals: gender),
                ),
              ),
        location: location == null
            ? null
            : LocationRelationFilter(
                is$: LocationWhereInput(
                  nearBy: m.LatLon(
                      lon: location!.latLng!.longitude,
                      lat: location!.latLng!.latitude),
                ),
              ),
        mode: EnumBusinessModeFilter(equals: mode),
        businessName: searchCtr.text.isEmpty == true
            ? null
            : StringFilter(
                contains: searchCtr.text, mode: QueryMode.insensitive));
  }

  _reloadData(BuildContext context) {
    context.bloc<FindManyBusinessesBloc>()
      ..add(FindManyBusinessesReseted())
      ..add(FindManyBusinessesExcuted(
          take: context.app.pageSize, where: computeWhere()));
  }

  _notifyReloadData(BuildContext context) {
    whereChangeStrem.add(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindManyBusinessesBloc>(
      create: (context) => FindManyBusinessesBloc(client: context.app.client!)
        ..add(FindManyBusinessesReseted())
        ..add(FindManyBusinessesExcuted(
            take: context.app.pageSize, where: computeWhere())),
      child: Padding(
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
                            child: FutureBuilder<String?>(
                                future: context.getLocationName(location),
                                builder: (context, snapshot) {
                                  return Nunito(
                                    text: snapshot.data ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    color: const Color.fromRGBO(22, 10, 49, 1),
                                    fontSize: 16,
                                  );
                                })),
                        TextsButton(
                          color: Theme.of(context).backgroundColor,
                          child: const Nunito(text: "Change"),
                          onPressed: () async {
                            final result =
                                await context.showPlacePicker(location?.latLng);
                            if (result != null) {
                              setState(
                                () {
                                  location = result;
                                },
                              );
                              // ignore: use_build_context_synchronously
                              _reloadData(context);
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
                    Expanded(
                        flex: 2,
                        child: SearchInput(
                          controller: searchCtr,
                          decoration: InputDecoration(
                              suffix: searchCtr.text.isEmpty == true
                                  ? null
                                  : InkWell(
                                      onTap: () => searchCtr.clear(),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                        size: 24,
                                      ),
                                    )),
                          minLines: 1,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.search,
                          onEditingComplete: () {
                            _reloadData(context);
                          },
                        )),
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
                        gender = v;
                        _reloadData(context);
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
                        mode = v == 0
                            ? BusinessMode.MOBILE$MODE
                            : BusinessMode.OFFICE$MODE;
                        _reloadData(context);
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
            body: Builder(builder: (context) {
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
                              skip: loaded, take: context.app.pageSize),
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
                                      rating: item.owner!.compoundRating!,
                                      starSize: 14,
                                      spaceBetween: 4,
                                      titleFontSize: 16,
                                      bottom: DistanceChip(
                                        iconSize: 16,
                                        labelPadding:
                                            const EdgeInsets.only(right: 10),
                                        label: Nunito(
                                          text: item.distance!.display,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Nunito(
                                        text: item.about ?? '',
                                        fontSize: 14,
                                        maxLines: 2,
                                        color:
                                            const Color.fromRGBO(0, 0, 0, 0.5),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Gordita(
                                            text: "${item.minPrice}/Tsh",
                                            fontSize: 12,
                                            color: const Color.fromRGBO(
                                                22, 10, 49, 1),
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Expanded(
                                          child: PrimaryButton(
                                              height:
                                                  kMinInteractiveDimension - 16,
                                              onPressed: () {
                                                context.navigator.pushNamed(
                                                    AppRoutes.providerDetails,
                                                    arguments: item);
                                              },
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
