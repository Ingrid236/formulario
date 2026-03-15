import '../entities/academic.dart';
import '../entities/course.dart';

abstract class AcademicRepository {
  Future<List<Academic>> getAllAcademics({int page = 1, int limit = 10});
  Future<bool> existsByCpf(String cpf);
  Future<bool> existsByRegistration(String registrationNumber);
  Future<void> registerAcademic(Academic academic);
  Future<void> deleteAcademic(String id);
  Future<List<Course>> getAvailableCourses();
}
