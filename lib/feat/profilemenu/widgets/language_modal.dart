import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/services/language_provder/language_cubit.dart';
import 'package:zakazflow/core/util/ui_util.dart';
import 'package:zakazflow/resources/resources.dart';

Future<void> showLanguageSelectModal(BuildContext context) =>
    Util.showCustomModalBottomSheet(
      context: context,
      child: BlocBuilder<LanguageCubit, Languages>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              InkWell(
                onTap: () => context
                    .read<LanguageCubit>()
                    .setLanguage(Languages.ru, context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      Image.asset(Images.ru, height: 10),
                      const SizedBox(width: 10),
                      Text(
                        Languages.ru.str,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                              child: state == Languages.ru
                                  ? const Icon(
                                      CupertinoIcons.checkmark,
                                      color: AppColors.primary,
                                    )
                                  : const SizedBox())),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => context
                    .read<LanguageCubit>()
                    .setLanguage(Languages.kz, context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(Images.kz, height: 10),
                      const SizedBox(width: 10),
                      Text(
                        Languages.kz.str,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                              child: state == Languages.kz
                                  ? const Icon(
                                      CupertinoIcons.checkmark,
                                      color: AppColors.primary,
                                    )
                                  : const SizedBox())),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => context
                    .read<LanguageCubit>()
                    .setLanguage(Languages.en, context),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(1),
                          child: Image.asset(Images.en, height: 10)),
                      const SizedBox(width: 10),
                      Text(
                        Languages.en.str,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black),
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Center(
                              child: state == Languages.en
                                  ? const Icon(
                                      CupertinoIcons.checkmark,
                                      color: AppColors.primary,
                                    )
                                  : const SizedBox())),
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
