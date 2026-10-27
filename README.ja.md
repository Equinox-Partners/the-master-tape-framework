# The Master Tape

**人間と複数AIが共有できる、ファイルベースの正本メモリ基盤です。**

The Master Tapeは、会話履歴やフォルダ総当たりに頼らず、AIが必要な現在の文脈だけへ到達するためのオープンな仕組みです。Markdown、YAML、Git、Ruby標準ライブラリだけで動作します。

## 解決する問題

- AIを替えると文脈が失われる
- 過去チャットの情報が古いか判別できない
- メモが増えるほど、読む範囲と正本が分からなくなる
- AIがタスク、判断、調査結果を混同する

The Master Tapeでは、情報を7種類に分け、安定ID、Authority、Confidence、Lifecycle、Sensitivityを明示します。Registryで対象を確定してから、必要な文書だけを読みます。

## 5分で試す

Ruby 2.6以上とGitが必要です。追加gemは不要です。

```bash
ruby scripts/validate.rb
ruby scripts/resolve_context.rb "Example Project"
```

新しい情報を追加する場合は、`Templates/`から該当型をコピーし、`System/REGISTRY.yaml`へ登録してからvalidatorを実行します。

詳細は[英語README](README.md)と[AI Entry Point](System/AI_ENTRY_POINT.md)を参照してください。

## ライセンス

MIT Licenseです。
