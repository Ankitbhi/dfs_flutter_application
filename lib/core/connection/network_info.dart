// import 'package:data_connection_checker_tv/data_connection_checker.dart';

// abstract class NetworkInfo {
//   Future<bool>? get isConnected;
// }

// class NetworkInfoImpl implements NetworkInfo {
//   var isDeviceConnected = false;

// var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
//   if(result != ConnectivityResult.none) {
//     isDeviceConnected = await InternetConnectionChecker().hasConnection;
//   }
// });
//   final DataConnectionChecker connectionChecker;

//   NetworkInfoImpl(this.connectionChecker);

//   @override
//   Future<bool> get isConnected => connectionChecker.hasConnection;
// }

class NetworkCheck {}
