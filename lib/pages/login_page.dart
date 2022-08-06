import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:massagex/pages/account_page_layout.dart';
import 'package:massagex/secrets/api_keys.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class LoginPage extends StatefulWidget {
  final bool register;
  const LoginPage({Key? key, this.register = false}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isRegistering;
  @override
  void initState() {
    isRegistering = widget.register;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AcountPageLayoutWidget(
      title: isRegistering! ? "Create An Account" : "Sign In to your account",
      subTitle: isRegistering!
          ? "Kindly share your details to register your account."
          : "Please enter your info to sign in to your account.",
      children: [
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 94,
          child: PrimaryTextInput(
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
            label: Nunito(text: "Email Address"),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 94,
          child: PrimaryTextInput(
            obscureText: true,
            maxLines: 1,
            label: Nunito(text: "Password"),
          ),
        ),
        if (isRegistering!) ...[
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 94,
            child: PrimaryTextInput(
              obscureText: true,
              maxLines: 1,
              label: Nunito(text: "Confirm Password"),
            ),
          ),
        ],
        if (!isRegistering!) ...[
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextsButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {},
                child: const Nunito(
                  text: "Forgot password",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
        const SizedBox(
          height: 8,
        ),
        PrimaryButton(
            width: double.infinity,
            onPressed: () {},
            child: Nunito(text: widget.register ? "Register" : "Login")),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            ),
            Nunito(
              text: "OR",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: Divider(
                thickness: 1,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const GoogleSignInButton(clientId: googleAuthClientId),
        const SizedBox(
          height: 8,
        ),
        const FacebookSignInButton(
          clientId: fbAppId,
        ),
        const SizedBox(
          height: 8,
        ),
        const SignOutButton(
          variant: ButtonVariant.text,
        ),
        if (!isRegistering!) ...[
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextsButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  setState(() {
                    isRegistering = true;
                  });
                },
                child: Row(
                  children: [
                    const Nunito(
                      text: "i dont have an account?",
                      color: Color.fromRGBO(146, 136, 153, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Nunito(
                      text: "Sign Up",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                )),
          ),
        ],
        if (isRegistering!) ...[
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextsButton(
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  setState(() {
                    isRegistering = false;
                  });
                },
                child: Row(
                  children: [
                    const Nunito(
                      text: "I already have an account?",
                      color: Color.fromRGBO(146, 136, 153, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Nunito(
                      text: "Sign In",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )),
          )
        ],
      ],
    );
  }
}
