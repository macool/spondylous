require "rails_helper"

describe %{
  As a User
  I want to create offers
  So that I can charge other users
} do
  let(:seller) { create :user }
  # let(:offer) { create :offer, user: seller }
  let(:offer_attrs) {
    attributes_for(:offer).tap do |attrs|
      attrs[:price_amount] = attrs[:price]
      attrs.delete :price
    end
  }

  let(:submit!) { find("input[type='submit']").click }

  before {
    login_as seller
    visit user_offers_path(seller)
    click_on I18n.t("views.offers.new")
    fill_form!(:offer, offer_attrs)
  }

  it {
    expect {
      submit!
    }.to change{ seller.offers.count }.by(1)
  }
end
