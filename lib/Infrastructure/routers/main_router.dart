
import 'package:examen2_ticketavion/Presentation/Screens/home/home_screen.dart';
import 'package:examen2_ticketavion/Presentation/Screens/ticketlist/ticketlist_screen.dart';
import 'package:go_router/go_router.dart';

final mainRouter = GoRouter(

routes: <RouteBase>[

GoRoute(
  path: '/',
  builder: (context, state) => const HomeScreen()
  
  ),
GoRoute(
  path: '/ticketlist',
  builder: (context, state) => const TicketlistScreen(),
  
  ),

]

);