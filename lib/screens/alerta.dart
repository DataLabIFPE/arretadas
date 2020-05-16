
import 'package:flutter/material.dart';

class Alerta  extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white ,
            ),
            onPressed: () => {},

          ) ,
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Mylogo(),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () =>{},
            ),
          ],
         
         
                  
          backgroundColor: Color.fromRGBO(255, 0, 102, 1),
          
        
        ),
        body: Container(
          decoration: new BoxDecoration(color:Colors.black),
          
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
         
            

          
          
         Center(
          child: Myimagem(),

         ),
        Text('EMERGÊNCIA',
              style: TextStyle(
                color: Colors.white,
               
                fontStyle: FontStyle.italic,
                
                fontSize: 25,
                
              ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             FlatButton(
               color: Color.fromRGBO(255, 0, 102, 1),
               textColor:Colors.white ,
               disabledColor: Colors.grey,
               padding: EdgeInsets.all(10.0),
               splashColor: Colors.white,
               onPressed: () {
                 debugPrint("O botão foi clicado");
               },
               child: Text(
                 "Clique aqui",
                 style: TextStyle(fontSize: 20.0),
               ),
             ),
            
             
          

          ],
         
       
        ),
        ],
      ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          child: Icon(Icons.info,
          color: Colors.white,
          size: 40,
         
         ),
         onPressed:() => {
           //Adicionar funcionalidades no botão info
           //Possivéis funcionalidades:
           //Texto informativo sobre a tela atual
           //Advertências 
          }
        ),


      ),
      
    );
  }
}




// Imagem de atenção 
class Myimagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var icone = new AssetImage('images/warning.png');
    var image = new Image(image:icone,width: 130,height: 130,);

  
    return Container(
      child: image,
    );
  }
}
//Imagem logo
class Mylogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var icone2 = new AssetImage('images/logo_app.jpeg');
    var image2 = new Image(image: icone2,width: 50,height: 50,);
    return Container(
      child: image2,
      
    );
  }
}