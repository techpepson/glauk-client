import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glauk/components/utils/app_bar_actions.dart';
import 'package:glauk/core/constants/constants.dart';

class StudentExams extends StatefulWidget {
  const StudentExams({super.key});

  @override
  State<StudentExams> createState() => _StudentExamsState();
}

class _StudentExamsState extends State<StudentExams> {
  final String userImage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        actions: [AppBarActions(userImage: userImage)],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Exams",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: Constants.mediumSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constants.inter,
              ),
            ),
            Text(
              "Academic Performance",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: Constants.smallSize,
                fontWeight: FontWeight.w600,
                fontFamily: Constants.inter,
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: Center(
              child: Text(
                "Academic Performance",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: Constants.mediumSize,
                  fontWeight: FontWeight.w600,
                  fontFamily: Constants.inter,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGpaCard(){
    return Container();
  }
}
