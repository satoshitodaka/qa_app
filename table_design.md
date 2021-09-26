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
