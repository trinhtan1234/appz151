import 'dart:async';

import '../models/info_user_model.dart';

import '../models/suachua_model.dart';
import '../responsitories/responsitory.dart';

class UserBloc {
  final _userRepository = UserProfileRepository();

  final StreamController<UserProfile?> _userStreamController =
      StreamController<UserProfile?>.broadcast();
  Stream<UserProfile?> get userStream => _userStreamController.stream;

  UserProfile? _userProfile;

  Future<void> getUserProfile() async {
    try {
      _userProfile = await _userRepository.getUserProfile();
      _userStreamController.sink.add(_userProfile);
    } catch (error) {
      _userStreamController.sink.addError(error);
    }
  }

  void dispose() {
    _userStreamController.close();
  }
}

class TienDoBloc {
  final _tienDoRepository = TienDoRepository();

  final StreamController<XeSuaChua?> _tienDoStreamController =
      StreamController<XeSuaChua?>.broadcast();
  Stream<XeSuaChua?> get tienDoStream => _tienDoStreamController.stream;

  XeSuaChua? _xeSuaChua;

  Future<void> getTienDo() async {
    try {
      _xeSuaChua = await _tienDoRepository.getTienDo();
      _tienDoStreamController.sink.add(_xeSuaChua);
    } catch (error) {
      _tienDoStreamController.sink.addError(error);
    }
  }

  void dispose() {
    _tienDoStreamController.close();
  }
}
