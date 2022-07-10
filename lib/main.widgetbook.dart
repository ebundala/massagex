// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:massagex/widgets/themes/light_theme.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:massagex/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:massagex/graphql/clients/signup/signup_bloc.dart';
import 'package:massagex/graphql/clients/update_my_profile/update_my_profile_bloc.dart';
import 'package:models/attachment_create_without_businesses_input.dart';
import 'package:models/string_field_update_operations_input.dart';
import 'package:models/attachment_create_nested_one_without_businesses_input.dart';
import 'package:models/scalars/json_object.dart';
import 'package:flutter/foundation.dart';
import 'package:massagex/graphql/clients/find_user/find_user_bloc.dart';
import 'package:models/signup_input.dart';
import 'package:models/business_create_without_owner_input.dart';
import 'package:models/scalars/phone_number.dart';
import 'package:models/scalars/email_address.dart';
import 'package:models/attachment_update_one_without_users_input.dart';
import 'dart:convert';
import 'package:massagex/graphql/clients/recover_account/recover_account_bloc.dart';
import 'package:models/gender.dart';
import 'package:models/attachment_create_without_users_input.dart';
import 'package:graphql/client.dart';
import 'package:models/enum_gender_field_update_operations_input.dart';
import 'package:http/http.dart';
import 'package:massagex/graphql/clients/signin/signin_bloc.dart';
import 'package:models/auth_input.dart';
import 'package:models/business_mode.dart';
import 'package:massagex/widgets/components/page_indicator.dart';
import 'package:massagex/widgets/shapes/active_page_indicator.dart';
import 'package:massagex/widgets/shapes/inactive_page_indicator.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:massagex/widgets/icons/arrow_next.dart';
import 'dart:math';
import 'package:massagex/widgets/shapes/intro_large_shape.dart';
import 'package:massagex/widgets/shapes/intro_small_shape.dart';
import 'package:massagex/widgets/shapes/skip_intro_action_container.dart';
import 'package:massagex/widgets/texts/app_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:massagex/widgets/texts/intro_heading.dart';
import 'package:massagex/widgets/texts/styled_text.dart';
import 'package:massagex/widgets/texts/intro_paragraph.dart';
import 'package:massagex/widgets/texts/intro_skip_text.dart';
import 'dart:ui';
import 'package:massagex/widgets/components/avators.dart';
import 'package:massagex/widgets/components/badges.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/cards.dart';
import 'package:massagex/widgets/components/chips.dart';
import 'package:massagex/widgets/components/spinars.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/components/stars_rating.dart';
import 'package:massagex/widgets/components/photo_gallery.dart';
import 'package:massagex/widgets/components/map_markers.dart';
import 'package:massagex/widgets/components/map_info_card.dart';
import 'package:massagex/widgets/components/map_location_name_card.dart';
import 'package:massagex/widgets/components/bottom_sheets.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'massagex',
      ),
      themes: [
        WidgetbookTheme(
          name: 'Dark',
          data: getDarkTheme(),
        ),
        WidgetbookTheme(
          name: 'light',
          data: getLightTheme(),
        ),
      ],
      devices: [
        Device.mobile(
          name: 'Galaxy A10',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 1520.0,
              width: 720.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device.mobile(
          name: 'iPhone 12',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
      ],
      frames: [
        WidgetbookFrame(
          name: 'Widgetbook',
          allowsDevices: true,
        ),
        WidgetbookFrame(
          name: 'None',
          allowsDevices: false,
        ),
      ],
      textScaleFactors: [
        1.0,
        2.0,
        3.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'texts',
                  widgets: [
                    WidgetbookComponent(
                      name: 'NunitoSans',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'nunito sans',
                          builder: (context) => getFont3(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'AppName',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getAppName(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Secondary',
                          builder: (context) => getAppSecondary(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'IntroHeading',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getIntroHeading(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) => getIntroHeadingWhite(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Manrope',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'manrope',
                          builder: (context) => getFont2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Nunito',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Nunito',
                          builder: (context) => getFont(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'IntroParagraph',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getIntroParagraph(context),
                        ),
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getIntroParagraphWhite(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) =>
                              getIntroParagraphWhite1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Gilroy',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Gilroy 400',
                          builder: (context) => getFont4(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Gilroy 500',
                          builder: (context) => getFont5(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Gilroy 600',
                          builder: (context) => getFont6(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Gilroy 700',
                          builder: (context) => getFont7(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Gordita',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Gordita',
                          builder: (context) => getFont1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'IntroSkipTextWidget',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'default',
                          builder: (context) => getIntroSkipText(context),
                        ),
                        WidgetbookUseCase(
                          name: 'onprimary',
                          builder: (context) => getIntroSkipText1(context),
                        ),
                        WidgetbookUseCase(
                          name: 'onsecondry',
                          builder: (context) => getIntroSkipText2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  folders: [],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'shapes',
                  widgets: [
                    WidgetbookComponent(
                      name: 'UserLocationMarker',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getUserLocationMarker(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'DestinationMarker',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getDestinationMarker(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'ActivePageIndicator',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getActivePageIndicator(context),
                        ),
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) =>
                              getActivePageIndicator1(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) =>
                              getActivePageIndicator2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'SkipIntroActionContainer',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) =>
                              getSkipIntroActionContainer(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) =>
                              getSkipIntroActionContainerSecondary(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Tertiary',
                          builder: (context) =>
                              getSkipIntroActionContainerTertiary(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'IntroSmallShape',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getIntroSmallShape(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Primary',
                          builder: (context) =>
                              getIntroSmallShapePrimary(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'InactivePageIndicator',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) =>
                              getInactivePageIndicator(context),
                        ),
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) =>
                              getInactivePageIndicator1(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) =>
                              getInactivePageIndicator2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'IntroLargeShape',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Default',
                          builder: (context) => getIntroLargeShape(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  folders: [],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'components',
                  widgets: [
                    WidgetbookComponent(
                      name: 'RequestBottomSheet',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getRequestBottomSheet(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'NotificationBottomSheet',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) =>
                              getNotificationBottomSheet(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'MapNavigationDestinationInfo',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) =>
                              getMapNavigationDestinationInfo(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Waiting map info',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Provider',
                          builder: (context) => getWaitingMapInfoCard(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Customer',
                          builder: (context) =>
                              getCustomerWaitingMapInfoCard(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Traveling map info',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Provider',
                          builder: (context) => getTravelerMapInfoCard(context),
                        ),
                        WidgetbookUseCase(
                          name: 'Customer',
                          builder: (context) =>
                              getCustomerTravelerMapInfoCard(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Photo gallery',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'PhotoGallery',
                          builder: (context) => getPhotoGallery(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'Stars rating',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'StarsRating',
                          builder: (context) => getStarsRating(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'DistanceChip',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'distance',
                          builder: (context) => getChip1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimarySpinar',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getSpinar(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'TextButton',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Text',
                          builder: (context) => getButton4(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimaryAvator',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getAvator(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'SwipableButton',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'swipable',
                          builder: (context) => getButton3(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'DatePickerInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'datepicker',
                          builder: (context) => getTextField2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'DropdownInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Dropdown',
                          builder: (context) => getTextField1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'OutlinedChip',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'outlined',
                          builder: (context) => getChip(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'CardWithActions',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'with actions',
                          builder: (context) => getCard1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'SecondaryButton',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) => getButton1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'LocationInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'location',
                          builder: (context) => getTextField6(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PageIndicator',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'default',
                          builder: (context) => getPageIndicator(context),
                        ),
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getPageIndicator1(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) => getPageIndicator2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimaryTextInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getTextField(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'OTPInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'OTP',
                          builder: (context) => getTextField3(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PhoneInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Phone',
                          builder: (context) => getTextField7(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'ScheduleInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'schedule',
                          builder: (context) => getTextField5(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'CompletedSpinar',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'completed',
                          builder: (context) => getSpinar1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimaryBadge',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getBadge(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'SecondaryBadge',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) => getBadge1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimaryButton',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getButton(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'FilledTextInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'filled',
                          builder: (context) => getTextField8(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'SearchInput',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'Search',
                          builder: (context) => getTextField4(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'OutlinedAvator',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'outlined',
                          builder: (context) => getAvator1(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PrimaryCard',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getCard(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                    WidgetbookComponent(
                      name: 'PaymentMethodButton',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'payment method',
                          builder: (context) => getButton2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  folders: [],
                  isExpanded: true,
                ),
                WidgetbookFolder(
                  name: 'icons',
                  widgets: [
                    WidgetbookComponent(
                      name: 'ArrowNext',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'default',
                          builder: (context) => getArrowNext(context),
                        ),
                        WidgetbookUseCase(
                          name: 'primary',
                          builder: (context) => getArrowNext1(context),
                        ),
                        WidgetbookUseCase(
                          name: 'secondary',
                          builder: (context) => getArrowNext2(context),
                        ),
                      ],
                      isExpanded: true,
                    ),
                  ],
                  folders: [],
                  isExpanded: true,
                ),
              ],
              isExpanded: true,
            ),
          ],
          widgets: [
            WidgetbookComponent(
              name: 'MassageX',
              useCases: [
                WidgetbookUseCase(
                  name: 'light',
                  builder: (context) => mainApp(context),
                ),
                WidgetbookUseCase(
                  name: 'dark',
                  builder: (context) => mainApp(context),
                ),
              ],
              isExpanded: true,
            ),
          ],
        ),
      ],
    );
  }
}
