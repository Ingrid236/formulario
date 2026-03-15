import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'features/academic_registration/data/datasources/academic_remote_data_source.dart';
import 'features/academic_registration/data/repositories/academic_repository_impl.dart';
import 'features/academic_registration/domain/usecases/get_academics.dart';
import 'features/academic_registration/domain/usecases/get_courses.dart';
import 'features/academic_registration/domain/usecases/register_academic.dart';
import 'features/academic_registration/domain/usecases/delete_academic.dart';
import 'features/academic_registration/presentation/controllers/academic_controller.dart';
import 'features/academic_registration/presentation/pages/academic_page.dart';

void main() {
  // Simple Dependency Injection setup
  final dataSource = InMemoryAcademicDataSource();
  final repository = AcademicRepositoryImpl(dataSource);

  final getAcademics = GetAcademics(repository);
  final getCourses = GetCourses(repository);
  final registerAcademic = RegisterAcademic(repository);
  final deleteAcademic = DeleteAcademic(repository);

  runApp(
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
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro Acadêmico',
      theme: AppTheme.lightTheme,
      home: const AcademicPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
