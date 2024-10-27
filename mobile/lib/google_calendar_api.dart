import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:googleapis/calendar/v3.dart' as calendar;
import 'package:googleapis_auth/auth_io.dart';

const _scopes = [calendar.CalendarApi.calendarScope];
const _tokenFile = 'token.json';

class GoogleCalendarApi {
  final String credentialsPath;
  AccessCredentials? credentials;

  GoogleCalendarApi(this.credentialsPath);

  Future<void> authenticate() async {
    final Map<String, dynamic> credentialsJson =
        jsonDecode(await File(credentialsPath).readAsString());

    final clientId = ClientId(
      credentialsJson['installed']['client_id'],
      credentialsJson['installed']['client_secret'],
    );

    // トークンファイルが存在する場合、トークンを読み込む
    if (await File(_tokenFile).exists()) {
      final Map<String, dynamic> tokenJson =
          jsonDecode(await File(_tokenFile).readAsString());
      credentials = AccessCredentials(
        AccessToken(tokenJson['type'], tokenJson['data'],
            DateTime.parse(tokenJson['expiry'])),
        tokenJson['refreshToken'],
        _scopes,
      );
    }

    // トークンが存在しないか期限切れの場合、新しいトークンを取得
    if (credentials == null || credentials!.accessToken.hasExpired) {
      var client = await clientViaUserConsent(clientId, _scopes, (url) {
        print('Please go to the following URL:');
        print('  => $url');
      });

      credentials = client.credentials;

      // トークンを保存
      final Map<String, dynamic> tokenJson = {
        'type': credentials!.accessToken.type,
        'data': credentials!.accessToken.data,
        'expiry': credentials!.accessToken.expiry.toIso8601String(),
        'refreshToken': credentials!.refreshToken,
      };
      await File(_tokenFile).writeAsString(jsonEncode(tokenJson));

      // クライアントを閉じる
      client.close();
    }
  }

  Future<void> addEvent(String eventFilePath) async {
    var client = authenticatedClient(http.Client(), credentials!);
    var calendarApi = calendar.CalendarApi(client);

    // 予定を追加するJSONファイルを読み込む
    final String eventJson = await File(eventFilePath).readAsString();
    final Map<String, dynamic> eventMap = jsonDecode(eventJson);

    // 予定を作成
    var event = calendar.Event.fromJson(eventMap);

    // 予定をカレンダーに追加
    await calendarApi.events.insert(event, 'primary');

    // クライアントを閉じる
    client.close();
  }
}

// APIサーバーのJsonファイルをGoogle Calendar API向けのJsonファイルに変換する
class JsonConverter {
  // ファイルパスを受け取り、APIサーバーのJsonをGoogle Calendar API向けのJsonに変換するメソッド
  Future<void> convert(String inputFilePath, String outputFilePath) async {
    // ファイルからAPIサーバーのJSONデータを読み込む
    final String apiJsonString = await File(inputFilePath).readAsString();
    final Map<String, dynamic> apiJson = jsonDecode(apiJsonString);

    // Google Calendar API向けのJSON形式に変換
    final Map<String, dynamic> googleCalendarJson = {
      'summary': apiJson['summary'],
      'location': apiJson['location'],
      'description': apiJson['description'],
      'start': {
        'dateTime': '${apiJson['dtstart']}:00+09:00',
        'timeZone': 'Asia/Tokyo'
      },
      'end': {
        'dateTime': '${apiJson['dtend']}:00+09:00',
        'timeZone': 'Asia/Tokyo'
      }
    };

    // 変換したJSONデータをファイルに書き込む
    final String googleCalendarJsonString = jsonEncode(googleCalendarJson);
    await File(outputFilePath).writeAsString(googleCalendarJsonString);
  }
}

void main() async {
  // APIサーバーのJsonファイルをGoogle Calendar API向けのJsonファイルに変換
  final converter = JsonConverter();
  await converter.convert('sample_event.json', 'converted_event.json');

  // Google Calendar APIにアクセス
  final api = GoogleCalendarApi('credentials.json');
  await api.authenticate();
  await api.addEvent('converted_event.json');
}
