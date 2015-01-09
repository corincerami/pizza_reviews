require "rails_helper"

describe Pizzeria do
  let(:blank_values) { [nil, ""] }

  describe "#pizzeria" do
    it { should have_valid(:name).when("#{'x' * 2 }", "#{'x' * 100 }") }
    it { should_not have_valid(:name).when("x", "#{'x' * 101 }", *blank_values) }
  end
end
