
class Conta {
  final int id;
  final String bancoId;
  final String descricao;
  final TipoConta tipoConta;
  final bool ativo;

  Conta(
      {required this.id,
      required this.bancoId,
      required this.descricao,
      required this.tipoConta,
      required this.ativo});
}

enum TipoConta { contaCorrente, contaPoupanca, contaInvestimento }
