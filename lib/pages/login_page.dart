import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:massagex/pages/account_page_layout.dart';
import 'package:massagex/secrets/api_keys.dart';
import 'package:massagex/state/app/app_bloc.dart';
import 'package:massagex/state/routes/routes.dart';
import 'package:massagex/widgets/components/buttons.dart';
import 'package:massagex/widgets/components/text_inputs.dart';
import 'package:massagex/widgets/texts/styled_text.dart';

class LoginPage extends StatefulWidget {
  final bool? register;
  const LoginPage({Key? key, this.register = false}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isRegistering;
  final emailRegex = RegExp(r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$");
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final confirmPasswordCtr = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final double inputHeigt = 114;
  bool registeringInProgress = false;
  Exception? emailPasswordError;

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
          if (context.app.fauth.currentUser?.uid != null)
            AuthFlowBuilder<EmailFlowController>(
                builder: (context, state, ctr, _) {
              return ListBody(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      text:
                          "You are already loged in as \n ${context.app.currentUser?.data?.displayName ?? "Guest"}"),
                  const SizedBox(
                    height: 40,
                  ),
                  PrimaryButton(
                      onPressed: () => context.navigator
                          .pushReplacementNamed(AppRoutes.home),
                      child: const Nunito(text: "Go to Home")),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Nunito(text: "OR"),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SecondaryButton(
                    onPressed: () async {
                      await context.app.fauth.signOut();
                      context.app.add(const AppResseted());
                    },
                    child: const Nunito(text: "Sign Out"),
                  )
                ],
              );
            }),
          if (context.app.fauth.currentUser?.uid == null) ...[
            Form(
              key: formKey,
              child: AuthFlowBuilder<EmailFlowController>(
                auth: context.app.fauth,
                builder: (context, state, controller, _) {
                  final loading = state is SigningIn || registeringInProgress;
                  if (state is AuthFailed) {
                    emailPasswordError = state.exception;
                  }
                  return ListBody(children: [
                    SizedBox(
                      height: inputHeigt,
                      child: PrimaryTextInput(
                        controller: emailCtr,
                        keyboardType: TextInputType.emailAddress,
                        enabled: !loading,
                        maxLines: 1,
                        label: const Nunito(text: "Email Address"),
                        validator: validateEmail,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: inputHeigt,
                      child: PrimaryTextInput(
                        controller: passwordCtr,
                        obscureText: true,
                        maxLines: 1,
                        enabled: !loading,
                        validator: validatePassword,
                        label: const Nunito(text: "Password"),
                      ),
                    ),
                    if (isRegistering!) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: inputHeigt,
                        child: PrimaryTextInput(
                          controller: confirmPasswordCtr,
                          obscureText: true,
                          maxLines: 1,
                          enabled: !loading,
                          validator: (v) {
                            final e = validatePassword(v);
                            if (e != null) {
                              return e;
                            }
                            if (passwordCtr.text != confirmPasswordCtr.text) {
                              return "Password mismatch";
                            }
                            return null;
                          },
                          label: const Nunito(text: "Confirm Password"),
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
                      onPressed: !loading
                          ? () async {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate() == true) {
                                if (isRegistering == true) {
                                  try {
                                    if (mounted) {
                                      setState(() {
                                        registeringInProgress = true;
                                        emailPasswordError = null;
                                      });
                                    }
                                    await controller.auth
                                        .createUserWithEmailAndPassword(
                                            email: emailCtr.text,
                                            password: passwordCtr.text)
                                        .whenComplete(() {
                                      if (mounted) {
                                        setState(() {
                                          registeringInProgress = false;
                                        });
                                      }
                                    });
                                  } catch (e) {
                                    if (e is Exception && mounted) {
                                      setState(() {
                                        emailPasswordError = e;
                                        registeringInProgress = false;
                                      });
                                    }
                                  }
                                } else {
                                  controller.setEmailAndPassword(
                                      emailCtr.text, passwordCtr.text);
                                }
                              }
                            }
                          : null,
                      child: loading
                          ? SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            )
                          : Nunito(text: isRegistering! ? "Register" : "Login"),
                    ),
                    if (emailPasswordError != null) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      ErrorText(exception: emailPasswordError!)
                    ]
                  ]);
                },
              ),
            ),
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
        ]);
  }

  String? validatePassword(v) {
    if (v?.isEmpty == true) {
      return "Password is required";
    }
    if (v!.length < 6) {
      return "Password need to be 6 or more charaters";
    }
    return null;
  }

  String? validateEmail(v) {
    if (v?.isEmpty == true) {
      return 'Email is required';
    }
    if (!emailRegex.hasMatch(v!)) {
      return 'Email provided is Invalid';
    }
    return null;
  }
}
