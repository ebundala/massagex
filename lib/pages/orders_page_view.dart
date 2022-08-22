import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:massagex/graphql/clients/find_my_orders/find_my_orders_bloc.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:models/enum_order_status_filter.dart';
import 'package:models/order_status.dart';
import 'package:models/order_where_input.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late FindMyOrdersBloc newOrdersBloc;
  late FindMyOrdersBloc oldOrdersBloc;

  bool isLoadingMore = false;
  bool isRefreshing = false;

  final newOrdersWhere = OrderWhereInput(
      orderStatus: EnumOrderStatusFilter(
          in$: const [OrderStatus.WAITING, OrderStatus.ACCEPTED]));

  OrderWhereInput oldOrdersWhere = OrderWhereInput(
      orderStatus: EnumOrderStatusFilter(
          in$: const [OrderStatus.PROCESSED, OrderStatus.REJECTED]));

  @override
  void initState() {
    newOrdersBloc = FindMyOrdersBloc(client: context.client);
    oldOrdersBloc = FindMyOrdersBloc(client: context.client);

    super.initState();
  }

  @override
  void dispose() {
    newOrdersBloc.close();
    oldOrdersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spaceSliver = SliverToBoxAdapter(
      child: SizedBox(
        height: 8,
      ),
    );
    const space = SizedBox(
      height: 8,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: BlocBuilder<FindMyOrdersBloc, FindMyOrdersState>(
          bloc: newOrdersBloc
            ..add(FindMyOrdersReseted())
            ..add(
              FindMyOrdersExcuted(
                  uid: context.app.fauth.currentUser!.uid,
                  where: newOrdersWhere),
            ),
          builder: (context, nState) {
            return BlocBuilder<FindMyOrdersBloc, FindMyOrdersState>(
                bloc: oldOrdersBloc
                  ..add(FindMyOrdersReseted())
                  ..add(
                    FindMyOrdersExcuted(
                        uid: context.app.fauth.currentUser!.uid,
                        where: oldOrdersWhere,
                        take: context.app.pageSize),
                  ),
                builder: (context, oState) {
                  final loading = oState is FindMyOrdersInProgress ||
                      nState is FindMyOrdersInProgress;
                  final newOrders = nState.data?.data?.ordered ?? [];
                  final oldOrders = oState.data?.data?.ordered ?? [];

                  return NotificationListener<OverscrollNotification>(
                    onNotification: (e) {
                      if (e.overscroll > 0) {
                        final loaded = oState.data?.data?.ordered?.length ?? 0;
                        context.waitForBlocOperation<
                                FindMyOrdersBloc,
                                FindMyOrdersEvent,
                                FindMyOrdersState,
                                FindMyOrdersSuccess,
                                FindMyOrdersFailure,
                                FindMyOrdersError,
                                FindMyOrdersExcuted,
                                FindMyOrdersReseted>(
                            bloc: oldOrdersBloc,
                            excuted: FindMyOrdersExcuted(
                                uid: context.app.fauth.currentUser!.uid,
                                skip: loaded,
                                take: context.app.pageSize),
                            reseted: FindMyOrdersReseted(),
                            callback: (v) => isLoadingMore = !isLoadingMore);
                      }
                      return false;
                    },
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context.waitForBlocOperation<
                            FindMyOrdersBloc,
                            FindMyOrdersEvent,
                            FindMyOrdersState,
                            FindMyOrdersSuccess,
                            FindMyOrdersFailure,
                            FindMyOrdersError,
                            FindMyOrdersExcuted,
                            FindMyOrdersReseted>(
                          bloc: newOrdersBloc,
                          excuted: FindMyOrdersExcuted(
                              uid: context.app.fauth.currentUser!.uid,
                              where: newOrdersWhere,
                              take: context.app.pageSize),
                          reseted: FindMyOrdersReseted(),
                        );
                        // ignore: use_build_context_synchronously
                        await context.waitForBlocOperation<
                                FindMyOrdersBloc,
                                FindMyOrdersEvent,
                                FindMyOrdersState,
                                FindMyOrdersSuccess,
                                FindMyOrdersFailure,
                                FindMyOrdersError,
                                FindMyOrdersExcuted,
                                FindMyOrdersReseted>(
                            bloc: oldOrdersBloc,
                            excuted: FindMyOrdersExcuted(
                                uid: context.app.fauth.currentUser!.uid,
                                where: oldOrdersWhere,
                                take: context.app.pageSize),
                            reseted: FindMyOrdersReseted(),
                            callback: (v) => isLoadingMore = !isLoadingMore);
                      },
                      child: CustomScrollView(
                        slivers: [
                          if (loading && !isLoadingMore && !isRefreshing)
                            const SliverFillRemaining(
                              child: Center(
                                  child: SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(),
                              )),
                            ),
                          if (!loading) ...[
                            spaceSliver,
                            spaceSliver,
                            const SliverToBoxAdapter(
                              child: Gilroy(
                                text: "Newly appointed services",
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            spaceSliver,
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate(((context, index) {
                                final order = newOrders[index];

                                return PrimaryCard(
                                  color: const Color.fromRGBO(244, 244, 245, 1),
                                  borderRadius: 8.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ProfileTile(
                                          titleFontSize: 18,
                                          titleFontWeight: FontWeight.w600,
                                          starSize: 20,
                                          avator:
                                              "assets/images/intro_picture_2.png",
                                          displayName:
                                              order.business!.businessName!,
                                          rating: 3.7,
                                          action: IconButton(
                                            icon: const Icon(IconlyLight.call),
                                            onPressed: () {},
                                          ),
                                        ),
                                        space,
                                        Nunito(
                                          text: order.service!.name!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Nunito(
                                          text: order.service!.description!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              128, 128, 128, 1),
                                        ),
                                        space,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Nunito(
                                            text:
                                                "${order.service!.price!}/=${order.service?.currency ?? "Tsh"}",
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        space,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SecondaryButton(
                                                  onPressed: () {},
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        IconlyLight.location,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary,
                                                      ),
                                                      const SizedBox(
                                                        width: 4,
                                                      ),
                                                      const Nunito(
                                                          text: "Track masseur")
                                                    ],
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: PrimaryButton(
                                                onPressed: () async {
                                                  await context.navigator
                                                      .pushNamed(
                                                          AppRoutes.payment,
                                                          arguments: order);
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                        Icons
                                                            .credit_card_rounded,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onPrimary),
                                                    const SizedBox(
                                                      width: 4,
                                                    ),
                                                    const Nunito(
                                                        text: "Pay Now")
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        space,
                                        const Divider(),
                                        space,
                                        Row(
                                          children: [
                                            const Icon(IconlyLight.calendar),
                                            Nunito(
                                                text: order.createdAt!
                                                    .toLocal()
                                                    .display,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1)),
                                            const Spacer(),
                                            DropdownButton<dynamic>(
                                                icon: const Icon(
                                                    Icons.more_horiz),
                                                items: [],
                                                onChanged: (v) {})
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }), childCount: newOrders.length),
                            ),
                            spaceSliver,
                            spaceSliver,
                            const SliverToBoxAdapter(
                              child: Gilroy(
                                text: "Previous scheduled service",
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            spaceSliver,
                            SliverList(
                              delegate:
                                  SliverChildBuilderDelegate(((context, index) {
                                final order = oldOrders[index];

                                return PrimaryCard(
                                  borderRadius: 8.0,
                                  color: Theme.of(context).backgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ProfileTile(
                                          titleFontSize: 18,
                                          titleFontWeight: FontWeight.w600,
                                          starSize: 20,
                                          avator:
                                              "assets/images/intro_picture_2.png",
                                          displayName:
                                              order.business!.businessName!,
                                          rating: 3.7,
                                          action: IconButton(
                                            icon: const Icon(IconlyLight.call),
                                            onPressed: () {},
                                          ),
                                        ),
                                        space,
                                        Nunito(
                                          text: order.service!.name!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Nunito(
                                          text: order.service!.description!,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              128, 128, 128, 1),
                                        ),
                                        space,
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Nunito(
                                            text:
                                                "${order.service!.price!}/=${order.service?.currency ?? "Tsh"}",
                                            fontSize: 16,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.end,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        space,
                                        const Divider(),
                                        space,
                                        Row(
                                          children: [
                                            const Icon(IconlyLight.calendar),
                                            Nunito(
                                                text: order.createdAt!
                                                    .toLocal()
                                                    .display,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color.fromRGBO(
                                                    0, 0, 0, 1)),
                                            const Spacer(),
                                            DropdownButton<dynamic>(
                                                items: [], onChanged: (v) {})
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }), childCount: oldOrders.length),
                            ),
                          ]
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
