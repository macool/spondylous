# == Schema Information
#
# Table name: transactions
#
#  id                    :integer          not null, primary key
#  account_id            :integer          not null
#  offer_id              :integer          not null
#  cached_price_cents    :integer          default(0), not null
#  cached_price_currency :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  describe "factory" do
    let(:transaction) {
      build :transaction, :account_credit
    }
    it { expect(transaction).to be_valid }
  end

  describe "validate account without money" do
    let(:account) { create :account, balance: 6.50 }
    let(:offer) { create :offer, price: 7.25 }
    let(:transaction) {
      build :transaction, account: account,
                          offer: offer
    }

    it {
      expect(transaction).to_not be_valid
      expect(
        transaction.errors.full_messages
      ).to include(I18n.t("errors.messages.invalid_balance"))
    }
  end

  describe "updates accounts' balance" do
    let(:account) { create :account, balance: 10 }
    let(:offer) { create :offer, price: 4.20 }
    let(:transaction) {
      build :transaction, account: account,
                          offer: offer
    }

    it {
      expect {
        transaction.save!
      }.to change {
        account.balance
      }.by(offer.price * -1)
    }

    it {
      expect {
        transaction.save!
      }.to change {
        offer.user.account.balance
      }.by(offer.price)
    }
  end
end
