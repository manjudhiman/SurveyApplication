require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validation' do
    subject { described_class.new(email: "abc@gmail.com", password: "123123", remember_me: "0") }

    context 'When email and passsword are present' do
      it "user is valid" do
        expect(subject).to be_valid
      end
    end
  end
end
