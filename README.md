# aws-terraform-LINE
awsとLINEを用いた構成をterraformで記述し、それらのtfファイルを本リポジトリで管理している。

## 事前準備

1. Line Developersの登録。
2. Line Developersにログインし、プロバイダーを作成する。
3. プロバイダー内でMessaging API設定の`チャネルアクセストークン`を確認し、コピーしておく。
4. AWSコンソールにログインし、SecretsManagerを開く
5. 「新しいシークレットを保存する」を選択し、「その他のシークレットタイプ」にキー/バリュー形式で`チャネルアクセストークン`を記載。キーを控えておく。
6. AWSコンソールにログインしcredentialsを取得する。

## 使用方法 - running_ec2

1. `aws configure`を実行し、credentialsをコピペ。
2. main.tfの`prefix`, `secret_id_key`を入力する。
