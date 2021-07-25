class Course {
  String name;
  String image;
  String level;
  int courseTime;
  bool favourite=false;
  Course(this.courseTime, this.image, this.level, this.name);
}

List<Course> courses = [
  Course(25, 'assets/course1.jpg', 'Beginners', 'doler sit doleam'),
  Course(35, 'assets/course2.jpg', 'advanced', 'amet doler sit doleam'),
  Course(15, 'assets/course3.jpg', 'intermediate', 'amet doler sit doleam sit'),
];
