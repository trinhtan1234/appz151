import 'package:flutter/material.dart';

import 'themmoicongviectheoxe.dart';

class QuanLyCongViec extends StatefulWidget {
  const QuanLyCongViec({super.key});

  @override
  State<QuanLyCongViec> createState() => _QuanLyCongViecState();
}

class _QuanLyCongViecState extends State<QuanLyCongViec> {
  List<bool> checkboxValues = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý công việc',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Tên công việc',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Giờ công',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Trạng thái',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Công việc A')),
                const DataCell(Text('19')),
                DataCell(
                  Checkbox(
                    value: checkboxValues[0],
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[0] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('Janine')),
                const DataCell(Text('43')),
                DataCell(
                  Checkbox(
                    value: checkboxValues[1],
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[1] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('William')),
                const DataCell(Text('27')),
                DataCell(
                  Checkbox(
                    value: checkboxValues[2],
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[2] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
           Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThemMoiCongViec()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
        ),
        child: const Icon(
          Icons.add,
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
