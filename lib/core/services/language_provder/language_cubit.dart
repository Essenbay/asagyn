import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/services/preference_service.dart';

enum Languages {
  ru('Русский язык', Locale('ru', 'RU'), 'ru'),
  kz('Қазақ тілі', Locale('kk', 'KK'), 'kz');

  final String str;
  final Locale locale;
  final String serverCode;
  const Languages(this.str, this.locale, this.serverCode);
}

@Injectable()
class LanguageCubit extends Cubit<Languages> {
  final PreferencesService _prefs;
  LanguageCubit(this._prefs) : super(Languages.ru) {
    _setInitialLanguage();
  }

  void _setInitialLanguage() {
    final savedServerCode = _prefs.languageCode;
    if (savedServerCode == Languages.kz.serverCode) {
      emit(Languages.kz);
    } else {
      emit(Languages.ru);
    }
  }

  void setLanguage(Languages newLan, BuildContext context) {
    _prefs.setLanguageCode(newLan.serverCode).then((value) => emit(newLan));
    emit(switch (newLan) {
      Languages.ru => Languages.kz,
      Languages.kz => Languages.ru,
    });
  }
}
