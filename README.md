<div style="text-align: center;">
<h1>zsh</h1>
</div>

---

## zsh用設定ファイル

### 推奨導入方法
以下のコマンドを実行する

```shell
mkdir -p ~/.dotfiles
git clone git@github.com:Kou-Ro/zsh ~/.dotfiles/zsh
ln -s --backup=simple -S .bak ./.dotfiles/zsh/.zshenv
```

### 機能
* 日本語出力
* コマンド補完
  * コマンド修正
  * コマンド補完大・小文字両対応
  * コマンド補完矢印キー選択
* ディレクトリ移動補完
  * ディレクトリ名のみでのカレントディレクトリ移動
  * ディレクトリ移動履歴保存
* history
  * history共有
  * 重複history削除
  * history日時表示
* カスタムプロンプト
  * config/colorを編集することでカラースキーム変更可能
* キーバインド(Xmodmap)読み込み
* 関数
    * mkcd : ディレクトリを作成し、そのディレクトリに入る
* エイリアス
  * exz : exec zsh
  * $ : 
  * \# : sudo
  * rma : rm -r
  * ls : ls --color=auto