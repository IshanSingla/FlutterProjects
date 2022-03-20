import 'package:flutter/material.dart';
import 'package:clyde_project/ui/component.dart';
import 'package:clyde_project/ui/screen/detail_wallet.dart';
import 'package:clyde_project/ui/component/logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double per = 3.97;
  dynamic futureAlbum;
  dynamic totalBalanceAmount;
  dynamic checkBalanceAmount;
  bool fetched = false;
  dynamic ValueAmount;
  _HomeScreenState(){
      // test();
      // reduce();
    check();
  }
  Future<void> test() async{
    futureAlbum = await fetchAlbum();
    fetched = true;
    print(futureAlbum);
  }
  Future<void> reduce() async{
    checkBalanceAmount = await moneyOut();
    print(checkBalanceAmount);
  }
  Future<void> check() async{
    totalBalanceAmount = await moneyCheck();
    print(totalBalanceAmount);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailWalletScreen()),
                );
              },
              child: _cardWalletBalance(context,
                  total: '\$ $totalBalanceAmount',
                  totalCrypto: '7.251332 CRD',
                  precent: 7.999),
            ),
            _cardWalletBalance(context,
                total: '\$ $checkBalanceAmount',
                totalCrypto: '5.251332 DEB',
                precent: -2.999),
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sorted by higher %',
                  style: TextStyle(color: Colors.black45)),
              Row(children: const [
                Text(
                  '24H',
                  style: TextStyle(color: Colors.black45),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.black45),
              ])
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    child: _listCryptoItem(
                      iconUrl:
                          'https://i.pinimg.com/originals/0d/e4/1a/0de41a3c5953fba1755ebd416ec109dd.gif',
                      totalDebitCredit: 'Credited',
                      myBalance: '\$ $futureAlbum',
                      myProfit: '\$19.153',
                      precent: 4.32,
                    ),
                  ),
                  GestureDetector(
                    child: _listCryptoItem(
                      iconUrl:
                          'https://cdn.dribbble.com/users/1303437/screenshots/3202506/multiple-cards-800x600_2.gif',
                      totalDebitCredit: 'Debited',
                      myBalance: '\$ $checkBalanceAmount',
                      myProfit: '\$4.822',
                      precent: per,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              reduce();
                              // check();
                            });
                          },
                          child: _cardButton(text: 'Send')),
                      const SizedBox(
                        width: 18.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              test();
                              // check();
                            });
                          },
                          child: _cardButton(text: 'Receive')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _cardButton({required String text}) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        width: 150,
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Widget _cardWalletBalance(BuildContext context,
      {required String total, totalCrypto, required double precent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: card(
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Material(
                    color: Colors.black87,
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: const SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.white,
                            size: 25.0,
                          )),
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Text('Total Wallet Balance',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: const [
                    Text('USD'),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                )
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  total,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black87),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      color: precent >= 0 ? Colors.green : Colors.pink,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: Text(
                    precent >= 0 ? '+ $precent %' : '$precent %',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              '$totalCrypto',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black38),
            ),
            const Center(
              child: Icon(Icons.keyboard_arrow_down,
                  size: 30, color: Colors.black45),
            )
          ],
        ),
      ),
    );
  }

  Widget _listCryptoItem(
      {required String iconUrl,
      double precent = 0,
      required String totalDebitCredit,
      myBalance,
      myProfit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(iconUrl, width: 95, height: 90, fit: BoxFit.fill),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    totalDebitCredit,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '$myProfit',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$myBalance',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  precent >= 0 ? '+ $precent %' : '$precent %',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: precent >= 0 ? Colors.green : Colors.pink,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
