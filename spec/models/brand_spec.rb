require "rails_helper"

RSpec.describe Brand, type: :model do
  describe "Direct Associations" do
    it { should have_many(:comments) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
