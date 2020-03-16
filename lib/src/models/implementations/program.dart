import '../exports.dart';

class Program {
  ProgramDefinition definition;

  String name;
  WorkoutCycle current;
  List<WorkoutCycle> history;
  Map<String, double> liftToWorkingWeight;

  Program(ProgramDefinition def, {Map<String, double> startingWorkingWeights}) {
    this.name = def.name;

    liftToWorkingWeight = startingWorkingWeights;
    current = new WorkoutCycle.fromProgramDefinitionAndStartingWeights(
        def, startingWorkingWeights);
  }

  pushNewCycle() {
    // move current to history and use definition
    // to generate a new cycle
    history.add(current);
    var newCycle = new WorkoutCycle.fromLastCycle(definition, current);
    current = newCycle;
  }

}