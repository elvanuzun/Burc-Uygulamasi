import 'dart:ui';
import 'package:palette_generator/palette_generator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;

  const BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appbarRengi = Colors.transparent;
  late PaletteGenerator _generator;
  @override
  void initState() {
    appBarRengiOlustur();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              title: Text(
                widget.secilenBurc.burcAdi + ' Yılı ve Özellikleri',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                  child: Center(
                      child: Column(
                children: [
                  Text(
                    widget.secilenBurc.burcDetayi,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ))),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRengiOlustur() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage('images/' + widget.secilenBurc.burcBuyukResim));
        setState(() {
          appbarRengi = _generator.dominantColor!.color;
        });
    
  }
}
