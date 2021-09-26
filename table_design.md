## テーブル設計

- users
  - nickname: string, null: false
  - email: string, null: false
  - password_digest: string, null: false
  - admin: boolean, default: false, null: false
  - `add_index :users, :email, unique: true`で`email`に一意制を保つ。

- questions
  - title: string, null: false
  - content: text, null: false
  - solved: boolean, default: false, null: false
  - solved_at: datetime
  - reference型でUserに紐づける

- answers
  - title: string, null: false
  - content: text, null: false
  - reference型でUserに紐づける
  - reference型でQuestionsに紐づける
