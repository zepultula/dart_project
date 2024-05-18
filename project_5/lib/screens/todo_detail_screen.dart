import 'package:flutter/material.dart';
import 'package:project_5/models/todo_model.dart';
import 'package:project_5/services/api_service.dart';

class TodoDetailScreen extends StatefulWidget {
  final TodoModel? todo;

  TodoDetailScreen({this.todo});

  @override
  _TodoDetailScreenState createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  final ApiService _apiService = ApiService();
  final _titleController = TextEditingController();
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
      _completed = widget.todo!.completed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.todo == null ? 'New Todo' : 'Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            CheckboxListTile(
              title: Text('Completed'),
              value: _completed,
              onChanged: (value) {
                setState(() {
                  _completed = value ?? false;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final todo = TodoModel(
                  id: widget.todo?.id ?? 0,
                  title: _titleController.text,
                  completed: _completed,
                );
                if (widget.todo == null) {
                  await _apiService.createTodo(todo);
                } else {
                  await _apiService.updateTodo(todo);
                }
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
            SizedBox(height: 8),
            if (widget.todo != null)
              ElevatedButton(
                onPressed: () async {
                  await _apiService.deleteTodo(widget.todo!.id);
                  Navigator.pop(context);
                },
                child: Text('Delete'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}