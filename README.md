# DreamDuck — Sekiya Yurie Model / 3D 監修ビュー

原案スケッチ（PNG）と 3D モデル（GLB）を左右に並べて確認できる監修サイトです。
3D は **遠近法 / パースなし（平行投影）** を切り替えて確認できます。

## 構成

```
.
├── index.html        … 監修ビュー本体（単一ファイル / Three.js は CDN 読込）
├── .nojekyll         … GitHub Pages 用（全ファイルをそのまま配信）
├── models/           … 3D モデル  01.glb 〜 12.glb, secret.glb
└── sketches/         … 原案スケッチ 01.png 〜 12.png, secret.png
```

`models/NN.glb` と `sketches/NN.png` を同じ番号でペアにして **自動検出** し並べます（01〜40＋secret）。
HTML の編集は不要です。

## 更新の反映（重要）

3Dデータを更新したら、サイトを**再読み込み**すれば自動で反映されます。

| やること | 反映 |
|---|---|
| **同じ番号のGLBを差し替え**（再エクスポート） | 再読み込みで自動で最新を表示。ファイルの更新印（ETag/更新日時）をURLに付けているので、**変わった時だけ取り直し**・変わらなければキャッシュで高速 |
| **新しい番号を追加**（例 `13.glb` + `13.png`） | 再読み込みで自動で一覧に追加（HTML編集不要） |
| **削除** | 再読み込みで一覧から消える |

- 画面右上の **「↻ 最新に更新」** ボタンでキャッシュを避けて再取得できます。
- ※開いている画面にリアルタイムで反映されるわけではなく、**再読み込み**が必要です。
- ※GitHub公開時は、更新したファイルを **push（デプロイ）** してから再読み込みしてください。

## 機能

- **画角切替**：遠近法（Perspective）⇔ パースなし（Orthographic）
- **背景切替**：ライト / ダーク
- **自動回転**：ON / OFF
- 各カードで **ドラッグ回転・ホイール/ピンチで拡大縮小・視点リセット**
- 画面に入ったモデルから順に読み込む遅延ロード（重い GLB でも初期表示が軽い）

## ローカルで開く

GLB はファイル直開き（file://）だと読めません。簡易サーバー経由で開いてください。

```bash
cd 監修
python3 -m http.server 8000
# → http://localhost:8000/ をブラウザで開く
```

## GitHub Pages で公開

この `監修` フォルダの中身をリポジトリ直下に置き、Pages を有効化すれば公開できます。

```bash
# 例：このフォルダを単独リポジトリとして公開する場合
cd 監修
git init
git add .
git commit -m "DreamDuck 3D review site"
git branch -M main
git remote add origin git@github.com:<USER>/<REPO>.git
git push -u origin main
# GitHub → Settings → Pages → Branch: main / (root) を選択
```

公開 URL: `https://<USER>.github.io/<REPO>/`

> 合計サイズは GLB が大きめ（約 180MB）です。1 ファイルは GitHub の 100MB 上限内に収まっています。
