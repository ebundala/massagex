import "package:flutter/material.dart";
import 'package:iconly/iconly.dart';
import 'package:massagex/pages/page_layout.dart';
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
          rating: 3.7,
          count: 500,
          avatorWidth: 128,
          titleFontSize: 20,
          subTitleFontSize: 14,
          action: InkWell(
            onTap: () {},
            child: const Icon(IconlyLight.heart),
          ),
          bottom: const DistanceChip(
            label: Nunito(text: "5 km away"),
          ),
        ),
        space,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryBadge(
              subText: "Clients",
              text: "971",
              icon: Icon(
                IconlyLight.user_1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            PrimaryBadge(
              subText: "Experience",
              text: "8 Years",
              icon: Icon(
                IconlyLight.shield_done,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            PrimaryBadge(
              subText: "Rating",
              text: "3.7",
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
        const Nunito(
            color: Color.fromRGBO(108, 108, 108, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            text:
                "Massage treatment of superficial parts of the body by systematic rubbing, stroking, kneading, or slapping. Massages can be administered manually or with mechanical devices. They are sought most often to relieve muscle stiffness see more..."),
        space,
        // services
        const Gilroy(
          text: "Pricing & Services",
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(22, 10, 49, 1),
        ),
        space,
        ListBody(children: [
          PrimaryCard(
            borderRadius: 8,
            color: Theme.of(context).backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                          child: Nunito(
                        text: "Service name",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(22, 10, 49, 1),
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Gordita(
                        text: "5000/= Tsh",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(22, 10, 49, 1),
                      )
                    ],
                  ),
                  space,
                  const Nunito(
                    text:
                        "Lorem Ipsum is simply dummy text of  printing and typesetting industry.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(128, 128, 128, 1),
                  ),
                  space,
                  Row(
                    children: [
                      const Icon(IconlyLight.time_circle),
                      const SizedBox(
                        width: 8,
                      ),
                      const Nunito(text: "1 hour"),
                      const Spacer(),
                      PrimaryButton(
                        child: const Nunito(text: "Request"),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ]),

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
