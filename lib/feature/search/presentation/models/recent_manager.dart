import 'package:shared_preferences/shared_preferences.dart';

class RecentKeywordsManager {
  static const String _keyRecentKeywords = 'recent_keywords';
  static const int _maxKeywords = 6;

  // 최근 검색어들을 가져옴
  static Future<List<String>> getRecentKeywords() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyRecentKeywords) ?? [];
  }

  // 새로운 키워드를 입력받으면 List에 추가(중복X)
  static Future<void> addKeyword(String keyword) async {
    if (keyword.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    List<String> keywords = await getRecentKeywords();

    keywords.removeWhere((item) => item == keyword);

    keywords.insert(0, keyword);

    //키워드 갯수는 6개로 제한
    if(keywords.length > _maxKeywords){
      keywords = keywords.sublist(0, _maxKeywords);
    }
    await prefs.setStringList(_keyRecentKeywords, keywords);
  }

  // 특정 키워드를 삭제함
  static Future<void> removeKeyword(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> keywords = await getRecentKeywords();

    keywords.removeWhere((item) => item == keyword);

    await prefs.setStringList(_keyRecentKeywords, keywords);
  }
}
