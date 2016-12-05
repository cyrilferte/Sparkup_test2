require 'rails_helper'

RSpec.describe Contact, type: :model do
  subject {
    described_class.new(first_name: "Cyril", last_name: "Ferte", email: "cyril@fertec.fr")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid if first or last name shorter than 3 characters" do
    subject.first_name = "Cyril"
    expect(subject).to_not be_valid

    # Reset first_name to a valid length.
    subject.first_name = "Cyril"
    subject.last_name = "Ferte"
    expect(subject).to_not be_valid
  end

  it "is not valid with existing first and last name" do
    subject.save
    contact = Contact.new(first_name: "Cyril", last_name: "Ferte", email: "cyril@fertec.fr")
    expect(contact).to_not be_valid
  end

  it "is not valid with existing email address" do
    subject.save
    contact = Contact.new(first_name: "Cyril", last_name: "Ferte", email: "cyril@fertec.fr")
    expect(contact).to_not be_valid
  end

  it "is not valid with invalid email address" do
    subject.email = "cyril@fertec.fr"
    expect(subject).to_not be_valid
  end

  it "capitalizes first and last name" do
    # Nudge before_validation callback.
    subject.valid?

    expect(subject.first_name).to eq "Cyril"
    expect(subject.last_name).to eq "Ferte"
  end

  it "corrects invalid characters in name fields" do
    subject.first_name = "C$^&dric"
    subject.last_name = "C$^&dric"

    # Nudge before_validation callback.
    subject.valid?
    expect(subject.first_name).to eq "Cdric"
    expect(subject.last_name).to eq "Cdric"
  end
end
