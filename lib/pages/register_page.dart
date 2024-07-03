import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media/components/button.dart';
import 'package:social_media/components/text_field.dart';

class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState()=> _RegisterPageState();

}

class _RegisterPageState extends State<RegisterPage>{
  final emailTextController=TextEditingController();
  final passwordTextController=TextEditingController();
  final confirmPasswordTextController=TextEditingController();

  void signUp() async{
    showDialog(
      context:context,
      builder:(context)=> const Center(
        child:CircularProgressIndicator(),
      ),
    );
    if(passwordTextController.text!=confirmPasswordTextController.text){
      Navigator.pop(context);
      displayMessage("Passwords don't match !");
      return;
    }
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:emailTextController.text,
        password:passwordTextController.text,
      );
      if(context.mounted) Navigator.pop(context);
    }on FirebaseAuthException catch (e){
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }
   void displayMessage(String message){
    showDialog(
      context:context,
      builder:(context)=>AlertDialog(
        title:Text(message),
      ),

    );
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body:SafeArea(
        child:Center(
          child:Padding(
            padding:const EdgeInsets.symmetric(horizontal:25.0),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children:[
              const Icon(
                Icons.lock,
                size:100,
              ),
              const SizedBox(height:50),

              Text(
                "Let's create an account for you",
                style:TextStyle(
                  color:Colors.grey[700],
                )
              ),

              const SizedBox(height:25),

              MyTextField(
              controller:emailTextController,
              hintText:'Email',
              obsecureText:false),
              const SizedBox(height:10),

              MyTextField(
                controller:passwordTextController,
                hintText:'Password',
                obsecureText:true,
              ),
              MyTextField(
                controller:confirmPasswordTextController,
                hintText:'Confirm Password',
                obsecureText:true,
              ),
              const SizedBox(height:10),
              MyButton(
                onTap:signUp,
                text:'Sign Up',
              ),
              const SizedBox(height:25),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  Text(
                    "Already have an account",
                    style:TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(width:4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child:Text(
                      "Login here",
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        color:Colors.blue,
                      ),
                    ),
                  ),
                ]
              )
            ],
          )
          )
          
        )
      ),
      
    );
  }
}