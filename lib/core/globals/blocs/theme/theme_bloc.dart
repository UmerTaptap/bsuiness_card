import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../managers/sf_manager.dart';
import '../../app_constants.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc() : super(SfManager().getTheme() == AppConstants.THEME_DARK ? ThemeDark() : ThemeLight()){
    on<ThemeChanged>((event, emit) {
      if (event.isDark) {
        emit(ThemeDark());
        SfManager().setTheme(AppConstants.THEME_DARK);
      } else {
        emit(ThemeLight());
        SfManager().setTheme(AppConstants.THEME_LIGHT);
      }
    });
  }


  @override
  void onEvent(ThemeEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<ThemeState> change) {
    super.onChange(change);
    print(change);
  }
}
