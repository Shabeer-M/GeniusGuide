import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 600;
    final double containerWidth = isWeb ? 500 : MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Container(
                  width: containerWidth,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Animated Logo
                      FlutterLogo(size: 100)
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .scale(delay: 200.ms),
                      SizedBox(height: 30),
                      // Title
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ).animate().slideY(duration: 500.ms, begin: -1),
                      SizedBox(height: 20),
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: -1),
                      SizedBox(height: 20),
                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: 1),
                      SizedBox(height: 30),
                      // Login Button
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: AnimatedContainer(
                          duration: 300.ms,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _isHovered
                                  ? [Colors.purple.shade400, Colors.blue.shade400]
                                  : [Colors.blue.shade400, Colors.purple.shade400],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: _isHovered
                                ? [
                              BoxShadow(
                                color: Colors.blue.shade200,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ]
                                : [],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Logging in...')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 500.ms),
                      SizedBox(height: 20),
                      // Signup Link
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                          // Navigate to signup page
                        },
                        child: Text(
                          'Don\'t have an account? Sign Up',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).animate().fadeIn(delay: 700.ms),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Online Doctor Consultation",
      "description": "Get expert medical advice from certified doctors anytime, anywhere.",
      "image": "https://www.baghospital.com/SysTrack/BlogImage/1/8129dcdd-ee5f-4572-a1e9-e153408f3236.png",
    },
    {
      "title": "Advocate Consultation",
      "description": "Legal solutions and advice from experienced advocates.",
      "image": "https://sp-ao.shortpixel.ai/client/to_auto,q_glossy,ret_img,w_1200/https://lawansweronline.com/wp-content/uploads/2021/01/1610009666684.jpg",
    },
    {
      "title": "Astrologist Consultation",
      "description": "Guidance and predictions from trusted astrologists.",
      "image": "https://astromanch.com/public/storage/images/blog_1051727082927.webp",
    },
    {
      "title": "Software Engineering Assistance",
      "description": "Get help with coding, debugging, and software development.",
      "image": "https://media.excellentwebworld.com/wp-content/uploads/2024/05/27114331/software-development-consulting-services.webp",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 600;
    final double containerWidth = isWeb ? 600 : MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: containerWidth,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // PageView for Onboarding
                    SizedBox(
                      height: 400,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingData.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.network(
                                onboardingData[index]["image"]!,
                                height: 200,
                              )
                                  .animate()
                                  .fadeIn(duration: 500.ms)
                                  .scale(delay: 200.ms),
                              SizedBox(height: 30),
                              Text(
                                onboardingData[index]["title"]!,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade900,
                                ),
                              ).animate().slideY(duration: 500.ms, begin: -1),
                              SizedBox(height: 20),
                              Text(
                                onboardingData[index]["description"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                ),
                              ).animate().slideX(duration: 500.ms, begin: 1),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingData.length,
                            (index) => GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: 500.ms,
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.blue.shade900
                                  : Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Get Started Button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ).animate().fadeIn(delay: 500.ms),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 600;
    final double containerWidth = isWeb ? 500 : MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Container(
                  width: containerWidth,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                        ),
                      ).animate().slideY(duration: 500.ms, begin: -1),
                      SizedBox(height: 20),
                      // Name Field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: -1),
                      SizedBox(height: 20),
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: 1),
                      SizedBox(height: 20),
                      // Phone Field
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: -1),
                      SizedBox(height: 20),
                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: 1),
                      SizedBox(height: 20),
                      // Confirm Password Field
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ).animate().slideX(duration: 500.ms, begin: -1),
                      SizedBox(height: 30),
                      // Sign Up Button
                      MouseRegion(
                        onEnter: (_) => setState(() => _isHovered = true),
                        onExit: (_) => setState(() => _isHovered = false),
                        child: AnimatedContainer(
                          duration: 300.ms,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: _isHovered
                                  ? [Colors.purple.shade400, Colors.blue.shade400]
                                  : [Colors.blue.shade400, Colors.purple.shade400],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: _isHovered
                                ? [
                              BoxShadow(
                                color: Colors.blue.shade200,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ]
                                : [],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Creating account...')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ).animate().fadeIn(delay: 500.ms),
                      SizedBox(height: 20),
                      // Login Link
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(categories: categories),
                            ),
                          );
                          // Go back to login screen
                        },
                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).animate().fadeIn(delay: 700.ms),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// Add the data model and sample data here

class HomeScreen extends StatefulWidget {
  final List<Category> categories;

  HomeScreen({required this.categories});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGridView = true;
  bool isSearchExpanded = false;
  final TextEditingController _searchController = TextEditingController();
  List<Category> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = widget.categories;
  }

  void _filterCategories(String query) {
    setState(() {
      filteredCategories = widget.categories
          .where((category) =>
      category.title.toLowerCase().contains(query.toLowerCase()) ||
          category.subCategories.any((subCategory) =>
              subCategory.title.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildInteractiveSearch(),
          Expanded(
            child: AnimationLimiter(
              child: isGridView ? _buildGridView() : _buildListView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveSearch() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSearchExpanded ? double.infinity : 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(isSearchExpanded ? 30 : 60),
        ),
        child: Row(
          children: [
            if (isSearchExpanded)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterCategories,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search categories...",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            IconButton(
              icon: Icon(
                isSearchExpanded ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isSearchExpanded = !isSearchExpanded;
                  if (!isSearchExpanded) {
                    _searchController.clear();
                    _filterCategories("");
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: Duration(milliseconds: 500),
          columnCount: _getCrossAxisCount(context),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: CategoryCard(
                category: filteredCategories[index],
                onTap: () {
                  _navigateToSubCategoryScreen(context, filteredCategories[index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: Duration(milliseconds: 500),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: CategoryCard(
                category: filteredCategories[index],
                onTap: () {
                  _navigateToSubCategoryScreen(context, filteredCategories[index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToSubCategoryScreen(BuildContext context, Category category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubCategoryScreen(category: category),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1200) {
      return 4;
    } else if (MediaQuery.of(context).size.width > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${category.subCategories.length} Subcategories",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoryScreen extends StatefulWidget {
  final Category category;

  SubCategoryScreen({required this.category});

  @override
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  int? selectedSubCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.purple.shade50],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AnimationLimiter(
          child: ListView.builder(
            itemCount: widget.category.subCategories.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: SubCategoryCard(
                      subCategory: widget.category.subCategories[index],
                      isSelected: selectedSubCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          selectedSubCategoryIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SubCategoryCard extends StatelessWidget {
  final SubCategory subCategory;
  final bool isSelected;
  final VoidCallback onTap;

  SubCategoryCard({
    required this.subCategory,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? [Colors.blueAccent, Colors.purpleAccent]
                  : [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(
                  Icons.category,
                  color: isSelected ? Colors.white : Colors.blueAccent,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subCategory.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subCategory.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.white70 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Category {
  final String title;
  final List<SubCategory> subCategories;

  Category({required this.title, required this.subCategories});
}

class SubCategory {
  final String title;
  final String description;

  SubCategory({required this.title, required this.description});
}
List<Category> categories = [
  Category(
    title: "Doctors",
    subCategories: [
      SubCategory(title: "GYNAECOLOGIST", description: "Pregnancy, Menopause, Irregular periods, Ovarian cysts, Vaginal discharge"),
      SubCategory(title: "GENERAL PHYSICIAN", description: "Fever, High BP, Dizziness, Pneumonia, (Acidity, Jaundice, Constipation, Piles - Can be added under Stomach & Indigestion)"),
      SubCategory(title: "DERMATOLOGIST", description: "Vitiligo, Hair loss, Acne Scars, Dandruff"),
      SubCategory(title: "SEXOLOGIST", description: "HIV aids, Premature ejaculation, Erection Problems, Delayed Ejaculation"),
      SubCategory(title: "PSYCHIATRIST", description: "Autism, Schizophrenia, Bipolar disorder, Panic attack"),
      SubCategory(title: "PEDIATRICIAN", description: "Babies related"),
      SubCategory(title: "EarNoseThroat SPECIALIST", description: "Sore throat, Snoring, Coughing, Mouth sores"),
      SubCategory(title: "UROLOGIST", description: "Premature ejaculation, Urinary tract infection"),
      SubCategory(title: "DENTIST", description: "Dental related"),
      SubCategory(title: "ORTHOPEDIC", description: "Knee pain, Shoulder pain, Leg pain, Carpal tunnel syndrome"),
      SubCategory(title: "NEUROLOGIST", description: "Migraines, Epilepsy"),
      SubCategory(title: "CARDIOLOGIST", description: "Heart attack, Arrhythmias, Hyper tension"),
      SubCategory(title: "DIETITION/NUTRIONIST", description: "Weight management, Diet plans"),
      SubCategory(title: "DIABETOLOGIST", description: "Diabetes, Obesity, Blurry vision, Lethargy"),
      SubCategory(title: "OPHTHAMOLOGIST/EYE SURGEON", description: "Glaucoma, Cataracts"),
      SubCategory(title: "PULMONOLOGIST", description: "Asthma, Lung infections"),
      SubCategory(title: "AYURVEDA", description: "-"),
      SubCategory(title: "HOMEOPATHY", description: "-"),
      SubCategory(title: "ONCOLOGIST", description: "Chemotherapy, Tumor"),
      SubCategory(title: "PHYSIOTHERAPIST", description: "Rehabilitation, Back pain"),
      SubCategory(title: "GENERAL SURGEON", description: "Hernia, Biopsy"),
      SubCategory(title: "PSYCHOLOGIST", description: "Depression, Anxiety"),
      SubCategory(title: "VETERINARY", description: "Vaccination, Surgery and anything related to animals"),
      SubCategory(title: "NEPHROLOGIST", description: "Kidney related"),
      SubCategory(title: "RHEUMATOLOGIST", description: "Osteoarthritis"),
      SubCategory(title: "GASTROENTEROLOGIST/ LAPAROSCOPIC SURGEON", description: "Colonoscopy, GERD")
    ],
  ),
  Category(
    title: "Lawyers",
    subCategories: [
      SubCategory(title: "Corporate lawyers", description: "Business contracts and agreements, mergers and acquisitions, corporate governance and compliance"),
      SubCategory(title: "Family lawyers", description: "Divorce and legal separation, child custody and support, prenuptial and postnuptial agreements"),
      SubCategory(title: "Tax lawyers", description: "Tax disputes and litigation, tax planning and compliance, IRS audits and appeals"),
      SubCategory(title: "Employment and labor lawyers", description: "Workplace discrimination and harassment cases, wrongful termination disputes, employment contracts and wage claims"),
      SubCategory(title: "Health law attorneys", description: "Advising on healthcare regulations and compliance, representing clients in medical law cases, handling healthcare facility licensing and policy issues"),
      SubCategory(title: "Securities and finance lawyers", description: "Assisting with financial regulations and compliance, managing mergers and acquisitions, handling disputes involving financial contracts and investments"),
      SubCategory(title: "General practice lawyer", description: "Handling a wide range of legal issues including family law, criminal law, real estate, and civil litigation"),
      SubCategory(title: "Cyber lawyers", description: "Addressing data privacy and cybersecurity issues, handling cybercrime cases, advising on digital regulations and compliance"),
      SubCategory(title: "Civil lawyers", description: "Discrimination and civil liberties cases, police misconduct and brutality claims, human rights advocacy"),
      SubCategory(title: "Medical malpractice lawyer", description: "Claims for negligence by healthcare professionals, wrongful death lawsuits, compensation for medical errors"),
      SubCategory(title: "Bankruptcy lawyer", description: "Filing for bankruptcy (e.g., Chapter 7, Chapter 13), debt relief and repayment plans, creditor negotiations"),
      SubCategory(title: "Securities lawyer", description: "Handling stock and investment regulations, assisting with securities fraud cases, guiding IPO processes and compliance"),
      SubCategory(title: "Constitutional lawyers", description: "Cases involving constitutional law, challenges to legislation, First Amendment rights"),
      SubCategory(title: "Immigration Lawyers", description: "Visa and work permit applications, citizenship and naturalization processes, deportation defense"),
      SubCategory(title: "Criminal Lawyers", description: "Defending against criminal charges (e.g., theft, assault), bail applications and plea negotiations, representation in court trials"),
      SubCategory(title: "Intellectual Property Lawyers", description: "Patent and trademark applications, copyright infringement cases, protecting trade secrets"),
      SubCategory(title: "Personal Injury Lawyers", description: "Car accident and medical malpractice claims, slip and fall cases, workplace injuries"),
      SubCategory(title: "Real Estate Lawyers", description: "Property sales and purchase agreements, lease and rental contract disputes, landlord-tenant issues"),
      SubCategory(title: "Environmental Lawyers", description: "Cases involving environmental regulations, pollution and land use disputes, sustainability and conservation laws"),
      SubCategory(title: "Estate Planning Lawyers", description: "Drafting wills and trusts, probate and estate administration, power of attorney and guardianship arrangements"),
      SubCategory(title: "Contract Lawyers", description: "Drafting and reviewing contracts, contract disputes and breach of contract cases, negotiating contract terms"),
    ],
  ),
  Category(
    title: "IT",
    subCategories: [
      SubCategory(title: "Frontend Development", description: "Building user interfaces and client-side interactions using technologies like React, Angular."),
      SubCategory(title: "Backend Development", description: "Server-side logic, database management, APIs with Node.js, Django, Ruby on Rails, etc."),
      SubCategory(title: "Mobile Development", description: "Creating mobile applications for iOS and Android using Flutter, React Native, Swift, Kotlin."),
      SubCategory(title: "Full Stack Development", description: "End-to-end development including frontend and backend with stacks like MERN, MEAN, LAMP."),
      SubCategory(title: "Data Science and Analytics", description: "Data analysis, predictive modeling, data visualization using Python, R, SQL, etc."),
      SubCategory(title: "Machine Learning and AI", description: "Developing AI algorithms, training models with TensorFlow, PyTorch, Keras."),
      SubCategory(title: "DevOps and CI/CD", description: "Automating development, continuous integration/deployment with Docker, Kubernetes, Jenkins."),
      SubCategory(title: "Cloud Computing", description: "Deploying and managing applications on cloud platforms like AWS, Azure, GCP."),
      SubCategory(title: "Cybersecurity", description: "Securing networks, protecting data, conducting security assessments."),
      SubCategory(title: "Blockchain Development", description: "Creating decentralized applications, smart contracts with Ethereum, Solidity."),
      SubCategory(title: "UI/UX Design", description: "Designing user-friendly interfaces, prototyping with Figma, Adobe XD, Sketch."),
      SubCategory(title: "Web Development", description: "Developing websites and web apps using HTML, CSS, JavaScript, TypeScript."),
      SubCategory(title: "Database Management", description: "Managing data storage and retrieval with SQL databases, NoSQL databases like MongoDB."),
      SubCategory(title: "Software Development", description: "General-purpose programming for software applications using Java, C#, C++, Python."),
      SubCategory(title: "Game Development", description: "Creating video games using Unity, Unreal Engine, C++, C#."),
      SubCategory(title: "Networking", description: "Setting up and securing network infrastructures with Cisco, Juniper, and network protocols."),
      SubCategory(title: "IT Operations and Support", description: "Managing IT infrastructure and providing technical support using ITSM platforms."),
      SubCategory(title: "AR/VR Development", description: "Building augmented reality and virtual reality apps using Unity, ARKit, ARCore."),
      SubCategory(title: "IoT (Internet of Things)", description: "Developing smart devices with Raspberry Pi, Arduino, and edge computing platforms."),
      SubCategory(title: "Embedded Systems", description: "Developing software for embedded devices with C/C++, Embedded Linux."),
    ],
  ),
  Category(
    title: "Astrology",
    subCategories: [
      SubCategory(title: "Vedic Astrology (Jyotish Shastra)", description: "Based on ancient Vedic texts, using planetary positions to predict life events."),
      SubCategory(title: "Nadi Astrology", description: "Uses ancient palm leaf manuscripts to provide detailed life predictions."),
      SubCategory(title: "Jaimini Astrology", description: "Focuses on unique techniques like Chara Dasha and Karaka planets."),
      SubCategory(title: "KP Astrology (Krishnamurti Paddhati)", description: "Combining elements of Vedic and Western astrology, focusing on precision timing."),
      SubCategory(title: "Lal Kitab Astrology", description: "Combines astrology with palmistry, offering simplified remedies."),
      SubCategory(title: "Numerology", description: "Predictions based on birth date and name numbers."),
      SubCategory(title: "Vastu Shastra", description: "Harmonize home or workspace with natural forces."),
      SubCategory(title: "Tarot Reading", description: "Gain insights into past, present, and future with symbolic tarot cards."),
      SubCategory(title: "Crystal Healing", description: "Use gemstones for energy balancing and healing."),
      SubCategory(title: "Angel Card Reading", description: "Receive guidance from angelic messages and affirmations."),
      SubCategory(title: "Chakra Balancing", description: "Align energy centers for overall well-being."),
      SubCategory(title: "Meditation Guidance", description: "Learn techniques to promote relaxation and spiritual growth."),
    ],
  ),


  // Add more categories
];