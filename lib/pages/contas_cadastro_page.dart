import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ContasCadastroPage extends StatefulWidget {
  const ContasCadastroPage({super.key});

  @override
  State<ContasCadastroPage> createState() => _ContasCadastroPageState();
}

class _ContasCadastroPageState extends State<ContasCadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final tipoController = TextEditingController();

  TipoConta tipoContaSelecionada = TipoConta.contaCorrente;
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
                //_buildButton(),
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Descrição';
        }
        if (value.length < 5 || value.length > 30) {
          return 'A Descrição deve entre 5 e 30 caracteres';
        }
        return null;
      },
    );
  }

  // TextFormField _buildDescricao() {
  //   return TextFormField(
  //     controller: descricaoController,
  //     decoration: const InputDecoration(
  //       hintText: 'Informe a descrição',
  //       labelText: 'Descrição',
  //       prefixIcon: Icon(Ionicons.text_outline),
  //       border: OutlineInputBorder(),
  //     ),
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return 'Informe uma Descrição';
  //       }
  //       if (value.length < 5 || value.length > 30) {
  //         return 'A Descrição deve entre 5 e 30 caracteres';
  //       }
  //       return null;
  //     },
  //   );
  // }

  DropdownMenu<TipoConta> _buildTipo() {
    return DropdownMenu<TipoConta>(
      initialSelection: tipoContaSelecionada,
      width: MediaQuery.of(context).size.width - 16,
      label: const Text('Tipo de Conta'),
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: TipoConta.contaCorrente,
          label: "Conta Corrente",
        ),
        DropdownMenuEntry(
          value: TipoConta.contaInvestimento,
          label: "Conta Investimento",
        ),
        DropdownMenuEntry(
          value: TipoConta.contaPoupanca,
          label: "Conta Poupança",
        ),
      ],
    );
  }


}
