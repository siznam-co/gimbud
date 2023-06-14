import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final bool? isLoading;
  final Widget? child;

  const CustomLoader({
    @required this.isLoading,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return isLoading!
        ? Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  width: width,
                  height: height,
                  child: child,
                ),
              ),
              Positioned(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: width,
                    height: height,
                    color: Colors.black26,
                    child: Center(
                      child: Container(
                        width: width * 0.12,
                        height: width * 0.12,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            child: child,
          );
  }

}
