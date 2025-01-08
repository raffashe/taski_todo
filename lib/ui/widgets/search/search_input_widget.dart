import 'package:flutter/material.dart';
import 'package:taski_todo/core/constants/app_colors.dart';
import 'package:taski_todo/core/constants/app_text_styles.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const SearchInput({
    super.key,
    required this.textController,
    required this.hintText,
    this.onChanged,
  });

  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  void initState() {
    super.initState();
    widget.textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.textController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      controller: widget.textController,
      onChanged: widget.onChanged,
      style: AppTextStyles.subtitlesearch(context).copyWith(
        fontSize: screenWidth * 0.045,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.subtitlesearch(context).copyWith(
          fontSize: screenWidth * 0.045,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.blue,
          size: screenWidth * 0.06,
        ),
        fillColor: AppColors.paleWhite50,
        filled: true,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        suffixIcon: widget.textController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.cancel_sharp,
                  size: screenWidth * 0.04,
                  color: AppColors.stateBlue,
                ),
                onPressed: () {
                  widget.textController.clear();
                  widget.onChanged?.call('');
                  setState(() {});
                },
              )
            : null,
      ),
    );
  }
}
