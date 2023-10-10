import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/login_provider.dart';
import 'package:dfs_flutter_application/src/widgets/common_button.dart';
import 'package:dfs_flutter_application/src/widgets/common_text_button.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 47.0, left: 47),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Mobile Varification',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                const Text('Enter your country code and Phone Number to signin',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                CustomInput(
                  controller: loginProvider.mobileNumber,
                  isRequired: false,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text('I accept the'),
                    const CommonTextButton(
                      iconText: 'Termas of use & privacy policy',
                    )
                  ],
                ),
                const CommonTextButton(
                  iconText: 'Account Recovery',
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signinPage');
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text('Submit'),
                ),
                const Row(
                  children: [
                    Text('Not a user'),
                    CommonTextButton(
                      iconText: 'SignUp',
                    ),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
