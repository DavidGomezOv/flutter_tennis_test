import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkHelper {
  Future<bool> validateConnection() async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      throw ('No internet connection');
    }
    return connectivity != ConnectivityResult.none;
  }
}
