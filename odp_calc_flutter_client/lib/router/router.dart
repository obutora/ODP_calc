import 'package:go_router/go_router.dart';

import '../screen/add_patient_screen.dart';
import '../screen/home_screen.dart';
import '../screen/med_master_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/medMaster',
    builder: (context, state) => const MedMasterScreen(),
  ),
  GoRoute(
    path: '/addPatient',
    builder: (context, state) => const AddPatientScreen(),
  )
  // ),
  // GoRoute(
  //   path: '/searchMed',
  //   builder: (context, state) => PatientDetailScreen(
  //     id: state.params['id']!,
  //   ),
  // ),
  // GoRoute(
  //   path: '/med',
  //   builder: (context, state) => const MedScreen(),
  // ),
  // GoRoute(
  //   path: '/med/:id',
  //   builder: (context, state) => MedDetailScreen(
  //     id: state.params['id']!,
  //   ),
  // ),
  // GoRoute(
  //   path: '/pdf',
  //   builder: (context, state) => const PdfScreen(),
  // ),
]);
