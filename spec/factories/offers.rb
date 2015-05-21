# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  detail         :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :offer do
    sequence(:title) { |n| "Oferta #{n}" }
    detail           { "#{title} details" }
    price            { rand * 10 }
    user
  end
end
