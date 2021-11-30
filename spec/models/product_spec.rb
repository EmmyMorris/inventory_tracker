require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:quantity)}
    it {should validate_numericality_of(:quantity)}
  end
end
