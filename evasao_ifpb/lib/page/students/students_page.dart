import 'package:evasao_ifpb/components/custom_text.dart';
import 'package:evasao_ifpb/model/student_model.dart';
import 'package:evasao_ifpb/page/students/components/custom_header.dart';
import 'package:evasao_ifpb/store/student_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../../store/page_store.dart';

class StudentsPage extends StatelessWidget {
  final StudentStore _studentController = GetIt.I<StudentStore>();
  final PageStore pageStore = GetIt.I<PageStore>();
  late StudentDataSource _studentDataSource;

  StudentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      _studentDataSource = StudentDataSource(students: _studentController.students);
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomHeader(),
          _studentController.loadingStudentPage
              ? const Expanded(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
              : Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: (MediaQuery.of(context).size.width * 0.03)),
              child: Card(
                elevation: 50,
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                    headerColor: Colors.green,
                    headerHoverColor: Colors.green.shade900,
                    gridLineColor: Colors.green,
                    gridLineStrokeWidth: 2,
                  ),
                  child: SfDataGrid(
                    source: _studentDataSource,
                    columnWidthMode: ColumnWidthMode.fill,
                    columns: [
                      GridColumn(
                        columnName: 'id',
                        label: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: 'ID',
                            fontWeight: FontWeight.bold,
                            corText: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'curso',
                        label: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: 'CURSO',
                            fontWeight: FontWeight.bold,
                            corText: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'cre',
                        label: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: 'CRE',
                            fontWeight: FontWeight.bold,
                            corText: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GridColumn(
                        columnName: 'risco',
                        label: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          alignment: Alignment.center,
                          child: const CustomText(
                            text: 'RISCO (%)',
                            fontWeight: FontWeight.bold,
                            corText: Colors.white,
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                    onCellTap: (DataGridCellDetails details) async {
                      if (details.rowColumnIndex.rowIndex != 0) {
                        await _studentController.fetchStudentById(_studentDataSource.dataGridRows[details.rowColumnIndex.rowIndex - 1].getCells()[0].value);
                        if(_studentController.studentModel!=null){
                          pageStore.page = 3;
                        }
                      }
                    },

                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}


class StudentDataSource extends DataGridSource {

  StudentDataSource({required List<StudentModel> students}) {
    dataGridRows = students
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'id', value: dataGridRow.id.toString()),
              DataGridCell<String>(
                  columnName: 'curso', value: dataGridRow.curso),
              DataGridCell<String>(
                  columnName: 'cre', value: dataGridRow.cre.toString()),
              DataGridCell<String>(
                  columnName: 'risco',
                  value: dataGridRow.historic![0].risco == -1
                      ? dataGridRow.historic![1].risco.toString()
                      : dataGridRow.historic![0].risco.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'risco') {
        return Container(
            color: ((dataGridCell.columnName == 'risco') &&
                    (int.parse(dataGridCell.value) > 50))
                ? Colors.red.shade200
                : Colors.green.shade200,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ));
      }
      return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
}
