import 'dart:async';

import 'package:appbloccubit/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';
class InternetCubit extends Cubit<InternetState>{
  final Connectivity connectivity;

  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}):super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection(){

    return connectivityStreamSubscription=connectivity.onConnectivityChanged.listen((connectivityResult) {

      if (connectivityResult==ConnectivityResult.wifi){

        emitInternetConnected(ConnectionType.wifi);

      }else if (connectivityResult==ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);

      } else if (connectivityResult==ConnectivityResult.none){

        emitInternetDisConnected();

      }

    });

  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));
  
  void emitInternetDisConnected() => emit(InternetDisConnected());


  @override

  Future<void> close(){

    connectivityStreamSubscription.cancel();
    return super.close();

  }

  listen(Null Function(dynamic internetState) param0) {}


  
}


class ExBlocObserver extends BlocObserver{

}

