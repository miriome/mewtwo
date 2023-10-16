import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "miromie",
                  style: GoogleFonts.barlow(
                      textStyle: const TextStyle(
                          fontSize: 70,
                          color: Color(
                            0xFF6EC6CA,
                          ),
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(
                  height: 52,
                ),
                usernameInput(),
                const SizedBox(height: 20),
                passwordInput(),
                Row(
                  children: [
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(color: Color(0xFF7D7878), decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
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
                ),
                const SizedBox(height: 32,),
                TextButton(onPressed: () {}, child: const Text.rich(TextSpan(children: [
                  TextSpan(text: "Don't have an account? "), 
                  TextSpan(text: "Start here!", style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700))
                ], style:  TextStyle(color: Colors.black, fontSize: 12))))
              ],
            ),
          )),
    );
  }

  Widget usernameInput() {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Username", style: TextStyle(color: Color(0xFF7D7878)),),
          TextFormField(
            controller: usernameController,
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
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Password", style: TextStyle(color: Color(0xFF7D7878)),),
          TextFormField(
            controller: usernameController,
            maxLines: 1,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(border: InputBorder.none, isDense: true),
          )
        ],
      ),
    );
  }
}
