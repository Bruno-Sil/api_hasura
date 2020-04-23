
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  HasuraConnect conexao = HasuraConnect('https://aplicativoteste-1.herokuapp.com/v1/graphql');
  
  @override
  void initState() {
    super.initState();

    var snapshot = conexao.subscription(variavelTabela);

    snapshot.listen((data) {
     print(data);
     print('${data["data"] ["tabela_teste"][0]["nome"]}');
     });
  }
  
  String variavelTabela = """
   subscription {
   tabela_teste {
    codigo
    nome
  }
}
  """;
   
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

