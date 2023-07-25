// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/presentation/auth/blocs/auth_bloc/auth_bloc.dart' as _i10;
import '../../app/presentation/auth/core/service/auth_service.dart' as _i3;
import '../modules/modules.dart' as _i11;
import '../services/api_client.dart' as _i9;
import '../services/network_info.dart' as _i6;
import '../services/secure_storage_service.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final modules = _$Modules();
  gh.factory<_i3.AuthService>(() => _i3.AuthService());
  gh.lazySingleton<_i4.Connectivity>(() => modules.connectivity);
  gh.lazySingleton<_i5.Dio>(() => modules.dio);
  gh.lazySingleton<_i6.INetworkInfo>(
      () => _i6.NetworkInfo(gh<_i4.Connectivity>()));
  gh.factory<_i7.SecureStorageService>(
      () => _i7.SecureStorageService(storage: gh<_i8.FlutterSecureStorage>()));
  gh.lazySingleton<_i9.ApiClient>(() => _i9.ApiClient(client: gh<_i5.Dio>()));
  gh.factory<_i10.AuthBloc>(
      () => _i10.AuthBloc(authService: gh<_i3.AuthService>()));
  return getIt;
}

class _$Modules extends _i11.Modules {}
