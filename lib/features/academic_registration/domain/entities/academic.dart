import 'course.dart';

class Academic {
  final String id;
  final String fullName;
  final String institutionalEmail;
  final String phone;
  final String cpf;
  final String registrationNumber;
  final int period;
  final Course course;

  const Academic({
    required this.id,
    required this.fullName,
    required this.institutionalEmail,
    required this.phone,
    required this.cpf,
    required this.registrationNumber,
    required this.period,
    required this.course,
  });
}
