import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:activity_tracker/LoginPage/register.dart';
import 'package:activity_tracker/HomePage/home.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool obscurePw = true;
  String? userError;
  String? pwError;
  List <Widget> iconEye = [Icon(Icons.visibility), Icon(Icons.visibility_off)];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    List<User> listUser = userProvider.listUser;

    void checkUser() {
      if(_usernameController.text.isEmpty || _pwController.text.isEmpty) {
        if(_usernameController.text.isEmpty) userError = "Username Could Not Empty (User : admin / Register First)";
        if(_pwController.text.isEmpty) pwError = "Password Could Not Empty (Password : admin / Register First)";
        setState(() {
          
        });
        return;
      }

      for(int i = 0; i < listUser.length; i++) {
        if(listUser[i].username == _usernameController.text) {
          userError = null;
          pwError = null;
          if(listUser[i].password != _pwController.text) {
            pwError = "Password Did Not Match";
            setState(() {
              
            });
            return;
          }
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) => HomePage(username: listUser[i].username))
          );
        }
      }
      setState(() {
        userError = "Username Could Not Found (User : admin / Fegister First)";
        pwError = null;
      });
      return;
    }

    return Scaffold(
      body: Padding(padding: EdgeInsets.all(30),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      width: 100, // Panjang garis biru
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
                      width: 12, // Ukuran titik kecil
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
            SizedBox(height: 40),
            SizedBox(
              child: TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  errorText: userError,
                  label: Text("Username"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
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
                controller: _pwController,
                obscureText: obscurePw,
                decoration: InputDecoration(
                  errorText: pwError,
                  label: Text("Password"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.lock, size: 20,), 
                  suffixIcon: IconButton(onPressed:() {
                    setState(() {
                      obscurePw = !obscurePw; 
                    });
                  }, icon: iconEye[obscurePw ? 1 : 0], iconSize: 20,), // Icon Kanan
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (newValue) {
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
                        checkUser();
                      }, 
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                        foregroundColor: WidgetStateProperty.all(Colors.white),
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
                  Navigator.pushReplacement(context, 
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
