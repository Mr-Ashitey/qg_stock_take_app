import 'package:qg_stock_take_app/models/station_model.dart';
import 'package:qg_stock_take_app/network/dio_client.dart';
import 'package:qg_stock_take_app/offline/prefs_manager.dart';

import 'package:dartz/dartz.dart';
import 'package:qg_stock_take_app/util/query_util.dart';

import '../models/login_model.dart';
import '../util/base_provider.dart';

class LoginProvider extends BaseProvider {
  final DioClient _dioClient = DioClient();

  List<StationModel> _stations = [];
  List<StationModel> get stations => [..._stations];

  Future<Either<String, void>> login(String phoneNumber, String code) async {
    try {
      updateState(NotifierState.loading);
      LoginModel loginCredentials = LoginModel(phone: phoneNumber, code: code);

      await PrefsManager().setPhone(phoneNumber);
      await PrefsManager().setStationCode(code);

      final result = await _dioClient.post(
        '/rpc/stock_authuser',
        loginCredentials.toJson(),
      );

      final String teamName = result.first['name'];
      final int officerId = result.first['officer_id'];

      await PrefsManager().setIsLoggedIn(true);
      await PrefsManager().setOfficerId(officerId);
      await PrefsManager().setTeamName(teamName);
      updateState(NotifierState.loaded);
      return const Right(null);
    } catch (error) {
      updateState(NotifierState.initial);
      return Left(error.toString());
    }
  }

  // getStations
  Future<Either<String, void>> getStations() async {
    try {
      updateState(NotifierState.loading);

      final result = await _dioClient.get(QueryUtils.getStations());

      _stations = result
          .map<StationModel>((station) => StationModel.fromJson(station))
          .toList();

      updateState(NotifierState.loaded);
      return const Right(null);
    } catch (error) {
      updateState(NotifierState.initial);
      return Left(error.toString());
    }
  }
}
