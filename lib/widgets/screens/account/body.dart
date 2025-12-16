import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/screens/account/components/guest_view.dart';
import 'components/user_view.dart';

class AccountBody extends StatelessWidget{
  const AccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data;

          if(user == null) {
            return const AccountGuestView();
          } else {
            return AccountUserView(user: user);
          }
        }
    );
  }
}