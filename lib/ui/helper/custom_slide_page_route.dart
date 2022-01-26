import 'package:flutter/cupertino.dart';

//? sayfa geçişi olurken arkaplanım solmasını(gölgeli hale gelmesini drawerda açılınça olduğu gibi) araştırdım ama yakın bir şey bulamadım :(
class CustomSlidePageRoute extends PageRouteBuilder {
  CustomSlidePageRoute(
      {required this.child, Duration? duration, required this.direction})
      : super(
          transitionDuration: duration ?? const Duration(milliseconds:300),
          reverseTransitionDuration: duration ?? const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );
  final Widget child;
  final AxisDirection direction;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: getBeginOffSet(),  
        end: Offset.zero).animate(animation),
      child: child,
    );
  }

  Offset getBeginOffSet() {
    switch(direction){
      case AxisDirection.up : return const Offset(0,1);
      case AxisDirection.down : return const Offset(0,-1);
      case AxisDirection.right : return const Offset(-1,0);
      case AxisDirection.left : return const Offset(1,0);
    }
  }
}



//SlideTransition ı araştır