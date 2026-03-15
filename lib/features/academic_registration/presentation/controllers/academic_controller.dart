import 'package:flutter/material.dart';
import '../../domain/entities/academic.dart';
import '../../domain/entities/course.dart';
import '../../domain/usecases/get_academics.dart';
import '../../domain/usecases/get_courses.dart';
import '../../domain/usecases/register_academic.dart';

import '../../domain/usecases/delete_academic.dart';

class AcademicController extends ChangeNotifier {
  final GetAcademics getAcademics;
  final GetCourses getCourses;
  final RegisterAcademic registerAcademic;
  final DeleteAcademic deleteAcademic;

  AcademicController({
    required this.getAcademics,
    required this.getCourses,
    required this.registerAcademic,
    required this.deleteAcademic,
  });

  List<Academic> _academics = [];
  List<Academic> get academics => _academics;

  List<Course> _courses = [];
  List<Course> get courses => _courses;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadCourses() async {
    _isLoading = true;
    notifyListeners();
    try {
      _courses = await getCourses();
    } catch (e) {
      _errorMessage = 'Falha ao carregar cursos';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadAcademics({int page = 1, int limit = 10}) async {
    _isLoading = true;
    notifyListeners();
    try {
      _academics = await getAcademics(page: page, limit: limit);
    } catch (e) {
      _errorMessage = 'Falha ao carregar acadêmicos';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> registerNewAcademic(Academic academic) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      await registerAcademic(academic);
      await loadAcademics();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeAcademic(String id) async {
    _isLoading = true;
    notifyListeners();
    try {
      await deleteAcademic(id);
      await loadAcademics();
    } catch (e) {
      _errorMessage = 'Falha ao remover acadêmico';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
