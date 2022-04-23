
import 'package:flutter/material.dart';

import 'burc_item.dart';
import 'data/strings.dart';
import 'model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çin Astrolojisi Burç Rehberi'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc:tumBurclar[index],);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      var burBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i + 1}.png';

      Burc eklenecekBurc =
          Burc(burcAdi, burcDetayi, burcKucukResim, burBuyukResim);
      gecici.add(eklenecekBurc);
    }

    return gecici;
  }
}
