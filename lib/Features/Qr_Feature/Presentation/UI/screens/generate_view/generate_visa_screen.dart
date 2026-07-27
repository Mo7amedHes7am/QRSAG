import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Data/Models/qrtype.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/Cubit/qr_cubit.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/utils/visa_utils.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/generate_background.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/generate/submit_button.dart';
import 'package:qr_scanner_and_generator/Features/Qr_Feature/Presentation/UI/widgets/main_app_bar.dart';
import 'package:qr_scanner_and_generator/Features/Splash_Feature/Presentation/UI/widgets/background_pattern.dart';
import 'package:qr_scanner_and_generator/app/app_variables.dart';
import 'package:qr_scanner_and_generator/core/Methods/Global_Methods.dart';
import 'package:qr_scanner_and_generator/core/Methods/app_validators.dart';
import 'package:qr_scanner_and_generator/core/components/global/system_wrapper.dart';
import 'package:qr_scanner_and_generator/core/responsive/responsive_core.dart';
import 'package:qr_scanner_and_generator/core/utils/app_images.dart';
import 'package:qr_scanner_and_generator/generated/locale_keys.g.dart';

class GenerateVisaScreen extends StatefulWidget {
  const GenerateVisaScreen({super.key});

  @override
  State<GenerateVisaScreen> createState() => _GenerateVisaScreenState();
}

class _GenerateVisaScreenState extends State<GenerateVisaScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QrCubit>();
    final type = QrType.visa;

    cubit.initGenerateTypePage(QrType.visa);

    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        final formKey = cubit.VisaformKey;
        final isCvvFocused = cubit.isCvvFocused;
        final useGlassMorphism = cubit.useGlassMorphism;
        final useBackgroundImage = cubit.useBackgroundImage;
        final useFloatingAnimation = cubit.useFloatingAnimation;
        final cardHolderNameController = cubit.cardHolderNameController;
        final cardNumberController = cubit.cardNumberController;
        final cvvCodeController = cubit.cvvCodeController;
        final expiryDateController = cubit.expiryDateController;

        if (state is QrGenerateError) {
          showToast(state.message, isError: true);
        }

        return SystemWrapper(
          child: Scaffold(
            backgroundColor: appColors.background,
            appBar: MainAppBar(
              context: context,
              title: type.getLabelFromContext(context),
              hasBack: true,
              backstyle: 1,
            ),
            body: QRBackgroundPattern(
              child: Center(
                child: SingleChildScrollView(
                  child: GenerateBackground(
                    type: type,
                    child: Column(
                      children: [
                        SizedBox(height: 18.h),
                        CreditCardWidget(
                          enableFloatingCard: useFloatingAnimation,
                          glassmorphismConfig: VisaUtils.getGlassmorphismConfig(
                            useGlassMorphism: useGlassMorphism,
                          ),
                          cardNumber: cardNumberController.text,
                          expiryDate: expiryDateController.text,
                          cardHolderName: cardHolderNameController.text,
                          cvvCode: cvvCodeController.text,
                          width: 336.w,
                          chipColor: appColors.primary,
                          isChipVisible: true,
                          textStyle: VisaUtils.getCreditCardTextStyle(),
                          bankName: LocaleKeys.visa_card_bank_name.tr(),
                          frontCardBorder: useGlassMorphism
                              ? null
                              : Border.all(color: appColors.grey),
                          backCardBorder: useGlassMorphism
                              ? null
                              : Border.all(color: appColors.grey),
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: appColors.primary,
                          backgroundImage: useBackgroundImage
                              ? AppImagesAssets.cardBg
                              : null,
                          isSwipeGestureEnabled: true,
                          cardType: CardType.mastercard,
                          onCreditCardWidgetChange:
                              (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            CustomCardTypeIcon(
                              cardType: CardType.mastercard,
                              cardImage: Image.asset(
                                AppImagesAssets.mastercard,
                                height: 48.sp,
                                width: 48.sp,
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              CreditCardForm(
                                formKey: formKey,
                                obscureCvv: true,
                                obscureNumber: true,
                                cardHolderValidator: (value) =>
                                    AppValidators.validateVisaCardHolderName(
                                      value,
                                    ),
                                cardNumberValidator: (value) =>
                                    AppValidators.validateVisaCardNumber(value),
                                cvvValidator: (value) =>
                                    AppValidators.validateCvvCode(value),
                                expiryDateValidator: (value) =>
                                    AppValidators.validateVisaCardExpireDate(
                                      value,
                                    ),
                                cardNumber: cardNumberController.text,
                                cvvCode: cvvCodeController.text,
                                isHolderNameVisible: true,
                                isCardNumberVisible: true,
                                isExpiryDateVisible: true,
                                cardHolderName: cardHolderNameController.text,
                                expiryDate: expiryDateController.text,
                                inputConfiguration:
                                    VisaUtils.getInputConfiguration(
                                      context,
                                      cardNumberController,
                                      expiryDateController,
                                      cvvCodeController,
                                      cardHolderNameController,
                                      cubit,
                                    ),
                                onCreditCardModelChange: (creditCardModel) {
                                  VisaUtils.onCreditCardModelChange(
                                    creditCardModel,
                                    cubit,
                                    cardNumberController,
                                    expiryDateController,
                                    cardHolderNameController,
                                    cvvCodeController,
                                  );
                                },
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        SubmitButton(
                          controllers: [
                            cardHolderNameController,
                            cardNumberController,
                            cvvCodeController,
                            expiryDateController,
                          ],
                          cubit: cubit,
                          context: context,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
