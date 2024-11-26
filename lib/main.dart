import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'МОДА 214020 мобилна апликација',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> proizvodi = [
    {
      'ime': 'RIBBED TEXTURED T-SHIRT',
      'slika': 'https://static.zara.net/assets/public/a1b3/5860/e8eb41cf8150/4ee666e017dc/06462315524-e1/06462315524-e1.jpg?ts=1725878538265&w=418',
      'opis': 'Slim fit long sleeve T-shirt with a round neckline.',
      'cena': '799.00 MKD',
    },
    {
      'ime': 'SLIM FIT CARGO TROUSERS',
      'slika': 'https://static.zara.net/assets/public/9bfe/e03b/298648cc8dff/535a17e74d12/04470301806-e1/04470301806-e1.jpg?ts=1722582650937&w=418',
      'opis': 'Slim fit trousers. Front pockets and back welt pockets. Patch pockets with flap on the legs. Faded effect. Front zip and button fastening.',
      'cena': '2290.00 MKD',
    },
    {
      'ime': 'CHELSEA BOOTS',
      'slika': 'https://static.zara.net/assets/public/0704/84ef/e3844dd0ba9c/fb9f071d922a/12000421700-ult3/12000421700-ult3.jpg?ts=1722427135779&w=418',
      'opis': 'Chelsea boots. Plain upper. Elastic side gores and pull tab in the back for slipping on with ease. Round toe. Slightly heeled sole.',
      'cena': '2990.00 MKD',
    },
    {
      'ime': '100% DOWN PUFFER JACKET',
      'slika': 'https://static.zara.net/assets/public/dd31/6f01/d7274082b0ec/35607ad9a061/03411411800-e1/03411411800-e1.jpg?ts=1727365352967&w=418',
      'opis': 'Padded jacket made of shiny technical fabric. Filled with a blend of down and feathers. High neck with adjustable hood and long sleeves with elasticated cuffs. Welt pockets at the hip and an inside pocket. Adjustable hem with elastic at the sides. Zip-up front.',
      'cena': '6490.00 MKD',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('214020 Александар Атанасоски'),
      ),
      backgroundColor: Colors.grey[200],
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: EdgeInsets.all(10),
        itemCount: proizvodi.length,
        itemBuilder: (context, index) {
          final proizvod = proizvodi[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProizvodDetali(proizvod: proizvod),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Image.network(proizvod['slika']!, height: 120),
                  Text(proizvod['ime']!, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  Text(proizvod['cena']!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProizvodDetali extends StatelessWidget {
  final Map<String, String> proizvod;

  ProizvodDetali({required this.proizvod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(proizvod['ime']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(proizvod['slika']!),
            SizedBox(height: 16),
            Text(proizvod['opis']!, style: TextStyle(fontSize: 12)),
            SizedBox(height: 16),
            Text('Price: ${proizvod['cena']!}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}