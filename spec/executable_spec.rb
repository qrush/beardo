require File.join(File.dirname(__FILE__), 'spec_helper')
$:.unshift File.join(File.dirname(__FILE__), '..', 'bin')

describe "the executable" do
  before do
    ARGV.clear
    stub(Beardo).run("") { true }
  end

  it "should take in some arguments" do
    mock(Beardo).run("") { true }
    load "bd"
  end

   it "should parse options with optparse" do
     @args = []
     @opts = Object.new
     stub(OptionParser).new { @opts }
     mock(@opts).parse! { true }
     load "bd"
   end

   it "should parse --status properly" do
     @status = "work sucks"
     ARGV << "--status"
     ARGV << @status
     mock(Beardo).run(@status) { true }
     load "bd"
   end
end
