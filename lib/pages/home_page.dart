// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app/pages/my_button.dart';
import 'package:wallet_app/pages/my_list_tile.dart';
import 'package:wallet_app/pages/utilities/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Pagecontroller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.monetization_on,
          size: 32,
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.home,
                size: 32,
                color: Colors.pink[200],
                ),
            ),
               
            IconButton(
              onPressed: () {}, 
              icon: Icon(
                Icons.settings,
                size: 32,
                color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'My',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Cards',
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),
                  //plus button
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            ),

            SizedBox(height: 25),

            //cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 5250.20,
                    cardNumber: 12345678,
                    expiryMonth: 10,
                    expiryYear: 24,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 345.20,
                    cardNumber: 12345678,
                    expiryMonth: 12,
                    expiryYear: 22,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 4242.40,
                    cardNumber: 12345678,
                    expiryMonth: 12,
                    expiryYear: 26,
                    color: Colors.orange[300],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),
            SmoothPageIndicator(
            
              controller: _controller, 
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
            ),
             

            SizedBox(height: 20),

            //3 buttons -> send + pay + bills
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //send button
                  MyButton(
                    iconImagePath: 'lib/icons/006-salary.png',
                    buttonText: 'Send',
                  ),              
            
                //pay button
                MyButton(
                    iconImagePath: 'lib/icons/credit.png',
                    buttonText: 'Pay',
                  ),
            
                //bills button
                MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: 'Bills',
                  ),                        
                ],
              ),
            ),

            SizedBox(height: 40),


            //column -> stats + transactions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                //statics
                  MyListTile(
                    iconImagePath: 'lib/icons/analysis.png', 
                    tileTitle: 'Statistics', 
                    tileSubTitle: 'Payment and Income', 
                ),
                //transaction
                MyListTile(
                    iconImagePath: 'lib/icons/mobile-banking (1).png', 
                    
                    tileTitle: 'Transactions', 
                    tileSubTitle: 'Transaction History',
                    
                ),
                
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
