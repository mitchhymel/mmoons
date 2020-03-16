part of mmoons;

class ProgramDefinitionPage extends StatelessWidget {
  final ProgramDefinition definition;

  ProgramDefinitionPage(this.definition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(definition.name),
      ),
      body: Text('ay'),
    );
  }
}