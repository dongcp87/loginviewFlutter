import 'package:flutter/material.dart';
import 'login_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class HomeVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeVC> {
  bool isSwitched = false;
  bool _isLoading = false;

  LoginService _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(child: homeMainView(context), inAsyncCall: _isLoading);
  }


  void clickLogin() async {
    setState(() {
      _isLoading = true;
    });
    final response = await _loginService.login('username', 'password');
    print(response);
     setState(() {
      _isLoading = false;
    });
  }

  Widget homeMainView(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    imageView('images/logo.png', context),
                    SizedBox(height: 20),
                    tilteText('UserName'),
                    SizedBox(height: 8),
                    textField(),
                    SizedBox(height: 20),
                    checkBox(),
                    SizedBox(height: 10),
                    tilteText('Password'),
                    SizedBox(height: 8),
                    textField(),
                    SizedBox(height: 20),
                    checkBox(),
                    SizedBox(height: 20),
                    autoLoginView(),
                    SizedBox(height: 20),
                    loginButton(),
                    Spacer(),
                    copyrightLabel(),
                    SizedBox(height: 8),
                    bottomView()
                  ],
                ))));
  }

  Widget imageView(String imgName, BuildContext context) {
    return Center(
      child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width - 100,
          child: FittedBox(
            child: Center(
              child: Image.asset(imgName),
            ),
            fit: BoxFit.fitWidth,
          )),
    );
  }

  Widget tilteText(String text) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Widget textField() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white),
      padding: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
      ),
    );
  }

  Widget checkImage() {
    return Container(
      width: 20,
      height: 20,
      child: Image.asset('images/check.png'),
    );
  }

  Widget checkBox() {
    return Row(
      children: <Widget>[
        Spacer(),
        checkImage(),
        SizedBox(
          width: 5,
        ),
        Text(
          'Check',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget autoLoginView() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      height: 140,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Text('Finger print', style: TextStyle(color: Colors.white)),
              Spacer(),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          )),
          Container(
            color: Colors.white54,
            height: 1,
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Text('Auto login', style: TextStyle(color: Colors.white)),
              Spacer(),
              Switch(
                value: false,
                onChanged: null,
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 50,
      child: Row(
        children: <Widget>[
          SizedBox(width: 8),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black54, width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: FlatButton(
                      onPressed: null,
                      child: Text(
                        "Close",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )))),
          SizedBox(width: 8),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.black87, width: 4),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: FlatButton(
                      onPressed: () => clickLogin(),
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))))),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget copyrightLabel() {
    return Container(
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Text(
          "GMO click FX Neo",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ));
  }

  Widget bottomView() {
    return Container(
      color: Colors.black,
      height: 70,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Expanded(
                child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: FlatButton(
                  onPressed: null,
                  child: Text(
                    "Login Demo",
                    style: TextStyle(color: Colors.white),
                  )),
            )),
            SizedBox(
              width: 50,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.blueGrey),
              child: FlatButton(
                  onPressed: null,
                  child: Text(
                    "Login Demo",
                    style: TextStyle(color: Colors.white),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
