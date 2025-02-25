import 'package:flutter/material.dart';
import 'package:balance_app/pages/screens/BalanceAppScreen.dart'; // Corrected the file name import
import 'package:balance_app/widgets/BalancePluseCard.dart';
import 'package:balance_app/widgets/CommonTextButton.dart';
import 'package:balance_app/pages/screens/BalanceTabScreen.dart';

class WhoWeAreScreen extends StatelessWidget {
   final PageController _pageController1 = PageController(initialPage:0);
    final PageController _pageController2 = PageController(initialPage:0);
    final PageController _pageController3 = PageController(initialPage:0);
    final PageController _pageController4 = PageController(initialPage:0);
    final PageController _pageController5 = PageController(initialPage:0);
    final PageController _pageController6 = PageController(initialPage:0);
    final PageController _pageController7 = PageController(initialPage:0);


     final PageController _pageController8 = PageController(initialPage:0);
     final PageController _pageController9 = PageController(initialPage:0);
      final PageController _pageController10 = PageController(initialPage:0);
       final PageController _pageController11 = PageController(initialPage:0);
        final PageController _pageController12 = PageController(initialPage:0);
         final PageController _pageController13 = PageController(initialPage:0);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
  leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BalanceAppScreen()),
      );
    },
  ),
  title: Text(
    'Who we are',
    style: TextStyle(color: Colors.white, fontSize: 18),
  ),
  backgroundColor: Color(0xFF0b5369),
  centerTitle: true,
  bottom: PreferredSize(
    preferredSize: Size.fromHeight(60.0), // Increase height for margin effect
    child: Padding(
      padding: EdgeInsets.only(bottom: 15.0), // Add bottom margin
      child: Container(
        width: 330, // Reduce width
        height: 46, // Reduce height
        decoration: BoxDecoration(
          color: const Color(0xFF04424F), // Dark teal
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
            bottom: Radius.circular(25),
          ),
        ),
         child: Material( // Add this to remove the default tab underline
      color: Colors.transparent, // Keep background same as container
        child: TabBar(
         // Change the color if needed
         dividerColor: Colors.transparent,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          indicator: BoxDecoration(
            color: Color(0xFFf8e7ef),

            borderRadius: BorderRadius.circular(25),
          ),
          indicatorPadding: EdgeInsets.symmetric(horizontal: -32.0, vertical: 1.0),
          labelColor: const Color(0xFF1E5D73),
          labelPadding: EdgeInsets.only(right: 10),
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          tabs: [
            Tab(text: 'About the app'),
            Tab(text: "What's balance+?"),
          ],
          isScrollable: false,
          indicatorSize: TabBarIndicatorSize.label
        ),
      ),
      ),
    ),
  ),
),
backgroundColor: Color(0xFFFAF9FF),

        body: TabBarView(
          children: [
            // Tab 1 Content
            SingleChildScrollView( // Wrap this part with SingleChildScrollView
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xFF1E5D73),
                      ),
                      children: [
                        TextSpan(text: 'Our mission at balance is to make\nmenopause support '),
                        TextSpan(text: 'inclusive', style: TextStyle(color: Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                        TextSpan(text: ' and\n'),
                        TextSpan(text: 'accessible', style: TextStyle(color: Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                        TextSpan(text: ' for all, so the main part\nof the app is'),
                        TextSpan(text: ' free!', style: TextStyle(color: Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 22),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xFF1E5D73),
                      ),
                      children: [
                        TextSpan(text: 'We then introduced '),
                        TextSpan(text: 'balance+', style: TextStyle(color: Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                        TextSpan(text: ' as\nan optional '),
                        TextSpan(text: 'premium subscription\n', style: TextStyle(color: Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                        TextSpan(text: 'that offers a more personalised\nExperience. All this revenue goes\n'),
                        TextSpan(text: 'towards keeping the main part of\nthe app free.'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'So, what can you do for free?',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E5D73)),
                  ),

                  SizedBox(height: 20),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController1,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
      Icon(
        Icons.menu_book_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(width: 26),
      RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
                text: 'Explore \n',
                style: TextStyle(
                    color: const Color(0xFF1E5D73),
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'hundreds of \n',
                style: TextStyle(
                    color: const Color(0xFF1E5D73),
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'expert ',
                style: TextStyle(
                    color: const Color(0xFF1E5D73),
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'articles',
                style: TextStyle(
                    color: const Color(0xFF04b6ae),
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController1.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),

                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.menu_book_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Dive into our extensive library of\n expert content. Find out info about\n HRT, treament options, and how you\n can manage your symptoms.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController1.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                   
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),

                  // SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 270, // Define a height for the PageView
                child: PageView(
        controller: _pageController2,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                            children: [
                              TextSpan(text: 'Keep track of \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'your ', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'symptoms', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController2.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),

                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.calendar_today_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Menopause can be tricky to\n identify. By tracking symptoms\n daily, you can better manage your\n health and wellbeing by pinpointing\n your needs.',
              style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController2.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),

                  // SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController3,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                           children: [
                              TextSpan(text: 'Generate a          \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'health report  ', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController3.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),
                   
                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.assignment_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Fast track your care by generating\n your own balance health report to\n take to GP appointments.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController3.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),


                  // SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController4,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                          children: [
                              TextSpan(text: 'Be part of a        \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'Supportive \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'community', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController4.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),
                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.groups_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Fast track your care by generating\n your own balance health report to\n take to GP appointments.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child:  CommonTextButton(
  onPressed: () {
    _pageController4.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),
//  SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController5,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                           children: [
                              TextSpan(text: 'Keep an eye on \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'your ', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'mental \n', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'health', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],

                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController5.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),
                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.groups_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Fast track your care by generating\n your own balance health report to\n take to GP appointments.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController5.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),
//  SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController6,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                           children: [
                              TextSpan(text: 'Take part in      \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'community \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'experiments', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController6.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),
                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.groups_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Fast track your care by generating\n your own balance health report to\n take to GP appointments.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController6.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),
//  SizedBox(height: 10),
                  Center(
              child: SizedBox(
                height: 260, // Define a height for the PageView
                child: PageView(
        controller: _pageController7,
        children: [
          // First Page: "Read More" Content
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          color: const Color(0xFF1E5D73),
                          size: 46,
                        ),
                        SizedBox(width: 26),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 30, color: Colors.black, height: 1.5),
                         children: [
                              TextSpan(text: 'Monitor your     \n', style: TextStyle(color: const Color(0xFF1E5D73), fontWeight: FontWeight.bold)),
                              TextSpan(text: 'community', style: TextStyle(color: const Color(0xFF04b6ae), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController7.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Read more',
),
                  ),
              ],
            ),
          ),
          // Second Page: "Back" Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
    crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
    children: [
      Icon(
        Icons.groups_outlined,
        color: const Color(0xFF1E5D73),
        size: 46,
      ),
      SizedBox(height: 16), // Space between icon and text
      RichText(
        textAlign: TextAlign.center, // Center the text
        text: TextSpan(
          style: TextStyle(fontSize: 17, color: Colors.black, height: 1.5),
          children: [
            TextSpan(
              text: 'Fast track your care by generating\n your own balance health report to\n take to GP appointments.',
               style: TextStyle(
                color: const Color(0xFF1E5D73),
              ),
            ),
            
          ],
        ),
      ),
    ],
  ),
),

            
                 SizedBox(height: 8),
                  Center(
                    child: CommonTextButton(
  onPressed: () {
    _pageController7.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  },
  text: 'Back',
),
                  ),
              ],
            ),
          ),
        ],
                ),
              ),
      ),


                   SizedBox(height: 20),
                  Container(
                    height: 1100,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                colors: [Color(0xFF3739c0), Color(0xFF3739c0).withOpacity(0.4)],
                                // colors: [Color(0xFF8E87D5), Colors.purple.withOpacity(0.4)],
                                // 0xFF3739c0
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                         Positioned(
                          top: 16,
                          left: 16,
                          right: 16,
                          child:
                        Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 35, color: Colors.black, height: 1.5),
                            children: [
                              TextSpan(text: 'Introducing  \n balance+     \n', style: TextStyle(color:  Color(0xFFDDC494), fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        //  SizedBox(height: 10),
                       
                      ],
                    ),
                  ),
                         ),
    Positioned(
  top: 156,
  left: 16,
  right: 16,
  child: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 17, color: Colors.white, height: 1.5),
            children: [
              TextSpan(
                text: 'As well as the free part of the app,\nwe introduced a premium option\nthat gives a more holistic and\npersonalised experience.\n\nNot only does Balance+ give you\naccess to unparalleled premium\ncontent, but by subscribing, you\nare also helping to keep the main\npart of the app free for those \nwho aren’t able to pay.\n\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // SizedBox(height: 4.0),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Prevent scrolling if inside another scrollable widget
          children: [
                Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline, color: Color(0xFFDDC494), size:26),
                SizedBox(width: 8.0),
             
                Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 17.0, color: Colors.white), // Default text style
          children: [
            TextSpan(
              text: 'Live sessions, ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
            TextSpan(
              text: 'with Dr Louise \nNewson.', // Regular text
            ),
          ],
        ),
      ),
    ),
              ],
            ),
            SizedBox(height: 20.0),
                Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline, color: Color(0xFFDDC494), size: 26),
                SizedBox(width: 8.0),
             
                Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 17.0, color: Colors.white), // Default text style
          children: [
             TextSpan(
              text: 'Access to ', // Regular text
            ),
            TextSpan(
              text: 'video recipes,\nweight management, yoga,\npilates, classes ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
             TextSpan(
              text: 'and more!', // Regular text
            ),
           
          ],
        ),
      ),
    ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline, color: Color(0xFFDDC494), size:26),
                SizedBox(width: 8.0),
             
                Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 17.0, color: Colors.white), // Default text style
          children: [
              TextSpan(
              text: 'Explore', // Regular text
            ),
            TextSpan(
              text: ' expert channels, ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
            TextSpan(
              text: 'to\nget a holistic personalised\nexperience.', // Regular text
            ),
          ],
        ),
      ),
    ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_outline, color: Color(0xFFDDC494), size:26),
                SizedBox(width: 8.0),
                             Expanded(
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 17.0, color: Colors.white), // Default text style
          children: [
              TextSpan(
              text: 'Watch', // Regular text
            ),
            TextSpan(
              text: ' healthcare\nconsultation scenarios, ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
            TextSpan(
               text: 'to\nhelp prepare you for doctor\'s\nvisits.',
            ),
          ],
        ),
      ),
    ),
               
              ],
            ),
            SizedBox(height: 20),
             Center(
                  child: Text(
                    "...And so much more!",
                    style: TextStyle(fontSize: 17.0, color: Colors.white),
                  ),
                ),
            Center(
        child: Image.asset(
          'assets/images/findBalance2.png', // Replace with your saved image path
          height: 160,
          width: 350,
          // fit: BoxFit.cover, // Optional: adjust how the image fits
        ),
      ),

      //  const SizedBox(height: 20),
                  OutlinedButton(
  onPressed: () {
    // Add log-in action
  },
  style: OutlinedButton.styleFrom(
    side: const BorderSide(color: Color(0xFF4C48B7), width: 2), // Border size 2
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 15),
  ),
  child: const Center(
    child: Text(
      'Find out more',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold, // Make text bold
        color: Color(0xFF4C48B7),
      ),
    ),
  ),
),

          ],
        ),
      ],
    ),
  ),
),

               
                      ],
                    ),
                  ),
                 
                  SizedBox(height: 24),
                 
                ],
              ),
            ),
            // Tab 2 Content
            SingleChildScrollView( // Wrap this part with SingleChildScrollView
             padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'balance+ is an optional premium\nsubscription that unlocks more\ncontent to give you a more holistic\nand personalised experience. The\nrevenue we earn from subscriptions\nis used to keep the lights on for the \nfree app for those who aren’t able\nto pay.',
                     style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                        color: Color(0xFF1E5D73),
                      ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'So, what does balance+ include?',
                    style: TextStyle(fontSize: 20, height: 1.5, fontWeight: FontWeight.bold, color: Color(0xFF1E5D73)),
                  ),
                  SizedBox(height: 40),

BalancePluseCard(
   imagePath: 'assets/images/profile.png',
  richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 28.0, color: Colors.white), // Default text style
          children: [
            TextSpan(
              text: 'Live sessions ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
            TextSpan(
               text: 'with\nDr. Louise Newson',
            ),
          ],
        ),
      ),
       onPressed: () {
                        _pageController8.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },

  pageController:_pageController8,
  textVal: 'Join our founder, Dr.\nLouise Newson in regular\nlive sessions featuring\nhandpicked guests, and\nexperts in the menopause.'
  ),
  SizedBox(height: 26),
  BalancePluseCard(
   imagePath: 'assets/images/profile.png',
    richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 26.0, color: Colors.white), // Default text style
          children: [
              TextSpan(
              text: 'Cook along with\n', // Regular text
            ),
            TextSpan(
              text: 'recipe videos',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
            
          ],
        ),
      ),
       onPressed: () {
                        _pageController9.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
  pageController:_pageController9,
  textVal: 'Not sure which foods help\nor hinder your symptoms?\nJoin our nutrition experts for\nplenty of cooking inspiration,\nrecipes, and helpful advice.'
  ),
    SizedBox(height: 26),
  BalancePluseCard(
   imagePath: 'assets/images/profile.png',
    richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 26.0, color: Colors.white), // Default text style
          children: [
             TextSpan(
              text: 'Pilates',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
              TextSpan(
              text: ',', // Regular text
            ),
            TextSpan(
              text: 'yoga',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
               TextSpan(
              text: 'and\nguided ', // Regular text
            ),
             TextSpan(
              text: 'meditation\n',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
             TextSpan(
              text: 'sessions', // Regular text
            ),
            
          ],
        ),
      ),
       onPressed: () {
                        _pageController10.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
  pageController:_pageController10,
  textVal: 'Prioritise your health and\nwellbeing with access to\nexclusive exercise and\nwellbeing sessions with our\nbalance experts.'),
    SizedBox(height: 26),
  BalancePluseCard(
   imagePath: 'assets/images/profile.png',
    richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 26.0, color: Colors.white), // Default text style
          children: [
             TextSpan(
              text: 'Nutrition\n',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
              TextSpan(
              text: 'and ', // Regular text
            ),
            TextSpan(
              text: 'weight',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
             TextSpan(
              text: '\nmanagement', // Regular text
            ),
            
          ],
        ),
      ),
       onPressed: () {
                        _pageController11.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
  pageController:_pageController11,
  textVal: 'Take back control of your\nbody! Learn more about\nthe ways that nutrition can\n improve your symptoms\nand weight changes in\nmenopause.'),
    SizedBox(height: 26),
  BalancePluseCard(
   imagePath: 'assets/images/profile.png',
    richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 26.0, color: Colors.white), // Default text style
          children: [
            
            TextSpan(
              text: 'Consultation\nexample ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
              TextSpan(
              text: 'videos', // Regular text
            ),
            
          ],
        ),
      ),
       onPressed: () {
                        _pageController12.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
  pageController:_pageController12,
  textVal: 'Watch our recreations of\na wide range of real-life\nconsultations to help you\nbetter prepare yourself for\nyour next GP appointment.' ),
    SizedBox(height: 26),
  BalancePluseCard(
   imagePath: 'assets/images/profile.png',
    richText: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 26.0, color: Colors.white), // Default text style
          children: [
            
            TextSpan(
              text: 'Sexual health ',
              style: TextStyle(fontWeight: FontWeight.bold,  color: Color(0xFFDDC494)), // Apply bold to this part
            ),
              TextSpan(
              text: 'and\npelvic floor experts', // Regular text
            ),
            
          ],
        ),
      ),
       onPressed: () {
                        _pageController13.animateToPage(
                          1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
  pageController:_pageController13,
  textVal: 'Revive your confidence,\nrebuild your relationship\nwith your body. Menopause can be a very frustrating,\nuncomfortable and confusing\ntime when it comes to sexual\nhealth. Our handpicked\nexperts are here to heip!'
   ),
    SizedBox(height: 10),
Center(
        child: Image.asset(
          'assets/images/findBalance1.jpg', // Replace with your saved image path
          height: 150,
          width: 450,
          // fit: BoxFit.cover, // Optional: adjust how the image fits
        ),
      ),
              SizedBox(height: 16),
             
         
                ],
              ),
            ),
          ],
        ),
bottomNavigationBar: Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Color(0xFFFAF9FF), // Background color
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BalanceTabScreen()),
      );
    },
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 50),
      backgroundColor: const Color(0xFF3739c0),
    ),
    child: Text(
      'Create my free account!',
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  ),
),


      ),
    );
  }
  
}

