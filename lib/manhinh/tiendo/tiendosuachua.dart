import 'package:flutter/material.dart';

class TrangThaiTienDoChiTiet extends StatefulWidget {
  const TrangThaiTienDoChiTiet({super.key});

  @override
  State<TrangThaiTienDoChiTiet> createState() => _TrangThaiTienDoChiTietState();
}

class _TrangThaiTienDoChiTietState extends State<TrangThaiTienDoChiTiet> {
  List<bool> checkboxValues = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text(
          'Chi tiết tiến độ sửa chữa',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tiepnhan(),
              _kiemTraDanhGiaTTKT(),
              _tongThaoLap(),
              _thaoCum(),
              _thaoRoi(),
              _lapCum(),
              _dongBo(),
              _tongLap(),
              _thuXe(),
            ],
          ),
        ),
      ),
    );
  }

  Container _thuXe() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '(9) Thử xe: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 130)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[2],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[2] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _tongLap() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '(8) Tổng lắp: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 130)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[2],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[2] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _dongBo() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '(7) Đồng bộ:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cụm lẻ:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 190)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[0],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[0] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Động cơ: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 180)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Gầm: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 210)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Điện: ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 170)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Thân - vỏ: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 180)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Khung - Thùng: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 140)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Cụm lẻ hoàn chỉnh: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 110)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _lapCum() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '(6) Lắp cụm:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lắp cụm:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 190)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[0],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[0] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Kiểm thử: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 180)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Sơn cụm: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 190)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _thaoRoi() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '(5) Tháo rời:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tháo rời tẩy rửa:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 130)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[0],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[0] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Kiểm tra phân loại: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 110)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Sửa chữa phục hồi: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 110)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _thaoCum() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '(4) Tháo cụm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 130)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[2],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[2] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _tongThaoLap() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '(3) Tổng tháo xe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 100)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[2],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[2] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _kiemTraDanhGiaTTKT() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '(2) Kiểm tra đánh giá TTKT',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 0)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[2],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[2] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _tiepnhan() {
    return Container(
      margin: const EdgeInsets.all(5),
      color: const Color.fromARGB(255, 63, 87, 196),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    '(1) Tiếp nhận:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Rửa xe:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 150)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[0],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        checkboxValues[0] = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Lập hồ sơ tình trạng: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 90)),
                Expanded(
                  child: Checkbox(
                    value: checkboxValues[1],
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(
                        () {
                          checkboxValues[1] = value!;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
