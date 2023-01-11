import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Services/auth.dart';
import 'package:graduation_project/UI/Home/home.dart';
import 'package:graduation_project/UI/Order/order.dart';
import 'package:graduation_project/UI/Profile/UserProfile.dart';
import 'package:graduation_project/UI/TailorsList/tailorsList.dart';
import 'customUI/colors.dart';
class AppDrawer extends StatefulWidget {
  final Widget child;
  final AuthBase auth;

  AppDrawer({key, this.child, @required this.auth}) : super(key: key);

  static _AppDrawerState of(BuildContext context) => context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open () => _controller.forward();

  void toggle () {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed && startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted && startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal *  0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(auth: widget.auth,),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
 const CustomDrawer({Key key, @required this.auth }) : super(key: key);
final AuthBase auth;


  @override
  Future<void> signout() async{
    try{
      await auth.signOut() ;

    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: SecondryColorLight,
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text('Terzi App', style: TextStyle(fontSize: 30, color: PrimaryDarkColor)),
              ),
              ListTile(
                leading: Icon(Icons.home, color: PrimaryDarkColor),
                title: Text('Home' ,style: TextStyle(color: PrimaryDarkColor)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.notifications , color: PrimaryDarkColor),
                title: Text('Notifications',style: TextStyle(color: PrimaryDarkColor)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.track_changes, color: PrimaryDarkColor),
                title: Text('Track booking',style: TextStyle(color: PrimaryDarkColor)),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) => Order()));                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle, color: PrimaryDarkColor),
                title: Text('Profile',style: TextStyle(color: PrimaryDarkColor)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: PrimaryDarkColor),
                title: Text('Get help',style: TextStyle(color: PrimaryDarkColor)),
              ),
              ListTile(
                leading: Icon(Icons.lock, color: PrimaryDarkColor),
                title: Text('Logout',style: TextStyle(color: PrimaryDarkColor)),
               onTap: signout,
               // onTap: _signOut ,
              )
            ],
          ),
        ),
      ),
    );
  }
}