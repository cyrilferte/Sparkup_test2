require 'rails_helper'

RSpec.describe Importation, type: :model do
  it "is not valid without a file" do
    importation = Importation.new
    expect(importation.invalid?)
  end
end
