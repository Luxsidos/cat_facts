import 'package:connectivity_plus/connectivity_plus.dart';


Future<bool> isInternetConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.ethernet) {
    return true; // Connected to mobile data or Wi-Fi
  } else {
    return false; // Not connected to the internet
  }
}
