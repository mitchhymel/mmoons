import '../exports.dart';

class WorkoutCycle {

  Map<int, List<Workout>> days;

  // map of lift to training max
  WorkoutCycle.fromProgramDefinitionAndStartingWeights(
      ProgramDefinition definition,
      Map<String, double> startingWorkingWeights) {
    for (LiftDefinition liftDef in definition.lifts) {
      for (WorkoutDayDefinition workoutDayDef in liftDef.workouts) {
        if (!days.containsKey(workoutDayDef.dayOfCycle)) {
          days[workoutDayDef.dayOfCycle] = [];
        }

        if (!startingWorkingWeights.containsKey(liftDef.name)) {
          throw Exception('Trying to create program without working weight set for lift ${liftDef.name}');
        }

        double workingWeight = startingWorkingWeights[liftDef.name];

        // if working weight is less than  or equal to 1... then they likely
        // entered a percentage of training weight, rather than
        // raw value
        bool workingWeightIsPercentOfTrainingMax = (workingWeight <= 1);

        List<WorkoutSet> sets = workoutDayDef.workout.sets.map(
          (e) => new WorkoutSet(
            reps: e.reps,
            weight: workingWeightIsPercentOfTrainingMax ?
              e.weight * workingWeight : e.weight,
            amrap: e.amrap
          )).toList();

        Workout newWorkout = new Workout(
          name: liftDef.name,
          sets: sets,
        );
        days[workoutDayDef.dayOfCycle].add(newWorkout);
      }
    }
  }

  WorkoutCycle.fromLastCycle(ProgramDefinition definition, WorkoutCycle last) {

  }
}