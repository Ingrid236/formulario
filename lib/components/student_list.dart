import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/student_provider.dart';
import 'student_item.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  @override
  Widget build(BuildContext context) {
    final students = context.watch<StudentProvider>().students;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 400),
        child: students.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: Text(
                    'Nenhum acadêmico cadastrado.',
                    style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: students.length,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return StudentItem(student: students[index]);
                },
              ),
      ),
    );
  }
}
