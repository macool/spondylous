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

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions

  monetize :balance_cents,
           numericality: {
             greater_than_or_equal: 0
           }

  validates :balance, presence: true
  validates :user_id, presence: true
end
