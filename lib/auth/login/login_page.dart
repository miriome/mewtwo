import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mewtwo/auth/login/login_page_store.dart';
import 'package:mewtwo/base/pages/webview/webview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mewtwo/utils.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);
  final store = LoginPageStore();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Observer(
      builder: (context) {
        return Scaffold(
          body: Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 92,
                    ),
                    header(),
                    const SizedBox(
                      height: 52,
                    ),
                    usernameInput(),
                    const SizedBox(height: 20),
                    passwordInput(),
                    forgetPassword(),
                    const SizedBox(
                      height: 32,
                    ),
                    signInButton(),
                    const SizedBox(
                      height: 32,
                    ),
                    startHere(),
                    const Spacer(),
                    privacyPolicy(),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              )),
        );
      }
    );
  }

  Widget header() {
    return Text(
      "miromie",
      style: GoogleFonts.barlow(
          textStyle: const TextStyle(
              fontSize: 70,
              color: Color(
                0xFF6EC6CA,
              ),
              fontWeight: FontWeight.w700)),
    );
  }

  Widget usernameInput() {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Username",
            style: TextStyle(color: Color(0xFF7D7878)),
          ),
          TextFormField(
            controller: store.usernameController,
            maxLines: 1,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(border: InputBorder.none, isDense: true),
          )
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 20, end: 8),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(color: Color(0xFF7D7878)),
                ),
                TextFormField(
                  obscureText: store.isPasswordHidden,
                  controller: store.passwordController,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(border: InputBorder.none, isDense: true),
                )
              ],
            ),
          ),
          IconButton(onPressed: () {
            store.isPasswordHidden = !store.isPasswordHidden;
          }, icon: Icon(store.isPasswordHidden ? Icons.visibility : Icons.visibility_off, color: const Color(0xFF7D7878),))
        ],
      ),
    );
  }

  Widget forgetPassword() {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {
              MainPlatform.goToScreen(Screens.forgetPassword);
            },
            child: const Text(
              "Forget Password?",
              style: TextStyle(color: Color(0xFF7D7878), decoration: TextDecoration.underline),
            ))
      ],
    );
  }

  Widget signInButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
          padding: const MaterialStatePropertyAll(EdgeInsetsDirectional.symmetric(horizontal: 44, vertical: 8))),
      child: SizedBox(
        width: 122,
        height: 44,
        child: Center(
          child: Text(
            "Sign in",
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget startHere() {
    return TextButton(
        onPressed: () {},
        child: const Text.rich(TextSpan(children: [
          TextSpan(text: "Don't have an account? "),
          TextSpan(
              text: "Start here!", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700))
        ], style: TextStyle(color: Colors.black, fontSize: 12))));
  }

  Widget privacyPolicy() {
    return Builder(
      builder: (context) {
        return Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: "By continuing, you agree to miromie's "),
              WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Webview(url: "https://www.google.com", title: "Terms of use",)));
                    },
                    child: const Text("Terms of use", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700),),
                  )
              ),
              const TextSpan(text: " and confirm that you have read and understood our "),
              WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Webview(url: "https://www.google.com", title: "Privacy Policy",)));
                    },
                    child: const Text("Privacy Policy",style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700),),
                  )
              ),
              const TextSpan(text: " and that you are at least 13 years old."),
            ],
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Color(0xFF7D7878), fontSize: 12),
        );
      }
    );
  }
}
