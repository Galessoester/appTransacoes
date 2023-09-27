import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    await Future.delayed(const Duration(seconds: 5));
    final supabase = Supabase.instance;
    final rows = await supabase.client
        .from('contas')
        .select<List<Map<String, dynamic>>>();

    final contas = rows
        .map(
          (row) => Conta(
            id: row['id'],
            bancoId: row['banco'],
            descricao: row['descricao'],
            tipoConta: TipoConta.values[row['tipo_conta']],
            ativo: row['ativo'],
            
          ),
        )
        .toList();

    return contas;

    // return [
    //   Conta(
    //     id: '1',
    //     bancoId: 'bb',
    //     descricao: 'Conta Corrente',
    //     tipoConta: TipoConta.contaCorrente,
    //   ),
    //   Conta(
    //     id: '2',
    //     bancoId: 'nubank',
    //     descricao: 'Conta Digital',
    //     tipoConta: TipoConta.contaCorrente,
    //   ),
    //   Conta(
    //     id: '1',
    //     bancoId: 'caixa',
    //     descricao: 'Conta Pupança',
    //     tipoConta: TipoConta.contaPoupanca,
    //   ),
    //   Conta(
    //     id: '1',
    //     bancoId: 'c6bank',
    //     descricao: 'Conta Investimento',
    //     tipoConta: TipoConta.contaInvestimento,
    //   )
    // ];
  }
}
