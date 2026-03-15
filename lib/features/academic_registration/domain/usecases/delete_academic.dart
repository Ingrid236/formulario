import '../repositories/academic_repository.dart';

class DeleteAcademic {
  final AcademicRepository repository;

  DeleteAcademic(this.repository);

  Future<void> call(String id) async {
    return await repository.deleteAcademic(id);
  }
}
