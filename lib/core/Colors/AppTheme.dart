import 'package:flutter/material.dart' show ThemeExtension, Color;

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color button;
  final Color textfield;
  final Color bgoverlay;
  final Color background;
  final Color primaryTextColor;
  final Color grey;
  final Color secondaryTextColor;
  final Color lightTextColor;
  final Color primaryLight;
  final Color doneBg;
  final Color done;
  final Color waitingBg;
  final Color waiting;
  final Color failed;
  final Color failedBg;
  final Color buttonTextColor;
  final Color activeColor;
  final Color borderText2;
  final Color workshopText;
  final Color textGrey;
  final Color buttonGrey;
  final Color border;
  final Color navGrey;
  final Color moveLight;
  final Color shadow;
  final Color thirdText;
  final Color grey3;
  final Color grey2;
  final Color border3;
  final Color divider;
  final Color arrow;
  final Color chart1;
  final Color chart2;
  final Color chart3;
  final Color border2;
  final Color delete;
  final Color textGrey2;
  final Color date;
  final Color chartText;

  const AppColors({
    required this.primary,
    required this.button,
    required this.textfield,
    required this.background,
    required this.primaryTextColor,
    required this.grey,
    required this.secondaryTextColor,
    required this.lightTextColor,
    required this.primaryLight,
    required this.doneBg,
    required this.done,
    required this.waitingBg,
    required this.waiting,
    required this.failed,
    required this.failedBg,
    required this.buttonTextColor,
    required this.activeColor,
    required this.borderText2,
    required this.workshopText,
    required this.textGrey,
    required this.buttonGrey,
    required this.border,
    required this.bgoverlay,
    required this.navGrey,
    required this.moveLight,
    required this.shadow,
    required this.thirdText,
    required this.grey3,
    required this.grey2,
    required this.border3,
    required this.divider,
    required this.arrow,
    required this.chart1,
    required this.chart2,
    required this.chart3,
    required this.border2,
    required this.delete,
    required this.textGrey2,
    required this.date,
    required this.chartText,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? button,
    Color? textfield,
    Color? background,
    Color? primaryTextColor,
    Color? grey,
    Color? secondaryTextColor,
    Color? lightTextColor,
    Color? primaryLight,
    Color? doneBg,
    Color? done,
    Color? waitingBg,
    Color? waiting,
    Color? failed,
    Color? failedBg,
    Color? buttonTextColor,
    Color? activeColor,
    Color? borderText2,
    Color? workshopText,
    Color? textGrey,
    Color? buttonGrey,
    Color? border,
    Color? navGrey,
    Color? moveLight,
    Color? shadow,
    Color? thirdText,
    Color? grey3,
    Color? grey2,
    Color? border3,
    Color? divider,
    Color? arrow,
    Color? chart1,
    Color? chart2,
    Color? chart3,
    Color? border2,
    Color? delete,
    Color? textGrey2,
    Color? date,
    Color? chartText,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      bgoverlay: bgoverlay ?? this.bgoverlay,
      button: button ?? this.button,
      textfield: textfield ?? this.textfield,
      background: background ?? this.background,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      grey: grey ?? this.grey,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      lightTextColor: lightTextColor ?? this.lightTextColor,
      primaryLight: primaryLight ?? this.primaryLight,
      doneBg: doneBg ?? this.doneBg,
      done: done ?? this.done,
      waitingBg: waitingBg ?? this.waitingBg,
      waiting: waiting ?? this.waiting,
      failed: failed ?? this.failed,
      failedBg: failedBg ?? this.failedBg,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      activeColor: activeColor ?? this.activeColor,
      borderText2: borderText2 ?? this.borderText2,
      workshopText: workshopText ?? this.workshopText,
      textGrey: textGrey ?? this.textGrey,
      buttonGrey: buttonGrey ?? this.buttonGrey,
      border: border ?? this.border,
      navGrey: navGrey ?? this.navGrey,
      moveLight: moveLight ?? this.moveLight,
      shadow: shadow ?? this.shadow,
      thirdText: thirdText ?? this.thirdText,
      grey3: grey3 ?? this.grey3,
      grey2: grey2 ?? this.grey2,
      border3: border3 ?? this.border3,
      divider: divider ?? this.divider,
      arrow: arrow ?? this.arrow,
      chart1: chart1 ?? this.chart1,
      chart2: chart2 ?? this.chart2,
      chart3: chart3 ?? this.chart3,
      border2: border2 ?? this.border2,
      delete: delete ?? this.delete,
      textGrey2: textGrey2 ?? this.textGrey2,
      date: date ?? this.date,
      chartText: chartText ?? this.chartText,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      bgoverlay: Color.lerp(bgoverlay, other.bgoverlay, t)!,
      button: Color.lerp(button, other.button, t)!,
      textfield: Color.lerp(textfield, other.textfield, t)!,
      background: Color.lerp(background, other.background, t)!,
      primaryTextColor:
          Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      secondaryTextColor:
          Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      lightTextColor: Color.lerp(lightTextColor, other.lightTextColor, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      doneBg: Color.lerp(doneBg, other.doneBg, t)!,
      done: Color.lerp(done, other.done, t)!,
      waitingBg: Color.lerp(waitingBg, other.waitingBg, t)!,
      waiting: Color.lerp(waiting, other.waiting, t)!,
      failed: Color.lerp(failed, other.failed, t)!,
      failedBg: Color.lerp(failedBg, other.failedBg, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      borderText2: Color.lerp(borderText2, other.borderText2, t)!,
      workshopText: Color.lerp(workshopText, other.workshopText, t)!,
      textGrey: Color.lerp(textGrey, other.textGrey, t)!,
      buttonGrey: Color.lerp(buttonGrey, other.buttonGrey, t)!,
      border: Color.lerp(border, other.border, t)!,
      navGrey: Color.lerp(navGrey, other.navGrey, t)!,
      moveLight: Color.lerp(moveLight, other.moveLight, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      thirdText: Color.lerp(thirdText, other.thirdText, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      border3: Color.lerp(border3, other.border3, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      arrow: Color.lerp(arrow, other.arrow, t)!,
      chart1: Color.lerp(chart1, other.chart1, t)!,
      chart2: Color.lerp(chart2, other.chart2, t)!,
      chart3: Color.lerp(chart3, other.chart3, t)!,
      border2: Color.lerp(border2, other.border2, t)!,
      delete: Color.lerp(delete, other.delete, t)!,
      textGrey2: Color.lerp(textGrey2, other.textGrey2, t)!,
      date: Color.lerp(date, other.date, t)!,
      chartText: Color.lerp(chartText, other.chartText, t)!,
    );
  }
}
