import 'package:flutter/material.dart';

import '../../components/app_text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: appText('Order', fontSize: 18)));
  }
}
