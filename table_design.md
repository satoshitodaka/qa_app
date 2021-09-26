## テーブル設計

- User
  - nickname: string, null: false
  - email: string, null: false
  - password_digest: string, null: false
  - admin: boolean, default: false, null: false

- Question
  - title: string, null: false
  - context: text, null: false
  - solved: boolean, default: false, null: false
  - solved_at: Datetime
  - reference型でUserに紐づける

- Answer
  - title: striong, null: false
  - content: text, null: false
  - reference型でUserに紐づける
  - reference型でQuestionに紐づける


## 要件の実装方針
#### ログインログアウト機能がある
- Userモデルに`has_secure_password`を記述する
#### ユーザーはニックネームとアバター画像を登録できる
- ニックネームはUserモデルにカラム`nickname`を設定する。
- Active Strageを用いて、Userモデルにアバター画像を紐づける。
#### ユーザーは質問を投稿できる
- Questionコントローラで`create`アクションを作る。
#### ユーザーは自分の質問を編集・削除できる
- Questionコントローラで`edit``destroy`アクションを作る。
#### ユーザーは質問に対して回答ができる
- ユーザーと回答に紐づく質問を作成する。Answerコントローラの`create`アクション
#### ユーザーは質問を解決済み状態に変更できる
- Questionにカラム`solved`を作り、ユーザーに編集させる。
#### ユーザーは質問を検索できる
- gemで実装する。
#### 質問があった際に全員に対して質問があった旨をメールで通知する（ただし自分は除く）
- question_mailerを作成し、Questionコントローラの`create``アクションの中で、登録成功時に対象者にメール送信する。
#### 質問に対して回答があった場合は質問者および当該質問に回答したユーザーに対してメールで通知する。（ただし自分は除く）
- answer_mailerを作成し、Anserコントローラの`create``アクションの中で、登録成功時に対象者にメール送信する。
#### 質問はページングできる
- gemで実装する。
#### 管理画面がある（ユーザー管理？）
- route.jpの名前空間で、Userのadmin用のコントローラを設定。
#### 管理画面へは権限を付与されたユーザーしか入れない
- 管理画面のコントローラに`before_action`で制限をかける。
#### 管理画面では全てのリソースを削除できる
- route.jpの名前空間で、リソースごとにadmin用のコントローラを設定。
