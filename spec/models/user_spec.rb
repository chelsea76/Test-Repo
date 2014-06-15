require 'spec_helper'

describe User do
  let(:user) { User.new }
  
  describe "#valid" do
    subject { user.valid? }
    context "email is blank" do
      before { user.email = ""}
      it { subject.should eql false }
    end
    
    context "email is invalid" do
      before { user.email = "abcgd"}
      it { subject.should eql false }
    end
    
    context "password is blank" do
      before { user.password = ""}
      it { subject.should eql false }
    end
    
    context "Email & Password are valid" do
      before do
        user.email = "demo@demo.com"
        user.password = "cybage@123"
        user.password_confirmation = "cybage@123"
      end
      it { subject.should eql true }
    end
  end
end
