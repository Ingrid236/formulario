class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o seu e-mail';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'O formato do e-mail é inválido (ex: nome@dominio.com)';
    }
    return null;
  }

  static String? validateCPF(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o CPF';
    }
    final cleanCPF = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanCPF.length != 11) {
      return 'O CPF deve conter exatamente 11 dígitos numéricos';
    }
    
    // Check for same digits (e.g., 111.111.111-11)
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cleanCPF)) {
      return 'CPF inválido: todos os dígitos são iguais';
    }

    // CPF validation algorithm
    List<int> numbers = cleanCPF.split('').map((s) => int.parse(s)).toList();
    
    // First digit
    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += numbers[i] * (10 - i);
    }
    int firstDigit = (sum * 10) % 11;
    if (firstDigit == 10) firstDigit = 0;
    if (firstDigit != numbers[9]) return 'CPF inválido: primeiro dígito verificador incorreto';

    // Second digit
    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += numbers[i] * (11 - i);
    }
    int secondDigit = (sum * 10) % 11;
    if (secondDigit == 10) secondDigit = 0;
    if (secondDigit != numbers[10]) return 'CPF inválido: segundo dígito verificador incorreto';

    return null;
  }

  static String? validatePeriod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, informe o período atual';
    }
    final period = int.tryParse(value);
    if (period == null) {
      return 'O período deve ser um número válido';
    }
    if (period < 1 || period > 12) {
      return 'O período deve estar entre 1 e 12 (máximo permitido)';
    }
    return null;
  }

  static String? validateRequired(String? value, {String fieldName = 'este campo'}) {
    if (value == null || value.isEmpty) {
      return 'Por favor, preencha $fieldName';
    }
    return null;
  }
}
