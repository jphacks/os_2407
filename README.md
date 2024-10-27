# Eventpix

『Eventpix』は写真を撮るだけで予定をカレンダーに自動登録できるモバイルアプリです．\
AIが自動で写真から予定情報を抽出します．

<img width="1005" alt="スクリーンショット 2024-10-27 14 12 03" src="https://github.com/user-attachments/assets/70832d88-ab6a-4441-bb37-db8872d640e9">

<br/>
<br/>

> [!IMPORTANT]
> ### 審査員の方へ
> 複数のリポジトリで事前開発を進めていた都合上，本リポジトリに各リポジトリの情報を全てコピーすることはできませんでした．\
> 本リポジトリには，ソースコードのみをコピーしてアップロードしたため，
> コミット履歴等開発に関するデータは以下のリポジトリをそれぞれ参照いただきますよう，よろしくお願いいたします．
>
> モバイルアプリ用リポジトリ (本リポジトリ `/mobile` ディレクトリ内)　[NAIST-Eventpix/eventpix_mobile](https://github.com/NAIST-Eventpix/eventpix_mobile)  \
> APIサーバ用リポジトリ (本リポジトリ `/api` ディレクトリ内)　[NAIST-Eventpix/eventpix_api](https://github.com/NAIST-Eventpix/eventpix_api)

<br/>
<br/>

# 製品概要

## 背景(製品開発のきっかけ、課題等）

カレンダーアプリにおける予定入力の煩わしさを解消するため，私たちのチームは本モバイルアプリ『Eventpix』を作成しました．

現在，多くの人がスケジュール帳ではなく，カレンダーアプリで予定を管理しています．\
カレンダーアプリは予定の管理，リマインダー機能等，優れた機能が揃っていますが，予定の入力は全て手入力で行わなければなりません．\
特に紙などのコピー＆ペーストができない媒体は，全ての情報をわざわざ手打ちで入力する必要があり，非常に煩わしいと感じる方も多いのではないでしょうか．\
例としては，就職活動での企業説明会おける次回イベントのお知らせが掲載されたスライド (下部画像左) や，バンドのライブ情報が掲載されたポスター (下部画像右) などがあります．

<div style="display: flex;">
  <img style="height: 200px;" alt="image" src="https://github.com/user-attachments/assets/7a7d7301-e293-40db-b35a-426710a88acc">
  <img style="height: 200px;" alt="image" src="https://github.com/user-attachments/assets/12a85515-972c-425a-bd73-1e85fe426ae3">
</div>
(予定情報のイメージ，左：企業説明会における次回イベントのお知らせが掲載されたスライド，右：バンドのライブ情報が掲載されたポスター)

<br/>
<br/>

実体験として，あるチームメンバーがこのようなスライド・ポスターに遭遇した際，
すぐにカレンダーアプリに入力する時間がなかったためにとりあえずイベントの情報を写真で撮影しましたが，
結局そのままカレンダーに登録するのを忘れ，予定がフォトアルバムの奥深くに眠ってしまったということがよくありました．

このように，カレンダーアプリにおける予定の入力においては手入力の手間が残っており，入力の手間や入力忘れを生じさせる原因となっています．
そこで，写真を撮るだけで予定を自動登録できるモバイルアプリ「Eventpix」を開発し，本問題の解決へ取り組むことにしました．

<br/>

## 製品説明（具体的な製品の説明）

本アプリを使うことで，「最低**5回のタップ** 」で予定の登録が完了します．\
ユーザが必要なアクションは「予定を写真で撮る」「登録するカレンダーを選択する」，この2つだけです．

具体的な操作は以下の通りです．
以下では，バンドのライブ情報が掲載されたポスターを例に予定を登録しています．

<img style="height: 200px;" alt="image" src="https://github.com/user-attachments/assets/12a85515-972c-425a-bd73-1e85fe426ae3">

なお，本アプリはiPhone等ユーザが持つスマートフォンで動作させることができます．

* 予定情報のある画像の選択 (下部画像1段階目)
  * 「ライブラリから写真を撮る」：すでに撮影した写真など，スマートフォンの写真アルバムから画像を選択できます．
  * 「カメラで写真を撮る」：カメラを起動し，その場で予定の画像を撮影できます．
* 抽出処理：AIが自動で写真から予定情報を抽出し，日付，場所なども構造化して取得します．1つの画像から複数の予定を同時に取得することも可能です．
* 抽出完了（下部画像2段階目）
  * AIが抽出した予定が表示されます．抽出する内容は，「タイトル」「概要」「開始日時」「終了日時」「場所」の5つです．
* 予定編集（下部画像3段階目）
  * もし書き換えたい予定があった場合は，その予定をタップすると編集画面が出現します．自分の好きな情報に書き換えることも可能です．
* 登録カレンダー選択（下部画像4段階目）
  * 抽出完了画面の右下にあるカレンダーアイコンをタップすることで，登録カレンダー選択画面が表示されます．
  * 予定を登録するカレンダーを選択します．iPhone の場合 iOS のデフォルトカレンダー，Android の場合，Google カレンダー に登録されているカレンダーが一覧で表示されるため，登録したいカレンダーを選択します．
* 登録完了（下部画像5段階目）
  * 登録するカレンダーを選択すると，自動で全ての予定が登録されます．
  * 登録されたカレンダーは，デフォルトのカレンダーアプリでも確認することができ，適切なフィールドに日時や場所の情報などが登録されます． 

<img width="1296" alt="image" src="https://github.com/user-attachments/assets/8e3f044f-168c-4863-b57e-298eb1c52b6b">
(製品の流れのイメージ図．GitHub上では画像が小さいので，ぜひ，右クリック→「画像を新しいタブで開く」などで拡大してご覧ください)

<br/>
<br/>

## デモ動画

↓下の画像をクリックすると，YouTubeへ遷移します．
もしくは，[こちらから→https://www.youtube.com/watch?v=q0lc5Si2gBY](https://www.youtube.com/watch?v=q0lc5Si2gBY)

[![Eventpix Demo Video](https://img.youtube.com/vi/q0lc5Si2gBY/0.jpg)](https://www.youtube.com/watch?v=q0lc5Si2gBY)

<br/>
<br/>

## 特長
#### 1. AIが写真から予定を自動抽出！
#### 2. 必要な操作は写真を撮る or 選ぶだけ！
#### 3. スケジュールや行事予定表などにある複数の予定を一括で取り込みできる！
#### 4. デフォルトカレンダーに自動登録するため，使用するカレンダーアプリが制限されない！

<br/>

## 解決出来ること

* 予定情報を手作業で入力する手間を解消
* 予定入力の煩わしさや，煩わしさから予定入力を忘れたことでのミス・トラブルを防止
* 適切なフィールドに適切な情報を反映することで，カレンダーアプリの機能を最大限に活用

<br/>
  
## 今後の展望

* デフォルトカレンダー以外のカレンダーアプリともアカウント連携を行うなど，より多くのカレンダーアプリと自動で連携できる機能の実装
* AIの推論性能を改善し，より柔軟に予定を抽出できるように改善
* 予定入力だけでなく，予定の管理などにもAIを利活用

<br/>

## 注力したこと（こだわり等）
* 操作数を減らし，なるべく簡単に予定を登録できるようにしました（最低5タップで撮影から登録まで完了）
* スマートフォンのデフォルトカレンダーに自動で反映させることで，使用するカレンダーアプリの制約を減らしました
* 正確な予定情報を返すよう，ChatGPT APIに与えるプロンプトを工夫しました

<br/>
<br/>

# 開発技術
## 活用した技術

<img width="1996" alt="image" src="https://github.com/user-attachments/assets/bdb839de-a01e-4e7b-8647-a59b5b80aaa0">

### API・データ
* ChatGPT API

### フレームワーク・ライブラリ・モジュール

* モバイルアプリ (ユーザが操作する部分)
  * Flutter
  * Dart
* APIサーバ (モバイルアプリと連携．AIでの予定抽出を実行)
  * FastAPI
  * Python
  * Microsoft Azure
  * GitHub Actions
  * Docker

### デバイス

利用可能デバイス
* iPhone (iOS)
* Android

<br/>
<br/>

## 独自技術

### 事前開発

* モバイルアプリ
  * ハッカソン開始時点でのソースコード：([9f319bb](https://github.com/NAIST-Eventpix/eventpix_mobile/tree/9f319bb5a4e1fb12119285fec351e1ef84eb9e89))
  * 事前開発内容
    * Flutterの環境構築
    * Top画面（製品説明部の画像1段階目）のUIを作成
* APIサーバ
  * ハッカソン開始時点でのソースコード：([b1cd088](https://github.com/NAIST-Eventpix/eventpix_api/tree/b1cd0885b6c8085af683c39ee5c404e43756a11b))
  * 事前開発内容
    * APIサーバのインフラ整備
    * 予測部分の最小部分を作成

### ハッカソンで開発した機能 (一部抜粋)

* モバイルアプリ
  * UI画面の実装 ([`/mobile/lib/pages/page_result.dart`](https://github.com/NAIST-Eventpix/eventpix_mobile/blob/main/lib/pages/page_result.dart)) ([`/mobile/lib/pages/page_top.dart`](https://github.com/NAIST-Eventpix/eventpix_mobile/blob/main/lib/pages/page_top.dart))
    * 抽出した結果を一覧表示する結果ページの作成
    * 予定を手入力で編集できる編集のダイアログ画面の作成
    * 登録するカレンダーを選択するダイアログ画面の作成
  * 処理の追加
    * APIサーバから帰ってきた結果をUIのウィジェットに変換する処理の実装 ([`/mobile/lib/pages/page_top.dart`](https://github.com/NAIST-Eventpix/eventpix_mobile/blob/main/lib/pages/page_top.dart))
    * 編集した予定情報を反映させるための処理を実装 ([`/mobile/lib/pages/page_result.dart`](https://github.com/NAIST-Eventpix/eventpix_mobile/blob/main/lib/pages/page_result.dart))
    * デフォルトのカレンダーに登録するための処理を実装 ([`/mobile/lib/pages/page_result.dart`](https://github.com/NAIST-Eventpix/eventpix_mobile/blob/main/lib/pages/page_result.dart))
  * その他実装
    * アプリアイコンの長押し時に表示されるクイックアクションに「カメラで撮る」という項目を追加し，すぐに撮影画面を起動できる機能を実装 ([473991a](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/473991af2a2355fe0f5782b792d67b0a916e8be3))
    * Googleカレンダーに自動で反映させる関数を実装
* APIサーバ
  * 予測部分の性能改善（プロンプトの改善）
    * 年度情報が抽出できないとき，直近の年度になるように日程情報を更新
    * REST API でやり取りするためのJSON形式をモバイルアプリと統一
  * JSONをicsファイル (カレンダー情報を持つファイル) 形式に変更するAPIの作成
  * ソースコードのリファクタリング，リント，フォーマット等の性能改善

### 特にこだわった部分
* 処理中や処理完了時にはダイアログを表示し，ユーザビリティを意識した実装を行いました ([4bedad3](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/4bedad31759f4934343352b15d097839ff09a0f3))([838a4a5](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/838a4a576cb9fc03782afad2b52d9dfa4a30f038))
* カレンダー選択画面ではカレンダーをカテゴリ分けし，カレンダーごとの色情報を表示するなど，ユーザフレンドリなUIの構築を工夫しました ([be1c7f5](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/be1c7f5fe207de98a5cfd3ffd2765a3fc99581be))
* アプリアイコンの長押し時に表示されるクイックアクションに「カメラで撮る」という項目を追加し，すぐに撮影画面を起動できるようにしました ([473991a](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/473991af2a2355fe0f5782b792d67b0a916e8be3))


[![IMAGE ALT TEXT HERE](https://jphacks.com/wp-content/uploads/2024/07/JPHACKS2024_ogp.jpg)](https://www.youtube.com/watch?v=DZXUkEj-CSI)
