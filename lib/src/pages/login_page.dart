// import 'package:digit_components/widgets/atoms/digit_toaster.dart';
// import 'package:digit_components/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:mobile_number/mobile_number.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String _mobileNumber = '';
//   List<SimCard> _simCard = <SimCard>[];
//   @override
//   initState() {
//     super.initState();
//     MobileNumber.listenPhonePermission((isPermissionGranted) {
//       if (isPermissionGranted) {
//         initMobileNumberState();
//       } else {}
//     });

//     initMobileNumberState();
//   }

//   Future<void> initMobileNumberState() async {
//     if (!await MobileNumber.hasPhonePermission) {
//       await MobileNumber.requestPhonePermission;
//       return;
//     }
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       _mobileNumber = (await MobileNumber.mobileNumber)!;
//       _simCard = (await MobileNumber.getSimCards)!;
//     } on PlatformException catch (e) {
//       debugPrint("Failed to get mobile number because of '${e.message}'");
//     }
//     print(_mobileNumber);
//     print(_simCard);

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login Page'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Form(
//               // key: formKey,
//               autovalidateMode:
//                   false ? AutovalidateMode.always : AutovalidateMode.disabled,
//               child: DigitCard(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("LoginForm",
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w700)),
//                     ),
//                     DigitTextField(
//                       label: 'asasas',
//                       controller: TextEditingController(),
//                       isRequired: true,
//                       prefixText: '+91 - ',
//                       suffixIcon: Icon(Icons.add),
//                       // focusNode: _numberFocus,
//                       autoValidation: false
//                           ? AutovalidateMode.always
//                           : AutovalidateMode.disabled,
//                       textInputType: TextInputType.number,
//                       inputFormatter: [
//                         FilteringTextInputFormatter.allow(RegExp("[0-9]"))
//                       ],
//                       // validator: (val) {
//                       //   if (val!.trim().isEmpty || val!.trim().length != 10) {
//                       //     return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
//                       //   }
//                       //   return null;
//                       // },
//                       onChange: (value) {
//                         // setState(() {
//                         //   canContinue = value.length == 10;
//                         // });
//                         // if (value.length == 10) {
//                         //   _numberFocus.unfocus();
//                         // }
//                       },
//                       maxLength: 10,
//                     ),
//                     const SizedBox(height: 16),
//                     DigitIconButton(
//                       icon: Icons.add,
//                       iconText: 'Add Item',
//                       iconTextColor: Colors.blue,
//                       iconColor: Colors.blue,
//                       onPressed: () {
//                         DigitActionDialog.show(context, widget: Text('d'));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             DigitDropdown<String>(
//               value: 'label',
//               // .firstWhereOrNull(
//               //   (element) => element.key == label,
//               // )
//               // ?.value,
//               label: 'label',
//               menuItems: ['label', 'asas', 'asassda'],
//               onChanged: (value) {
//                 if (value == null) return;
//                 //Any functions to perform on change or on select of the dropdown
//               },
//               valueMapper: (value) {
//                 return value;
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 DigitToast.show(
//                   context,
//                   options: DigitToastOptions(
//                     'Unable to login',
//                     true,
//                     ThemeData(),
//                   ),
//                 );
//                 // final userProvider =
//                 //     Provider.of<UserProvider>(context, listen: false);
//                 // userProvider.loginUser('JohnDoe'); // Simulate login
//                 // Navigator.pushReplacementNamed(context, '/home');
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
