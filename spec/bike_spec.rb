require 'Rspec'
require 'spec_helper'
require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
end
