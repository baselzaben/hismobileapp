import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hismobileapp/UI/profile.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import '../GlobalVar.dart';
import '../HexaColor.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/HospitalInfo.dart';
import '../provider/LoginProvider.dart';
import '../provider/Them.dart';
import '../provider/languageProvider.dart';
import '../widget/Widgets.dart';
import 'Home.dart';
import 'Settings.dart';
import 'package:http/http.dart' as http;

class HospitalInfoS extends StatefulWidget {
  @override
  State<HospitalInfoS> createState() => _HospitalInfoSState();
}

class _HospitalInfoSState extends State<HospitalInfoS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.00122;
    var stops = [ 0.0, 1.00];
    var LanguageProvider = Provider.of<Language>(context, listen: false);
    var ThemP = Provider.of<Them>(context, listen: false);

    return Stack(children: <Widget>[
      Image.asset(
        "assets/backgroundhinfo.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            selectedItemColor: HexColor(Globalvireables.white),
            unselectedItemColor: Colors.white,
            backgroundColor: HexColor(ThemP.getcolor()),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: LanguageProvider.Llanguage('settings'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: LanguageProvider.Llanguage('Home')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: LanguageProvider.Llanguage('HospitalInfoS')
              ),
            ],
            iconSize: 30 * unitHeightValue,
            unselectedFontSize: 12 * unitHeightValue,
            selectedFontSize: 16 * unitHeightValue,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            selectedIconTheme:
            IconThemeData(color: HexColor(Globalvireables.white)),
            onTap: _onItemTapped,
          ),

          appBar: AppBar(
            backgroundColor: Colors.white,
            bottomOpacity: 800.0,
            elevation: 4.0,
            title: Widgets.Appbar(context,LanguageProvider.Llanguage('HospitalInfoS') , unitHeightValue,LanguageProvider.langg,LanguageProvider.getDirection()),
         ),
          backgroundColor: HexColor(ThemP.getcolor()),
          // backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/1.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  HexColor((Globalvireables.secondcolor)), HexColor((ThemP.getcolor()))
                ],
                stops: stops,
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: SafeArea(

              child: Container(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.24,
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage("assets/background.png"),
                      fit: BoxFit.cover,
                    ),

                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(40.0)),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                     children: [



 FutureBuilder(
                         future: getHospitalInf(context),
                         builder: (BuildContext context,
                             AsyncSnapshot<List<HospitalInfo>> snapshot) {
                           if (snapshot.hasData) {
                             List<HospitalInfo>? Doctors = snapshot.data;
                             return Column(
                               children: [
                                 SizedBox(
                                   width: 200,
                                   height: 200,
                                   child: Image(
                                       image: new AssetImage(
                                           "assets/newlogo.png")),
                                 ),
                                 Text(LanguageProvider.getLanguage()=='AR'? Doctors![0].desCA.toString():Doctors![0].desCE.toString(),
                                   style: TextStyle(
                                       fontWeight: FontWeight.w700,
                                       color: HexColor(Globalvireables
                                           .black),
                                       fontSize:
                                       18 *
                                           unitHeightValue),),
                                 SizedBox(
                                   height: 30,
                                 ),


                                 Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.circular(10),
                                     // if you need this
                                     side: BorderSide(
                                       width: MediaQuery.of(context)
                                           .size
                                           .height,
                                       //  color: Colors.black12.withOpacity(0.1),
                                     ),
                                   ),
                                   child: Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(10),
                                         child: Icon(
                                           Icons.location_on,
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(10),
                                         child: Center(child: Text(LanguageProvider.getLanguage()=='AR'? Doctors![0].addresSEXPA.toString():Doctors![0].addresSEXPE.toString(),
                                           style: TextStyle(
                                               fontWeight: FontWeight.w700,
                                               color: HexColor(Globalvireables
                                                   .black),
                                               fontSize:
                                               18 *
                                                   unitHeightValue),),),
                                       ),
                                     ],
                                   ),

                                 )
,
                                 Card(
                                   shape: RoundedRectangleBorder(
                                     borderRadius:
                                     BorderRadius.circular(10),
                                     // if you need this
                                     side: BorderSide(
                                       width: MediaQuery.of(context)
                                           .size
                                           .height,
                                       //  color: Colors.black12.withOpacity(0.1),
                                     ),
                                   ),
                                   child: Row(
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.all(10),
                                         child: Icon(
                                           Icons.email,
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(10),
                                         child: Center(child: Text(LanguageProvider.getLanguage()=='AR'? Doctors![0].email.toString():Doctors![0].email.toString(),
                                           style: TextStyle(
                                               fontWeight: FontWeight.w700,
                                               color: HexColor(Globalvireables
                                                   .black),
                                               fontSize:
                                               18 *
                                                   unitHeightValue),),),
                                       ),
                                     ],
                                   ),

                                 )
,
                                 GestureDetector(
                                   onTap: () async {
                                     String url="tel:+"+Doctors![0].phonE1.toString();
                                     if (await canLaunch(url)) {
                                     launch(url);
                                     } else {
                                     throw "Could not launch $url";
                                     }
                                   },
                                   child: Card(
                                     shape: RoundedRectangleBorder(
                                       borderRadius:
                                       BorderRadius.circular(10),
                                       // if you need this
                                       side: BorderSide(
                                         width: MediaQuery.of(context)
                                             .size
                                             .height,
                                         //  color: Colors.black12.withOpacity(0.1),
                                       ),
                                     ),
                                     child: Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Icon(
                                             Icons.phone,
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Center(child: Text(LanguageProvider.getLanguage()=='AR'? Doctors![0].phonE1.toString():Doctors![0].phonE1.toString(),
                                             style: TextStyle(
                                                 fontWeight: FontWeight.w700,
                                                 color: HexColor(Globalvireables
                                                     .black),
                                                 fontSize:
                                                 18 *
                                                     unitHeightValue),),),
                                         ),
                                       ],
                                     ),
                                   ),
                                 )
,
                                 GestureDetector(
                                   onTap: (){
                                     openUrl(Doctors![0].websitEADDRESS.toString().trim());

                                   },
                                   child: Card(
                                     shape: RoundedRectangleBorder(
                                       borderRadius:
                                       BorderRadius.circular(10),
                                       // if you need this
                                       side: BorderSide(
                                         width: MediaQuery.of(context)
                                             .size
                                             .height,
                                         //  color: Colors.black12.withOpacity(0.1),
                                       ),
                                     ),
                                     child: Row(
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Icon(
                                             Icons.link,
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.all(10),
                                           child: Container(
                                             width: MediaQuery.of(context).size.width/1.5,
                                             child: Center(child: Text(LanguageProvider.getLanguage()=='AR'? Doctors![0].websitEADDRESS.toString():Doctors![0].websitEADDRESS.toString(),
                                               style: TextStyle(
                                                   fontWeight: FontWeight.w700,
                                                   color: HexColor(Globalvireables
                                                       .black),
                                                   fontSize:
                                                   18 *
                                                       unitHeightValue),),),
                                           ),
                                         ),
                                       ],
                                     ),

                                   ),
                                 ),

SizedBox(height: 30,),
                                 Center(
                                   child: Row(children: [
Spacer(),
                           GestureDetector(
                           onTap: (){

                             openUrl(Doctors![0].Facebook.toString().trim());

                           },
                                       child: Image.asset(
                                         "assets/facebook.png",
                                         height: 70,
                                         width: 70,
                                       ),
                                     ),
                                     Spacer(),

                                     GestureDetector(
                                       onTap: (){

                                         openUrl(Doctors![0].Twitter.toString().trim());

                                       },
                                       child: Image.asset(
                                         "assets/twitter.png",
                                         height: 70,
                                         width: 70,
                                       ),
                                     ),


                                     Spacer(),





                                   ],),
                                 ),


                                 Container(
                                   padding: EdgeInsets.all(10),
                                   child: Card(
                                     
                                       child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Spacer()
,
                                             Text(
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.w900,
                                                     color: HexColor(Globalvireables
                                                         .black),
                                                     fontSize:
                                                     18 * unitHeightValue),
                                               " مستشفى ماركا التخصصي"
                                           ),
                                           ],
                                         ),
                                         SizedBox(height: 10,),
                                         Text(
                                             textAlign: TextAlign.right,
                                             style: TextStyle(
                                                 fontWeight: FontWeight.w300,
                                                 color: HexColor(Globalvireables
                                                     .black),
                                                 fontSize:
                                                 16 *
                                                     unitHeightValue),

                                                 "مستشفى ماركا التخصصي، الذي يعود تأسيسه الى عام ١٩٨٢، هو من اعرق المستشفيات الموجودة في شرق عمان وتحديدا في منطقة ماركا طاقة المستشفى السريرية تبلغ 50 سرير مع وجود خطة للتوسعة من خلال استحداث مبنى عيادات خارجية خلال السنوات المقبلة. وللمستشفى سمعة مرموقة في العمليات الجراحية المختلفة و التي تجرى بأحدث الأجهزة الطبية ذات المنشأ الأمريكي و الأوروبي بمواصفات عالية الجودة ، و استحداث وحدة القلب و القسطرة التداخلية وكذلك مركز جراحة السمنة وتكميم المعدة  أطلق على المستشفى اسم مستشفى ماركا التخصصي لأن إدارته ارتقت على كل أن يكون مستشفى ريادي في التخصصات المتاحة وذلك لضمان مستوى متقدم من الخدمة الطبية يضاهي فيها المستشفيات من شتى أنحاء الوطن العربي  يقدم المستشفى خدماته الطبية للمواطنين وكذلك يقصده كثير من مرضى الدول المجاورة وقد تمّ تجهيز المستشفى بأفضل وأحدث المرافق من حيث العلاج والمعدات والتشخيص، إلى جانب تسليم قيادة الدفة إلى فريق عمل طبي واختصاصيين متميزين  كما يستعد مستشفى ماركا التخصصي لدخول حقبة جديدة في مجال الرعاية الصحية من خلال حصوله على اعتمادية الايزو 9001 والعمل الدؤوب للحصول على اعتمادية مجلس اعتماد المؤسسات الصحية(HCAC) خلال عام 2019."
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 SizedBox(height: 20,),
                                 Container(
                                   padding: EdgeInsets.all(10),
                                   child: Card(

                                     child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Spacer()
                                             ,
                                             Text(
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.w900,
                                                     color: HexColor(Globalvireables
                                                         .black),
                                                     fontSize:
                                                     18 * unitHeightValue),
                                                 "كلمة المدير العام"
                                             ),
                                           ],
                                         ),
                                         SizedBox(height: 10,),
                                         Text(
                                             textAlign: TextAlign.right,
                                             style: TextStyle(
                                                 fontWeight: FontWeight.w300,
                                                 color: HexColor(Globalvireables
                                                     .black),
                                                 fontSize:
                                                 16 *
                                                     unitHeightValue),

"اهلا و سهلا بكم في مستشفى ماركا التخصصي ، الذي يعد من اعرق المستشفيات على مستوى المنطقة  ايماناً منا بأهمية توفير بيئة رعاية صحية آمنة، والالتزام بأعلى معايير ممكنة للجودة وتتويجا لتوجيهات جلالة الملك المعظم عبد الله بن الحسين، وتعليمات معالي وزير الصحة بضرورة العمل على راحة المستفيدين وصحتهم الجسدية والنفسية نحرص على مضاعفة جهودنا و خدماتنا من أجل استكمال مسيرتنا لتحقيق رسالتنا و رؤيتنا و غاياتنا المنشودة، وذلك من خلال منظومة عمل جماعي تعتمد تطبيق أحدث ما توصل اليه العلم و الاستعانة بأفضل الاجهزة المتطورة و المعدات الطبية الحديثة و توظيف النخبة من الكوادر الطبية و الفنية، إضافة الى التواصل مع المستفيدين من الخدمات الصحية ومشاركتهم في تقييم الخدمة من أجل التحسين المستمر.  إن جعل زيارتكم وإقامتكم بالمستشفى الأكثر راحة واستفادة تأتي في أولويات جميع العاملين بمستشفى ماركا التخصصي بكافة كوادرهم الفنية والإدارية، وهذا التواصل يؤدي إلى أقصى درجات النجاح للعناية بكم.  وهنا يسرني ويسعدني نيابة عن كافة طاقم المستشفى أن أرحب بجميع زوار الموقع الذي يقدم أفضل الخدمات الصحية وفق جودة عالية . أسأل الله العلي القدير أن يوفقنا جميعا ً لما فيه خدمة المرضى والمراجع"                                         ),
                                       ],
                                     ),
                                   ),
                                 ),

                                 SizedBox(height: 20,),
                                 Container(
                                   padding: EdgeInsets.all(10),
                                   child: Card(

                                     child: Column(
                                       children: [
                                         Row(
                                           children: [
                                             Spacer()
                                             ,
                                             Text(
                                                 textAlign: TextAlign.right,
                                                 style: TextStyle(
                                                     fontWeight: FontWeight.w900,
                                                     color: HexColor(Globalvireables
                                                         .black),
                                                     fontSize:
                                                     18 * unitHeightValue),
                                                 "رسالتنا"
                                             ),
                                           ],
                                         ),
                                         SizedBox(height: 10,),
                                         Text(
                                             textAlign: TextAlign.right,
                                             style: TextStyle(
                                                 fontWeight: FontWeight.w300,
                                                 color: HexColor(Globalvireables
                                                     .black),
                                                 fontSize:
                                                 16 *
                                                     unitHeightValue),

"تقديم خدمات طبية شاملة ضمن اعلى معايير الجودة لسكان المنطقة و ما حولها من خلال توفير بيئة علاج صحية و متكاملة و استخدام احدث التقنيات و استقطاب افضل الكفاءات .  "                     )                  ],
                                     ),
                                   ),
                                 )
                               ],


                             );
                           } else {
                             return Center(
                                 child: CircularProgressIndicator());
                           }
                         },
                       ),


                      /* Center(
                         child: Container(
                             decoration: BoxDecoration(

                               image: DecorationImage(
                                 image: AssetImage("assets/background.png"),
                                 fit: BoxFit.cover,),
                               borderRadius: BorderRadius.only(
                                   topRight: Radius.circular(0.0),
                                   bottomRight: Radius.circular(29.0),
                                   topLeft: Radius.circular(0.0),
                                   bottomLeft: Radius.circular(29.0)),
                             ),
                             width:
                             MediaQuery.of(context).size.width / 2.3,
                             height:
                             MediaQuery.of(context).size.width / 2.3,
                             child: Image(
                                 image: new AssetImage(
                                     "assets/esraalogo.png"))),
                       ),*/

                     ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    ]);
  }
  _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nav[index]),);
    });
  }
  int selectedIndex = 1;

  final List<Widget> nav = [
    Settings(),
    Home(),
    profile(),
  ];


  Future<List<HospitalInfo>> getHospitalInf(BuildContext context) async {
    var LanguageProvider = Provider.of<Language>(context, listen: false);

    var Loginprovider = Provider.of<LoginProvider>(context, listen: false);
    var ip= Loginprovider.getFirebaseIp().toString();


    Uri postsURL =
    Uri.parse(ip+Globalvireables.HospitalInfoURL);
    try {
      http.Response res = await http.post(
        postsURL,
      );

      if (res.statusCode == 200) {
        print("Doctors" + res.body.toString());

        List<dynamic> body = jsonDecode(res.body);

        List<HospitalInfo> Doctors = body
            .map(
              (dynamic item) => HospitalInfo.fromJson(item),
        )
            .toList();

print("facebookAPI "+Doctors[0].Facebook.toString());

        return Doctors;
      } else {
        throw "Unable to retrieve Doctors.";
      }
    } catch (e) {
      await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('بيانات الأطباء'),
          content: Text(e.toString()),
          actions: <Widget>[],
        ),
      );
    }

    throw "Unable to retrieve Doctors.";
  }
  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);

    print("urrri "+url);

    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }
  }

}
