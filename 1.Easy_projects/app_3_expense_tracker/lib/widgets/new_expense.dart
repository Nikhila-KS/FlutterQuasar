import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _EnteredTitle = '';
  // void _saveInput(String inputTitle){
  //   _EnteredTitle = inputTitle;
  // }
  final _titlecontroller = TextEditingController();
  final _amountcontroller = TextEditingController();
  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(

        children:  [

          TextField(
            // onChanged: _saveInput,
            controller: _titlecontroller,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            // onChanged: _saveInput,
            controller: _amountcontroller,
            
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Amount',prefix: Text('\$ ')),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              TextButton(onPressed: (){}, child: const Text('cancel')),
              const SizedBox(width: 10,),
              ElevatedButton(
                onPressed: (() {print("${_titlecontroller.text}---${_amountcontroller.text}");}), 
                child: const Text("save"),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
