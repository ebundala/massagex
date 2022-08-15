import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:massagex/pages/account_page_layout.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart' hide PhoneInput;
import 'package:massagex/widgets/texts/styled_text.dart';

class VerifyPhonePage extends StatefulWidget {
  const VerifyPhonePage({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyPhonePage> createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final flowKey = GlobalKey<PhoneInputState>();
  final smsCodeKey = GlobalKey<SMSCodeInputState>();

  acceptPhoneNumber(PhoneAuthController authController) {
    if (flowKey.currentState?.formKey.currentState?.validate() == true) {
      flowKey.currentState!.formKey.currentState!.save();

      authController.acceptPhoneNumber(flowKey.currentState!.phoneNumber);
    }
  }

  verifySMSCode(PhoneAuthController authController) {
    final smsCode = smsCodeKey.currentState!.controller.text;
    authController.verifySMSCode(smsCode);
  }

  @override
  Widget build(BuildContext context) {
    return AuthFlowBuilder<PhoneAuthController>(
        listener: (oldState, newState, ctr) {
      if (newState is CredentialLinked || newState is SignedIn) {
        Navigator.of(context).pop<AuthState>(newState);
      }
    }, builder: (context, state, authController, _) {
      final loading = state is SMSCodeRequested;
      print(state);
      return AcountPageLayoutWidget(
          title: "Update phone number",
          subTitle: "Kindly share your main phone to complete your profile",
          children: [
            const SizedBox(
              height: 8,
            ),
            if (state is! SMSCodeSent && (state is! AuthFailed))
              PhoneInput(
                key: flowKey,
                initialCountryCode: "TZ",
                onSubmit: (v) {
                  acceptPhoneNumber(authController);
                },
              ),
            if (state is AuthFailed) ...[
              if (state.exception is! AutoresolutionFailedException) ...[
                ErrorText(exception: state.exception),
                const SizedBox(
                  height: 8,
                ),
                SecondaryButton(
                    onPressed: () => authController.reset(),
                    child: const Nunito(
                      text: "Try again",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ))
              ],
              if (state.exception is AutoresolutionFailedException) ...[
                SMSCodeInput(
                  key: smsCodeKey,
                  onSubmit: (smsCode) {
                    verifySMSCode(authController);
                  },
                ),
                PrimaryButton(
                  width: double.infinity,
                  onPressed:
                      !loading ? () => verifySMSCode(authController) : null,
                  child: !loading
                      ? const Nunito(
                          text: "Verify code",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                      : SizedBox(
                          height: 32,
                          width: 32,
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                )
              ]
            ],
            const SizedBox(
              height: 8,
            ),
            if (state is AwaitingPhoneNumber || loading)
              PrimaryButton(
                width: double.infinity,
                onPressed:
                    !loading ? () => acceptPhoneNumber(authController) : null,
                child: !loading
                    ? const Nunito(
                        text: "Send Verification code",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )
                    : SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
              )
          ]);
    });
  }
}
