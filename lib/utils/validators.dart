class Validators {
  static String? validateNome(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    if (value.length > 150) {
      return 'Nome deve ter no máximo 150 caracteres';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@universidade\.edu\.br$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email deve terminar com @universidade.edu.br';
    }
    return null;
  }

  static String? validateTelefone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }
    final phoneRegex = RegExp(r'^\(\d{2}\) \d{5}-\d{4}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Telefone deve estar no formato (99) 99999-9999';
    }
    return null;
  }

  static String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }
    final cpfRegex = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');
    if (!cpfRegex.hasMatch(value)) {
      return 'CPF deve estar no formato 000.000.000-00';
    }
    return null;
  }

  static String? validateMatricula(String? value) {
    if (value == null || value.isEmpty) {
      return 'Matrícula é obrigatória';
    }
    final matriculaRegex = RegExp(r'^\d{9}$');
    if (!matriculaRegex.hasMatch(value)) {
      return 'Matrícula deve ter exatamente 9 dígitos';
    }
    return null;
  }

  static String? validateCurso(String? value) {
    if (value == null || value.isEmpty) {
      return 'Curso é obrigatório';
    }
    return null;
  }

  static String? validatePeriodo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Período é obrigatório';
    }
    return null;
  }
}
