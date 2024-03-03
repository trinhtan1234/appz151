import 'package:flutter/material.dart';

class ChiTietSuaChua extends StatefulWidget {
  const ChiTietSuaChua({
    super.key,
    this.tenThietBiKyThuat,
    this.soHieu,
    this.imageUrl,
  });
  final String? tenThietBiKyThuat;
  final String? soHieu;
  final String? imageUrl;

  @override
  State<ChiTietSuaChua> createState() => _ChiTietSuaChuaState();
}

class _ChiTietSuaChuaState extends State<ChiTietSuaChua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tenThietBiKyThuat ?? '',
          style: const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Số hiệu: ${widget.soHieu ?? ''}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Nội dung kiểm tra trước khi vào sửa chữa: '),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Nội dung sửa chữa: '),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Vật tư sử dụng: '),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Nội dung kiểm nghiệm: '),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                width: 400,
                child: ClipRect(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      widget.imageUrl ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/default_image.jpg');
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Trao đổi: '),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
