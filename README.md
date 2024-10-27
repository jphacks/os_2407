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
例としては，就職活動での企業説明会おける次回イベントのお知らせスライド (下部画像左) や，バンドのライブ情報が掲載されたポスター (下部画像右) などがあります．

<div style="display: flex;">
  <img style="height: 200px;" alt="image" src="https://github.com/user-attachments/assets/7a7d7301-e293-40db-b35a-426710a88acc">
  <img style="height: 200px;" alt="image" src="https://github.com/user-attachments/assets/12a85515-972c-425a-bd73-1e85fe426ae3">
</div>
<br/>

実体験として，あるチームメンバーがこのようなスライド・ポスターに遭遇した際，
すぐにカレンダーアプリに入力する時間がなかったためにとりあえずイベントの情報を写真で撮影しましたが，
結局そのままカレンダーに登録するのを忘れ，予定がフォトアルバムの奥深くに眠ってしまったということがよくありました．

このように，カレンダーアプリにおける予定の入力においては手入力の手間が残っており，入力の手間や入力忘れを生じさせる原因となっています．
そこで，写真を撮るだけで予定を自動登録できるモバイルアプリ「Eventpix」を開発し，本問題の解決へ取り組むことにしました．

<br/>

## 製品説明（具体的な製品の説明）

<img width="1296" alt="image" src="https://github.com/user-attachments/assets/8e3f044f-168c-4863-b57e-298eb1c52b6b">

## デモ動画
[![Eventpix Demo Video](https://img.youtube.com/vi/q0lc5Si2gBY/0.jpg)](https://www.youtube.com/watch?v=q0lc5Si2gBY)

## 特長
#### 1. AIが写真から予定を自動抽出
#### 2. 必要な操作は写真を撮る or 選ぶだけ
#### 3. スケジュールや行事予定表などにある複数の予定を一括で取り込みできる

## 解決出来ること

* 予定入力を手作業で入力する手間を解消
* 予定表などから予定を入力する際の入力時間を大幅に削減
  
## 今後の展望

* アカウント連携等，より多くのカレンダーアプリと自動で連携できる機能の実装
* AIの推論性能を改善し，より柔軟に予定を抽出できるように改善

## 注力したこと（こだわり等）
* 操作数を減らし，なるべく簡単に予定を登録できるようにしました（最低5タップで撮影から登録まで完了）
* スマートフォンのデフォルトカレンダーに自動で反映させることで，使用するカレンダーアプリの制約を減らしました
* 正確な予定情報を返すよう，ChatGPT APIに与えるプロンプトを工夫しました

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

## 独自技術
### ハッカソンで開発した独自機能・技術
* アプリ長押し時に表示されるクイックアクションに「カメラで撮る」という項目を追加し，すぐに撮影画面を起動できるようにしました ([473991a](https://github.com/NAIST-Eventpix/eventpix_mobile/commit/473991af2a2355fe0f5782b792d67b0a916e8be3))

[![IMAGE ALT TEXT HERE](https://jphacks.com/wp-content/uploads/2024/07/JPHACKS2024_ogp.jpg)](https://www.youtube.com/watch?v=DZXUkEj-CSI)
