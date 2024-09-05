import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/home.dart';
import 'package:flutter_assignment/screens/signup.dart';
import 'package:flutter_assignment/services/query.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late Query query;

  @override
  void initState() {
    query = Query();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Container(
                  width: 350,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SIGN In To Resume!!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 24),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: username,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter username',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'password',
                          ),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            elevation: 1),
                        onPressed: () async {
                          var res =
                              await query.sigin(username.text, password.text);

                          if (res == null) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.red,
                                    width: 300,
                                    content: Center(
                                      child: Text(
                                        "Please Re-Check the UserName and Password",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )));
                          } else {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home(model: res);
                                },
                              ),
                              (route) => false,
                            );
                          }

                          // var _data = Data();
                          // _data.Title = _titleController.text;
                          // _data.Category = _categoryController.text;
                          // _data.Description = _descriptionController.text;
                          // _data.Date = _dateController.text;
                          // _data.Time = _timeController.text;
                          // var result = await query.SaveData(_data);
                          // print(result);
                          // }
                        },
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp(),
                                  ));
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
