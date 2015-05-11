require "rails_helper"

describe %{
  As a User
  I want to be prompted before a transaction is made
  So that I can confirm or deny
} do
  let(:user) { create :user }
end
