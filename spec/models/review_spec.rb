require "rails_helper"

describe Review do
  let(:blank_values) { [nil, ""] }

  describe "#title" do
    it { should have_valid(:title).when("Best Pizza Ever", "123Pizza") }
    it { should_not have_valid(:title).when("#{'x' * 51 }", *blank_values) }
  end

  describe "#body" do
    it { should have_valid(:body).when("#{'x' * 50}", "#{'x' * 1000}") }
    it { should_not have_valid(:body).when("#{'x' * 49}", "#{'x' * 1001 }", *blank_values) }
  end

  describe "#rating" do
    it { should have_valid(:rating).when("3")}
    it { should_not have_valid(:rating).when("0", "6", *blank_values)}
  end
end
