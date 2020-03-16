part of mmoons;

class ProgramDefinitionCard extends StatelessWidget {

  final ProgramDefinition definition;

  ProgramDefinitionCard(this.definition);

  void _goToProgramPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
        builder: (BuildContext context) => ProgramDefinitionPage(definition)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _goToProgramPage(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(definition.name),

          ]..addAll(definition.lifts.map((e) => Text(e.name)).toList()),
        ),
      )
    );
  }
}