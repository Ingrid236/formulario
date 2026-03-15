import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_form_field.dart';
import '../components/app_button.dart';
import '../components/student_list.dart';
import '../models/student_model.dart';
import '../providers/student_provider.dart';
import '../utils/validators.dart';
import '../utils/formatters.dart';

class RegisterStudentPage extends StatefulWidget {
  const RegisterStudentPage({super.key});

  @override
  State<RegisterStudentPage> createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _matriculaController = TextEditingController();
  final _cursoController = TextEditingController();
  final _periodoController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _cpfController.dispose();
    _matriculaController.dispose();
    _cursoController.dispose();
    _periodoController.dispose();
    super.dispose();
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _nomeController.clear();
    _emailController.clear();
    _telefoneController.clear();
    _cpfController.clear();
    _matriculaController.clear();
    _cursoController.clear();
    _periodoController.clear();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final student = Student(
        nome: _nomeController.text.trim(),
        email: _emailController.text.trim(),
        telefone: _telefoneController.text,
        cpf: _cpfController.text,
        matricula: _matriculaController.text.trim(),
        curso: _cursoController.text.trim(),
        periodo: _periodoController.text.trim(),
      );

      context.read<StudentProvider>().addStudent(student);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Acadêmico cadastrado com sucesso'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );

      _clearForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Acadêmicos'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Novo Cadastro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppFormField(
                    label: 'Nome completo',
                    controller: _nomeController,
                    validator: Validators.validateNome,
                    maxLength: 150,
                  ),
                  AppFormField(
                    label: 'Email institucional',
                    controller: _emailController,
                    validator: Validators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppFormField(
                          label: 'Telefone',
                          controller: _telefoneController,
                          validator: Validators.validateTelefone,
                          inputFormatters: [AppFormatters.telefoneMask],
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: AppFormField(
                          label: 'CPF',
                          controller: _cpfController,
                          validator: Validators.validateCPF,
                          inputFormatters: [AppFormatters.cpfMask],
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppFormField(
                          label: 'Matrícula',
                          controller: _matriculaController,
                          validator: Validators.validateMatricula,
                          keyboardType: TextInputType.number,
                          maxLength: 9,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: AppFormField(
                          label: 'Período',
                          controller: _periodoController,
                          validator: Validators.validatePeriodo,
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),
                  AppFormField(
                    label: 'Curso',
                    controller: _cursoController,
                    validator: Validators.validateCurso,
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    label: 'CADASTRAR ACADÊMICO',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Divider(),
            ),
            const Text(
              'Acadêmicos Cadastrados',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const StudentList(),
          ],
        ),
      ),
    );
  }
}
