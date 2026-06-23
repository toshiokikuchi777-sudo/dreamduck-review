#!/bin/bash
# ── DreamDuck 監修ビュー ローカルプレビュー ──
# このファイルをダブルクリックすると、簡易サーバーが起動して
# 自動でブラウザが開きます。終了はこのウィンドウを閉じるだけ。

cd "$(dirname "$0")"
PORT=8777

echo "────────────────────────────────────"
echo " DreamDuck 監修ビューを起動します"
echo " URL : http://localhost:${PORT}/"
echo " 終了: このウィンドウを閉じる / Ctrl+C"
echo "────────────────────────────────────"

# 1秒後にブラウザを開く
( sleep 1; open "http://localhost:${PORT}/" ) &

# サーバー起動（ポートが使用中なら自動で次を試す）
python3 -m http.server ${PORT} 2>/dev/null \
  || python3 -m http.server $((PORT+1))
