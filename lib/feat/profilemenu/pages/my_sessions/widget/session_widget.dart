import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';
import 'package:zakazflow/core/extensions/context.dart';
import 'package:zakazflow/core/extensions/datetime.dart';
import 'package:zakazflow/core/router/app_router.dart';
import 'package:zakazflow/feat/profilemenu/pages/my_sessions/widget/fading_edges.dart';
import 'package:zakazflow/feat/session/logic/models/session_model.dart';

class SessionWidget extends StatelessWidget {
  const SessionWidget({Key? key, required this.data}) : super(key: key);
  final SessionModel data;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.router.push(MySessionDetailRoute(
            data: data,
          ));
        },
        child: Stack(
          children: [
            if (data.establishmentDTO.backgroundImage != null)
              CustomPaint(
                foregroundPainter: FadingEffect(),
                child: Container(
                  height: 60,
                  width: context.screenSize.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          data.establishmentDTO.backgroundImage ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.transparent
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.establishmentDTO.establishmentName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data.startDateTime?.getDateTimeString(context) ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right,
                      size: 30, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
