import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/app_cubit/app_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit getAppCubit(context) => BlocProvider.of(context);

  bool isDarkMode = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDarkMode = fromShared;
      emit(AppChangeModeState());
    } else {
      isDarkMode = !isDarkMode;
      CacheHelper.saveCashedBoolen(key: 'isDarkMode', value: isDarkMode)
          .then((value) {
            print('isDarkMode $value');
        emit(AppChangeModeState());
      });
    }
  }
}
