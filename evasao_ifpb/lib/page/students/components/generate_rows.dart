import 'package:flutter/material.dart';

DataRow generateRows(List<String> variables,List<Object> data){

  List<DataCell> rowCells = [];

  for(int i=0; i<variables.length; i++){
    rowCells.add(
      DataCell(
          Text(variables[i],
        style: const TextStyle(fontWeight: FontWeight.bold),)
      )
    );
    rowCells.add(
        DataCell(Text(data[i].toString()))
    );
  }

  return DataRow(
      cells: rowCells
  );

}
