import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/page_indicator.dart';
import 'package:massagex/widgets/icons/arrow_next.dart';
import 'package:massagex/widgets/shapes/intro_large_shape.dart';
import 'package:massagex/widgets/shapes/intro_small_shape.dart';
import 'package:massagex/widgets/shapes/skip_intro_action_container.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    initController();
    super.initState();
  }

  Map<int, List<Color>> get indicatorColors {
    final Map<int, List<Color>> indicatorColors = {
      0: [Theme.of(context).colorScheme.secondary, Colors.black26],
      1: [Theme.of(context).colorScheme.secondary, Colors.white38],
      2: [Colors.white, Colors.white38],
      3: [Colors.transparent, Colors.transparent]
    };
    return indicatorColors;
  }

  Map<int, Color> get backgroundColors {
    final Map<int, Color> colors = {
      0: Theme.of(context).backgroundColor,
      1: Theme.of(context).colorScheme.primary,
      2: Theme.of(context).colorScheme.secondary,
      3: Theme.of(context).backgroundColor
    };
    return colors;
  }

  void initController() {
    _controller = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  void skip() {
    _controller!.animateTo(3);
  }

  void next() {
    if (_controller!.index < _controller!.length) {
      _controller!.animateTo(_controller!.index + 1);
    }
  }

  void goToLogin(bool register) {
    Navigator.of(context).pushNamed(AppRoutes.login, arguments: register);
  }

  void goToCreateBussinessProfile() {
    Navigator.of(context).pushNamed(AppRoutes.createBussinessProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: TabBarView(
            controller: _controller!,
            children: [
              IntroPageWidget(
                backgroundColor: backgroundColors[0]!,
                hero: Stack(
                  children: [
                    const Positioned.fill(
                        right: -40,
                        left: 20,
                        child: IntroLargeShape(
                            angle: 0,
                            assetName: "assets/images/intro_picture_1.png")),
                    Positioned(
                        left: 80,
                        bottom: 55,
                        height: 70,
                        width: 70,
                        child: IntroSmallShape(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
                appName: const AppName(),
                skip: InkWell(
                  onTap: () => skip(),
                  child: const Nunito(
                    text: "Skip",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                title: const PlayfairDisplay(
                  text: "Find amazing massage service near you",
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(22, 10, 49, 1),
                ),
                body: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Nunito(
                    text:
                        "It is a long established fact that a reader will be distracted by the readable content of a page.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                bottom: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        next();
                      },
                      child: SkipIntroActionContainer(
                          child: ArrowNext(
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                    ),
                  ),
                ),
              ),
              IntroPageWidget(
                backgroundColor: backgroundColors[1]!,
                hero: Stack(
                  children: [
                    const Positioned.fill(
                        right: 20,
                        left: -40,
                        child: IntroLargeShape(
                            angle: 45,
                            assetName: "assets/images/intro_picture_2.png")),
                    Positioned(
                        right: 80,
                        bottom: 55,
                        height: 70,
                        width: 70,
                        child: IntroSmallShape(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
                appName: AppName(
                  isPrimary: false,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                skip: InkWell(
                  onTap: () => skip(),
                  child: Nunito(
                    text: "Skip",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                title: PlayfairDisplay(
                  text: "Book and enjoy service at massage centre",
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Nunito(
                    text:
                        "It is a long established fact that a reader will be distracted by the readable content of a page.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                bottom: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        next();
                      },
                      child: SkipIntroActionContainer(
                          color: Theme.of(context).colorScheme.secondary,
                          child: ArrowNext(
                              color:
                                  Theme.of(context).colorScheme.onSecondary)),
                    ),
                  ),
                ),
              ),
              IntroPageWidget(
                backgroundColor: backgroundColors[2]!,
                hero: Stack(
                  children: [
                    const Positioned.fill(
                        right: -40,
                        left: 20,
                        child: IntroLargeShape(
                            angle: 65,
                            assetName: "assets/images/intro_picture_3.png")),
                    Positioned(
                        left: 160,
                        bottom: 55,
                        height: 70,
                        width: 70,
                        child: IntroSmallShape(
                            color: Theme.of(context).colorScheme.primary))
                  ],
                ),
                appName: AppName(
                  isPrimary: false,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                skip: InkWell(
                  onTap: () => skip(),
                  child: Nunito(
                    text: "Skip",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                title: PlayfairDisplay(
                  text: "Provide your services as a masseur",
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Nunito(
                    text:
                        "It is a long established fact that a reader will be distracted by the readable content of a page.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                bottom: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        next();
                      },
                      child: SkipIntroActionContainer(
                          color: Theme.of(context).colorScheme.onSecondary,
                          child: ArrowNext(
                              color: Theme.of(context).colorScheme.primary)),
                    ),
                  ),
                ),
              ),
              IntroPageWidget(
                backgroundColor: backgroundColors[3]!,
                hero: Stack(
                  children: [
                    const Positioned.fill(
                        right: -60,
                        left: 20,
                        child: IntroLargeShape(
                            angle: 0,
                            assetName: "assets/images/intro_picture_4.png")),
                    Positioned(
                        left: 80,
                        bottom: 55,
                        height: 70,
                        width: 70,
                        child: IntroSmallShape(
                            color: Theme.of(context).colorScheme.secondary))
                  ],
                ),
                appName: const AppName(),
                title: const PlayfairDisplay(
                  text:
                      "Best Massage Service near you and you can also provide service as provider",
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(22, 10, 49, 1),
                ),
                body: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Nunito(
                    text: "Kindly share your details to register account.",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                bottom: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, bottom: 24, top: 32.0),
                  child: Column(
                    children: [
                      PrimaryButton(
                          onPressed: () => goToLogin(true),
                          width: double.infinity,
                          height: kMinInteractiveDimension,
                          child: const Nunito(
                            text: "Find MassageX Service",
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      SecondaryButton(
                          onPressed: () => goToCreateBussinessProfile(),
                          width: double.infinity,
                          height: kMinInteractiveDimension,
                          child: const Nunito(
                            text: "Become A Provider",
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      TextsButton(
                          onPressed: () => goToLogin(false),
                          width: double.infinity,
                          height: kMinInteractiveDimension,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Nunito(
                                text: "Already have an account?",
                                color: Color.fromRGBO(146, 136, 153, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Nunito(
                                text: "Sign In",
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          )),
          Positioned(
            left: 32,
            bottom: 32,
            child: AnimatedBuilder(
                animation: _controller!.animation!,
                builder: (context, child) {
                  final selected = _controller!.index;
                  final selectedColor = indicatorColors[selected]?[0];
                  final unselectedColor = indicatorColors[selected]?[1];

                  return PageIndicator(
                      pageCount: 4,
                      selected: selected,
                      activeColor: selectedColor,
                      inactiveColor: unselectedColor,
                      duration: _controller!.animationDuration);
                }),
          ),
        ],
      ),
    );
  }
}

class IntroPageWidget extends StatelessWidget {
  const IntroPageWidget(
      {Key? key,
      required this.hero,
      required this.appName,
      this.skip,
      required this.title,
      required this.body,
      required this.bottom,
      this.backgroundColor = Colors.white})
      : super(key: key);
  final Widget hero;
  final Widget appName;
  final Widget? skip;
  final Widget title;
  final Widget body;
  final Widget bottom;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [appName, if (skip != null) skip!],
              ),
            ),
          ),
          Expanded(
            child: hero,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: body,
          ),
          bottom
        ],
      ),
    );
  }
}
