import 'package:flutter/material.dart';
import 'package:schedule/Home/home_page.dart';
import 'package:schedule/Login_&_Register/login.dart';
import 'package:schedule/widget/button/button.dart';
import 'package:schedule/widget/image/iconappimg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String? selectedValue;
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
                decoration: BoxDecoration(
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
        getimageicon(100, 100),
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Form(
                    child: getform(),
                    key: formkey,
                  ),
                  Container(
                      width: 250,
                      padding: EdgeInsets.only(top: 30),
                      child: getelevatedbutton(
                          onpress: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
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
                          "Sudah punya akun?",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Text(
                            "Login",
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
            validator: (val) => val!.isEmpty ? 'Mohon isi Username anda' : null,
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                hintText: 'Masukkan Username Anda',
                labelText: 'Username'),
          ),
        ),
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
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'Masukkan Masukkan Password',
              labelText: 'Password',
            ),
          ),
        ),
      ],
    );
  }
}
