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

require 'rails_helper'

RSpec.describe Account, :type => :model do
  describe "factory" do
    let(:account) { build :account }
    it { expect(account).to be_valid }
  end
end
