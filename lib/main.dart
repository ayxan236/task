import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'provider/json_items.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => JsonItems(), child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      home: MyHomePage(title: 'Task'),
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
  List colors = [
    Colors.red[200],
    Colors.blue[200],
    Colors.green[200],
    Colors.purple[200]
  ];
 

  @override
  void initState() {
    super.initState();
    Provider.of<JsonItems>(context,listen: false).fetchJson();
  }
  @override
  Widget build(BuildContext context) {
    final task = Provider.of<JsonItems>(context).items;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.indigo,
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.indigo),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Task',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: task.length,
                itemBuilder: (context, index) {
                  var test = task[index];
                  
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colors[index]),
                        margin: const EdgeInsets.only(left: 6.0),
                        height: 60,
                        width: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[350],
                        ),
                        margin: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 8, left: 6),
                        height: 60,
                        width: 350,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${test.title}',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('${test.createdAt}',style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 6, bottom: 6, left: 6, right: 0),
                                child: FlatButton(
                                  height: 16,
                                  onPressed: () {
                                    setState(() {
                                      test.isSelected = !test.isSelected;
                                    });
                                  },
                                  shape: CircleBorder(
                                      side: BorderSide(
                                          color: Colors.indigo, width: 2)),
                                  child:  test.isSelected
                                      ? Icon(
                                          Icons.check_circle_sharp,
                                          color: Colors.indigo,
                                          size: 16,
                                        )
                                      : null,
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add,
        size: 30,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
      ),
    );
  }
}
