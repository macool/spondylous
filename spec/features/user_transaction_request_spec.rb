require "rails_helper"

describe %{
  As a User
  I want to be prompted before a transaction is made
  So that I can confirm or deny
} do
  let(:client) { create :user }
  let(:seller) { create :user }
  let(:offer) { create :offer, user: seller }

  before {
    visit user_offer_path(seller, offer)
  }

  subject { page.html }

  it { is_expected.to have_text(offer.detail) }
  it { is_expected.to have_text(offer.price) }
end
