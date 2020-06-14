import 'package:flutter/material.dart';

 class Denuncias extends StatelessWidget{
   
   @override 
   Widget build(BuildContext context){
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       title: "Fazer Denúncias",
       theme: ThemeData(
         primaryColor: Color.fromRGBO(248,92,104,1),
         
      ),
      home: Widgets1(),

     );

   }
 }

class Widgets1 extends StatefulWidget{
  @override
  _Widgets1State createState() => _Widgets1State();
}

class _Widgets1State extends State<Widgets1> {
   FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // limpa o no focus quando o form for liberado.
    myFocusNode.dispose();
    super.dispose();
  }
  @override 
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      
      appBar: AppBar(
        title: Text("Fazer Denúncias"),
        bottom: TabBar(tabs: 
         <Widget>[
           Text("Relato"),
           Text("Localização"),

        ]),

      
      ),
      
      
      body:

      SafeArea(child: Stack(children: <Widget>[
       
      TabBarView(
              children: <Widget>[
                
                widgetTextField(),
      
                
                new Container(child:
                 Center( 
                   child: FlatButton.icon(
                     color: Color.fromRGBO(248,92,104,1),
                     icon: Icon(Icons.add_location),
                     label: Text("Localizar"),
                     onPressed: ()  {

                       debugPrint("Localizando");
                     },
                   ),

                ),),
               
                
              ],
            ),
       
      /*new Container(
       child: Row(
         children: <Widget>[
            Flexible(
               child: new Text("Poderá denunciar ocorrências acontecidas com você ou testemunhar.",
               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
               ),
               )
                ],
        )),*/
      
  


      

      


      
      
       
           
       
            
          ],
    ),),

    bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(248,92,104,1),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.white,
          ),


      items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Voltar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.home,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Início',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            
            
          ],)));}








// Texto: Relato do acontecimento
 Padding widgetTextField(){
  return Padding (
    padding: const EdgeInsets.all(70),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


         Flexible(child: 
          TextField(
            focusNode: myFocusNode,
             decoration:
             InputDecoration(border: 
             InputBorder.none,
             icon: Icon(Icons.warning),
             hintText: "Escreva um relato"),
          ),),




  // Botão para salvar o relato           
 new Container(
                   
                    
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    margin: EdgeInsets.only(left: 6, right: 6, top: 365),
                    decoration: BoxDecoration(
                      color:Color.fromRGBO(248,92,104,1),
                      borderRadius: BorderRadius.circular(120),
                    ),

          child: Column(

        
        ///crossAxisAlignment:CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        
        
        
        children:[
          FlatButton(
                          
                          color: Color.fromRGBO(248,92,104,1),
                          textColor:Colors.white,
                          disabledColor: Colors.grey,
                          padding: EdgeInsets.all(15.0),
                          splashColor: Colors.white,
                          onPressed: () {
                           debugPrint("SALVANDO");
                          },
                          child: Text(
                            "SALVAR",
                            style: TextStyle(fontSize: 22.0),
        
               
                          
               ),
             ),
          
        ]),
       
),

           
          
          
        
        ],
      ),
    );
  }
}
