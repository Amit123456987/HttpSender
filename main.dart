import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var data = "";
  var url = Uri.parse('http://192.168.1.6:8000');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                onChanged: (value){
                    data = value;
                },
                onTap: () => _controller.selection = TextSelection(
                    baseOffset: 0, extentOffset: _controller.value.text.length),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              TextButton( onFocusChange: (True) {
                    _controller.selection;
                  },
                  onPressed: () {
                    var value = data;
                    print("value: "+value);

                    http.post(url, headers: <String, String>{
                      'Content-Type':
                          'application/x-www-form-urlencoded; charset=UTF-8',
                    }, body: {
                      'text': value
                    });
                  },
                  child: Text("Send")),
            ],
          ),
        ));
  }
}
