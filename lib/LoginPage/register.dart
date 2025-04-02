import 'package:flutter/material.dart';

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
                      "Login To Your\nAccount", 
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: 80, // Panjang garis biru
                          height: 4, // Ketebalan garis
                          color: Colors.blue, // Warna garis
                        ),
                        SizedBox(width: 4), // Jarak ke titik kecil
                        Container(
                          width: 8, // Ukuran titik kecil
                          height: 4,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: Text(''))
              ],
            ),
            SizedBox(
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("UserName / Email")
                ),
              ),
            ),
            SizedBox(
              child: TextField(
                decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.visibility),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
            ),
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
                Text("Remember Me")
              ],
            ),
            TextButton(onPressed: (){}, child: Text("Login")),
            Text("OR"),
            TextButton(onPressed: () {}, child: Text("INI GOOGLE")),
            Expanded(child: Text("")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?"),
                TextButton(onPressed: () => {}, child: Text("Register"))
              ],
            ),
            Expanded(child: Text(""),)
          ],
        ),
      )
    );
  }
}