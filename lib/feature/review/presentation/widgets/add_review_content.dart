import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/data/models/dto/product_dto.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';

import '../../../../core/data/models/entity/user.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../viewmodel/review_model.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';
import 'package:office_shopping_mall/feature/product/presentation/widgets/product_button.dart';
import '../viewmodel/review_model.dart';
import '../../../mypage/presentation/viewmodel/mypage_viewmodel.dart';
import '../../../../core/data/models/entity/product.dart';

class AddReviewContent extends StatefulWidget {
  const AddReviewContent({super.key});

  @override
  State<AddReviewContent> createState() => _AddReviewContentState();
}

class _AddReviewContentState extends State<AddReviewContent> {
  late ReviewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<ReviewModel>();

    vm.images.clear();
    vm.reviewController.clear();
  }


  Widget _buildImageSlot(int index) {
    bool isFilled = index < vm.images.length && vm.images[index] != null;

    return GestureDetector(
      onTap: () => vm.pickImage(index),
      child: Container(
        width: 74,
        height: 74,
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: isFilled
            ? ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.file(
            File(vm.images[index]!.path),
            fit: BoxFit.cover,
          ),
        )
            : Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  Future<void> _onSubmit() async {
    final product = vm.selectedProduct;

    if (product == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('상품 정보를 불러올 수 없습니다.')),
      );
      return;
    }

    try {
      final reviewDTO = vm.createReview(product: product);
      await vm.addReview(reviewDTO);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰가 등록되었습니다.')),
      );

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('리뷰 등록에 실패했습니다: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = context.watch<ReviewModel>().selectedProduct;

    if (product == null) {
      return Center(child: Text("상품 정보를 불러올 수 없습니다."));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text("별점을 남겨주세요.", style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 8),
          Row(
            children: List.generate(
              5,
                  (index) => Padding(
                padding: EdgeInsets.only(right: 8),
                child: GestureDetector(
                  onTap: () => vm.onScoreSelected(index),
                  child: vm.score[index],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text("후기를 남겨주세요. (최대 50자 이내)", style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 8),
          TextField(
            controller: vm.reviewController,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.gray100,
              hintText: "내용을 입력하세요",
              hintStyle: TextStyle(color: AppColors.gray200),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none,
              ),
            ),
            maxLines: 5,
          ),
          SizedBox(height: 20),
          Text("사진을 업로드 해 주세요. (선택)", style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 8),
          Row(
            children: List.generate(
              vm.visibleCount,
                  (index) => Padding(
                padding: EdgeInsets.only(right: 8),
                child: _buildImageSlot(index),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [

              ProductButton(
                text: "취소",
                backgroundColor: AppColors.gray100,
                textColor: Colors.black,
                onPressed: _onCancel,
                height: 48,
                width: 120,
              ),
              SizedBox(width: 12),
              ProductButton(
                text: "등록",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
                onPressed: _onSubmit,
                height: 48,
                width: 120,
              ),
            ],
          ),
        ],
      ),
    );
  }
}