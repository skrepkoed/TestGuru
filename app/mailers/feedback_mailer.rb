class FeedbackMailer < ApplicationMailer

  def feedback(feedback, user)
    @admin = User.find_by(type:'Admin')
    @user_from = user
    @feedback = feedback[:feedback]
    mail to: @admin.email, subject: feedback[:subject]
  end
end
