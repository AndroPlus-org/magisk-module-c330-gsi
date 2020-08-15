### Rakuten Mini C330 用 Magisk モジュール

Rakuten Mini C330 で Android 10 GSI を使用する際の不具合修正や機能追加を行う Magisk モジュールです。

## 機能一覧
- ブートループを修正 (Xiaomi Redmi 8 の android.hardware.graphics.composer@2.1-impl.so 等を流用)
- VoLTE を有効化 (楽天モバイルにてテスト済み)
- FlokoROM などで、クイック設定での FPS 表示タイルを有効化 (表示させるには初回のみ`adb shell cmd overlay enable me.phh.treble.overlay.rakuten.mini.systemui`の実行が必要)
- FeliCa / おサイフケータイアプリを追加 (ただしエラーで使用不可)
- eSIM の管理画面を追加

## TODO
- おサイフケータイアプリのエラー修正