class AnswerMailer < ApplicationMailer
  def creation_email(answer, user)
    @answer = answer
    mail(
      subject: '回答投稿通知メール',
      from: 'qa_app@example.com',
      to: user.email
    )
  end
end
