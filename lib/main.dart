import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}




class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}




class _LoginScreenState extends State<LoginScreen>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhâp'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),


      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                Icons.account_circle,
              size: 100,
              color: Colors.deepPurple,
            ),

      const SizedBox(height: 40),

      TextField(
        controller: _usernameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Tên đăng nhập',
          hintText: 'Nhập tên đăng nhập',
          prefixIcon: Icon(Icons.person),
        ),
      ),



      const SizedBox(height: 20),
      TextField(

        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Mật khẩu',
          hintText: 'Nhập mật khẩu',
          prefixIcon: Icon(Icons.lock),

      )
      ),

      const SizedBox(height: 30),
      SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            String username = _usernameController.text;
            String password = _passwordController.text;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Đang xử lý đăng nhập cho: $username')),
            );


            print('Tên đăng nhập: $username');
            print('Mật khẩu: $password');
          },

          child: const Text (
            'Đăng nhập',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

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
