import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/drawer.dart';
import 'package:social_media/components/text_field.dart';
import 'package:social_media/components/wall_post.dart';
import 'package:social_media/pages/profile_page.dart';
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final currentUser=FirebaseAuth.instance.currentUser!;

  void signOut(){
    FirebaseAuth.instance.signOut();
  }
  void postMessage(){
    if(textController.text.isNotEmpty){
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserEmail':currentUser.email,
        'Message':textController.text,
        'TimeStamp':Timestamp.now(),
        'Likes':[],
      });
    }
    setState((){
      textController.clear();
    });
  }

  void goToProfilePage(){
    Navigator.pop(context);

    Navigator.push(
      context,MaterialPageRoute(
        builder:(context)=> ProfilePage(),
      )
    );
  }



  final textController = TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Social Media App"),
        backgroundColor:Colors.grey[200],
        elevation:0,
        actions:[
          IconButton(
            onPressed:signOut,
            icon:Icon(Icons.logout),
          ),
        ]
        ),
         drawer:MyDrawer(
          onProfileTap: goToProfilePage,
          onSignOut:signOut,
         ),
          body: Center(
            child: Column(
            children:[
              Expanded(
                child:StreamBuilder(
                stream:FirebaseFirestore.instance.collection("User Posts").orderBy("TimeStamp",descending:false,).snapshots(),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount:snapshot.data!.docs.length,
                      itemBuilder:(context,index){
                        final post = snapshot.data!.docs[index];
                       return WallPost(
                        message:post['Message'],
                        user:post['UserEmail'],
                        postId:post.id,
                        likes:List<String>.from(post['Likes']??[]),

                       );
                      }
                    );
                  }else if(snapshot.hasError){
                    return Center(
                      child:Text('Error:${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child:CircularProgressIndicator(),
                  );
                }
                ),
              ),

             Padding(
              padding:const EdgeInsets.all(25.0),
              child: Row(
                children:[
                  Expanded(
                    child: MyTextField(
                      controller:textController,
                      hintText:'Write something on Wall',
                      obsecureText:false,
                    )
                  ),
                  IconButton(onPressed:postMessage,icon:const Icon(Icons.arrow_circle_up))
                ]
              ),
             ),



              Text("Logged in as "+ currentUser.email!),
              const SizedBox(height:50),
            ]
          )
          )
          
    );
  }
}
