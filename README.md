# aws-terraform-LINE
本リポジトリは、「AWS with LINEの構成」のterraformコードを管理している。

## 事前準備

`$aws configure`の credentials 設定は完了している前提

### tfstateファイルの格納先であるS3バケットの設定

1. コンソール上でS3バケットを作成。
2.  `provider.tf` 内の`<BUCKET_NAME>`に作成したバケット名を設定。

### LINEの設定

1. Line Developersへの登録。([こちら](https://developers.line.biz/ja/)から)
2. Line Developersにログインし、プロバイダーを作成する。
3. プロバイダー内で「チャンネル基本設定」の`ユーザID`を確認し、コピーしておく。 
4. プロバイダー内で「Messaging API設定」の`チャネルアクセストークン`を確認し、コピーしておく。 
5. 取得した`ユーザID`、`チャネルアクセストークン`の設定をする。CLI上で以下のコマンドを実行する。

-  Windowsの場合
```
export TF_VAR_LINE_USER_ID=<ユーザID>
export TF_VAR_LINE_ACCESS_TOKEN=<チャネルアクセストークン>
```
-  Mac/Linuxの場合
```
TF_VAR_LINE_USER_ID=<ユーザID>
TF_VAR_LINE_ACCESS_TOKEN=<チャネルアクセストークン>
```

## 使用方法 - budgets_alert

1. CLIを開き本リポジトリをcloneする。
2. `$terraform plan`を実行。
4. plan結果が問題なければ、`$terraform apply`を実行。
5. 以上

## 使用方法 - running_ec2

1. CLIを開き本リポジトリをcloneする。
2. `$terraform plan`を実行。
3. 取得した`ユーザID`、`チャネルアクセストークン`の設定。
4. plan結果が問題なければ、`$terraform apply`を実行。
5. API Gatewayのコンソール画面から作成した`API名`>>「ステージ」>>`ステージ名`>>「POST」を選択し、 「URLの呼び出し」に記載のURLをコピーしておく。
6. LINE Developersに移動し、「Messaging API設定」>>「Webhook設定」の 「Webhook URL」に上で取得したURLをペーストする。
7. 「Webhook設定」内で「Webhookの利用」にチェックを入れる。
8. 以上

※ API Gatewayが削除→再作成され場合、URLが変更される。その際は5~7の手順を再度実行する必要がある。（`チャネルアクセストークン`は変更されない。）

※ユーザIDは不要。

## 使用方法 - weekly_notification

1. CLIを開き本リポジトリをcloneする。
2. `$terraform plan`を実行。
3. 取得した`ユーザID`、`チャネルアクセストークン`の設定
4. plan結果が問題なければ、$`terraform apply`を実行。
5. 以上
