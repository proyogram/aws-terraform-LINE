# aws-terraform-LINE
本リポジトリは、terraformで記述された「AWSリソースとLINEを用いた構成」を管理している。

## 事前準備

1. Line Developersへの登録。([こちら](https://developers.line.biz/ja/)から)
2. Line Developersにログインし、プロバイダーを作成する。
3. プロバイダー内で「Messaging API設定」の`チャネルアクセストークン`を確認し、コピーしておく。
4. AWSコンソールにログインし、Secrets Managerを開く。
5. 「新しいシークレットを保存する」を選択する。
6. 「その他のシークレットタイプ」にキー/バリュー形式で`チャネルアクセストークン`を以下のように設定。 

|  キー  |  バリュー  |
| ---- | ---- |
|  LINE_ACCESS_TOKEN_STOP_EC2  |  <チャネルアクセストークン>  |

7. AWSコンソールにログインしIAMユーザ>>「セキュリティ認証情報」>>「アクセスキー」よりcredentialsを生成する。

## 使用方法 - running_ec2

1. `aws configure`を実行し、credentialsをペースト。
2. main.tfの`prefix`, `secret_id_key`を入力する。
3. `terraform plan`を実行し、作成されるリソースを確認
4. `terraform apply`を実行
5. API Gatewayのコンソール画面から作成した`API名`>>「ステージ」>>`ステージ名`>>「POST」を選択し、 「URLの呼び出し」に記載のURLをコピーしておく。
6. LINE Developersに移動し、「Messaging API設定」>>「Webhook設定」の 「Webhook URL」に5で取得したURLをペーストする。
7. 「Webhook設定」内で「Webhookの利用」にチェックを入れる。
8. 以上

## 留意点

- API Gatewayが削除→再作成され場合、5のURLが変更になる。その際は5~7の手順を再度実行する必要がある。（`チャネルアクセストークン`は変更されない。）
