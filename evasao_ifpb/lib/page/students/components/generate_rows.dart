import 'package:evasao_ifpb/model/profile_student_model.dart';
import 'package:flutter/material.dart';

DataRow generateRows(List<String> variables,List<Object> data){

  // ignore: deprecated_member_use
  List<DataCell> rowCells = [];

  for(int i=0; i<variables.length; i++){
    rowCells.add(
      DataCell(
          Text(variables[i],
        style: TextStyle(fontWeight: FontWeight.bold),)
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
