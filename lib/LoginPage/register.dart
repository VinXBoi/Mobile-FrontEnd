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
<<<<<<< Updated upstream
                  Text("Terms & Conditions", style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold
                  ),), 
=======
                  TextButton(
                    onPressed: () {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: "Terms & Conditions",
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (context, animation1, animation2) {
                          return Center(
                            child: Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                                  maxWidth: MediaQuery.of(context).size.width * 0.4,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Terms & Conditions',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          'By using this app, you agree to the following terms and conditions.\n'
                                          'Make sure to read carefully. Your data may be collected for analytics purposes.\n'
                                          'You must not misuse this app or engage in illegal activities.\n'
                                          'For full details, visit our official website or contact support.',
                                          style: TextStyle(fontSize: 14, height: 2.5),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Close',
                                          style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        transitionBuilder: (context, animation1, animation2, child) {
                          return ScaleTransition(
                            scale: CurvedAnimation(
                              parent: animation1,
                              curve: Curves.easeOutBack,
                            ),
                            child: FadeTransition(
                              opacity: animation1,
                              child: child,
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // TextButton(onPressed: () {
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return Dialog(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16),
                  //         ),
                  //         child: Container(
                  //           padding: const EdgeInsets.all(20),
                  //           constraints: BoxConstraints(
                  //             maxHeight: MediaQuery.of(context).size.height * 0.4,
                  //             maxWidth: MediaQuery.of(context).size.width * 0.5,
                  //           ),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 'Terms & Conditions',
                  //                 style: TextStyle(
                  //                   fontSize: 20,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               SizedBox(height: 16),
                  //               Expanded(
                  //                 child: SingleChildScrollView(
                  //                   child: Text(
                  //                     'By using this app, you agree to the following terms and conditions.\n'
                  //                     'Make sure to read carefully. Your data may be collected for analytics purposes.\n'
                  //                     'You must not misuse this app or engage in illegal activities.\n'
                  //                     'For full details, visit our official website or contact support.',
                  //                     style: TextStyle(
                  //                       fontSize: 14,
                  //                       height: 2.5,
                  //                     ),
                  //                     textAlign: TextAlign.justify,
                  //                   ),
                  //                 ),
                  //               ),
                  //               SizedBox(height: 5),
                  //               Align(
                  //                 alignment: Alignment.centerRight,
                  //                 child: TextButton(
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                   child: Text(
                  //                     'Close',
                  //                     style: TextStyle(
                  //                       color: Theme.of(context).primaryColor,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },

                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Dialog(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(16),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(1),
                    //         child: Column(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Text(
                    //               'Terms & Conditions',
                    //               style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //             ),
                    //             SizedBox(height: 16),
                    //             SingleChildScrollView(
                    //               child: Text(
                    //                 'By using this app, you agree to the following terms and conditions.\n'
                    //                 'Make sure to read carefully. Your data may be collected for analytics purposes.\n'
                    //                 'You must not misuse this app or engage in illegal activities.\n'
                    //                 'For full details, visit our official website or contact support.',
                    //                 style: TextStyle(fontSize: 14),
                    //               ),
                    //             ),
                    //             SizedBox(height: 20),
                    //             Align(
                    //               alignment: Alignment.bottomRight,
                    //               child: TextButton(
                    //                 onPressed: () {
                    //                   Navigator.of(context).pop();
                    //                 },
                    //                 child: Text(
                    //                   'Close',
                    //                   style: TextStyle(color: Theme.of(context).primaryColor),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     );
                  
                  //   );
                  // },
                  // child: Text("Terms & Conditions", style: TextStyle(
                  //   color: Colors.blue,
                  //   fontWeight: FontWeight.bold
                  // ),),
                  // ),
>>>>>>> Stashed changes
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