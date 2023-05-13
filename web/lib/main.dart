import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUAT IEEE SB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List _isHovering = [false, false, false, false];
  final List appbarlist = ["Activities", "Members", "Events"];
  final List thumbnailimages = [
    "images/IMG_20221031_115447_085.jpeg",
    "images/IMG_4760.JPG",
    "images/IEEE_SB_brand_small.png",
  ];
  final List<String> activityimages = [
    "images/22771349.png",
    "images/22987927.png",
    "images/22171414.jpg",
  ];
  final List<String> activitytitles = [
    "ミーティング",
    "勉強会",
    "イベント",
  ];
  final List<String> activitytexts = [
    "週に1度のペースでSB役員を中心にメンバーがオンサイトで集まり活動予定やイベントの企画について話し合っています。",
    "月に1度のペースでメンバー各自が興味を持った議題について持ち寄りプレゼンター担当を交代しながら議論しています。",
    "不定期で技術に関するイベントを開催している他、外部の団体が開催するイベントにも参加しています。",
  ];
  /* メンバー[役職、名前、画像]*/
  final List<List<String>> memberlists = [
    ["Chair", "Shogo Takata", "images/profiel.png"],
    ["Vice Chair", "Hisao Usui", "images/profiel.png"],
    ["Secretary", "Nao Sato", "images/profiel.png"],
    ["Treasure", "Ryota Genseki", "images/profiel.png"],
    ["Member", "Takegami", "images/profiel.png"],
    ["Member", "Sotaro Isomoto", "images/profiel.png"],
    ["Member", "Shunpei Takenaka", "images/profiel.png"],
  ];

  final List<List<String>> eventlists = [
    [
      "C言語 Workshop",
      "1年生やプログラミング初学者に向けてプログラミングでつまづきがちな環境構築やデバッグ方法について説明を行います。",
      "images/unknown.png"
    ],
    [
      "LaTexワークショップ",
      "研究室配属前の3年生に対してマークアップ言語LaTexを用いた文書作成についてオンラインエディタのOverleafを使った講習会を行います。",
      "images/latex.png"
    ],
    [
      "テクニカルワークショップ",
      "主にSB内部のメンバーで新たなプログラミング言語やデバイスを用いてチュートリアルの成果物を作成します。",
      "images/raspi_color.png"
    ],
    [
      "LT大会",
      "他大学SBと連携して一人当たり5分の持ち時間で情報技術に関するピッチコンテストを開催します。質疑応答の場面などを利用して意見交換などが活発に行われます。",
      "images/IMG_4761.JPG"
    ],
    ["and more ...", "", "images/TUATIEEElogo.png"]
  ];

  final List<List<String>> newslists = [
    [
      "合同LaTexワークショップを開催します。",
      "2023-05-14",
      "東京理科大学と関西大学、青山学院大学のStudent Branchと共同でLatexワークショップを開催します。アカリクの講師をお招きして講習を行います。"
    ],
    [
      "技育博に参加します。",
      "2023-05-14",
      "渋谷ソラスタにて開催される技育博に@はだしのげんちゃんΩと@S4stosh1が参加します。",
    ],
    [
      "@shunrinによる勉強会を開催しました。",
      "2023-05-09",
      "自作ファイルブラウジングシステムについて発表しました。",
    ],
    [
      "@Tomoによる勉強会を開催しました。",
      "2023-05-02",
      "初めての発表でした。",
    ],
    [
      "@ABC.ioによる勉強会を開催しました。",
      "2023-04-25",
      "neewscontents",
    ],
    [
      "@Sugarによる勉強会を開催しました。",
      "2023-04-22",
      "newscontens",
    ],
    [
      "新入生オリエンテーションにて発表しました。",
      "2023-04-20",
      "2023年度入学の新入生に対しIEEE Student Branchの活動を紹介しました。",
    ],
    [
      "@はだしのげんちゃんΩによる勉強会を開催しました。",
      "2023-04-15",
      "newscontens",
    ],
    [
      "2022年度卒業生の送別会を開催しました。",
      "2023-03-29",
      "newscontens",
    ],
    [
      "情報処理学会　全国大会に参加しました。",
      "2023-03-04",
      "newscontens",
    ],
    [
      "IEEE Student Branch at TUAT設立10周年記念LT大会を開催しました。",
      "2022-12-17",
      "機会振興会館にてStudent Branchの先輩方を交えたLT大会でした。東京理科大学、関西大学からも参加者がいらっしゃいました。",
    ],
  ];

  ScrollController _scrollController = ScrollController();
  final List<double> _scrollPosition = [0, 1250, 1900, 2600];
  int _imagechanger = 0;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            value
                                ? _isHovering[0] = true
                                : _isHovering[0] = false;
                          });
                        },
                        onTap: () {
                          setState(() {
                            _scrollController.animateTo(
                              0.0,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeOutCirc,
                            );
                          });
                        },
                        child: Text(
                          'TUAT IEEE SB',
                          style: TextStyle(
                            color: _isHovering[0]
                                ? Color.fromARGB(255, 9, 67, 97)
                                : Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      ...Iterable<int>.generate(appbarlist.length).map(
                        (int appbarIndex) => InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[appbarIndex + 1] = true
                                  : _isHovering[appbarIndex + 1] = false;
                            });
                          },
                          onTap: () {
                            setState(() {
                              _scrollController.animateTo(
                                _scrollPosition[appbarIndex + 1],
                                duration: Duration(milliseconds: 700),
                                curve: Curves.easeOutCirc,
                              );
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                appbarlist[appbarIndex],
                                style: TextStyle(
                                  color: _isHovering[appbarIndex + 1]
                                      ? Colors.blue[200]
                                      : Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Visibility(
                                maintainAnimation: true,
                                maintainState: true,
                                maintainSize: true,
                                visible: _isHovering[appbarIndex + 1],
                                child: Container(
                                  height: 2,
                                  width: 20,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  // image below the top bar
                  height: screenSize.height,
                  width: screenSize.width,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 2000),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(child: child, opacity: animation);
                    },
                    child: Image.asset(
                      thumbnailimages[_imagechanger],
                      key: ValueKey<int>(_imagechanger),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: screenSize.width * 0.15,
                  top: screenSize.height * 0.3,
                  child: Container(
                    height: screenSize.height,
                    width: screenSize.width * 0.5,
                    child: const Text(
                      "Welcome to TUAT IEEE SB Home Page",
                      style: TextStyle(
                        fontSize: 90,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.3),
            Row(
              children: [
                SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: Column(
                    children: [
                      const Text(
                        "IEEE Student Branch とは",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoSansJP'),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          "IEEEの活動組織の一つであり、サークル活動に近い意味合いがあります。学生自ら様々な企画運営ができる他、 他大学のBranchの学生や教職員、社会で活躍している専門家等と会い、学び、また交流することによって、色々なプロジェクト、 会議、見学、旅行等の活動を通して、多くの教育的、技術的、専門的な刺激を得ることができます。",
                          style: TextStyle(
                              fontSize: 20,
                              height: 2.0,
                              color: Colors.black,
                              fontFamily: 'NotoSansJP'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.45,
                  width: screenSize.width * 0.45,
                  child: Image.asset(
                    "images/TUATIEEElogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.3,
            ),
            Center(
              child: Row(
                /*イラストと活動内容3つの紹介部分横並び*/
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...Iterable<int>.generate(activityimages.length).map(
                    (int pageIndex) => Card(
                      child: SizedBox(
                        height: screenSize.height / 1.5,
                        width: screenSize.width / 3.5,
                        child: Column(
                          children: [
                            Container(
                              height: 2,
                              width: screenSize.width / 4,
                              color: Color.fromARGB(255, 219, 218, 218),
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Text(
                              activitytitles[pageIndex],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoSansJP'),
                            ),
                            SizedBox(height: screenSize.height * 0.05),
                            Text(
                              activitytexts[pageIndex],
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'NotoSansJP'),
                            ),
                            SizedBox(height: screenSize.height * 0.07),
                            Expanded(
                              child: Image.asset(
                                activityimages[pageIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                      margin: const EdgeInsets.all(10),
                      elevation: 0, // 影の離れ具合
                      shadowColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.1),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenSize.height,
                  width: screenSize.width,
                  color: Color.fromARGB(255, 233, 232, 232),
                  child: Align(
                    alignment: Alignment(0, -0.9),
                    child: Text(
                      "Members",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenSize.height * 0.1,
                  child: Container(
                    width: screenSize.width,
                    height: screenSize.height * 1.5,
                    child: Wrap(
                      children: [
                        ...Iterable<int>.generate(memberlists.length).map(
                          (int index) => Column(
                            children: [
                              SizedBox(
                                height: screenSize.height * 0.3,
                                width: screenSize.width * 0.25,
                                child: Image.asset(
                                  memberlists[index][2],
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.03),
                              Text(
                                memberlists[index][0],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: screenSize.height * 0.02),
                              Text(
                                memberlists[index][1],
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            /////////////////////////////////////////////////////////////
            //Events erea
            Container(
              padding: const EdgeInsets.all(20),
              height: screenSize.height * 1.3,
              width: screenSize.width,
              child: Column(
                children: [
                  const Text(
                    "Events",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Wrap(
                    children: [
                      ...Iterable<int>.generate(eventlists.length).map(
                        (int eventIndex) => Card(
                          child: SizedBox(
                            height: screenSize.height / 2,
                            width: screenSize.width / 3.5,
                            child: Column(
                              children: [
                                Container(
                                  height: 10,
                                  width: screenSize.width / 14,
                                  color: Color.fromARGB(255, 0, 203, 163),
                                ),
                                SizedBox(height: screenSize.height * 0.02),
                                Text(
                                  eventlists[eventIndex][0],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSansJP'),
                                ),
                                SizedBox(height: screenSize.height * 0.05),
                                Text(
                                  eventlists[eventIndex][1],
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'NotoSansJP'),
                                ),
                                SizedBox(height: screenSize.height * 0.07),
                                Expanded(
                                  child: Image.asset(
                                    eventlists[eventIndex][2],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.white,
                          margin: const EdgeInsets.all(10),
                          elevation: 10, // 影の離れ具合
                          shadowColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /////////////////////////////////////////////////////////////
            //News erea
            Container(
              margin: const EdgeInsets.all(100),
              height: screenSize.height * 0.7,
              width: screenSize.width,
              decoration: BoxDecoration(
                border: const Border(
                  top: const BorderSide(color: Colors.black26, width: 1),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  const Text(
                    "News",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: newslists.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 80,
                            decoration: BoxDecoration(
                              border: const Border(
                                top: const BorderSide(
                                  color: Colors.black26,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  newslists[index][0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoSansJP'),
                                ),
                                Text(
                                  newslists[index][2],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'NotoSansJP'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 7), (timer) {
      setState(() {
        if (_imagechanger < thumbnailimages.length - 1) {
          _imagechanger += 1;
        } else {
          _imagechanger = 0;
        }
      });
    });

    super.initState();
  }
}
