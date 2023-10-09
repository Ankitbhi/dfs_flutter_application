import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController otp = TextEditingController();
  String verificationID = '';
  String resendToken = '';
  bool isOtpSent = false;
  int countdown = 30;
  String mobileNumberList = '';
  final focusNode = FocusNode();
  List<SimCard> simCard = <SimCard>[];
  String otpVarification = '';
  List<String> availableMobileNumbers = [
    // Add more available numbers as needed
  ];
  String codeValue = "";

  void updateMobileNumber(String number) {
    mobileNumber.text = number;
    // number.substring(number.length - 10);
    notifyListeners();
  }

  void updateOTP(String enteredOTP) {
    otp.text = enteredOTP;
    notifyListeners();
  }

  void sendOTP(BuildContext context) async {
    countdown = 30;
    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": mobileNumber.text,
      "app_signature_id": appSignatureID
    };
    print(sendOtpData);
    // signInWithPhoneNumber('+91${mobileNumber.text}');
    // signInWithPhoneNumber(mobileNumber.text, context);
    notifyListeners();
  }

  void verifyOTP(BuildContext context) async {
    print('OTP Verified: ${otp.text}');
    // try {
    //   final PhoneAuthCredential creds = PhoneAuthProvider.credential(
    //       verificationId: verificationID, smsCode: otp.text);
    //   final UserCredential userCredential =
    //       await FirebaseAuth.instance.signInWithCredential(creds);
    //   final User? user = userCredential.user;

    //   if (user != null) {
    //     if (context.mounted) Navigator.pushReplacementNamed(context, '/home');
    //   }
    // } on FirebaseAuthException catch (e) {
    //   otpVarification = e.message!;
    //   print(e);
    // }
    verifyOtp(context);
  }

  void startCountdownTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (countdown > 0) {
        countdown--;
        notifyListeners();
      } else {
        timer.cancel(); // Stop the timer when countdown reaches 0
      }
    });
  }

  String verificationId = "";
  Future<void> signInWithPhoneNumber(
      String phoneNumber, BuildContext context) async {
    try {
      verified(AuthCredential authResult) {
        FirebaseAuth.instance.signInWithCredential(authResult);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Phone number automatically verified and signed in."),
        ));
      }

      verificationFailed(FirebaseAuthException authException) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Phone number verification failed: ${authException.message}"),
        ));
      }

      smsSent(String verId, [int? forceResend]) {
        verificationId = verId;
        resendToken = resendToken;
        verificationID = verificationId;
        isOtpSent = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("SMS code has been sent to your phone."),
        ));
      }

      autoTimeout(String verId) {
        verificationId = verId;
      }

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout,

        timeout:
            const Duration(seconds: 120), // Timeout for code auto-retrieval
      );

      // await FirebaseAuth.instance.verifyPhoneNumber(
      //   phoneNumber: phoneNumber,
      //   verificationCompleted: (PhoneAuthCredential credential) {
      //     print(credential);
      //   },
      //   verificationFailed: (FirebaseAuthException e) {
      //     print(e);
      //   },
      //   codeSent: (String verificationId, int? resendToken) {
      //     resendToken = resendToken;
      //     verificationID = verificationId;
      //     isOtpSent = true;
      //   },
      //   forceResendingToken: 120,
      //   codeAutoRetrievalTimeout: (String verificationId) {
      //     print(verificationId);
      //     verificationID = verificationId;
      //   },
      // );
    } catch (e) {
      // Handle the error
      if (kDebugMode) {
        print("Error during sign-in: $e");
      }
      // You can display an error message to the user or take appropriate actions.
    }
    // await auth.verifyPhoneNumber(
    //   phoneNumber: '+91$phoneNumber',
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     await auth.signInWithCredential(credential);
    //     // authentication successful, do something
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     // authentication failed, do something
    //     print(e);
    //   },
    //   codeSent: (String verificationId, int? resendToken) async {
    //     // code sent to phone number, save verificationId for later use
    //     String smsCode = '123123'; // get sms code from user
    //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //       verificationId: verificationId,
    //       smsCode: smsCode,
    //     );
    //     try {
    //       await auth.signInWithCredential(credential);
    //       // Authentication successful, do something
    //     } catch (e) {
    //       // Handle the error
    //       print("Error during sign-in: $e");
    //       // You can display an error message to the user or take appropriate actions.
    //     }
    //   },
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }

  Future<void> verifyOtp(BuildContext context) async {
    // try {
    //   final PhoneAuthCredential creds = PhoneAuthProvider.credential(
    //       verificationId: verificationID, smsCode: otp.text);
    //   final UserCredential userCredential =
    //       await FirebaseAuth.instance.signInWithCredential(creds);
    //   final User? user = userCredential.user;

    //   if (user != null) {
    //     Navigator.pushReplacementNamed(context, '/home');
    //   }
    // } on FirebaseAuthException catch (e) {
    //   otpVarification = e.message!;
    //   print(e);
    // }
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    availableMobileNumbers.clear();
    List<SimCard> simCards = [];

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      (await MobileNumber.mobileNumber)!;
      List<SimCard> simCardList = (await MobileNumber.getSimCards)!;
      simCards = simCardList;

      for (var simCard in simCards) {
        String mobileNumber = simCard.number ?? "N/A";

        print("SIM Card: ${simCard.displayName}, Mobile Number: $mobileNumber");
        availableMobileNumbers.add(mobileNumber);
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get SIM cards because of '${e.message}'");
    }

    notifyListeners();
  }

  setCode(String? code) {
    if (code != codeValue) {
      codeValue = code.toString();
      otp.text = codeValue;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    mobileNumber.dispose();
    otp.dispose();
    super.dispose();
  }
}
