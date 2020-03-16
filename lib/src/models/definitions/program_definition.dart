import '../exports.dart';

class ProgramDefinition {
  String name;
  List<LiftDefinition> lifts;

  ProgramDefinition({this.name, this.lifts});

  static ProgramDefinition nsuns() {

    WorkoutDefinition primaryBench = new WorkoutDefinition(
      name: 'Primary',
      sets: [
        WorkoutSetDefinition(reps: 8, weight: .65),
        WorkoutSetDefinition(reps: 6, weight: .75),
        WorkoutSetDefinition(reps: 4, weight: .85),
        WorkoutSetDefinition(reps: 4, weight: .85),
        WorkoutSetDefinition(reps: 4, weight: .85),
        WorkoutSetDefinition(reps: 5, weight: .8),
        WorkoutSetDefinition(reps: 6, weight: .75),
        WorkoutSetDefinition(reps: 7, weight: .70),
        WorkoutSetDefinition(reps: 8, weight: .65, amrap: true),
      ]
    );

    WorkoutDefinition primaryDead = new WorkoutDefinition(
      name: 'Primary',
      sets: [
        WorkoutSetDefinition(reps: 5, weight: .75),
        WorkoutSetDefinition(reps: 3, weight: .85),
        WorkoutSetDefinition(reps: 1, weight: .95),
        WorkoutSetDefinition(reps: 3, weight: .9),
        WorkoutSetDefinition(reps: 3, weight: .85),
        WorkoutSetDefinition(reps: 3, weight: .8),
        WorkoutSetDefinition(reps: 3, weight: .75),
        WorkoutSetDefinition(reps: 3, weight: .70),
        WorkoutSetDefinition(reps: 3, weight: .65, amrap: true),
      ]
    );

    WorkoutDefinition primarySquat = new WorkoutDefinition(
      name: 'Primary',
      sets: [
        WorkoutSetDefinition(reps: 5, weight: .75),
        WorkoutSetDefinition(reps: 3, weight: .85),
        WorkoutSetDefinition(reps: 1, weight: .95),
        WorkoutSetDefinition(reps: 3, weight: .9),
        WorkoutSetDefinition(reps: 3, weight: .85),
        WorkoutSetDefinition(reps: 3, weight: .8),
        WorkoutSetDefinition(reps: 5, weight: .75),
        WorkoutSetDefinition(reps: 5, weight: .70),
        WorkoutSetDefinition(reps: 5, weight: .65, amrap: true),
      ]
    );

    WorkoutDefinition primaryOverhead = new WorkoutDefinition(
        name: 'Primary',
        sets: [
          WorkoutSetDefinition(reps: 5, weight: .75),
          WorkoutSetDefinition(reps: 3, weight: .85),
          WorkoutSetDefinition(reps: 1, weight: .95),
          WorkoutSetDefinition(reps: 3, weight: .9),
          WorkoutSetDefinition(reps: 5, weight: .85),
          WorkoutSetDefinition(reps: 3, weight: .8),
          WorkoutSetDefinition(reps: 5, weight: .75),
          WorkoutSetDefinition(reps: 3, weight: .70),
          WorkoutSetDefinition(reps: 5, weight: .65, amrap: true),
        ]
    );

    WorkoutDefinition secondary = new WorkoutDefinition(
      name: 'Secondary',
      sets: [
        WorkoutSetDefinition(reps: 5, weight: .5),
        WorkoutSetDefinition(reps: 5, weight: .6),
        WorkoutSetDefinition(reps: 3, weight: .7),
        WorkoutSetDefinition(reps: 5, weight: .7),
        WorkoutSetDefinition(reps: 7, weight: .7),
        WorkoutSetDefinition(reps: 4, weight: .7),
        WorkoutSetDefinition(reps: 6, weight: .7),
        WorkoutSetDefinition(reps: 8, weight: .7),
      ]
    );

    LiftDefinition bench = new LiftDefinition(
      name: 'Bench',
      workouts: [
        new WorkoutDayDefinition(
          dayOfCycle: 0,
          workout: primaryBench
        ),
        new WorkoutDayDefinition(
          dayOfCycle: 2,
          workout: secondary
        )
      ]
    );

    LiftDefinition squat = new LiftDefinition(
      name: 'Squat',
      workouts: [
        new WorkoutDayDefinition(
            dayOfCycle: 1,
            workout: primarySquat
        ),
        new WorkoutDayDefinition(
            dayOfCycle: 3,
            workout: secondary
        )
      ]
    );

    LiftDefinition overhead = new LiftDefinition(
      name: 'Overhead',
      workouts: [
        new WorkoutDayDefinition(
            dayOfCycle: 2,
            workout: primaryOverhead
        ),
        new WorkoutDayDefinition(
            dayOfCycle: 0,
            workout: secondary
        )
      ]
    );

    LiftDefinition deadlift = new LiftDefinition(
      name: 'Deadlift',
      workouts: [
        new WorkoutDayDefinition(
            dayOfCycle: 3,
            workout: primaryDead
        ),
        new WorkoutDayDefinition(
            dayOfCycle: 1,
            workout: secondary
        )
      ]
    );

    return new ProgramDefinition(
      name: 'nsuns',
      lifts: [ bench, squat, overhead, deadlift ],
    );
  }
}