import '../model/student.dart';
import '../model/course-result.dart';
import '../model/course.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<CourseResult> courseResults = [];
  final List<Course> courses = [];
  int _resultCount = 0;

  // Student sections
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }

    courseResults.removeWhere((result) => result.studentId == studentId);
  }

  // Course sections
  void createCourse({required String courseId, required String courseName}) {
    // ! Course is not already exist
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course $courseId already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);

    if (course == null) {
      throw Exception("Course $courseId not exists");
    }

    // Remove course from the courses list
    courseResults.removeWhere((result) => result.courseId == courseId);
    courses.removeWhere((course) => course.id == courseId);
  }

  // Enroll students sections
  void enrollStudent({required String studentId, required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);

    // check course if exists or not
    if (course == null) {
      throw Exception("Course $courseId not found");
    }
    // check student if exist or not
    if (student == null) {
      throw Exception("Student $studentId not found");
    }
    // check student if already enroll or not
    if (course.studentIds.contains(studentId)) {
      throw Exception("Student $studentId is already enroll in the course");
    }

    course.studentIds.add(studentId);
  }

  // discarded student from course section
  void discardStudentFromCourse({required studentId, required courseId}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);

    if (course == null) {
      throw Exception("Course $courseId not found");
    }

    if (student == null) {
      throw Exception("Student $studentId not found");
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception("Student $studentId not enroll");
    }

    course.studentIds.remove(studentId);
    courseResults.removeWhere((result) =>
        result.studentId == studentId && result.courseId == courseId);
  }

  // Add result to student
  void addCourseResult(
      {required String studentId,
      required String courseId,
      required int score}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    bool alreadyHasResult = courseResults.any((result) =>
        result.studentId == studentId && result.courseId == courseId);

    if (course == null) {
      throw Exception("Course $courseId not found");
    }

    if (student == null) {
      throw Exception("Student $studentId not found");
    }

    if (!course.studentIds.contains(studentId)) {
      throw Exception("Student $studentId not enroll");
    }

    if (score < 0 || score > 100) {
      throw Exception("Invalid score, score can be only between n = [0,100]");
    }

    if (alreadyHasResult) {
      throw Exception("Student $studentId already has result in course");
    }

    courseResults.add(CourseResult(
        studentId: studentId,
        id: "R${_resultCount++}",
        courseId: courseId,
        scores: score));
  }

  void removeCourseResult({required String courseResultId}) {
    CourseResult? courseResult = _findCourseResultOrNull(courseResultId);

    if (courseResult == null) {
      throw Exception("CourseResult $courseResultId not found");
    }

    courseResults.removeWhere((result) => result.id == courseResultId);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null; // not found
  }

  CourseResult? _findCourseResultOrNull(String courseResultsId) {
    for (CourseResult r in courseResults) {
      if (r.id == courseResultsId) {
        return r;
      }
    }
    return null; // not found
  }
}
