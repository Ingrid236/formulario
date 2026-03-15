import 'package:flutter_test/flutter_test.dart';
import 'package:formulario/main.dart';
import 'package:provider/provider.dart';
import 'package:formulario/features/academic_registration/data/datasources/academic_remote_data_source.dart';
import 'package:formulario/features/academic_registration/data/repositories/academic_repository_impl.dart';
import 'package:formulario/features/academic_registration/domain/usecases/get_academics.dart';
import 'package:formulario/features/academic_registration/domain/usecases/get_courses.dart';
import 'package:formulario/features/academic_registration/domain/usecases/register_academic.dart';
import 'package:formulario/features/academic_registration/domain/usecases/delete_academic.dart';
import 'package:formulario/features/academic_registration/presentation/controllers/academic_controller.dart';

void main() {
  testWidgets('Check if the app starts correctly', (WidgetTester tester) async {
    final dataSource = InMemoryAcademicDataSource();
    final repository = AcademicRepositoryImpl(dataSource);
    
    final getAcademics = GetAcademics(repository);
    final getCourses = GetCourses(repository);
    final registerAcademic = RegisterAcademic(repository);
    final deleteAcademic = DeleteAcademic(repository);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AcademicController(
              getAcademics: getAcademics,
              getCourses: getCourses,
              registerAcademic: registerAcademic,
              deleteAcademic: deleteAcademic,
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('Sistema de Cadastro Acadêmico'), findsOneWidget);
  });
}
