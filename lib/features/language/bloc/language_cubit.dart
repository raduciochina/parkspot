import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkspot/app_config/app_config.dart';
import 'package:parkspot/features/language/data/sources/local/language_local_data_source.dart';
import 'package:parkspot/features/language/ui/language_sheet.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale(AppConfig.languageDefault));

  void _selectLanguage(String countryCode) {
    emit(Locale(countryCode));
  }

  void getCurrentLanguage() async {
    String currLang = await LanguageLocalDataSource().getCurrentLanguage();
    _selectLanguage(currLang);
  }

  void setCurrentLanguage(String langCode) async {
    await LanguageLocalDataSource().setCurrentLanguage(langCode);
    _selectLanguage(langCode);
  }

  void openLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => const LanguageSheet(),
    );
  }
}
