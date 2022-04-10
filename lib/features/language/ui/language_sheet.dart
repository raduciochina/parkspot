import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkspot/app_config/app_config.dart';
import 'package:parkspot/features/language/bloc/language_cubit.dart';
import 'package:parkspot/generated/l10n.dart';

class LanguageSheet extends StatefulWidget {
  const LanguageSheet({Key? key}) : super(key: key);

  @override
  _LanguageSheetState createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late LanguageCubit _languageCubit;

  String? selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(S.of(context).changeLanguage),
        ),
        body: BlocBuilder<LanguageCubit, Locale>(
          builder: (context, currentLocale) {
            selectedLocale ??= currentLocale.languageCode;
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
              physics: const BouncingScrollPhysics(),
              itemCount: AppConfig.languagesSupported.length,
              itemBuilder: (context, index) {
                var langCode =
                    AppConfig.languagesSupported.keys.elementAt(index);
                return RadioListTile(
                  title: Text(AppConfig.languagesSupported[langCode]!),
                  value: langCode,
                  groupValue: selectedLocale,
                  onChanged: (langCode) async {
                    setState(() {
                      selectedLocale = langCode as String;
                    });
                  },
                  activeColor: theme.primaryColor,
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          child: const Icon(Icons.check, size: 24),
          onPressed: () async {
            _languageCubit.setCurrentLanguage(selectedLocale!);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
