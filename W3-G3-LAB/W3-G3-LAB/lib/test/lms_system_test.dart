import 'package:test/test.dart';

import '../service/lms_system.dart';

void main() {
  test('Task 1 - Add and remove courses', () {
    final lms = LmsSystem();
    lms.createCourse(courseId: 'C1', courseName: 'Mobile Development');
    expect(lms.courses.length, 1);
    expect(lms.courses.first.id, 'C1');
    expect(lms.courses.first.name, 'Mobile Development');
    lms.removeCourse(courseId: 'C1');
    expect(lms.courses.length, 0);
  });

  test('Task 1 - Reject duplicate course ID', () {
    final lms = LmsSystem();
    lms.createCourse(courseId: 'C1', courseName: 'Mobile Development');
    expect(() => lms.createCourse(courseId: 'C1', courseName: 'Another'),
        throwsException);
  });

  test('Task 1 - Reject removal of nonexistent course', () {
    final lms = LmsSystem();
    expect(() => lms.removeCourse(courseId: 'C999'), throwsException);
  });

  test('Task 2 - Enroll existing student in existing course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    expect(lms.courses.first.studentIds.contains('S01'), true);
  });

  test('Task 2 - Reject enrollment if student does not exist', () {
    final lms = LmsSystem();
    lms.createCourse(courseId: 'C01', courseName: 'Mobile Development');
    expect(() => lms.enrollStudent(studentId: 'S99', courseId: 'C01'),
        throwsException);
  });

  test('Task 2 - Reject enrollment if course does not exist', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    expect(() => lms.enrollStudent(studentId: 'S01', courseId: 'C99'),
        throwsException);
  });

  test('Task 2 - Reject duplicate enrollment', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    expect(() => lms.enrollStudent(studentId: 'S01', courseId: 'C01'),
        throwsException);
  });

  test('Task 3 - Remove an existing enrollment', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    expect(lms.courses.first.studentIds.contains('S01'), true);
    lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01');
    expect(lms.courses.first.studentIds.contains('S01'), false);
  });

  test('Task 3 - Reject removal of a nonexistent enrollment', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    // S01 is not enrolled in C01
    expect(
        () => lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01'),
        throwsException);
  });

  test('Task 3 - Verify student and course still exist after un-enrolling', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01');
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
    expect(lms.students.first.id, 'S01');
    expect(lms.courses.first.id, 'C01');
  });

  test('Task 3 - Verify the chosen policy for associated results', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 85);
    expect(lms.courseResults.length, 1);
    lms.discardStudentFromCourse(studentId: 'S01', courseId: 'C01');
    expect(lms.courseResults.length, 0);
  });

  test(
      'Task 3 - Test removing a student who has enrollments in multiple courses',
      () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.createCourse(courseId: 'C02', courseName: 'Web');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.enrollStudent(studentId: 'S01', courseId: 'C02');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 80);
    lms.addCourseResult(studentId: 'S01', courseId: 'C02', score: 90);
    lms.removeStudent(studentId: 'S01');
    expect(lms.students.length, 0);
    expect(lms.courses.length, 2);
    expect(lms.courses[0].studentIds.contains('S01'), false);
    expect(lms.courses[1].studentIds.contains('S01'), false);
    expect(lms.courseResults.length, 0);
  });

  test('Task 4 - Add a valid result', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 85);
    expect(lms.courseResults.length, 1);
    expect(lms.courseResults.first.scores, 85);
    expect(lms.courseResults.first.studentId, 'S01');
    expect(lms.courseResults.first.courseId, 'C01');
  });

  test('Task 4 - Reject a result for a nonexistent student or course', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    expect(
        () => lms.addCourseResult(studentId: 'S99', courseId: 'C01', score: 80),
        throwsException);
    expect(
        () => lms.addCourseResult(studentId: 'S01', courseId: 'C99', score: 80),
        throwsException);
  });

  test('Task 4 - Reject a result for a student who is not enrolled', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    // not enrolled
    expect(
        () => lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 80),
        throwsException);
  });

  test('Task 4 - Reject an invalid score', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    expect(
        () => lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: -1),
        throwsException);
    expect(
        () =>
            lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 101),
        throwsException);
  });

  test('Task 4 - Test the chosen policy for duplicate results', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 80);
    expect(
        () => lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 90),
        throwsException);
  });

  test('Task 5 - Remove an existing result', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 85);
    expect(lms.courseResults.length, 1);
    final resultId = lms.courseResults.first.id;
    lms.removeCourseResult(courseResultId: resultId);
    expect(lms.courseResults.length, 0);
  });

  test('Task 5 - Reject removal of a nonexistent result', () {
    final lms = LmsSystem();
    expect(
        () => lms.removeCourseResult(courseResultId: 'R999'), throwsException);
  });

  test('Task 5 - Verify that the result is no longer available', () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 85);
    final resultId = lms.courseResults.first.id;
    lms.removeCourseResult(courseResultId: resultId);
    expect(lms.courseResults.any((r) => r.id == resultId), false);
  });

  test(
      'Task 5 - Verify that the student, course, and unrelated results remain unchanged',
      () {
    final lms = LmsSystem();
    lms.addStudent(studentId: 'S01', studentName: 'Alice');
    lms.addStudent(studentId: 'S02', studentName: 'Bob');
    lms.createCourse(courseId: 'C01', courseName: 'Mobile');
    lms.enrollStudent(studentId: 'S01', courseId: 'C01');
    lms.enrollStudent(studentId: 'S02', courseId: 'C01');
    lms.addCourseResult(studentId: 'S01', courseId: 'C01', score: 85);
    lms.addCourseResult(studentId: 'S02', courseId: 'C01', score: 90);
    final s01ResultId =
        lms.courseResults.firstWhere((r) => r.studentId == 'S01').id;
    lms.removeCourseResult(courseResultId: s01ResultId);
    expect(lms.students.length, 2);
    expect(lms.courses.length, 1);
    expect(lms.courses.first.studentIds.contains('S01'), true);
    expect(lms.courses.first.studentIds.contains('S02'), true);
    expect(lms.courseResults.length, 1);
    expect(lms.courseResults.first.studentId, 'S02');
  });
}
