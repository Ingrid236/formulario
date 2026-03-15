import '../../../../core/errors/failures.dart';
import '../entities/academic.dart';
import '../repositories/academic_repository.dart';

class RegisterAcademic {
  final AcademicRepository repository;

  RegisterAcademic(this.repository);

  Future<void> call(Academic academic) async {
    // Duplicate validation (T029)
    final cpfExists = await repository.existsByCpf(academic.cpf);
    if (cpfExists) {
      throw const DuplicateException('CPF já cadastrado');
    }

    final regExists = await repository.existsByRegistration(academic.registrationNumber);
    if (regExists) {
      throw const DuplicateException('Matrícula já cadastrada');
    }

    await repository.registerAcademic(academic);
  }
}
