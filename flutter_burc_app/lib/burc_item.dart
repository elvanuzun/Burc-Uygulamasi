
import 'package:flutter/material.dart';

import 'burc_detay.dart';
import 'model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  const BurcItem({Key? key, required this.listelenenBurc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap:() {Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=> BurcDetay(secilenBurc: listelenenBurc), ),);
              },
            leading: Image.asset("images/" + listelenenBurc.burcKucukResim),
            title: Text(listelenenBurc.burcAdi, style: myTextStyle.headline5,),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
