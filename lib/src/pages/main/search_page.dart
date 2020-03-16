part of mmoons;

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ProgramDefinitionCard(ProgramDefinition.nsuns())
      ],
    );
  }
}