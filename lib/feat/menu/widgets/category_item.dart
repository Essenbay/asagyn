import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zakazflow/core/config/colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onClick,
      required this.isSelected});
  final String? imagePath;
  final String title;
  final bool isSelected;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: isSelected ? Border.all(color: AppColors.primary) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
            if (isSelected)
              BoxShadow(
                  color: AppColors.primary.withOpacity(.4), blurRadius: 10)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: imagePath == null
                  ? const SizedBox()
                  : CachedNetworkImage(
                      imageUrl: imagePath ?? '',
                      imageBuilder: (context, imageProvider) => Image(
                        image: imageProvider,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      placeholder: (context, url) =>
                          Container(color: AppColors.white),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.white,
                      ),
                    ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: AppColors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
