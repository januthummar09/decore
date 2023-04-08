import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class ECatalogue extends StatefulWidget {
  const ECatalogue({Key? key}) : super(key: key);

  @override
  State<ECatalogue> createState() => _ECatalogueState();
}

class _ECatalogueState extends State<ECatalogue> {
  @override
  Widget build(BuildContext context) {
    List activeDeviceList = [
      {'image': catalogue1, 'title': 'DENVER', 'switch': true},
      {'image': catalogue2, 'title': 'COMICAL', 'switch': true},
      {'image': catalogue3, 'title': 'NU BUCK', 'switch': true},
      {'image': catalogue4, 'title': 'SOFT LEATHER', 'switch': true},
      {'image': catalogue1, 'title': 'DENVER', 'switch': true},
      {'image': catalogue1, 'title': 'DENVER', 'switch': true},
    ];
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(10),
            itemCount: activeDeviceList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 14 / 9,
            ),
            itemBuilder: (context, index) {
              // activeDeviceList[index]['switch'] == true ? active.add(index) : active.remove(index);

              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/PdfViewerPage');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(activeDeviceList[index]['image']), fit: BoxFit.cover),
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor),
                        boxShadow: index == 0 ? null : [BoxShadow(blurRadius: 6, color: colorForShadow)],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Text(
                        activeDeviceList[index]['title'],
                        style: whiteSemiBold16,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
