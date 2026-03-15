import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:formulario/features/academic_registration/presentation/controllers/academic_controller.dart';
import 'package:formulario/features/academic_registration/presentation/pages/academic_page.dart';
import 'package:formulario/features/academic_registration/domain/usecases/get_academics.dart';
import 'package:formulario/features/academic_registration/domain/usecases/get_courses.dart';
import 'package:formulario/features/academic_registration/domain/usecases/register_academic.dart';
import 'package:formulario/features/academic_registration/domain/usecases/delete_academic.dart';
import 'package:formulario/features/academic_registration/data/repositories/academic_repository_impl.dart';
import 'package:formulario/features/academic_registration/data/datasources/academic_remote_data_source.dart';

void main() {
  testWidgets('Academic list rendering performance check', (WidgetTester tester) async {
    final dataSource = InMemoryAcademicDataSource();
    final repository = AcademicRepositoryImpl(dataSource);
    final getAcademics = GetAcademics(repository);
    final getCourses = GetCourses(repository);
    final registerAcademic = RegisterAcademic(repository);
    final deleteAcademic = DeleteAcademic(repository);

    final controller = AcademicController(
      getAcademics: getAcademics,
      getCourses: getCourses,
      registerAcademic: registerAcademic,
      deleteAcademic: deleteAcademic,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<AcademicController>.value(
          value: controller,
          child: const AcademicPage(),
        ),
      ),
    );

    final stopwatch = Stopwatch()..start();
    await controller.loadAcademics();
    stopwatch.stop();

    expect(stopwatch.elapsedMilliseconds, lessThan(500), 
      reason: 'List loading took too long: ${stopwatch.elapsedMilliseconds}ms');
    
    await tester.pump();
    expect(find.text('Acadêmicos Cadastrados'), findsOneWidget);
  });
}
