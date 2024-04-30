import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photogallerymrf/Database/card_data.dart';

class DetailsPage extends StatefulWidget {
  final itemNO;


  const DetailsPage({super.key, this.itemNO});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double lines=2.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(CardData.cards[widget.itemNO]['AlbumName']??'Album Name',style: TextStyle(color: Colors.white),),
        leading: Container(
          margin: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[200],
          ),

          child: Center(
            child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
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
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if(orientation==Orientation.portrait)
            {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        height: MediaQuery.sizeOf(context).height/3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(

                              width:double.maxFinite,
                              fit: BoxFit.cover,
                              CardData.cards[widget.itemNO]["AlbumPicture"]??"assets/hhh.jpg"),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(CardData.cards[widget.itemNO]['AlbumHeader']??'Album Name',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 24),)
                      ,
                      Text(
                        maxLines: lines.toInt(),
                        CardData.cards[widget.itemNO]["AlbumDescription"]!,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 40,
                          child: ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor:  Color(0xFFb2CAB00),foregroundColor: Colors.white),
                              onPressed: (){
                                setState(() {
                                  lines=double.maxFinite;
                                });
                              },
                              child: Text("See More",style: TextStyle(fontSize: 16,color:Colors.white),)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Suggestions",style: TextStyle(color:  Color(0xFFb2CAB00),fontSize: 22),)
                      ,
                      const SizedBox(height: 20,),
                      Container(
                        height: 150,
                        width: double.maxFinite,

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: CardData.cards.length,
                          itemBuilder: (context, index) {
                            if(index!=widget.itemNO)
                            {
                              return
                                InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsPage(itemNO: index,)));
                                  },
                                  child: Container(
                                    height: 100,width: MediaQuery.sizeOf(context).width/2.5,
                                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                            }
                            else
                              return Text("");
                          },),
                      ),


                    ],
                  ),
                ),
              );
            }
          else
            {
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
               child:Row(
                 
                 children: [
                   Expanded(
                     child: SizedBox(
                       width: MediaQuery.sizeOf(context).width/2,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(20),
                         child: Image.network(
                     
                             //width:double.maxFinite,
                             fit: BoxFit.cover,
                             CardData.cards[widget.itemNO]["AlbumPicture"]??"assets/hhh.jpg"),
                       ),
                     ),
                   ),

                   SizedBox(width: 10,),
                   
                   Expanded(
                     child: SingleChildScrollView(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           SizedBox(height: 20,),
                           Text(CardData.cards[widget.itemNO]['AlbumHeader']??'Album Name',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 24),)
                           ,
                           Text(
                             maxLines: lines.toInt(),
                             CardData.cards[widget.itemNO]["AlbumDescription"]!,
                             textAlign: TextAlign.start,
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Center(
                             child: SizedBox(
                               width: double.maxFinite,
                               height: 40,
                               child: ElevatedButton(
                       
                                   style: ElevatedButton.styleFrom(
                                       elevation: 10,
                                       backgroundColor:  Color(0xFFb2CAB00),foregroundColor: Colors.white),
                                   onPressed: (){
                                     setState(() {
                                       lines=double.maxFinite;
                                     });
                                   },
                                   child: Text("See More",style: TextStyle(fontSize: 16,color:Colors.white),)),
                             ),
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Text("Suggestions",style: TextStyle(color:  Color(0xFFb2CAB00),fontSize: 22),)
                           ,
                           SizedBox(height: 20,),
                           Container(
                             height: 150,
                             width: double.maxFinite,
                       
                             child: ListView.builder(
                               scrollDirection: Axis.horizontal,
                               itemCount: CardData.cards.length,
                               itemBuilder: (context, index) {
                                 if(index!=widget.itemNO)
                                 {
                                   return
                                     InkWell(
                                       splashColor: Colors.transparent,
                                       onTap: (){
                                         Navigator.push(
                                             context,
                                             MaterialPageRoute(
                                                 builder: (context) => DetailsPage(itemNO: index,)));
                                       },
                                       child: Container(
                                         height: 100,width: MediaQuery.sizeOf(context).width/4.5,
                                         margin: EdgeInsets.symmetric(horizontal: 10),
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
                                 }
                                 else
                                   return Text("");
                               },),
                           ),
                       
                       
                         ],
                       ),
                     ),
                   ),
                 ],
               ),

             );
            }
        },

      ),
    );
  }
}
