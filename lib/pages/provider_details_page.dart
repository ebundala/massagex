import "package:flutter/material.dart";
import 'package:flutterfire_ui/auth.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/graphql/clients/find_services/find_services_bloc.dart';
import 'package:massagex/pages/page_layout.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/badges.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/photo_gallery.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:models/business.dart';

class ProviderDetailsPage extends StatelessWidget {
  const ProviderDetailsPage({
    Key? key,
    required this.business,
  }) : super(key: key);
  final Business business;

  Future<FindServicesState?> loadServices(BuildContext context) async {
    return context.waitForBlocOperation<
        FindServicesBloc,
        FindServicesEvent,
        FindServicesState,
        FindServicesSuccess,
        FindServicesFailure,
        FindServicesError,
        FindServicesExcuted,
        FindServicesReseted>(
      bloc: FindServicesBloc(client: context.client),
      excuted: FindServicesExcuted(businessId: business.id!),
      reseted: FindServicesReseted(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(
      height: 8,
    );

    return PageLayoutWidget(
      title: "About Masseur",
      children: [
        space,
        ProfileTile(
          avator: "assets/images/intro_picture_3.png",
          displayName: business.businessName!,
          userSubTitle: "Massage specialist",
          rating: business.owner!.compoundRating!,
          avatorWidth: 128,
          titleFontSize: 20,
          subTitleFontSize: 14,
          action: InkWell(
            onTap: () {},
            child: const Icon(IconlyLight.heart),
          ),
          bottom: DistanceChip(label: Nunito(text: business.distance!.display)),
        ),
        space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryBadge(
              subText: "Clients",
              text: "${business.workCompleted}",
              icon: Icon(
                IconlyLight.user_1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            PrimaryBadge(
              subText: "Acceptance",
              text: "${(business.acceptance! * 100).toStringAsFixed(1)}%",
              icon: Icon(
                IconlyLight.shield_done,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            PrimaryBadge(
              subText: "Rating",
              text: "${business.owner!.compoundRating}",
              icon: Icon(
                IconlyLight.star,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          ],
        ),
        space,
        const Gilroy(
          text: "About",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        Nunito(
            color: const Color.fromRGBO(108, 108, 108, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            text: business.about!),
        space,
        // services
        const Gilroy(
          text: "Pricing & Services",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        FutureBuilder<FindServicesState?>(
            future: loadServices(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                final data = snapshot.data;
                if (data is! FindServicesSuccess) {
                  return ErrorText(
                      exception: Exception(
                          data?.message ?? data?.data?.message ?? "Error"));
                }
                final services = data.data.data!.services!;

                return ListBody(
                  children: List.generate(services.length, (index) {
                    final service = services[index];
                    return PrimaryCard(
                      borderRadius: 8,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Nunito(
                                  text: service.name ?? "",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(22, 10, 49, 1),
                                )),
                                const SizedBox(
                                  width: 8,
                                ),
                                Gordita(
                                  text:
                                      "${service.price ?? ""}/= ${service.currency ?? "Tsh"}",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(22, 10, 49, 1),
                                )
                              ],
                            ),
                            space,
                            Nunito(
                              text: service.description ?? "",
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(128, 128, 128, 1),
                            ),
                            space,
                            Row(
                              children: [
                                const Icon(IconlyLight.time_circle),
                                const SizedBox(
                                  width: 8,
                                ),
                                Nunito(
                                    text:
                                        "${service.metadata?.value["duration"] ?? ""} minutes"),
                                const Spacer(),
                                PrimaryButton(
                                  child: const Nunito(text: "Request"),
                                  onPressed: () {
                                    context.requireToCompleteProfile(
                                      onSuccess: () => context.navigator
                                          .pushNamed(AppRoutes.createOrder,
                                              arguments: service),
                                    );
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            }),

        space,
        // photos
        const Gilroy(
          text: "Photos",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        SizedBox(
          height: 240,
          child: PhotoGallery(
              photos: List.generate(
                  4,
                  (index) => Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Image.asset(
                            "assets/images/intro_picture_${index + 1}.png"),
                      ))),
        ),
        space,
        // reviews
        Row(
          children: [
            const Gilroy(
              text: "Reviews",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(22, 10, 49, 1),
            ),
            const Spacer(),
            InkWell(
                onTap: () {},
                child: const Nunito(
                  text: "See All",
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(34, 34, 46, 1),
                ))
          ],
        ),
        space,
        ListBody(
          children: [
            ProfileTile(
              avator: "assets/images/intro_picture_3.png",
              displayName: "John Doe",
              rating: 4.1,
              titleFontSize: 16,
              titleFontWeight: FontWeight.w500,
              starSize: 32,
              action: InkWell(
                onTap: () {},
                child: const Icon(IconlyLight.heart),
              ),
            ),
            space,
            const Nunito(
              text:
                  "Wow what an experience I had today with Russell as soon as I walked in the door made my feel very welcome, very friendly and was extremely reassuring.",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(128, 128, 128, 1),
            )
          ],
        )
      ],
    );
  }
}
