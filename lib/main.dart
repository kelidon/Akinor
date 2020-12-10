import 'package:Akinor/repository/rules_repository.dart';
import 'package:flutter/material.dart';

import 'model/condition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akinor',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Akinor'),
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
  String answer;
  String currentAnswer;
  Condition currentCondition;
  List<Condition> currentContext = [];
  List<Condition> currentAnswerContext = [];

  var finalRules = RulesRepository().getFinalRules();
  var allRules = RulesRepository().getAllRules();

  _processAnswer(bool response) {
    var responseCondition = Condition(
        condition: currentCondition.condition, value: response.toString());
    setState(() {
      currentContext.add(responseCondition);
      if (response.toString() == currentCondition.value) {
        if (currentAnswerContext.last == currentCondition) {
          answer = currentAnswer;
        } else {
          currentCondition = currentAnswerContext[
              currentAnswerContext.indexOf(currentCondition) + 1];
        }
      } else {
        bool correctConditions = false;
        while (!correctConditions) {
          currentAnswer = finalRules.keys
              .toList()[finalRules.keys.toList().indexOf(currentAnswer) + 1];
          currentAnswerContext = [];
          finalRules[currentAnswer].forEach((element) { _getFirstConditions(element, currentAnswerContext);});
          correctConditions = _isCorrectAnswerContext(currentAnswerContext, currentContext);
        }
        currentAnswerContext.removeWhere((element) => currentContext.map((e) => e.props.toString()).contains(element.props.toString()));
        if(currentAnswerContext.isEmpty){
          answer = currentAnswer;
        } else {
          currentCondition = currentAnswerContext.first;
        }
      }
    });
  }

  bool _isCorrectAnswerContext(
      List<Condition> currentAnswerContext, List<Condition> currentContext) {
    for (var c in currentAnswerContext) {
      if (currentContext.map((e) => e.condition).contains(c.condition) &&
          currentContext
                  .firstWhere((element) => element.condition == c.condition)
                  .value !=
              c.value) {
        return false;
      }
    }
    return true;
  }

  _getFirstConditions(Condition c, List<Condition> firstConditions) {
    var ifs = allRules
        .where((element) =>
            element.result.condition == c.condition &&
            element.result.value == c.value)
        .toList();
    if (ifs.isNotEmpty) {
      ifs.first.conditions.forEach(
          (element) => _getFirstConditions(element, firstConditions));
    } else firstConditions.add(c);
  }

  @override
  void initState() {
    super.initState();
    currentAnswer = finalRules.keys.first;
    finalRules[currentAnswer].forEach((element) { _getFirstConditions(element, currentAnswerContext);});
    currentCondition = currentAnswerContext.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withOpacity(0.1),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: answer == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    currentCondition.condition,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 42,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        text: "True",
                        onTap: () => _processAnswer(true),
                      ),
                      ButtonWidget(
                        text: "False",
                        onTap: () => _processAnswer(false),
                      )
                    ],
                  )
                ],
              ),
            )
          : Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      answer,
                    style: TextStyle(fontSize: 20),),
                  SizedBox(height: 42,),
                  ButtonWidget(text: "Again", onTap: (){
                    setState(() {
                      answer = null;
                      currentAnswer = finalRules.keys.first;
                      currentAnswerContext = [];
                      finalRules[currentAnswer].forEach((element) { _getFirstConditions(element, currentAnswerContext);});
                      currentCondition = currentAnswerContext.first;
                      currentContext = [];
                    });
                  },)
                ],
              )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;

  const ButtonWidget({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.lime,
      ),
      margin: EdgeInsets.all(10),
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHover: null,
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(text)),
      ),
    );
  }
}
