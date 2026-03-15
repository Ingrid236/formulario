import '../entities/academic.dart';
import '../repositories/academic_repository.dart';

class GetAcademics {
  final AcademicRepository repository;

  GetAcademics(this.repository);

  Future<List<Academic>> call({int page = 1, int limit = 10}) async {
    return await repository.getAllAcademics(page: page, limit: limit);
  }
}
