import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:localization/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguage = prefs.getString('selected_language');

    if (savedLanguage != null) {
      setState(() {
        _selectedLanguage = savedLanguage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            tr('language'),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25.0,
            ),
          ),
        ), // Localized title
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            _buildLanguageTile('English', 'en'),
            _buildLanguageTile('हिंदी', 'hi'),
            _buildLanguageTile('ગુજરાતી', 'gu'),
            const SizedBox(height: 20.0),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language, String code) {
    bool isSelected = _selectedLanguage == code;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = code;
          _changeLanguage(code);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueGrey.withOpacity(0.5) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.verified : Icons.circle_outlined,
              color: isSelected ? Colors.black : Colors.grey,
              size: isSelected ? 30 : 30,
            ),
            const SizedBox(width: 16.0),
            Text(
              language,
              style: TextStyle(
                fontSize: 22.0,
                color: isSelected ? Colors.black : Colors.black,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
          label: Text(
            tr("btn_text"),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22.0,
            ),
          ),
          icon: const Icon(
            Icons.save_alt_sharp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _changeLanguage(String code) async {
    if (code == 'en') {
      context.setLocale(const Locale('en'));
    } else if (code == 'gu') {
      context.setLocale(const Locale('gu'));
    } else if (code == 'hi') {
      context.setLocale(const Locale('hi'));
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selected_language', code);
  }
}
