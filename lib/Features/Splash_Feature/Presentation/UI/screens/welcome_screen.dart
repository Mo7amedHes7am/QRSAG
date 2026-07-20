import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Logic/Methods.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/cache/cache_manager.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/components/widgets/CustomText.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _avatarKey = GlobalKey();

    return SystemWrapper(
      child: Scaffold(
        backgroundColor: appColors.primary,
        body: Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  width: 200.sp,
                  height: 200.sp,
                  AppImages.Svgs.qrlogogold,
                  color: appColors.background,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 232.h),
                ClipPath(
                  clipper: WaveClipperOne(flip: true, reverse: true),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: appColors.background,
                    padding: EdgeInsets.symmetric(vertical: 48.h),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText.x16
                                  .medium(LocaleKeys.welcome_get.tr())
                                  .fontSize(42)
                                  .primaryTextColor,
                              Container(
                                padding: EdgeInsets.only(bottom: 0.h),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: appColors.primary,
                                      width: 5.sp,
                                    ),
                                  ),
                                ),
                                child: CustomText.x16
                                    .medium(LocaleKeys.welcome_started.tr())
                                    .fontSize(42)
                                    .primaryTextColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          CustomText.x18
                              .medium(LocaleKeys.welcome_description.tr())
                              .center
                              .width(275.w)
                              .grey,
                          SizedBox(height: 20.h),
                          InkWell(
                            onTap: () async {
                              await CacheManager.setGlobalData(
                                onboarding: true,
                              );
                              CheckWhereToGo(context: context);
                            },
                            child: Container(
                              key: _avatarKey,
                              width: 80.sp,
                              height: 80.sp,
                              decoration: BoxDecoration(
                                color: appColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: appColors.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                    spreadRadius: 5.sp,
                                    blurRadius: 7.sp,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: appColors.background,
                                  size: 35.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
