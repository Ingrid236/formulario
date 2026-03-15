import '../models/academic_model.dart';

abstract class AcademicDataSource {
  Future<List<AcademicModel>> getAcademics({int page = 1, int limit = 10});
  Future<void> saveAcademic(AcademicModel academic);
  Future<void> deleteAcademic(String id);
  Future<List<CourseModel>> getCourses();
}

class InMemoryAcademicDataSource implements AcademicDataSource {
  final List<AcademicModel> _academics = [];
  final List<CourseModel> _courses = [
    const CourseModel(id: '1', name: 'Engenharia de Software'),
    const CourseModel(id: '2', name: 'Ciência da Computação'),
    const CourseModel(id: '3', name: 'Sistemas de Informação'),
  ];

  @override
  Future<List<AcademicModel>> getAcademics(
      {int page = 1, int limit = 10}) async {
    final startIndex = (page - 1) * limit;
    if (startIndex >= _academics.length) return [];
    final endIndex = (startIndex + limit).clamp(0, _academics.length);
    return _academics.sublist(startIndex, endIndex).toList();
  }

  @override
  Future<void> saveAcademic(AcademicModel academic) async {
    _academics.add(academic);
  }

  @override
  Future<void> deleteAcademic(String id) async {
    _academics.removeWhere((academic) => academic.id == id);
  }

  @override
  Future<List<CourseModel>> getCourses() async {
    return _courses;
  }
}
