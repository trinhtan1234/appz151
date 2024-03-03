import 'package:flutter/material.dart';
import 'package:appz151/network/bloc/bloc.dart';

import '../../network/models/suachua_model.dart';
import 'chitiet.dart';
import 'tiendosuachua.dart';

class QuaTrinhSuaChua extends StatefulWidget {
  const QuaTrinhSuaChua({super.key});

  @override
  State<QuaTrinhSuaChua> createState() => _QuaTrinhSuaChuaState();
}

class _QuaTrinhSuaChuaState extends State<QuaTrinhSuaChua> {
  final TienDoBloc _tienDoBloc = TienDoBloc();

  @override
  void initState() {
    _tienDoBloc.getTienDo();
    super.initState();
  }

  @override
  void dispose() {
    _tienDoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quản lý quá trình sữa chữa',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: _tienDoBloc.tienDoStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tienDo = snapshot.data;
              return _buildList(tienDo?.data?.data);
            } else if (snapshot.hasError) {
              return Text('Lỗi load dữ liệu tiến độ: ${snapshot.error}');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildList(List<Datum>? data) {
    if (data?.isEmpty ?? true) {
      return const Text('Danh sach trong');
    }
    return ListView.separated(
      itemCount: data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        final currentItem = data[index];
        return GestureDetector(
          onTap: () => _navigateToDetail(currentItem),
          child: _createContainerFormItem(currentItem),
        );
      },
    );
  }

  Widget _createContainerFormItem(Datum currentItem) {
    String imageUrl = currentItem.imageUrl ?? '';
    bool hasImage = imageUrl.isNotEmpty;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 233, 231, 231),
      ),
      height: hasImage ? 450 : 0,
      child: Column(
        children: [
          _buildRow(
            leftText: 'TTKT: ${currentItem.tenThietBiKyThuat ?? ''}',
            rightText: 'SỐ HIỆU: ${currentItem.soHieu ?? ''}',
          ),
          _buildImage(imageUrl, hasImage),
          _buildButtonsRow('Xem nội dung kiểm tra', 'Xem nội dung sửa chữa'),
          _buildButtonsRow('Vật tư sử dụng', 'Nội dung kiểm nghiệm'),
          _buildButtonsRow('Thảo luận (2)', 'Sơn hoàn thiện',
              onPressedRight: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    const TrangThaiTienDoChiTiet(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRow({required String leftText, required String rightText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            leftText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            rightText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl, bool hasImage) {
    return hasImage
        ? Visibility(
            visible: true,
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // print('Error loading image: $error');
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildButtonsRow(String leftText, String rightText,
      {VoidCallback? onPressedRight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            leftText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: onPressedRight ?? () {},
            child: Text(
              rightText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToDetail(Datum currentItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChiTietSuaChua(
          tenThietBiKyThuat: currentItem.tenThietBiKyThuat ?? '',
          soHieu: currentItem.soHieu ?? '',
          imageUrl: currentItem.imageUrl ?? '',
        ),
      ),
    );
  }
}
