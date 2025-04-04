import 'package:flutter/material.dart';
import 'package:activity_tracker/LoginPage/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(30),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register New\nAccount", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          width: 80, // Panjang garis biru
                          height: 4, // Ketebalan garis
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            )
                          ),
                        ),
                        SizedBox(width: 4), // Jarak ke titik kecil
                        Container(
                          width: 10, // Ukuran titik kecil
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2),
                              bottomRight: Radius.circular(2),
                            )
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Text(''))
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Username"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon : Icon(Icons.home, size: 20,)
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("Email"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon : Icon(Icons.mail, size: 20,)
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon: Icon(Icons.lock, size: 20,), 
                  suffixIcon: Icon(Icons.visibility, size: 20,), // Icon Kanan
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password Confirmation"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  prefixIcon: Icon(Icons.lock, size: 20,), 
                  suffixIcon: Icon(Icons.visibility, size: 20,), // Icon Kanan
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("By creating an account, you agree to our"),
                  Text("Terms & Conditions", style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),), 
                ],),
                Expanded(child: Text('')),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50, // Atur tinggi tombol
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => LoginPage())
                        );
                      }, 
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
                        padding: WidgetStateProperty.all(EdgeInsets.all(10)),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Text("Register", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: Text("")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account ?"),
                TextButton(onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => LoginPage())
                  );
                }, child: Text("Login"))
              ],
            ),
          ],
        ),
      )
    );
  }
}