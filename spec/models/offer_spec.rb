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

require 'rails_helper'

RSpec.describe Offer, :type => :model do
  describe "factory" do
    let(:offer) { build :offer }
    it { expect(offer).to be_valid }
  end
end
