import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';

class ChangeLanguageDropdown extends StatelessWidget {
  const ChangeLanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Languages>(
      builder: (context, state) {
        return DropdownButton<Languages?>(
          onChanged: (value) {
            if (value != null) {
              context.read<LanguageCubit>().setLanguage(value, context);
            }
          },
          padding: const EdgeInsets.symmetric(horizontal: 10),
          value: state,
          alignment: Alignment.bottomCenter,
          icon: const SizedBox(),
          underline: const SizedBox(),
          selectedItemBuilder: (context) => [
            Center(
              child: Text(
                Languages.ru.str,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Text(
                Languages.kz.str,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          items: [
            DropdownMenuItem(
              value: Languages.ru,
              child: Text(Languages.ru.str),
            ),
            DropdownMenuItem(
              value: Languages.kz,
              child: Text(Languages.kz.str),
            ),
          ],
        );
      },
    );
  }
}
