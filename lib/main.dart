import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
          child: Text(
            "Subscription Checkout",
            style: TextStyle(color: Colors.black87, fontSize: 16),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.close,
              color: Colors.black87,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        child: ListView(
          children: [
            // const Placeholder(
            //   fallbackHeight: 150,
            // ),
            const Image(image: AssetImage("assets/sample.png")),
            Row(
              children: [
                const Text(
                  "Go",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20)),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor)),
                      onPressed: () {},
                      child: const Text("PRO"),
                    ))
              ],
            ),
            const Text(
              "Start Your Free 14 Day SidelineSwap Pro Trial Now!",
              style: TextStyle(color: Colors.black54, fontSize: 18),
            ),
            const PaymentMethod(),
            Row(
              children: [
                const Expanded(child: Text("Billing Cycle")),
                Row(
                  children: [
                    const Text("Monthly"),
                    Switch(
                      value: true,
                      onChanged: (value) => value,
                      activeColor: Theme.of(context).primaryColor,
                    ),
                    const Text("Annually"),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const ExpenseTile(
              title: Text("SidelineSwap Pro Subscription"),
              trailing: Text("\$19.99"),
              subtitle: Text("(Monthly)"),
            ),
            const SizedBox(
              height: 20,
            ),
            const ExpenseTile(
              title: Text("SidelineSwap Pro Subscription"),
              trailing: Text("\$1.00"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const ExpenseTile(
              title: Text(
                "Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                "\$20.99",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Agreements(),
            const AgreeBox(),
            OutlinedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade900),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(15))),
              onPressed: () {},
              child: const Text(
                "Start Free Trial Now!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AgreeBox extends StatelessWidget {
  const AgreeBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
            child: Checkbox(value: false, onChanged: (value) => value),
          ),
          Flexible(
              child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context)
                          .style
                          .copyWith(height: 1.5),
                      children: const [
                TextSpan(text: "I agree to the "),
                TextSpan(
                    text: "Terms and Services",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                TextSpan(text: " and "),
                TextSpan(
                    text: "Acknowledge the",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline)),
                TextSpan(text: " Privacy Policy")
              ])))
        ],
      ),
    );
  }
}

class Agreements extends StatelessWidget {
  const Agreements({Key? key}) : super(key: key);

  final String bullet = "\u2022";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          BulletListTile(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style.copyWith(height: 1.5),
                children: const [
                  TextSpan(
                      text: "You will be automatically be billed starting "),
                  TextSpan(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      text: "May 19th, 2022 "),
                  TextSpan(text: "recurring monthly")
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          BulletListTile(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                text: "You may cancel at anytime"),
          )
        ],
      ),
    );
  }
}

class BulletListTile extends StatelessWidget {
  const BulletListTile({Key? key, required this.text}) : super(key: key);

  final TextSpan text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text("\u2022"),
          margin: const EdgeInsets.only(right: 10),
        ),
        Flexible(child: RichText(text: text))
      ],
    );
  }
}

class ExpenseTile extends StatelessWidget {
  const ExpenseTile(
      {Key? key, required this.title, this.subtitle, this.trailing})
      : super(key: key);

  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final _sub = subtitle;
    final _trail = trailing;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [Expanded(child: title), if (_trail != null) _trail],
          ),
          if (_sub != null) _sub,
        ],
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RequiredText(
              label: Text(
            "Payment Method",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                isDense: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              isExpanded: true,
              hint: const Text("Select Payment Method"),
              items: const [
                DropdownMenuItem(
                  child: Text("CASH"),
                  value: "CASH",
                ),
                DropdownMenuItem(
                  child: Text("CREDIT CARD"),
                  value: "CREDIT CARD",
                )
              ],
              onChanged: (value) => print(value))
        ],
      ),
    );
  }
}

class RequiredText extends StatelessWidget {
  const RequiredText({Key? key, required this.label}) : super(key: key);
  final Text label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        label,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "*",
            style: label.style!.copyWith(color: Colors.red),
          ),
        )
      ],
    );
  }
}