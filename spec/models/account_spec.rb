# == Schema Information
#
# Table name: accounts
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  balance_cents    :integer          default(0), not null
#  balance_currency :string           default("USD"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Account, :type => :model do
  describe "factory" do
    let(:account) { build :account }
    it { expect(account).to be_valid }
  end

  describe "#debt!" do
    let(:account) { create :account, balance: 5.5 }
    let(:offer1) { create :offer, price: 5 }
    let(:offer2) { create :offer, price: 5.6 }

    it {
      expect {
        account.debt!(offer1)
      }.to change {
        account.balance
      }.by(offer1.price * -1)
    }

    it {
      expect {
        account.debt!(offer2)
      }.to raise_exception(Account::InsufficientFundsError)
    }
  end

  describe "#credit!" do
    let(:account) { create :account }
    let(:offer) { create :offer }

    it {
      expect {
        account.credit!(offer)
      }.to change {
        account.balance
      }.by(offer.price)
    }
  end
end
