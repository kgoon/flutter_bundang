import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_bloc.dart';
import 'package:flutter_bundang/src/services/auth_service.dart';

class ApiProvider with ChangeNotifier {
  ApiBloc _bloc;

  ApiProvider() {
    _bloc = ApiBloc();
    _bloc.loadPreferences();
  }

  // Getters
  ApiBloc get bloc => _bloc;
}
