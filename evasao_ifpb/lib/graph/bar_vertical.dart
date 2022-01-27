import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class BarVertical extends StatelessWidget {
  List<Series<dynamic, String>> seriesList;

  BarVertical(this.seriesList);

  factory BarVertical.create(List<int> valores,List<String> variaveis) {

    return BarVertical(
      _createSampleData(valores,variaveis),
    );
  }


  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData(List<int> valores,List<String> variaveis) {
    List<OrdinalSales> data = [];
    int total = 0;

    for(int i=0;i<variaveis.length;i++){
      try{
        total+=valores[i];
      }catch(e){
        total+=10;
      }
    }

    int porcentagem(int num){
      return (100*num)~/total;
    }

    for(int i=0;i<variaveis.length;i++){
      try{
        data.add(OrdinalSales(variaveis[i], porcentagem(valores[i])));
      }catch(e){
        data.add(OrdinalSales((i+1).toString(), i));
      }
    }

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (OrdinalSales sales, _) =>
        '${sales.sales.toString()}',
      )
    ];

  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
