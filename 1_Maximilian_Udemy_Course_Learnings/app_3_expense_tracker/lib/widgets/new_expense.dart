import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_3_expense_tracker/models/expense.dart';

final formatter= DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key,required this.addExpense});
  final void Function(Expense e) addExpense;

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
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  
  void _presentDatePicker() async{
    final now= DateTime.now();

    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
       firstDate: DateTime(now.year-2,now.month,1),
        lastDate: DateTime(now.year+2,now.month,now.day)
        );
        // .then((value) => (){}); // one way if using the future value
        setState(() {
          _selectedDate = pickedDate;
        });
  }

  void _submitExpenseData(){  // this function is called when the user clicks on the button submit

    final enteredAmound = double.tryParse(_amountcontroller.text); // to convert the string to double
    final isAmoundInValid = enteredAmound==null || enteredAmound <=0;
    final enteredTitle = _titlecontroller.text;
    if(_titlecontroller.text.trim().isEmpty || isAmoundInValid || _selectedDate==null){
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please check your input'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(ctx).pop();
              }, 
              child: const Text('Okay')
              )
          ],
        ),
        );
        return;
    }
    widget.addExpense(
      Expense(
      amount :enteredAmound,
      title: enteredTitle,
      date: _selectedDate!,
      category: _selectedCategory,
      )
    );
    Navigator.of(context).pop();
    
  }

  @override
  void dispose() {
    _titlecontroller.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboradspacing = MediaQuery.of(context).viewInsets.bottom; // to get the height of the keyboard
    return LayoutBuilder(builder: (ctx,constraints){ // to get the height of the screen
      return SizedBox(
      height :double.infinity,
      child: SingleChildScrollView(
        
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboradspacing+16),  // to make the bottom modal appear above the keyboard
          child: Column(
            children: [
              TextField(
                // onChanged: _saveInput,
                controller: _titlecontroller,
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      // onChanged: _saveInput,
                      controller: _amountcontroller,
                      keyboardType: TextInputType.number,
                      decoration:
                      const InputDecoration(labelText: 'Amount', prefix: Text('\$ ')),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(_selectedDate==null?'No Date': formatter.format(_selectedDate!)),
                          IconButton(
                            onPressed: _presentDatePicker, 
                            icon: const Icon(Icons.calendar_month_rounded)
                            ), 
                        ],
                      ),
                    )
                ],
              ),
              
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values.map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child:Text(category.name.toUpperCase()),
                        ),
                      ).toList(), 
                    
                    onChanged: (value){
                      if(value==null){
                        return;
                      } 
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel')),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      _submitExpenseData();
                      // print(
                      //     "${_titlecontroller.text}--->${_amountcontroller.text}--->${_selectedDate.toString()}--->");
                    }),
                    child: const Text("save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
    );
  }
}
