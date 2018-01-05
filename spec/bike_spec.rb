require 'rspec'
require 'spec_helper'
require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it 'bike can be broken' do
    subject.report_broken
    expect(subject.working?).to be_falsey
  end
end
