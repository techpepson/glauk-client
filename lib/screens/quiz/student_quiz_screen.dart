import 'package:flutter/material.dart';
import 'package:glauk/components/utils/empty_widget.dart';
import 'package:glauk/core/constants/constants.dart';
import 'dart:developer' as dev;

import 'package:glauk/data/course_data.dart';

class StudentQuizScreen extends StatefulWidget {
  const StudentQuizScreen({super.key});

  @override
  State<StudentQuizScreen> createState() => _StudentQuizScreenState();
}

class _StudentQuizScreenState extends State<StudentQuizScreen> {
  int studentLevel = 12;
  int totalXP = 3000;
  int userXP = 2750;
  double averageScore = 85.5;
  String courseDisplayImage = '';

  final List<String> quizStatus = [
    'All',
    'Not Started',
    'Completed',
    'In Progress',
    'Retake Recommended',
  ];

  String selectedChoice = 'All';

  final CourseData courseData = CourseData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLevelBar(),
                  _buildScoreCards(),
                  _buildQuizStatus(),
                  _buildExamCard(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLevelBar() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Constants.primary,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Text('Level ${studentLevel.toString()}'),
              ),
              Text('${userXP.toString()}/${totalXP.toString()}'),
            ],
          ),
          LinearProgressIndicator(value: userXP.toDouble() / totalXP),
        ],
      ),
    );
  }

  Widget _buildScoreCards() {
    return Row(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Constants.chartArrow),
                  Text(
                    '${averageScore.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
              Text('Average Score'),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Constants.targetIcon),
                  Text(
                    '${averageScore.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
              Text('Daily Goal'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExamCard() {
    return courseData.courseSlides.isEmpty
        ? EmptyWidget(
          icon: Constants.bookIcon,
          title: 'No Quizzes Generated Yet',
          subtitle: 'Upload slides to generate quizzes',
        )
        : SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10),
            itemCount: courseData.courseSlides.length,
            itemBuilder: (context, index) {
              final course = courseData.courseSlides[index];
              int completeTime =
                  course['solutionStatus'] == 'completed'
                      ? course['completeTime'] as int ?? 0
                      : 0;

              final quizScore =
                  course['solutionStatus'] == 'completed'
                      ? course['scores'] as double ?? 0
                      : 0;

              String scoreComplement = '';

              String completeTimeText = '';

              switch (quizScore) {
                case 0:
                  scoreComplement = 'Critical Attention Needed';
                  break;
                case >= 50 && < 75:
                  scoreComplement = 'Good Condition';
                  break;
                case >= 75 && < 90:
                  scoreComplement = 'Consistent Learner';
                  break;
                case >= 90 && <= 100:
                  scoreComplement = 'Perfect Score';
                  break;
                default:
                  scoreComplement = 'Keep Learning';
              }
              final studyField = course['courseField'] ?? 'science';
              switch (studyField) {
                case 'science':
                  courseDisplayImage = Constants.scienceImage;
                  break;
                case 'computing':
                  courseDisplayImage = Constants.computingImage;
                  break;
                case 'business':
                  courseDisplayImage = Constants.businessImage;
                  break;
                case 'arts':
                  courseDisplayImage = Constants.artsImage;
                  break;
                case 'english':
                  courseDisplayImage = Constants.englishImage;
                  break;
                case 'humanities':
                  courseDisplayImage = Constants.humanitiesImage;
                  break;
                case 'languages':
                  courseDisplayImage = Constants.languagesImage;
                  break;
                case 'maths':
                  courseDisplayImage = Constants.mathsImage;
                  break;
                case 'others':
                  courseDisplayImage = Constants.othersImage;
                  break;
                case 'statistics':
                  courseDisplayImage = Constants.statisticsImage;
                  break;
                default:
                  courseDisplayImage = Constants.scienceImage;
              }

              switch (completeTime) {
                case 0:
                  completeTimeText = 'Uncompleted';
                  break;
                case >= 1 && < 10:
                  completeTimeText = 'Moderate Finisher';
                  break;
                case >= 10 && < 20:
                  completeTimeText = 'Good Finisher';
                  break;
                case >= 20 && < 30:
                  completeTimeText = 'Excellent Finisher';
                  break;
                default:
                  completeTimeText = 'Not Started';
              }
              return courseData.courseSlides.isEmpty
                  ? EmptyWidget(
                    icon: Constants.bookIcon,
                    title: 'No Quizzes Generated Yet',
                    subtitle: 'Upload slides to generate quizzes',
                  )
                  : Dismissible(
                    key: ValueKey(course['slideId']),
                    confirmDismiss: (direction) async {
                      return await showDialog<bool>(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text('Confirm Dismissal'),
                              content: Text(
                                'Are you sure you want to dismiss this item?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed:
                                      () => Navigator.pop(context, false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  courseDisplayImage,
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              Text(course['slideTitle']),
                            ],
                          ),
                          Text(course['slideUploadTime']),
                          Chip(
                            label: Row(
                              children: [Text('🏆'), Text(scoreComplement)],
                            ),
                          ),
                          Chip(
                            label: Row(
                              children: [Text('⏱️'), Text(completeTimeText)],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(course['questions'].length.toString()),
                                  Text('Questions'),
                                ],
                              ),
                              course['solutionStatus'] == 'completed'
                                  ? Chip(
                                    label: Text(
                                      'Score: ${course['scores'].toString()}%',
                                    ),
                                  )
                                  : Chip(label: Text('Score: X')),
                            ],
                          ),
                          LinearProgressIndicator(
                            value:
                                course['solutionStatus'] == 'completed'
                                    ? course['scores'] / 100
                                    : 0,
                          ),
                          Row(
                            children: [
                              course['solutionStatus'] == 'completed'
                                  ? ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Retake Quiz'),
                                  )
                                  : ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Take Quiz'),
                                  ),
                              course['solutionStatus'] == 'completed'
                                  ? ElevatedButton(
                                    onPressed: () {},
                                    child: Text('View Results'),
                                  )
                                  : ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Review'),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
            },
          ),
        );
  }

  Widget _buildQuizStatus() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: quizStatus.length,
        itemBuilder: (context, index) {
          return ChoiceChip(
            label: Text(quizStatus[index]),
            selected: selectedChoice == quizStatus[index],
            onSelected: (value) {
              setState(() {
                selectedChoice = quizStatus[index];
                dev.log(selectedChoice);
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildSlideDisplayCard() {
    return Container();
  }
}
