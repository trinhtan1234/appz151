import 'package:flutter/material.dart';

class DanhSachXeTiepNhan extends StatefulWidget {
  const DanhSachXeTiepNhan({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DanhSachXeTiepNhanState createState() => _DanhSachXeTiepNhanState();
}

class _DanhSachXeTiepNhanState extends State<DanhSachXeTiepNhan> {
  int? _selectedRow;

  final List<Map<String, dynamic>> _tbktData = [
    {'name': 'TBKT 1', 'sohieu': '001', 'dinhmuc': '10', 'Tile': '78%'},
    {'name': 'TBKT 2', 'sohieu': '002', 'dinhmuc': '20', 'Tile': '78%'},
    {'name': 'TBKT 3', 'sohieu': '003', 'dinhmuc': '15', 'Tile': '78%'},
    {'name': 'TBKT 4', 'sohieu': '004', 'dinhmuc': '25', 'Tile': '78%'},
    {'name': 'TBKT 5', 'sohieu': '001', 'dinhmuc': '10', 'Tile': '78%'},
    {'name': 'TBKT 6', 'sohieu': '002', 'dinhmuc': '20', 'Tile': '78%'},
    {'name': 'TBKT 7', 'sohieu': '003', 'dinhmuc': '15', 'Tile': '78%'},
    {'name': 'TBKT 8', 'sohieu': '004', 'dinhmuc': '25', 'Tile': '78%'},
    {'name': 'TBKT 9', 'sohieu': '001', 'dinhmuc': '10', 'Tile': '78%'},
    {'name': 'TBKT 10', 'sohieu': '002', 'dinhmuc': '20', 'Tile': '78%'},
    {'name': 'TBKT 11', 'sohieu': '003', 'dinhmuc': '15', 'Tile': '78%'},
    {'name': 'TBKT 12', 'sohieu': '004', 'dinhmuc': '25', 'Tile': '78%'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách xe tiếp nhận',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Tìm kiếm',
                hintText: 'UAZ-452VT, 3303',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              color: Colors.grey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            'Tên TBKT',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            'Số hiệu',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            'Định mức',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            'Tỉ lệ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            'Chi tiết',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                    rows: _tbktData.asMap().entries.map((entry) {
                      final index = entry.key;
                      final tbkt = entry.value;
                      return DataRow(
                        selected: _selectedRow == index,
                        onSelectChanged: (isSelected) {
                          setState(() {
                            _selectedRow = isSelected! ? index : null;
                          });
                        },
                        cells: [
                          DataCell(Text(tbkt['name'])),
                          DataCell(Text(tbkt['sohieu'])),
                          DataCell(Text(tbkt['dinhmuc'])),
                          DataCell(Text(tbkt['Tile'])),
                          DataCell(
                            Radio(
                              value: index,
                              groupValue: _selectedRow,
                              onChanged: (int? value) {
                                setState(() {
                                  _selectedRow = value;
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            if (_selectedRow != null)
              Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Chi tiết của ${_tbktData[_selectedRow!]['name']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
