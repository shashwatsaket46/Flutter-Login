import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main()=>runApp(new myApp());
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:new LoginPage(),
      theme:new ThemeData(
      ),
    );
  }
}
class LoginPage extends StatefulWidget{
  @override
  State createState()=>new LoginPageState();
}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation= new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.bounceInOut);
    _iconAnimation.addListener(()=>this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: new Stack(
        fit:StackFit.expand,
        children:<Widget>[
          new Image(
            image: new AssetImage("lib/assets/168096161_1318019485264144_8398236423923072666_n.png"),
            fit: BoxFit.fill,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,

          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal, fontSize: 20.0,
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget> [
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        new Padding(padding: const EdgeInsets.only(top:50.0),
                        child: new MaterialButton(
                          color: Colors.teal,
                          child: new Text("Login"),
                          onPressed: ()=>{},
                          splashColor: Colors.blueAccent,
                        )
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
