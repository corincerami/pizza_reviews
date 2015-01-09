require "rails_helper"

describe Review do
  let(:blank_values) { [nil, ""] }

  describe "#title" do
    it { should have_valid(:title).when("Best Pizza Ever", "123Pizza") }
    it { should_not have_valid(:title).when("#{'x' * 51 }", *blank_values) }
  end
end
