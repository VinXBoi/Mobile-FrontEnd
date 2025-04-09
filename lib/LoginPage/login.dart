import 'package:flutter/material.dart';
import 'package:activity_tracker/LoginPage/register.dart';
import 'package:activity_tracker/HomePage/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  prefixIcon : Icon(Icons.home, size: 20,),
                  // filled: true,
                  // fillColor: Colors.lightBlue[200]
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
                Text("Remember Me"),
                Expanded(child: Text('')),
                TextButton(onPressed: () => {}, child: Text("Forgot Password ?"))
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
                          MaterialPageRoute(builder: (context) => Homepage())
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
                      child: Text("Login"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(children: [
              Expanded(child: Container(
                height: 1,
                color: Colors.grey,
              ),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15), // Beri jarak pada teks
                child: Text("OR"),
              ),
              Expanded(child: Container(
                height: 1,
                color: Colors.grey,
              ),)
            ],),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
              IconButton(onPressed: (){}, icon: SizedBox(
                width: 35,
                height: 35,
                child: Image.network("https://img.icons8.com/?size=100&id=17949&format=png&color=000000"),
              ),),
              IconButton(onPressed: (){}, icon: SizedBox(
                width: 35,
                height: 35,
                child: Image.network("https://img.icons8.com/?size=100&id=17949&format=png&color=000000"),
              ),),
              IconButton(onPressed: (){}, icon: SizedBox(
                width: 35,
                height: 35,
                child: Image.network("https://img.icons8.com/?size=100&id=17949&format=png&color=000000"),
              ),),
              IconButton(onPressed: (){}, icon: SizedBox(
                width: 35,
                height: 35,
                child: Image.network("https://img.icons8.com/?size=100&id=17949&format=png&color=000000"),
              ),),
            ],),
            
            Expanded(child: Text("")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => RegisterPage())
                  );
                }, child: Text("Register"))
              ],
            ),
          ],
        ),
      )
    );
  }
}
