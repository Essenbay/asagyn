import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/feat/widgets/primary_filled_text_button.dart';

class MessagedScreen extends StatelessWidget {
  const MessagedScreen(
      {super.key,
      required this.iconPath,
      required this.message,
      required this.buttonText,
      required this.buttonOnTap});
  final String iconPath;
  final String message;
  final String buttonText;
  final VoidCallback buttonOnTap;
  @override
  Widget build(BuildContext context) {
    final space = context.screenSize.height * 0.03;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            right: 40, left: 40, top: context.screenSize.height * .18),
        child: Column(children: [
          SvgPicture.asset(iconPath, height: 80),
          SizedBox(height: space * 1.5),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: space),
          PrimaryFilledTextButton(
            onPressed: buttonOnTap,
            text: buttonText,
            borderRadius: 15,
          )
        ]),
      ),
    );
  }
}
