## テーブル設計

- Users
  - nickname: string, null: false
  - email: string, null: false
  - password_digest: string, null: false
  - admin: boolean, default: false, null: false

- Questions
  - title: string, null: false
  - context: text, null: false
  - resolved: boolean, default: false, null: false
  - resolved_at: datetime
  - reference型でUserに紐づける

- Answers
  - title: string, null: false
  - content: text, null: false
  - reference型でUserに紐づける
  - reference型でQuestionsに紐づける
