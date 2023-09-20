import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

class ContasCadastroPage extends StatefulWidget {
  const ContasCadastroPage({super.key});

  @override
  State<ContasCadastroPage> createState() => _ContasCadastroPageState();
}

class _ContasCadastroPageState extends State<ContasCadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final tipoController = TextEditingController();
  final tipoContas = [
    TipoConta.contaCorrente, 
    TipoConta.contaInvestimento,
    TipoConta.contaPoupanca
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Conta'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDescricao(),
                const SizedBox(height: 30),
                _buildTipo(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: descricaoController,
      decoration: const InputDecoration(
        hintText: 'Escreva uma descrição',
        labelText: 'Descrição',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 2,
    );
  }

  DropdownMenu<TipoConta> _buildTipo() {
    List<DropdownMenuEntry<TipoConta>> listaDrop = [];
    for (var element in tipoContas) {
      listaDrop.add(
      DropdownMenuEntry(
          value: element,
          label: element.toString(),
        )
      );
    }
    return DropdownMenu<TipoConta>(
      dropdownMenuEntries: listaDrop,
      // tipoContas.map((e) => DropdownMenuEntry(
      //     value: e,
      //     label: e.toString(),
      //   ),).toList(),
    );
  }
}
