import '../../domain/entities/academic.dart';
import '../../domain/entities/course.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.name,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CourseModel.fromEntity(Course entity) {
    return CourseModel(id: entity.id, name: entity.name);
  }
}

class AcademicModel extends Academic {
  const AcademicModel({
    required super.id,
    required super.fullName,
    required super.institutionalEmail,
    required super.phone,
    required super.cpf,
    required super.registrationNumber,
    required super.period,
    required super.course,
  });

  factory AcademicModel.fromJson(Map<String, dynamic> json) {
    return AcademicModel(
      id: json['id'],
      fullName: json['fullName'],
      institutionalEmail: json['institutionalEmail'],
      phone: json['phone'],
      cpf: json['cpf'],
      registrationNumber: json['registrationNumber'],
      period: json['period'],
      course: CourseModel.fromJson(json['course']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'institutionalEmail': institutionalEmail,
      'phone': phone,
      'cpf': cpf,
      'registrationNumber': registrationNumber,
      'period': period,
      'course': (course as CourseModel).toJson(),
    };
  }

  factory AcademicModel.fromEntity(Academic entity) {
    return AcademicModel(
      id: entity.id,
      fullName: entity.fullName,
      institutionalEmail: entity.institutionalEmail,
      phone: entity.phone,
      cpf: entity.cpf,
      registrationNumber: entity.registrationNumber,
      period: entity.period,
      course: CourseModel.fromEntity(entity.course),
    );
  }
}
