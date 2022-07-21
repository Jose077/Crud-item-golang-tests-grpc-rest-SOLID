import 'dart:convert';

import 'package:bs_flutter_card/bs_flutter_card.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'source.dart';

class Datatables extends StatefulWidget {
  @override
  _DatatablesState createState() => _DatatablesState();
}

class _DatatablesState extends State<Datatables> {
  ExampleSource _source1 = ExampleSource(data: []);

  @override
  void initState() {
    _source1.controller = BsDatatableController();
    super.initState();
  }

  Future loadApi(Map<String, dynamic> params) {
    return http
        .post(
      Uri.parse('http://localhost/flutter_crud/api/public/types/datatables'),
      body: params,
    )
        .then((value) {
      Map<String, dynamic> json = jsonDecode(value.body);
      setState(() {
        _source1.response = BsDatatableResponse.createFromJson(json['data']);
        _source1.onEditListener = (typeid, index) {
          _source1.controller.reload();
        };
        _source1.onEditListener = (typeid, index) {
          final data = _source1.get(index);
          data['typenm'] = 'Edited';

          _source1.put(index, data);
        };
        _source1.onDeleteListener = (typeid, index) {
          _source1.removeAt(index);
        };
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: BsCard(
                children: [
                  BsCardContainer(title: Text('Lista de Itens'), actions: [
                    TextButton(
                      onPressed: () {
                        _source1.add({
                          'id': 'Type ${_source1.response.data.length}',
                          'descricao': 'Celular',
                          'sn': '000222',
                          'mac': '000222',
                          'imei': '000222',
                        });
                      },
                      child: Text('Cadastrar'),
                    )
                  ]),
                  BsCardContainer(
                    child: BsDatatable(
                      source: _source1,

                      columns: ExampleSource.columns,
                      language: const BsDatatableLanguage(
                        nextPagination: 'Próxima',
                        previousPagination: 'Anterior',
                        information: '',
                        informationFiltered: 'Dados filtrados',
                        firstPagination: 'Primeira Página',
                        lastPagination: 'Última Página',
                        hintTextSearch: 'Buscar dado',
                        perPageLabel: null,
                        searchLabel: null,
                      ),
                      // serverSide: loadApi,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
