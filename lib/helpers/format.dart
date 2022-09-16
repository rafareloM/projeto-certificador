abstract class Format {
  static String formatCnpj(String cnpj) {
    String parsedCnpj = cnpj.toString();
    return '${parsedCnpj.substring(0, 2)}.${parsedCnpj.substring(2, 5)}.${parsedCnpj.substring(5, 8)}/${parsedCnpj.substring(8, 12)}-${parsedCnpj.substring(12)}';
  }

  static String formatCep(String cep) {
    return '${cep.substring(0, 2)}-${cep.substring(2)}';
  }

  static String formatTelefone(String telefone) {
    String parsedTelefone = telefone.toString();
    return '(${parsedTelefone.substring(0, 2)}) ${parsedTelefone.substring(2, 3)} ${parsedTelefone.substring(3, 7)}-${parsedTelefone.substring(7)}';
  }

  static String formatCpf(String cpf) {
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }
}
