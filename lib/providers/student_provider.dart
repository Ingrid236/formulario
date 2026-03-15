import 'dart:collection';
import 'package:flutter/material.dart';
import '../models/student_model.dart';

class StudentProvider with ChangeNotifier {
  final List<Student> _students = [];

  UnmodifiableListView<Student> get students => UnmodifiableListView(_students);

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  void removeStudent(Student student) {
    _students.remove(student);
    notifyListeners();
  }
}
