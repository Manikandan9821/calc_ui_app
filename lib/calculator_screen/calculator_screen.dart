import 'package:calc_app/widgets/row_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CalCulatorScreen extends StatefulWidget {
  @override
  _CalCulatorScreenState createState() => _CalCulatorScreenState();
}

class _CalCulatorScreenState extends State<CalCulatorScreen> {

  String output = '';

  String _output = '0';

  double num1 =0.0;
  double num2 =0.0;

  String operand = '';

  _calculation(String value){
     if(value=='C'){
       output = '';
       num1 = 0;
       num2 =0;
       operand ='';
     }
     else if (value == "+" || value == "−" || value == "/" || value == "X"){
       num1 = double.parse(output);

       operand = value;

       _output = '0';
     }
    else if(value == '.'){
       if(_output.contains(".")){
         print("Already conatains a decimals");
         return;

       } else {
         _output = _output + value;
       }
     }
    else if(value=='='){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
     }
     else {
       _output = _output + value;
     }
     print(_output);
     setState(() {
       output = double.parse(_output).toStringAsFixed(2);

     });
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                       output!=null ?'$output' : '',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.headline2,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                height: MediaQuery.of(context).size.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: 250.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonsContainer(textValue: 'C',calculation: _calculation,),
                              ButtonsContainer(textValue:'±',calculation: _calculation,),
                              ButtonsContainer(textValue:'/',calculation: _calculation,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonsContainer(textValue:'7',calculation: _calculation,),
                              ButtonsContainer(textValue:'8',calculation: _calculation,),
                              ButtonsContainer(textValue:'9',calculation: _calculation,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonsContainer(textValue:'4',calculation: _calculation,),
                              ButtonsContainer(textValue:'5',calculation: _calculation,),
                              ButtonsContainer(textValue:'6',calculation: _calculation,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonsContainer(textValue:'1',calculation: _calculation,),
                              ButtonsContainer(textValue:'2',calculation: _calculation,),
                              ButtonsContainer(textValue:'3',calculation: _calculation,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ButtonsContainer(textValue:'',calculation: _calculation,),
                              ButtonsContainer(textValue:'0',calculation: _calculation,),
                              ButtonsContainer(textValue:'.',calculation: _calculation,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonsContainer(textValue:'X',calculation: _calculation,),
                          ButtonsContainer(textValue:'−',calculation: _calculation,),
                          ButtonsContainer(textValue:'+',calculation: _calculation,),
                          ButtonsContainer(textValue:'=',calculation: _calculation,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
