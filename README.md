<div style="text-align: center;">
<h1>zsh</h1>
</div>
<div style="text-align: right;">
v2.0.1
</div>

---

## zsh用設定ファイル

### 推奨導入方法
以下のコマンドを実行する

```shell
mkdir -p ~/.dotfiles
git clone --recursive https://github.com/Kou-Ro/zsh.git ~/.dotfiles/zsh
ln -s --backup=simple -S .bak ~/.dotfiles/zsh/.zshenv ~/
```
### アップデート方法
zshで以下を実行
```shell
zcon update
```
(変更がある状態で実行するとコンフリクトが発生する可能性があります)

### 機能
* 日本語出力
* コマンド補完
  * コマンド修正
  * コマンド補完大・小文字両対応
  * コマンド補完矢印キー選択
  * コマンド実行履歴自動表示
  * コマンド予測表示
  * gitコマンド補完
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
  * zcon : 本リポジトリ操作用
    * update : リポジトリアップデート
  * mkcd : ディレクトリを作成し、そのディレクトリに入る
* エイリアス
  * exz : exec zsh
  * $ : 
  * \# : sudo
  * rma : rm -r
  * ls : ls --color=auto
