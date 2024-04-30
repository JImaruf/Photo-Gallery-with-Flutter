
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photogallerymrf/Database/card_data.dart';
import 'package:photogallerymrf/pages/detailspage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Photo Gallery",style: TextStyle(color: Colors.white),),
        leading: Container(
           margin: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
         // padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[200],
          ),

          child: Center(
              child: IconButton(
                onPressed: (){
                  SystemNavigator.pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 25,)),
          ),

        ),

        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
             return [];
          },
            iconColor: Colors.white,
            iconSize: 32,)
        ],
      ),

        body: SafeArea(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return gridViewBuilder(orientation);
            },
          ),
        ));
  }

  Widget gridViewBuilder(Orientation orientation) {
    return GridView.builder(
        padding: const EdgeInsets.all(15.00),
        itemCount: CardData.cards.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(itemNO: index,)));
            },
            child: Container(height: 200,width: 200,

            decoration: BoxDecoration(

              image: DecorationImage(
                image: NetworkImage(CardData.cards[index]['AlbumPicture']??"assets/hhh.jpg"),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),

              borderRadius: BorderRadius.circular(20)
            ),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(CardData.cards[index]['AlbumName']??"Title",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
            ),),
          );
        });
  }
  }

