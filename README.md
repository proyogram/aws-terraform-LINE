# aws-terraform-LINE
本リポジトリは、「AWS with LINEの構成」のterraformコードを管理している。

## 事前準備

`$aws configure`の credentials 設定は完了している前提

1. Line Developersへの登録。([こちら](https://developers.line.biz/ja/)から)
2. Line Developersにログインし、プロバイダーを作成する。
3. プロバイダー内で「チャンネル基本設定」の`ユーザID`を確認し、コピーしておく。 
4. プロバイダー内で「Messaging API設定」の`チャネルアクセストークン`を確認し、コピーしておく。 
5. 取得した`ユーザID`、`チャネルアクセストークン`の設定をする。CLI上で以下のコマンドを実行する。
※本環境において、以下の二つのプロバイダを使用している。この場合、`ユーザID`および`チャネルアクセストークン`はプロバイダごとに設定する必要がある。以下は、本環境で設定しているプロバイダと環境変数の対応を示している。

|  プロバイダ  |  ユーザIDの環境変数  |  チャネルアクセストークンの環境変数  |
| ---- | ---- | ---- |
|  AWS Cost Alert  |  LINE_USER_ID  | LINE_ACCESS_TOKEN |
|  Stop Running Instance  |  LINE_USER_ID_RUNNING_EC2  | LINE_ACCESS_TOKEN_RUNNING_EC2 |

-  Windowsの場合
```
export TF_VAR_<ユーザIDの環境変数>=<ユーザID>
export TF_VAR_<チャネルアクセストークンの環境変数>=<チャネルアクセストークン>
```
-  Mac/Linuxの場合
```
TF_VAR_<ユーザIDの環境変数>=<ユーザID>
TF_VAR_<チャネルアクセストークンの環境変数>=<チャネルアクセストークン>
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
5. plan結果が問題なければ、`$terraform apply`を実行。
6. API Gatewayのコンソール画面から作成した`API名`>>「ステージ」>>`ステージ名`>>「POST」を選択し、 「URLの呼び出し」に記載のURLをコピーしておく。
7. LINE Developersに移動し、「Messaging API設定」>>「Webhook設定」の 「Webhook URL」に6で取得したURLをペーストする。
8. 「Webhook設定」内で「Webhookの利用」にチェックを入れる。
9. 以上

※ API Gatewayが削除→再作成され場合、URLが変更される。その際は6~7の手順を再度実行する必要がある。（`チャネルアクセストークン`は変更されない。）

※ユーザIDは不要。

## 使用方法 - weekly_notification

1. CLIを開き本リポジトリをcloneする。
2. `$terraform plan`を実行。
3. 取得した`ユーザID`、`チャネルアクセストークン`の設定
4. plan結果が問題なければ、$`terraform apply`を実行。
5. 以上
