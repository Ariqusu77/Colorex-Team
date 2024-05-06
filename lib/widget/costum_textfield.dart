import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCostumTextFieldGeneral extends StatelessWidget {
  const MyCostumTextFieldGeneral({
    super.key,
    required this.textFieldColor,
    required this.textFieldText,
    required this.textController,
    this.textColor,
    this.buttonWidth,
    this.buttonIcon,
    this.shadowColor,
  });
  final Color textFieldColor;
  final String textFieldText;
  final TextEditingController textController;
  final Color? textColor;
  final double? buttonWidth;
  final Icon? buttonIcon;
  final Color? shadowColor;

  final double fontSize = 18;
  final double topPad = 12;
  final double bottomPad = 4;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 14,
          right: 6,
          child: Container(
            width: (buttonWidth != null) ? buttonWidth! : 300,
            decoration: BoxDecoration(
              color: (shadowColor != null) ? shadowColor! : Colors.black,
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(8)),
            ),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 2, left: topPad, right: topPad),
              child: TextField(
                enabled: false,
                controller: textController,
                decoration: InputDecoration(
                  labelText: textFieldText,
                  labelStyle: const TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  border: InputBorder.none,
                ),
                cursorHeight: 20,
              ),
            )),
          ),
        ),
        Container(
          width: (buttonWidth != null) ? buttonWidth! : 300,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: textFieldColor,
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(-0.4, -0.7))
            ],
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 2, left: topPad, right: topPad),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: textFieldText,
                  labelStyle: const TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: textFieldColor)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              cursorHeight: 20,
            ),
          )),
        ),
      ],
    );
  }
}

class MyCostumTextFieldPassword extends StatefulWidget {
  const MyCostumTextFieldPassword({
    super.key,
    required this.textFieldColor,
    required this.textFieldText,
    required this.textController,
    this.textColor,
    this.buttonWidth,
    this.buttonIcon,
    this.shadowColor,
  });
  final Color textFieldColor;
  final String textFieldText;
  final TextEditingController textController;
  final Color? textColor;
  final double? buttonWidth;
  final Icon? buttonIcon;
  final Color? shadowColor;

  @override
  State<MyCostumTextFieldPassword> createState() =>
      _MyCostumTextFieldPasswordState();
}

class _MyCostumTextFieldPasswordState extends State<MyCostumTextFieldPassword>
    with SingleTickerProviderStateMixin {
  bool showPass = true;
  final double fontSize = 18;
  final double topPad = 12;
  final double bottomPad = 4;
  final String vectorOlo = "assets/svg/Olo_Olo.svg";

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() {
    if (showPass) {
      _controller.forward();
      setState(() {
        showPass = false;
      });
    } else {
      _controller.reverse();
      setState(() {
        showPass = true;
      });
    }
    // start the animation
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 14,
          right: 6,
          child: Container(
            width: (widget.buttonWidth != null) ? widget.buttonWidth! : 300,
            decoration: BoxDecoration(
              color: (widget.shadowColor != null)
                  ? widget.shadowColor!
                  : Colors.black,
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(8)),
            ),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(bottom: 2, left: topPad, right: topPad),
              child: TextField(
                enabled: false,
                controller: widget.textController,
                decoration: InputDecoration(
                  labelText: widget.textFieldText,
                  labelStyle: const TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  border: InputBorder.none,
                ),
                cursorHeight: 20,
              ),
            )),
          ),
        ),
        Container(
          width: (widget.buttonWidth != null) ? widget.buttonWidth! : 300,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: widget.textFieldColor,
            borderRadius: const BorderRadiusDirectional.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(-0.4, -0.7))
            ],
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(bottom: 2, left: topPad, right: topPad),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.textController,
                    obscureText: showPass,
                    decoration: InputDecoration(
                        labelText: widget.textFieldText,
                        labelStyle: const TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: widget.textFieldColor)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    cursorHeight: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _animate();
                  },
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001) // perspective
                          ..rotateY(
                              _animation.value * 3.141), // horizontal flip
                        child: SvgPicture.asset(
                          vectorOlo,
                          height: 18,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ],
    );
  }
}
