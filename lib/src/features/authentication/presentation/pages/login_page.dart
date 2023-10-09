import 'dart:io';

import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/login_provider.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/widgets/mobile_number_dialog.dart';
import 'package:dfs_flutter_application/src/features/authentication/presentation/widgets/otp_widget.dart';
import 'package:dfs_flutter_application/src/widgets/common_button.dart';
import 'package:dfs_flutter_application/src/widgets/common_text_button.dart';
import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:telephony/telephony.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    listenOtp();
    // Telephony.instance.listenIncomingSms(
    //   onNewMessage: (SmsMessage message) {
    //     print(message.address); //+977981******67, sender nubmer
    //     print(message.body); //Your OTP code is 34567
    //     print(message.date); //1659690242000, timestamp

    //     String sms = message.body.toString(); //get the message

    //     if (message.address == "+977981******67") {
    //       //verify SMS is sent for OTP with sender number
    //       String otpcode = sms.replaceAll(new RegExp(r'[^0-9]'), '');
    //       //prase code from the OTP sms
    //       loginProvider.otp.text = (otpcode);
    //       //split otp code to list of number
    //       //and populate to otb boxes

    //       setState(() {
    //         //refresh UI
    //       });
    //     } else {
    //       print("Normal message.");
    //     }
    //   },
    //   listenInBackground: false,
    // );
    if (Platform.isAndroid) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      MobileNumber.listenPhonePermission((isPermissionGranted) {
        if (isPermissionGranted) {
          loginProvider.initMobileNumberState();
        }
      });
      loginProvider.initMobileNumberState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const MobileNumberDialog();
          },
        );
      });
    }
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    print("unregisterListener");
    // TODO: implement dispose
    super.dispose();
  }

  void listenOtp() async {
    // await SmsAutoFill().unregisterListener();
    // listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: loginProvider.mobileNumber,
            // onChanged: (value) {
            //   loginProvider.updateMobileNumber(value);
            // },
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
            ),
            maxLength: 15,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Mobile number is required.';
              } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                return 'Invalid mobile number. It should be 10 digits.';
              }
              return null;
            },
          ),
          if (loginProvider.isOtpSent)
            loginProvider.countdown > 0
                ? CommonTextButton(
                    iconText:
                        "Resend OTP in ${loginProvider.countdown} seconds",
                    iconTextColor: Colors.grey,
                  )
                : CommonTextButton(
                    iconText: "Resend OTP",
                    onPressed: () {
                      loginProvider.sendOTP(context);
                      loginProvider.startCountdownTimer();
                    },
                  ),
          const SizedBox(height: 20.0),
          // if (loginProvider.isOtpSent)
          const OtpWidget(),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            text: loginProvider.isOtpSent ? 'Verify OTP' : 'Send OTP',
            enabled: !(loginProvider.isOtpSent &&
                loginProvider.otp.text.length != 6),
            onpressed: () {
              if (!loginProvider.isOtpSent) {
                loginProvider.sendOTP(context);
                loginProvider.startCountdownTimer();
              } else {
                if (loginProvider.otp.text.length == 6) {
                  loginProvider.focusNode.unfocus();
                  loginProvider.verifyOTP(context);
                } else {}
              }
            },
          ),
          PinFieldAutoFill(
            currentCode: loginProvider.codeValue,
            codeLength: 6,
            onCodeChanged: (code) {
              print("onCodeChanged $code");
              loginProvider.setCode(code);
            },
            onCodeSubmitted: (val) {
              print("onCodeSubmitted $val");
            },
          ),
        ],
      ),
    );
  }
}
