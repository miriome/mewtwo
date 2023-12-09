import 'package:flutter/material.dart';
import 'package:mewtwo/base/widgets/miromie_title.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const MiromieTitle(fontSize: 70),
            const SizedBox(
              height: 56,
            ),
            TextFormField(
              maxLines: 1,
              style: const TextStyle(fontSize: 16),
              decoration: textFieldDecoration(context: context, labelText: "Username"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 1,
              style: const TextStyle(fontSize: 16),
              decoration: textFieldDecoration(context: context, labelText: "Email"),
              // validator: ,
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 1,
              style: const TextStyle(fontSize: 16),
              decoration: textFieldDecoration(context: context, labelText: "Password"),
            ),
            const SizedBox(height: 16),
            TextFormField(
                maxLines: 1,
                style: const TextStyle(fontSize: 16),
                decoration: textFieldDecoration(context: context, labelText: "Confirm Password"))
          ],
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration({required BuildContext context, required String labelText}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return TextStyle(color: Theme.of(context).disabledColor);
        }
        if (states.contains(MaterialState.error)) {
          return TextStyle(color: Theme.of(context).colorScheme.error);
        }
        if (states.contains(MaterialState.focused)) {
          return TextStyle(color: Theme.of(context).colorScheme.primary);
        }
        return const TextStyle(color: Color(0xFF8474A1));
      }),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF8474A1)), borderRadius: BorderRadius.circular(12)),
    );
  }
}
