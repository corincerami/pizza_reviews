require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('lizvdk', 'kerronh123') }
  it { should_not have_valid(:username).when('', nil) }

  it { should have_valid(:first_name).when('Liz', nil) }

  it { should have_valid(:last_initial).when('V') }
  it { should_not have_valid(:last_initial).when('ABC', '3') }

  it { should have_valid(:bio).when('Cool bio.', "#{"x"*1000}") }
  it { should_not have_valid(:bio).when("#{"x"*1001}") }

  it { should have_many(:reviews).dependent(:destroy)}

  it { should have_many(:comments).dependent(:destroy)}

  it { should have_many(:votes).dependent(:destroy)}
end
