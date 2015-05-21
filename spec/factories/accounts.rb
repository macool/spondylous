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

FactoryGirl.define do
  factory :account do
    user
    balance { rand * 10 }
  end
end
