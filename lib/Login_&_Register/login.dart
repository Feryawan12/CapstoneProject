import 'package:flutter/material.dart';
import 'package:schedule/Home/home_page.dart';
import 'package:schedule/Login_&_Register/register.dart';
import 'package:schedule/widget/button/button.dart';
import 'package:schedule/widget/image/iconappimg.dart';
import 'package:schedule/Calender/event_calendar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showpw = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              getcontentform()
            ],
          ),
        ],
      ),
    );
  }

  Widget getcontentform() {
    return Column(
      children: [
        getimageicon(150, 150),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Form(
                    child: getform(),
                    key: formkey,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ))),
                  Container(
                      width: 250,
                      padding: EdgeInsets.only(top: 30),
                      child: getelevatedbutton(
                          onpress: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EventCalendarScreen()),
                                  (route) => false);
                            }
                          },
                          textchild: "Login")),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "belum punya akun?",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getform() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Mohon isi Email anda' : null,
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                hintText: 'Masukkan Email Anda',
                labelText: 'Email'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Mohon password!' : null,
            obscureText: !showpw,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Masukkan Masukkan Password',
              labelText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showpw = !showpw;
                  });
                },
                child: Icon(showpw ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
