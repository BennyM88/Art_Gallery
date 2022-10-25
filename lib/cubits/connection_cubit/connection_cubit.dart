import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionCheckCubit extends Cubit<bool> {
  late StreamSubscription<InternetConnectionStatus> streamSubscription;

  ConnectionCheckCubit() : super(true) {
    monitorInternetConnection();
  }

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 2),
    checkInterval: const Duration(seconds: 3),
  );

  StreamSubscription<InternetConnectionStatus> monitorInternetConnection() {
    return streamSubscription =
        connectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        emit(true);
      } else {
        emit(false);
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
