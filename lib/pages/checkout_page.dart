import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/find_payment_methods/find_payment_methods_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/utils.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/swipable_button/swipable_button.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/order.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 8,
    );
    return PageLayoutWidget(
      title: "Please Pay to start your service",
      children: [
        space,
        PrimaryCard(
          borderRadius: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTile(
                  titleFontSize: 18,
                  titleFontWeight: FontWeight.w600,
                  starSize: 20,
                  avator: "assets/images/intro_picture_2.png",
                  displayName: widget.order.business!.businessName!,
                  rating: 3.7,
                  action: IconButton(
                    icon: const Icon(IconlyLight.call),
                    onPressed: () {},
                  ),
                ),
                space,
                Gilroy(
                  text: widget.order.service!.name!,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(22, 10, 49, 1),
                ),
                Nunito(
                  text: widget.order.service!.description!,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(128, 128, 128, 1),
                ),
                space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(IconlyLight.time_circle),
                    SizedBox(
                      width: 8,
                    ),
                    Nunito(
                      text: "1 hour",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(22, 10, 49, 1),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        const Gilroy(
          text: "Payment method",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        SizedBox(
          height: 80,
          child: BlocProvider<FindPaymentMethodsBloc>(
            create: (ctx) => FindPaymentMethodsBloc(client: ctx.client)
              ..add(FindPaymentMethodsReseted())
              ..add(FindPaymentMethodsExcuted()),
            child: Builder(builder: (context) {
              return BlocBuilder<FindPaymentMethodsBloc,
                  FindPaymentMethodsState>(builder: (context, state) {
                final methods = state.data?.data ?? [];
                if (state is FindPaymentMethodsInProgress) {
                  return const Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 32,
                      width: 32,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final item = methods[index];
                    return SizedBox(
                      height: 80,
                      width: 80,
                      child: PrimaryCard(
                        borderRadius: 20,
                        elevation: 8,
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          serverUrl(path: item.logo?.path),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          isAntiAlias: true,
                        ),
                      ),
                    );
                  },
                  itemCount: methods.length,
                );
              });
            }),
          ),
        ),
        space,
        const Spacer(),
        const Gilroy(
          text: "Order summary",
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        PrimaryCard(
          borderRadius: 8,
          // shape: Border.all(style: BorderStyle.solid),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Nunito(
                  text: "Billing information",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                space,
                Row(
                  children: [
                    const Gordita(
                      text: "Subtotal",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Expanded(child: Divider(color: Colors.grey)),
                    Gordita(
                      text:
                          "${widget.order.quantity! * widget.order.service!.price!}/=${widget.order.service?.currency ?? "Tsh"}",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                space,
                Row(
                  children: [
                    const Gordita(
                      text: "Total",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const Expanded(child: Divider(color: Colors.grey)),
                    Gordita(
                      text:
                          "${widget.order.quantity! * widget.order.service!.price!}/=${widget.order.service?.currency ?? "Tsh"}",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        space,
        const Spacer(),
        space,
        SwipableButton(onUnlocked: () {}, label: "Swipe to pay"),
        space
      ],
    );
  }
}
