import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';

class CategoriaRepository {
  Future<List<Categoria>> listarCategorias(
      {TipoTransacao? tipoTransacao}) async {
    await Future.delayed(const Duration(seconds: 5));
    final supabase = Supabase.instance;
    final rows = await supabase.client
        .from('categorias')
        .select<List<Map<String, dynamic>>>();

    final categorias = rows
        .map(
          (row) => Categoria(
            id: row['id'],
            descricao: row['descricao'],
            cor: Color(row['cor']),
            icone: IoniconsData(row['icone']),
            tipoTransacao: TipoTransacao.values[row['tipo_transacao']],
            ativo: row['ativo'],
          ),
        )
        .toList();
    return categorias;
    //    var response = await http.get('https://api-flutter-ecommerce.herokuapp.com/categorias');
    //    if (response!= null) {
    //      List categoriasJson = jsonDecode(response.body);
    //        return categoriasJson
    //    } else {}
    //    print("listarCategorias");
    //    var query = QueryBuilder()..select().from('categorias').eq('id', id).single();
    //    String sql ='select * from categorias where id=$id';
    //    var result = await supabaseClient.query(sql, headers: {'apikey': '<KEY>'});
    //    var result = await supabase.client
    //      var result = await supabaseClient.rpc('listar_categorias', params: {"tipo": "receita"});
    //      var result = await supabaseClient.table('categorias')!.select('*').execute();
    //      var result = await supabaseClient.rpc('listar_categorias', params: {"tipo": "despesa"});
    //      var result = await supabaseClient.rpc('listar_categorias', params: {});
    //      var result = await supabaseClient.rpc('listar_categorias', params: {},headers:{'apikey':'<KEY>
    //      var result = await supabaseClient.rpc('listar_categorias',params:{"tipo":"receita"},headers:{}
    //      var result = await supabase.client.rpc('listar_categorias', params: {"tipo" : "receita
  }
}
