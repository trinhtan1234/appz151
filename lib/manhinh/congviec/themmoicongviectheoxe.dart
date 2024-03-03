import 'package:flutter/material.dart';

class ThemMoiCongViec extends StatefulWidget {
  const ThemMoiCongViec({super.key});

  @override
  State<ThemMoiCongViec> createState() => _ThemMoiCongViecState();
}

class _ThemMoiCongViecState extends State<ThemMoiCongViec> {
  TextEditingController thuocDonVi = TextEditingController();
  TextEditingController nguoiGiaoXe = TextEditingController();
  TextEditingController ngayBanGiao = TextEditingController();
  TextEditingController bienSoXe = TextEditingController();
  TextEditingController tbkt = TextEditingController();
  TextEditingController soHieu = TextEditingController();
  TextEditingController soXX = TextEditingController();
  TextEditingController tiLeHuHong = TextEditingController();
  TextEditingController dinhMuc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông tin tiếp nhận xe vào sửa chữa',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: thuocDonVi,
              decoration: const InputDecoration(
                labelText: 'Thuộc đơn vị',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: nguoiGiaoXe,
              decoration: const InputDecoration(
                labelText: 'Người giao xe',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: ngayBanGiao,
              decoration: const InputDecoration(
                labelText: 'Ngày bàn giao',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: bienSoXe,
              decoration: const InputDecoration(
                labelText: 'Biển số xe',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: tbkt,
              decoration: const InputDecoration(
                labelText: 'TBKT',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: soHieu,
              decoration: const InputDecoration(
                labelText: 'Số hiệu',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: soXX,
              decoration: const InputDecoration(
                labelText: 'Số xuất xưởng',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: tiLeHuHong,
              decoration: const InputDecoration(
                labelText: 'Tỉ lệ hư hỏng',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
            TextFormField(
              controller: dinhMuc,
              decoration: const InputDecoration(
                labelText: 'Định mức',
              ),
              // validator: (value) {
              //   if (value == null || !value.contains('')) {
              //     return 'Không được để trống';
              //   }
              //   return null;
              // },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 150,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Row(
            children: [
              Icon(Icons.save, color: Colors.white),
              Text(
                'Thông tin',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
