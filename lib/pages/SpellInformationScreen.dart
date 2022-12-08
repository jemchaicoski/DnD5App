import 'package:dnd5_app/components/InformationBox.dart';
import 'package:dnd5_app/models/Spell.dart';
import 'package:dnd5_app/services/DndService.dart';
import 'package:flutter/material.dart';

class SpellInformationScreen extends StatefulWidget {
  String spellIndex;

  SpellInformationScreen(this.spellIndex);

  @override
  State<SpellInformationScreen> createState() => _SpellInformationScreenState();
}

class _SpellInformationScreenState extends State<SpellInformationScreen> {
  DndService dndService = DndService();
  late Future<Spell> spell;

  void initState() {
    super.initState();
    spell = dndService.getOneSpell(widget.spellIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: spell,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //print(snapshot.data);
          if (snapshot.data == null) {
            return Scaffold(
              appBar: AppBar(),
              body: Container(
                child: const Center(
                  child: Text("Loading..."),
                ),
              ),
            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,//remover
                ),
              body: Column(
                children: [
                  InformationBox([snapshot.data.getNameTranslated(),], true),
                  const Divider(
                    height: 10,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.grey,
                  ),
                  InformationBox([snapshot.data.getTypeAndLevel(),
                    "Conjuradores: " + snapshot.data.getClassesTranslated(),
                    "Tempo de conjuração: " + snapshot.data.castingTime,
                    "Alcance: " + snapshot.data.getRange(),
                    "Componentes: " + snapshot.data.getComponents(),
                    "Duração: " + snapshot.data.duration,
                    snapshot.data.desc,
                    snapshot.data.getHigherLevel()
                  ], false
                  ),
                ],
              )
            );
          }
        },
      ),
    );
  }
}
