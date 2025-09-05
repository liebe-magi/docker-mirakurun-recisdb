# mirakurun-recisdb-docker

recisdb-rs導入済みのMirakurun Dockerイメージ

## 概要

このプロジェクトは、日本のデジタルTV放送を受信・配信するためのMirakurunサーバーにrecisdb-rsを統合したDockerイメージです。
PX-Q1UD、PX-Q3PE、PX-MLTシリーズなどの日本のTVチューナーデバイスとの互換性を提供します。

## 特徴

- **recisdb-rs** 統合済み (従来のrecpt1/recdvbの代替)
- PLEX製TVチューナー対応
- 地デジ (GR)、BS、CS対応
- マルチステージビルドによる軽量化
- Docker Composeによる簡単セットアップ

## 必要なもの

- Docker & Docker Compose
- 対応TVチューナーデバイス
- Linux環境

## セットアップ

### 1. リポジトリのクローン

```bash
git clone https://github.com/liebe-magi/mirakurun-recisdb-docker.git
cd mirakurun-recisdb-docker
```

### 2. データディレクトリの作成

```bash
mkdir -p ./app/data
```

### 3. デバイス設定の確認

お使いのTVチューナーデバイスに合わせて`docker-compose.yml`のdevicesセクションを調整してください。

```yaml
devices:
  - /dev/bus:/dev/bus
  - /dev/px4video0:/dev/px4video0  # 実際のデバイスに合わせて調整
  - /dev/px4video1:/dev/px4video1
  # 必要に応じて追加/削除
```

### 4. 起動

```bash
docker-compose up -d
```

## 設定ファイル

### チューナー設定（`app/config/tuners.yml`）

PLEX製チューナーの設定例が含まれています：

- **衛星放送用（BS/CS）**: `/dev/px4video0`, `/dev/px4video1`, etc.
- **地デジ用（GR）**: `/dev/px4video2`, `/dev/px4video3`, etc.

### チャンネル設定（`app/config/channels.yml`）

日本の主要チャンネル設定が含まれています：

- 地デジ: NHK総合、NHKEテレ、民放各局
- BS: NHK BS、BS民放各局
- CS: 一部CS放送局

### サーバー設定（`app/config/server.yml`）

基本的なMirakurun設定：

- ポート: `40772`
- ログレベル: `2`

## 使用方法

### Web UI

ブラウザで以下にアクセス：

```
http://localhost:40772
```

## 関連プロジェクト

- [Mirakurun](https://github.com/Chinachu/Mirakurun) - ベースとなるTVサーバー
- [recisdb-rs](https://github.com/kazuki0824/recisdb-rs) - Rust製チューナーコマンド
- [EPGStation](https://github.com/l3tnun/EPGStation) - 録画予約システム
- [KonomiTV](https://github.com/tsukumijima/KonomiTV) - Web視聴インターフェース

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。詳細は[LICENSE](LICENSE)ファイルを参照してください。

## 貢献

プルリクエストやイシューの報告を歓迎します。バグ報告や機能要求は[Issues](https://github.com/liebe-magi/mirakurun-recisdb-docker/issues)からお願いします。

## 免責事項

このソフトウェアは教育・研究目的で提供されています。放送コンテンツの利用については、各放送局の利用規約および著作権法を遵守してください。
