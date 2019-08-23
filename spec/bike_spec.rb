require "boris_bikes"
require "bike"

describe Bike do

  it "reports the bike as broken when returned" do
    subject.report_broken
    expect(subject).to be_broken
  end

  it "responds to #report_broken" do
    expect(subject).to respond_to(:report_broken)
  end

end
