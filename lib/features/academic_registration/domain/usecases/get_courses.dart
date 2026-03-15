import '../entities/course.dart';
import '../repositories/academic_repository.dart';

class GetCourses {
  final AcademicRepository repository;

  GetCourses(this.repository);

  Future<List<Course>> call() async {
    return await repository.getAvailableCourses();
  }
}
