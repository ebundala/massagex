import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:iconly/iconly.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/widgets/components/avators.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const sliverSpace = SliverToBoxAdapter(
      child: SizedBox(
        height: 8,
      ),
    );
    const space = SizedBox(
      height: 8,
    );
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: kToolbarHeight * 3,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: kToolbarHeight,
                    child: Container(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                Positioned(
                    bottom: 0,
                    left: 20,
                    width: kToolbarHeight * 2,
                    height: kToolbarHeight * 2,
                    child: OutlinedAvator(
                      radius: kToolbarHeight,
                      backgroundColor: Colors.white,
                      border: Border.all(color: Colors.white, width: 4),
                      backgroundImage:
                          const AssetImage("assets/images/intro_picture_3.png"),
                    )),
                Positioned(
                    left: kToolbarHeight * 2 + 20 + 8,
                    height: kToolbarHeight * 2,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Nunito(
                          text: "${context.app.currentUser!.data!.displayName}",
                          fontSize: 20,
                          height: 0.85,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                        Nunito(
                          text: context.app.currentUser!.data!.businessProfile
                                  ?.businessName ??
                              "",
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w400,
                        ),
                        // const Expanded(child: SizedBox.expand()),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Nunito(
                                text: "Vendor mode",
                                textAlign: TextAlign.start,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              // const Expanded(
                              //   child: SizedBox.expand(),
                              // ),
                              StreamBuilder(
                                  stream: context.app.userSettings!
                                      .watch(key: AppBloc.providerkey),
                                  builder: (context, snapshot) {
                                    return Switch(
                                        value: context.app.userSettings!.get(
                                            AppBloc.providerkey,
                                            defaultValue: false),
                                        onChanged: (v) {
                                          context.app.add(
                                              AppModeChaged(isProviderMode: v));
                                          // context.app.userSettings!
                                          //     .put(AppBloc.providerkey, v);
                                        });
                                  })
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        sliverSpace,
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const Gordita(
                text: "Account",
                fontSize: 13,
                color: Color.fromRGBO(108, 108, 108, 1),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.edit),
                title: const Gordita(
                  text: "Edit profile",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.setting),
                title: const Gordita(
                  text: "Settings",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.notification),
                title: const Gordita(
                  text: "Push notifications",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
              const Gordita(
                text: "General",
                fontSize: 13,
                color: Color.fromRGBO(108, 108, 108, 1),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.buy),
                title: const Gordita(
                  text: "Payments",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.document),
                title: const Gordita(
                  text: "Terms of service",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
              ListTile(
                onTap: () => {},
                leading: const Icon(IconlyLight.info_circle),
                title: const Gordita(
                  text: "Help center",
                  fontSize: 15,
                ),
                trailing: const Icon(IconlyLight.arrow_right_2),
              ),
              space,
            ]),
          ),
        ),
        // const SliverFillRemaining(),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
              child: Align(
            alignment: Alignment.centerLeft,
            child: SignOutButton(
              variant: ButtonVariant.text,
            ),
          )),
        )
      ],
    );
  }
}
