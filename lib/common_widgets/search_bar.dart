import 'package:filmio/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatefulWidget {
  final String? hintText;
  final void Function()? onSearch;
  final TextEditingController? controller;
  const CustomSearchBar(
      {super.key, this.hintText, this.onSearch, this.controller});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final String _searchAssetSrc = "assets/icons/search.svg";

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: ThemeColors.primary.shade400,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: Colors.transparent,
            hintStyle: const TextStyle(
              color: ThemeColors.white,
              fontSize: 16,
            ),
            hintText: widget.hintText,
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 24,
              maxHeight: 24,
            ),
            prefix: const SizedBox(width: 8),
            prefixIcon: GestureDetector(
              onTap: widget.onSearch,
              child: SvgPicture.asset(
                _searchAssetSrc,
                colorFilter:
                    const ColorFilter.mode(ThemeColors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
