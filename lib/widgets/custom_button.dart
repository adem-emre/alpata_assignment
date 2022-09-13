import 'package:alpata_assignment/const/app_colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.icon,
      this.onPressed,
      required this.label,
      this.paddingTop,
      this.color,
      this.onFuture})
      : super(key: key);
  final String label;
  final IconData? icon;
  final void Function()? onPressed;
  final double? paddingTop;
  final Color? color;
  final Future Function()? onFuture;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;
  bool isButtonDisable = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
      isButtonDisable = !isButtonDisable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(18, (widget.paddingTop ?? 15), 18, 0),
      child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              primary: widget.color ?? AppColors.buttonColor),
          onPressed: isButtonDisable
              ? null
              : () async {
                  if (widget.onFuture != null) {
                    changeLoading();
                    await widget.onFuture!.call();
                    changeLoading();
                  } else {
                    widget.onPressed?.call();
                  }
                },
          icon: widget.icon != null
              ? Icon(
                  widget.icon,
                  color: Colors.white,
                )
              : const SizedBox(),
          label: isLoading
              ? const SizedBox(
                  height: 3,
                  child: CircularProgressIndicator(
                    color: AppColors.buttonColor,
                  ))
              : Text(
                  widget.label,
                  style: const TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
    );
  }
}