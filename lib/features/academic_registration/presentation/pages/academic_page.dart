import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/academic_controller.dart';
import '../widgets/academic_form.dart';
import '../widgets/academic_list.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AcademicController>().loadCourses();
      context.read<AcademicController>().loadAcademics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Cadastro Acadêmico'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AcademicForm(),
                SizedBox(height: 16),
                AcademicList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
