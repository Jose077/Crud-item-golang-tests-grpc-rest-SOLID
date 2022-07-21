import 'package:bs_flutter_buttons/bs_flutter_buttons.dart';
import 'package:bs_flutter_datatable/bs_flutter_datatable.dart';
import 'package:flutter/material.dart';

class ExampleSource extends BsDatatableSource {
  ExampleSource({
    List<Map<String, dynamic>>? data = const [],
  }) : super(data: data);

  Function(dynamic, int) onEditListener = (value, index) {};
  Function(dynamic, int) onDeleteListener = (value, index) {};

  static List<BsDataColumn> get columns => <BsDataColumn>[
        BsDataColumn(
            label: Text('ID'),
            orderable: false,
            columnName: 'id',
            searchable: false,
            width: 100.0),
        BsDataColumn(
            label: Text('Descrição'),
            orderable: false,
            columnName: 'descricao',
            width: 200.0),
        BsDataColumn(
            label: Text('Número de Série'),
            orderable: false,
            searchable: false,
            columnName: 'sn'),
        BsDataColumn(
            label: Text('MAC'),
            orderable: false,
            searchable: false,
            columnName: 'mac'),
        BsDataColumn(
            label: Text('IMEI'),
            orderable: false,
            searchable: false,
            columnName: 'imei'),
        BsDataColumn(
            label: Text('Acões'),
            orderable: false,
            searchable: false,
            width: 200.0),
      ];

  @override
  BsDataRow getRow(int index) {
    return BsDataRow(index: index, cells: <BsDataCell>[
      BsDataCell(Text('${controller.start + index + 1}')),
      BsDataCell(Text('${response.data[index]['descricao']}')),
      BsDataCell(Text('${response.data[index]['sn']}')),
      BsDataCell(Text('${response.data[index]['mac']}')),
      BsDataCell(Text('${response.data[index]['imei']}')),
      BsDataCell(Row(
        children: [
          BsButton(
            margin: EdgeInsets.only(right: 5.0),
            onPressed: () =>
                onEditListener(response.data[index]['typecd'], index),
            prefixIcon: Icons.edit,
            size: BsButtonSize.btnIconSm,
            style: BsButtonStyle.primary,
          ),
          BsButton(
            onPressed: () =>
                onDeleteListener(response.data[index]['typecd'], index),
            prefixIcon: Icons.delete,
            size: BsButtonSize.btnIconSm,
            style: BsButtonStyle.danger,
          )
        ],
      ))
    ]);
  }
}


//  ID        uuid.UUID `json:"id"`
// 	Descricao string    `json:"descricao"`
// 	Sn        string    `json:"sn"`
// 	Mac       string    `json:"mac"`
// 	Imei      string    `json:"imei"`