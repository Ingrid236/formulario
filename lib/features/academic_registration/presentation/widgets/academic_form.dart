import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/validators.dart';
import '../controllers/academic_controller.dart';
import '../../domain/entities/academic.dart';
import '../../domain/entities/course.dart';

class AcademicForm extends StatefulWidget {
  const AcademicForm({super.key});

  @override
  State<AcademicForm> createState() => _AcademicFormState();
}

class _AcademicFormState extends State<AcademicForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _registrationController = TextEditingController();
  final _periodController = TextEditingController();
  Course? _selectedCourse;

  final _cpfFormatter = MaskTextInputFormatter(mask: '###.###.###-##');
  final _phoneFormatter = MaskTextInputFormatter(mask: '(##) #####-####');

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AcademicController>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro de Acadêmico',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Digite seu nome completo',
                ),
                validator: (v) => Validators.validateRequired(v, fieldName: 'o nome completo'),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Institucional',
                  prefixIcon: Icon(Icons.email),
                  hintText: 'exemplo@dominio.com',
                ),
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _phoneController,
                      inputFormatters: [_phoneFormatter],
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.phone),
                        hintText: '(00) 00000-0000',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _cpfController,
                      inputFormatters: [_cpfFormatter],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'CPF',
                        prefixIcon: Icon(Icons.badge),
                        hintText: '000.000.000-00',
                      ),
                      validator: Validators.validateCPF,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _registrationController,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        labelText: 'Matrícula',
                        prefixIcon: Icon(Icons.numbers),
                        counterText: "",
                        hintText: 'Até 10 dígitos',
                      ),
                      validator: (v) => Validators.validateRequired(v, fieldName: 'a matrícula'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _periodController,
                      keyboardType: TextInputType.number,
                      maxLength: 2,
                      decoration: const InputDecoration(
                        labelText: 'Período',
                        prefixIcon: Icon(Icons.calendar_today),
                        counterText: "",
                        hintText: '1-12',
                      ),
                      validator: Validators.validatePeriod,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<Course>(
                value: _selectedCourse,
                decoration: const InputDecoration(
                  labelText: 'Curso',
                  prefixIcon: Icon(Icons.school),
                  hintText: 'Selecione seu curso',
                ),
                items: controller.courses.map((course) {
                  return DropdownMenuItem(
                    value: course,
                    child: Text(course.name),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedCourse = value),
                validator: (value) => value == null ? 'Por favor, selecione um curso' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: controller.isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
                child: controller.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Cadastrar Acadêmico'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final controller = context.read<AcademicController>();
      final academic = Academic(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fullName: _nameController.text,
        institutionalEmail: _emailController.text,
        phone: _phoneController.text,
        cpf: _cpfController.text,
        registrationNumber: _registrationController.text,
        period: int.tryParse(_periodController.text) ?? 1,
        course: _selectedCourse!,
      );

      final success = await controller.registerNewAcademic(academic);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Acadêmico cadastrado com sucesso!')),
        );
        _formKey.currentState?.reset();
        setState(() => _selectedCourse = null);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(controller.errorMessage ?? 'Ocorreu um erro ao tentar cadastrar o acadêmico')),
        );
      }
    }
  }
}
