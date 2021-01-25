import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateTasks {
  updateTasks({this.targetOrder});

  DocumentReference targetOrder;
  Map<String, dynamic> data = new Map();

  decTaskService() async {
    final salesPersonnel =
        await targetOrder.get().then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data()['salesPersonnel'].toString();
    });

    final planPersonnel =
        await targetOrder.get().then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data()['planPersonnel'].toString();
    });

    final purchPersonnel =
        await targetOrder.get().then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data()['purchPersonnel'].toString();
    });

    final manfPersonnel =
        await targetOrder.get().then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot.data()['manfPersonnel'].toString();
    });

    DocumentReference salesDocRef =
        FirebaseFirestore.instance.collection('sales').doc(salesPersonnel);
    DocumentReference planDocRef =
        FirebaseFirestore.instance.collection('planning').doc(planPersonnel);
    DocumentReference purchDocRef =
        FirebaseFirestore.instance.collection('purchasing').doc(purchPersonnel);
    DocumentReference manfDocRef = FirebaseFirestore.instance
        .collection('manufacturing')
        .doc(manfPersonnel);

    final salesPersonnelTasks = await salesDocRef.get().then(
        (DocumentSnapshot documentSnapshot) =>
            {documentSnapshot.data()['tasks']});

    final planPersonnelTasks = await planDocRef.get().then(
        (DocumentSnapshot documentSnapshot) =>
            {documentSnapshot.data()['tasks']});

    final purchPersonnelTasks = await purchDocRef.get().then(
        (DocumentSnapshot documentSnapshot) =>
            {documentSnapshot.data()['tasks']});

    final manfPersonnelTasks = await manfDocRef.get().then(
        (DocumentSnapshot documentSnapshot) =>
            {documentSnapshot.data()['tasks']});

    int salesPersonnelTasksfinal =
        int.parse(salesPersonnelTasks.elementAt(0)) - 1;
    int purchPersonnelTasksfinal =
        int.parse(purchPersonnelTasks.elementAt(0)) - 1;
    int planPersonnelTasksfinal =
        int.parse(planPersonnelTasks.elementAt(0)) - 1;
    int manfPersonnelTasksfinal =
        int.parse(manfPersonnelTasks.elementAt(0)) - 1;

    //START SETTING VALUES
    final decSalePersonnelTask =
        await salesDocRef.update({'tasks': salesPersonnelTasksfinal});
    final decPlanPersonnelTask =
        await planDocRef.update({'tasks': planPersonnelTasksfinal});
    final decPurchPersonnelTask =
        await purchDocRef.update({'tasks': purchPersonnelTasksfinal});
    final decManfPersonnelTask =
        await manfDocRef.update({'tasks': manfPersonnelTasksfinal});

    decManfPersonnelTask;
    decPlanPersonnelTask;
    decPurchPersonnelTask;
    decSalePersonnelTask;
  }
}

incTaskService(
    salesPersonnel, planPersonnel, purchPersonnel, manfPersonnel) async {
  DocumentReference salesDocRef = FirebaseFirestore.instance
      .collection('sales')
      .doc(FirebaseAuth.instance.currentUser.uid);
  DocumentReference planDocRef =
      FirebaseFirestore.instance.collection('planning').doc(planPersonnel);
  DocumentReference purchDocRef =
      FirebaseFirestore.instance.collection('purchasing').doc(purchPersonnel);
  DocumentReference manfDocRef =
      FirebaseFirestore.instance.collection('manufacturing').doc(manfPersonnel);

  final salesPersonnelTasks = await salesDocRef.get().then(
      (DocumentSnapshot documentSnapshot) =>
          {documentSnapshot.data()['tasks'].toString()});

  final planPersonnelTasks = await planDocRef.get().then(
      (DocumentSnapshot documentSnapshot) =>
          {documentSnapshot.data()['tasks'].toString()});

  final purchPersonnelTasks = await purchDocRef.get().then(
      (DocumentSnapshot documentSnapshot) =>
          {documentSnapshot.data()['tasks'].toString()});

  final manfPersonnelTasks = await manfDocRef.get().then(
      (DocumentSnapshot documentSnapshot) =>
          {documentSnapshot.data()['tasks'].toString()});

  salesPersonnelTasks;
  planPersonnelTasks;
  purchPersonnelTasks;
  manfPersonnelTasks;

  int salesPersonnelTasksfinal =
      int.parse(salesPersonnelTasks.elementAt(0)) + 1;
  int purchPersonnelTasksfinal =
      int.parse(purchPersonnelTasks.elementAt(0)) + 1;
  int planPersonnelTasksfinal = int.parse(planPersonnelTasks.elementAt(0)) + 1;
  int manfPersonnelTasksfinal = int.parse(manfPersonnelTasks.elementAt(0)) + 1;

  //START SETTING VALUES
  final incSalePersonnelTask =
      await salesDocRef.update({'tasks': salesPersonnelTasksfinal});
  final incPlanPersonnelTask =
      await planDocRef.update({'tasks': planPersonnelTasksfinal});
  final incPurchPersonnelTask =
      await purchDocRef.update({'tasks': purchPersonnelTasksfinal});
  final incManfPersonnelTask =
      await manfDocRef.update({'tasks': manfPersonnelTasksfinal});

  incManfPersonnelTask;
  incPlanPersonnelTask;
  incPurchPersonnelTask;
  incSalePersonnelTask;
}
