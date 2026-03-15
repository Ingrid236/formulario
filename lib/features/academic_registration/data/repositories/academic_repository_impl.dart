import '../../domain/entities/academic.dart';
import '../../domain/entities/course.dart';
import '../../domain/repositories/academic_repository.dart';
import '../datasources/academic_remote_data_source.dart';
import '../models/academic_model.dart';

class AcademicRepositoryImpl implements AcademicRepository {
  final AcademicDataSource dataSource;

  AcademicRepositoryImpl(this.dataSource);

  @override
  Future<bool> existsByCpf(String cpf) async {
    final academics = await dataSource.getAcademics(page: 1, limit: 1000);
    return academics.any((a) => a.cpf == cpf);
  }

  @override
  Future<bool> existsByRegistration(String registrationNumber) async {
    final academics = await dataSource.getAcademics(page: 1, limit: 1000);
    return academics.any((a) => a.registrationNumber == registrationNumber);
  }

  @override
  Future<List<Academic>> getAllAcademics({int page = 1, int limit = 10}) async {
    return await dataSource.getAcademics(page: page, limit: limit);
  }

  @override
  Future<List<Course>> getAvailableCourses() async {
    return await dataSource.getCourses();
  }

  @override
  Future<void> registerAcademic(Academic academic) async {
    await dataSource.saveAcademic(AcademicModel.fromEntity(academic));
  }

  @override
  Future<void> deleteAcademic(String id) async {
    await dataSource.deleteAcademic(id);
  }
}
