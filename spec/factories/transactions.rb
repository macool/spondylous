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

FactoryGirl.define do
  factory :transaction do
    account
    offer

    trait :account_credit do
      after :build do |t|
        t.account.update! balance: t.offer.price.to_f + 1
      end
    end
  end
end
