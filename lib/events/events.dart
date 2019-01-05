import 'package:ceu_student/models/course.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class CoursesChangedEvent {
  List<Course> courses;
  CoursesChangedEvent(this.courses);
}
