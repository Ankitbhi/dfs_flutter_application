import 'package:dfs_flutter_application/src/features/authentication/presentation/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Pinput(
      length: 6,
      keyboardType: TextInputType.phone,
      controller: loginProvider.otp,
      focusNode: loginProvider.focusNode,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      listenForMultipleSmsOnAndroid: true,
      // defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      validator: (value) {
        return loginProvider.otpVarification;
      },
      // onClipboardFound: (value) {
      //   debugPrint('onClipboardFound: $value');
      //   loginProvider.otp.setText(value);
      // },
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
        loginProvider.verifyOTP(context);
      },
      onChanged: (value) {
        loginProvider.otp.text = value;
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            // color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(19),
          border: Border.all(color: focusedBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
