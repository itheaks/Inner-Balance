import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

const _detailCredentials = r'''
{
  "type": "service_account",
  "project_id": "inner-b",
  "private_key_id": "77f6a8fb7fa9eeac0b2b7a8e99868362dcfdb2b4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCpuhCmt7LWkfin\nXxih7PBUNfq/2E9R2wg0UoK8euxDH0B5KFHkHhUYmcKMbxgA2SnwXf5CJdU5xZTG\nGnUBB+LKmA5rWbcRwiob5T1ll0ziHQHU+9Ce1u570GmhBNnZmSiWtE7m03AjM5ew\n9biA5VB3BAUVOpeATomWCc1LAIyPGGq82L++0QajL28t1qwhIZWtMw3VJrt+JJgW\nMB0fMGZ5sO/P+npYJJr18o1scgHdsuxkTU0J+jhwR9JraocV5Dveeqoq0dqJvRNN\nYKxzOLQ/JNtQM8LXnWJPrYA3EUe7Eo0QE57lj2SteJ6QJlgHMR0OLYP9Z0vtICig\nLc1nFAurAgMBAAECggEAFLFAknLW9N37CLzJTgSLEFk8ZuNCWGJxz583nS8HWu+W\ndq75vOwF+mfUljZ9IK1ZNZrgAsSGCHMUPkq/dQ63EagUKfZYIWwgoiICqD4X+4E5\n1fOVbagajzHLjvv+a08G6ci1zeJ9S21g0wxCIETU2I2+6OWpztTEZWxwgPJiMJfA\nloRSSxZksMCEw5aoXhQEWmM0u3zVSV1O0DSF1tj9yEFv6mAuSRj24GpDqUnwjVhN\nKfmLu4FbMjJF59ib2fKrU1m0m06AQVdfp702g/Zf3T+aEJvP/WrsdL7r4bSkGyt7\nmULHMC7kYiyVLfENmmjFU1ata83iVpHMI4kXsXaggQKBgQDbiIsTQ51vhLFqaCLI\nU2SuXPyEscaYbLpXB9XcUdmZL5jlmt+IHHFsJ6UP7B4DlkYWjghwv1W3woBxdtSr\nlNY6r5ybA13rjaMgVZM7xjeX9o33vjRn6jomGlxvPlkaz6AHM24LMOJVO4ljb0r9\nkJfV41Vp3YuUq1a/rUoq6d1O4QKBgQDF64sZwbtRrwSqm69HCkgB9StZkYsLvI3Q\nGTQPWjl/Q5UuzZzhJZ3H6cGqPlagKxMK81avJT+/CwhJ4fxUyjeuEg/6nbWQysWG\nD2uU6FBiFDBh/lxhXCch0V8k0PkYOlfXSKx7tYGo8mJW7ByJlFHmuSp8FmWMLjzs\ndmf8Ho6oCwKBgQCGFZO8JGQYJNenwgrch/LKfIjPEzXVCzOUzHhWpLde1K9yLXGx\n1I2CHYS3gOOkFTihtgZ5tqNIJUgGBSpH0hQ2q+Pe2eOXZ17m9N2EeMCj1DdJxaaE\ngY8ajqc+WrpZoc6AF21y8FyM6lwzm1oWHSZfwQX+Lw59s1i8ob7XDxfYgQKBgFWM\nwsuXWgisxi+Yq+LhJs7x0pMcviWMkx/oRQB912yTIeDhL3aCc/j9qaCU4YzKEaki\nFc4PI8bIVgTZkeB0qCyt0gpaMSks/MQ91hq/cD90ypURBY1v79pGTgHz8jfuwBlm\naGfwxOLqImfAF3XAjsZUM3D/nVVCh0MOy1PHQZKRAoGBALKgNlWP3kGvPqgRM5sW\nUcq3fbbxzRjGTb6AwdNtWYSKkwgZD6oQH1DSyNLDtVp82g7T77oeX5WRxi0M645S\npSHFdq3S1tIkgCdo91jGKumyGYi/ZRFqRW2RNeVWKPlGCd4e1kmJz5AT7W1Ogr9X\nu4JwQuIUMMrgJNNR5E4rkVxQ\n-----END PRIVATE KEY-----\n",
  "client_email": "inner-balance@inner-b.iam.gserviceaccount.com",
  "client_id": "102272102959483750239",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/inner-balance%40inner-b.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

const _detailSpreadsheetId = '1j4oKKSxg6ENvKvuYdmmZk3dwaAAA--7CgSW78q3nc_M';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail App',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: SuggestionPage(),
    );
  }
}

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  final GSheets _gsheets = GSheets(_detailCredentials);
  Worksheet? _detailSheet;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _suggestionController = TextEditingController();
  bool _isSuccessful = false;
  List<List<String>> _detailData = [];

  @override
  void initState() {
    super.initState();
    _loadDetailSheet();
  }

  Future<void> _loadDetailSheet() async {
    final ss = await _gsheets.spreadsheet(_detailSpreadsheetId);
    _detailSheet = ss.worksheetByTitle('Sheet1');
    await _refreshDetailData();
  }

  Future<void> _refreshDetailData() async {
    if (_detailSheet == null) {
      return;
    }

    final values = await _detailSheet!.values.allRows();
    setState(() {
      _detailData = values;
    });
  }

  Future<void> _createDetail() async {
    if (_detailSheet == null) {
      return;
    }

    final now = DateTime.now();

    final rowData = [
      _emailController.text,
      _nameController.text,
      _dateController.text,
      _suggestionController.text,
      _isSuccessful ? 'Yes' : 'No',
    ];

    await _detailSheet!.values.appendRow(rowData);
    _clearControllers();
    await _refreshDetailData();
  }

  Future<void> _updateDetail(String date) async {
    if (_detailSheet == null) {
      return;
    }

    final updatedRowData = [
      _emailController.text,
      _nameController.text,
      _dateController.text,
      _suggestionController.text,
      _isSuccessful ? 'Yes' : 'No',
    ];

    final rowIndex = _detailData.indexWhere((rowData) => rowData[0] == date);

    if (rowIndex != -1) {
      _detailData[rowIndex] = updatedRowData;

      await _detailSheet!.values.insertRow(rowIndex + 2, updatedRowData);

      _clearControllers();
      await _refreshDetailData();
    }
  }

  Future<void> _deleteDetail(String date) async {
    if (_detailSheet == null) {
      return;
    }

    _detailData.removeWhere((rowData) => rowData[0] == date);

    await _detailSheet!.clear();
    await _detailSheet!.values.appendRow(['Email', 'Name', 'Date', 'Suggestion', 'I Enjoyed the Application']);
    for (final rowData in _detailData) {
      await _detailSheet!.values.appendRow(rowData);
    }

    _clearControllers();
    await _refreshDetailData();
  }

  void _clearControllers() {
    _emailController.clear();
    _nameController.clear();
    _dateController.clear();
    _suggestionController.clear();
    setState(() {
      _isSuccessful = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Add a shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Match the container's border radius
                      child: Image.asset(
                        'assets/logo.jpeg',
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _suggestionController,
                  decoration: InputDecoration(labelText: 'Suggestion'),
                ),
                Row(
                  children: [
                    Text('I agree app was helpful!!'),
                    Checkbox(
                      value: _isSuccessful,
                      onChanged: (value) {
                        setState(() {
                          _isSuccessful = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      return;
                    }
                    _createDetail();
                  },
                  child: Center(child: Text('Submit')),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    'Thanks for your Feedback!',
                    style: TextStyle(fontSize: 20,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
