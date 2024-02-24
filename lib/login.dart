import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                Text(
                  'SHRINE',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Reno Sebastian, 221511062',
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            const SizedBox(height: 120.0),
            // Remove filled: true values (103)
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                // Removed filled: true
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                // Removed filled: true
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            // TODO: Add button bar (101)
            OverflowBar(
              alignment: MainAxisAlignment.end,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                TextButton(
                  child: const Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  child: const Text('NEXT'),
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;

                    if (username.isEmpty || password.isEmpty) {
                      // Tampilkan notifikasi jika username atau password kosong
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Username dan password harus diisi!'),
                          duration: Duration(seconds: 2), // Durasi notifikasi
                        ),
                      );
                    } else if (username.length < 8 || password.length < 8) {
                      // Tampilkan notifikasi jika username atau password kurang dari 8 karakter
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Username dan password harus memiliki minimal 8 karakter!'),
                          duration: Duration(seconds: 2), // Durasi notifikasi
                        ),
                      );
                    } else {
                      // Lanjutkan jika kedua input telah memenuhi persyaratan
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
