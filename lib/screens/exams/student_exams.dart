import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glauk/components/utils/app_bar_actions.dart';
import 'package:glauk/core/constants/constants.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:glauk/data/student_data.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StudentExams extends StatefulWidget {
  const StudentExams({super.key});

  @override
  State<StudentExams> createState() => _StudentExamsState();
}

class _StudentExamsState extends State<StudentExams> {
  final String userImage = "";

  final StudentData studentData = StudentData();

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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(height: Constants.verticalPadding),
                    _buildGpaCard(),
                    SizedBox(height: Constants.verticalPadding),
                    _buildCourseTable(),
                    SizedBox(height: Constants.verticalPadding),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGpaCard() {
    final currentGpa = studentData.studentDetails['currentGpa'];
    final targetGpa = studentData.studentDetails['targetGpa'];
    final percentage = (currentGpa / targetGpa);
    String gpaStatus;

    switch (currentGpa) {
      case 4.0:
        gpaStatus = 'Outstanding';
        break;
      case >= 3.5 && < 4.0:
        gpaStatus = 'Excellent';
        break;
      case >= 3.0 && < 3.5:
        gpaStatus = 'Very Good';
        break;
      case >= 2.5 && < 3.0:
        gpaStatus = 'Good';
        break;
      case >= 2.0 && < 2.5:
        gpaStatus = 'Average';
        break;
      default:
        gpaStatus = 'Needs Improvement';
    }
    return GlassContainer(
      blur: 0.3,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            // First row with GPA info
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.verticalPadding,
                horizontal: Constants.horizontalPadding,
              ),
              child: Row(
                children: [
                  // Left side with chart arrow and GPA info
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Constants.primary,
                        ),
                        child: Icon(
                          Constants.chartArrow,
                          size: Constants.largeSize,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current GPA',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Constants.mediumSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: Constants.inter,
                            ),
                          ),
                          Text(
                            gpaStatus.toString(),
                            style: TextStyle(
                              color: Constants.primary,
                              fontSize: Constants.smallSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: Constants.inter,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Spacer to push the trailing content to the right
                  const Spacer(),

                  // Right side with current GPA and target
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        currentGpa.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: Constants.largeSize,
                          fontWeight: FontWeight.w800,
                          fontFamily: Constants.inter,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Constants.targetIcon,
                            size: Constants.iconSize,
                            color: Constants.greyedText,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            'Target: $targetGpa',
                            style: TextStyle(
                              color: Constants.greyedText,
                              fontSize: Constants.smallSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: Constants.inter,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Progress bar section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  // Progress label and percentage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progress to Target',
                        style: TextStyle(
                          color: Constants.greyedText,
                          fontSize: Constants.smallSize,
                          fontWeight: FontWeight.w700,
                          fontFamily: Constants.inter,
                        ),
                      ),
                      Text(
                        '${(percentage * 100).toStringAsFixed(1)}%',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: Constants.smallSize,
                          fontWeight: FontWeight.w800,
                          fontFamily: Constants.inter,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Progress bar
                  CircularStepProgressIndicator(
                    currentStep: (percentage * 100).round(),
                    totalSteps: 100,
                    selectedColor: Constants.primary,
                    unselectedColor: Colors.grey[200]!,
                    stepSize: 8,
                    padding: 0,
                    width: 150,
                    height: 150,
                    selectedStepSize: 8,
                    roundedCap: (_, __) => true,
                    child: Center(
                      child: Text(
                        '$currentGpa/$targetGpa',
                        style: TextStyle(
                          fontFamily: Constants.inter,
                          fontWeight: FontWeight.w700,
                          fontSize: Constants.mediumSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseTable() {
    final List<Map<String, dynamic>> courses = studentData.courseData;
    final courseLength = courses.length;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: DataTable(
          columnSpacing: 16,
          horizontalMargin: 16,
          dividerThickness: 0.0,
          dataRowColor: WidgetStateProperty<Color?>.fromMap({
            WidgetState.selected: Constants.appBg,
          }),
          columns: [
            DataColumn(
              label: Text(
                'Course Code',
                style: TextStyle(
                  fontFamily: Constants.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Grade',
                style: TextStyle(
                  fontFamily: Constants.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Credits',
                style: TextStyle(
                  fontFamily: Constants.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Grade Points',
                style: TextStyle(
                  fontFamily: Constants.inter,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          rows: [
            for (int i = 0; i < courseLength; i++)
              DataRow(
                cells: [
                  DataCell(
                    showEditIcon: true,
                    Text(
                      courses[i]['courseCode'] ?? 'N/A',
                      style: TextStyle(fontFamily: Constants.inter),
                    ),
                  ),
                  DataCell(
                    Text(
                      courses[i]['grade'] ?? 'N/A',
                      style: TextStyle(fontFamily: Constants.inter),
                    ),
                  ),
                  DataCell(
                    Text(
                      courses[i]['credits']?.toString() ?? '0',
                      style: TextStyle(fontFamily: Constants.inter),
                    ),
                  ),
                  DataCell(
                    Text(
                      _calculateWeightedAverage(
                        courses[i]['gradePoints'] as List<dynamic>?,
                        (courses[i]['credits'] as int?) ?? 0,
                      ).toStringAsFixed(2),
                      style: TextStyle(fontFamily: Constants.inter),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  double _calculateWeightedAverage(List<dynamic>? gradePoints, int credits) {
    if (gradePoints == null || gradePoints.isEmpty || credits == 0) return 0.0;

    // Convert dynamic list to List<double>
    final points = gradePoints.map((e) => (e as num).toDouble()).toList();

    // Calculate average of grade points
    final average = points.reduce((a, b) => a + b) / points.length;

    // Return weighted average (average * credits) / credits
    // This maintains the same scale but shows the weighted value if needed
    return average;
  }
}
