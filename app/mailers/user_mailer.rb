class UserMailer < ApplicationMailer
  def zero_product_email(user)
    @user = user
    mail(to: @user.email, subject: 'One Of Your Products Have Reached A Quantity Of 0')
  end
end
