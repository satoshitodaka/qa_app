class QuestionMailer < ApplicationMailer
  def creation_email(question, user)
    @question = question
    mail(
      subject: '質問登録通知メール',
      from: 'user@example.com',
      to: user.email
    )
  end
end
