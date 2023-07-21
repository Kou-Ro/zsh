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
ln -s ~/.dotfiles/zsh/.zshenv ~/
```

### 搭載内容
* 日本語出力
* カラー出力
* コマンド補完
* history共有
* ディレクトリ名のみでのカレントディレクトリ移動
* ディレクトリ移動履歴保存
* コマンド修正
* コマンド補完矢印キー選択
* コマンド補完大・小文字両対応
* キーバインド(Xmodmap)読み込み
* ls自動色付き表示
* 関数
    * mkcd : ディレクトリを作成し、そのディレクトリに入る
* エイリアス
  * exz : exec zsh
  * $ : 
  * \# : sudo
  * rma : rm -r
* カスタムプロンプト
  * config/colorを編集することでカラースキーム変更可能