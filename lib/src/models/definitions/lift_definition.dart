import '../exports.dart';

class LiftDefinition {
  String name;
  List<WorkoutDayDefinition> workouts;
  List<ProgressionDefinition> progression;
  bool usesWorkingWeight = true;

  LiftDefinition({this.name, this.workouts, this.usesWorkingWeight, this.progression});
}