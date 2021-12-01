require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  # UserMailer.should_receive(:zero_product_email).and_return(double("Mailer", deliver: true))
  before(:each) do
    @user = User.create(email: 'emmymorris1102@gmail.com', password: 'test_password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe 'instructions' do
    let(:mail) { UserMailer.zero_product_email(@user).deliver_now }
    it 'renders the subject' do
      expect(mail.subject).to eq('One Of Your Products Have Reached A Quantity Of 0')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([@user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['product.tracker.app@gmail.com'])
    end

    it 'assigns @email' do
      expect(mail.body.encoded).to match(@user.email)
    end
  end
end
