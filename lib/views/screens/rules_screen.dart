import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotlight/constants.dart';
import 'package:spotlight/views/screens/home_screen.dart';
import 'package:spotlight/views/widgets/navigation.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({Key? key}) : super(key: key);

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  // bool isShown
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 0)).then((_) {
      showModalBottomSheet<dynamic>(
          isDismissible: false,
          isScrollControlled: true,
          context: context,
          builder: (builder) {
            return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  SliderTransition(HomeScreen(idx: 0)));
                            },
                            child: SvgPicture.asset(
                              'assets/cross.svg',
                              height: 20,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset('assets/spotlight.svg'),
                      Text('Welcome to Spotlight',
                          style: h3.copyWith(color: Colors.red)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Before you start, Let\s go over out community rules: ',
                        style: h3.copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ListTile(
                        title: Text(
                            'Keep it clean, no hate speech,harassment, scamming or breaking the law'),
                      ),
                      const ListTile(
                        title: Text('Keep it fresh, no content copying'),
                      ),
                      // Expanded(child: child)
                      Spacer(),
                      Text('A Shaikh Afroz product'),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              SliderTransition(HomeScreen(idx: 0)));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'I agree',
                              style: h3.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: appRed),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height - 40,
                width: MediaQuery.of(context).size.width);
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
