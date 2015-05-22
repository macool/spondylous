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

class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :offer

  monetize :cached_price_cents,
           numericality: {
             greater_than: 0
           }

  before_validation :cache_price!
  before_create :credit_accounts!

  begin :validations
    validates :offer, presence: true
    validates :account, presence: true
    validates :cached_price, presence: true
    validate :account_has_money
  end

  def account_has_money
    if !(account.balance >= offer.price)
      errors.add(
        :base,
        I18n.t("errors.messages.invalid_balance")
      )
    end
  end

  private

  def cache_price!
    self.cached_price = offer.price
  end

  def credit_accounts!
    account.debt!(offer)
    offer.user.account.credit!(offer)
  end
end
