# aws-terraform-LINE
本リポジトリは、terraformで記述された「AWSリソースとLINEを用いた構成」を管理している。

## 事前準備

1. Line Developersへの登録。([こちら](https://developers.line.biz/ja/)から)
2. Line Developersにログインし、プロバイダーを作成する。
3. プロバイダー内で「チャンネル基本設定」の`ユーザID`を確認し、コピーしておく。 
4. プロバイダー内で「Messaging API設定」の`チャネルアクセストークン`を確認し、コピーしておく。 
5. AWSコンソールにログインしIAMユーザ>>「セキュリティ認証情報」>>「アクセスキー」よりcredentialsを生成する。

※本環境において、以下の二つのプロバイダを使用している。この場合、`ユーザID`および`チャネルアクセストークン`はプロバイダごとに設定する必要がある。以下は、本環境で設定しているプロバイダと環境変数の対応を示している。

|  プロバイダ  |  ユーザID  |  チャネルアクセストークン  |
| ---- | ---- | ---- |
|  AWS Cost Alert  |  LINE_USER_ID  | LINE_ACCESS_TOKEN |
|  Stop Running Instance  |  LINE_USER_ID_RUNNING_EC2  | LINE_ACCESS_TOKEN_RUNNING_EC2 |

## 使用方法 - budgets_alert

1. `aws configure`を実行し、credentialsをペースト。
2. `terraform plan`を実行。
3. `LINE_USER_ID`に`ユーザID`をペーストする。
4. `LINE_ACCESS_TOKEN`に`チャネルアクセストークン`をペーストする。
5. plan結果が問題なければ、`terraform apply`を実行
6. 以上

## 使用方法 - running_ec2

1. `aws configure`を実行し、credentialsをペースト。
2. `terraform plan`を実行。
4. `LINE_ACCESS_TOKEN_RUNNING_EC2`に`チャネルアクセストークン`をペーストする。
5. plan結果が問題なければ、`terraform apply`を実行。
6. API Gatewayのコンソール画面から作成した`API名`>>「ステージ」>>`ステージ名`>>「POST」を選択し、 「URLの呼び出し」に記載のURLをコピーしておく。
7. LINE Developersに移動し、「Messaging API設定」>>「Webhook設定」の 「Webhook URL」に6で取得したURLをペーストする。
8. 「Webhook設定」内で「Webhookの利用」にチェックを入れる。
9. 以上

※ユーザIDは不要。

## 使用方法 - weekly_notification

1. `aws configure`を実行し、credentialsをペースト。
2. `terraform plan`を実行。
3. `LINE_USER_ID_RUNNING_EC2`に`ユーザID`をペーストする。
4. `LINE_ACCESS_TOKEN_RUNNING_EC2`に`チャネルアクセストークン`をペーストする。
5. plan結果が問題なければ、`terraform apply`を実行。
6. 以上

## 留意点

- API Gatewayが削除→再作成され場合、5のURLが変更になる。その際は5~7の手順を再度実行する必要がある。（`チャネルアクセストークン`は変更されない。）
