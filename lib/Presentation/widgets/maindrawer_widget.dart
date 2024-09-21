import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

menuDrawer (BuildContext context){
  return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           const DrawerHeader(
                decoration: BoxDecoration(
                   color: Color.fromARGB(255, 255, 162, 247),
                  ),
               child: Text('Options'),
        ),
        ListTile(
        title: const Text('Inicio'),
        onTap: () { 
          context.push('/');
          
        },
      ),
      ListTile(
        title: const Text('Coleccion de Tickets'),
        onTap: () {
           context.push('/ticketlist');
        },
      )
     ]
  ),
);
}