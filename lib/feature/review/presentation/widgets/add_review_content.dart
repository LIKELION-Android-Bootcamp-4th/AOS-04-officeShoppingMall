import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_shopping_mall/core/theme/app_colors.dart';

class AddReviewContent extends StatefulWidget {
  const AddReviewContent({super.key});

  @override
  State<AddReviewContent> createState() => _AddReviewContent();
}

class _AddReviewContent extends State<AddReviewContent> {
  final TextEditingController _reviewController = TextEditingController();
  final List<SvgPicture?> _score = List.generate(5, (index) => SvgPicture.asset(""));
  final List<XFile?> _images = [];
  final ImagePicker _picker = ImagePicker();
  final int visibleCount = 3;

  void _onScoreSelected(int index) {
    setState(() {
      for(int i = 0; i < _score.length; i++) {
        if(i <= index) {
          _score[index] = SvgPicture.asset("");
        }
        else{
          _score[index] = SvgPicture.asset("");
        }
      }
    });
  }

  Future<void> _pickImage(int index) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (index < _images.length) {
        _images[index] = pickedFile;
      } else {
        _images.add(pickedFile);
      }
      setState(() {});
    }
  }

  Widget _buildImageSlot(int index) {
    bool isFilled = index < _images.length && _images[index] != null;

    return GestureDetector(
      onTap: () => _pickImage(index),
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
                  File(_images[index]!.path),
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

  void _onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap: () => _onScoreSelected(index),
                child: _score[index],
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        Text("후기를 남겨주세요. (최대 50자 이내)", style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 8),
        TextField(
          controller: _reviewController,
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

        Text(
          "사진을 업로드 해 주세요. (선택)",
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        SizedBox(height: 8),

        Row(
          children: List.generate(
            visibleCount,
            (index) => Padding(
              padding: EdgeInsets.only(right: 8),
              child: _buildImageSlot(index),
            ),
          ),
        ),

        SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: _onCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gray100,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  minimumSize: Size.fromHeight(48),
                ),
                child: Text("취소"),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: _onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  minimumSize: Size.fromHeight(48),
                ),
                child: Text("등록"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
