import 'package:flutter/material.dart';
import 'package:nodra_student/providers/page_provider.dart';
import 'package:provider/provider.dart';

class EmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PageProvider>(context);
    return Center(
      child: Text('Empty Page'),
    );
  }
}
