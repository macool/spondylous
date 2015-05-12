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

  monetize :price_cents,
           numericality: {
             greater_than: 0
           }

  validates :title, presence: true
  validates :price, presence: true
  validates :user_id, presence: true

  ##
  # hack: we need to force this to be a number
  def price_amount=(new_price)
    self.price=new_price.to_f
  end

  def price_amount
    price.to_s
  end
end
