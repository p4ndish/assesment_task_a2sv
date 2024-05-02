
class TodoModel { 
  final String title;
  final String description;
  final bool isCompleted ;

  TodoModel({required this.title, required this.description, required this.isCompleted});
  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel( 
    title: json['title'],
    description: json['title'],
    isCompleted: json['completed']
  );

}