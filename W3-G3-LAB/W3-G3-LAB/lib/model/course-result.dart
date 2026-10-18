class CourseResult {
  final String id;
  final String studentId;
  final String courseId;
  final int scores;

  CourseResult({
    required this.studentId,
    required this.id,
    required this.courseId,
    required this.scores,
  });
}
