import 'package:expense_tracker/models/conta.dart';

class ContaRepository {
  List<Conta> listarContas() {
    return [
      Conta(
        id: '1',
        bancoId: 'caixa',
        descricao: 'Conta pessoal',
        tipoConta: TipoConta.contaCorrente,
      ),
      Conta(
        id: '2',
        bancoId: 'c6bank',
        descricao: 'Conta compartilhada mamis',
        tipoConta: TipoConta.contaPoupanca,
      ),
      Conta(
        id: '3',
        bancoId: 'bb',
        descricao: 'Investimento',
        tipoConta: TipoConta.contaInvestimento,
      ),
    ];
  }
}
