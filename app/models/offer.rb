# == Schema Information
#
# Table name: offers
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  detail         :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Offer < ActiveRecord::Base
  belongs_to :user

  monetize :price_cents

  validates :title, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
