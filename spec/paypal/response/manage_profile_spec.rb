require "spec_helper"

describe PayPal::Recurring::Response::ManageProfile do
  let(:paypal) { PayPal::Recurring.new({
        :username    => "fnando.vieira+seller_api1.gmail.com",
        :password    => "PRTZZX6JDACB95SA",
        :signature   => "AJnjtLN0ozBP-BF2ZJrj5sfbmGAxAnf5tev1-MgK5Z8IASmtj-Fw.5pt",
        :seller_id   => "F2RM85WS56YX2",
        :email       => "fnando.vieira+seller.gmail.com"
      },{ :profile_id => "I-W4FNTE6EXJ2W" }) }

  context "suspending" do
    context "when successful" do
      use_vcr_cassette "profile/suspend/success"
      subject { paypal.suspend }

      it { should be_success }
      it { should be_valid }
    end

    context "when failure" do
      use_vcr_cassette "profile/suspend/failure"
      subject { paypal.suspend }

      it { should_not be_success }
      it { should_not be_valid }
      its(:errors) { should have(1).item }
    end
  end

  context "reactivating" do
    context "when successful" do
      use_vcr_cassette "profile/reactivate/success"
      subject { paypal.reactivate }

      it { should be_success }
      it { should be_valid }
    end

    context "when failure" do
      use_vcr_cassette "profile/reactivate/failure"
      subject { paypal.reactivate }

      it { should_not be_success }
      it { should_not be_valid }
      its(:errors) { should have(1).item }
    end
  end

  context "cancelling" do
    context "when successful" do
      use_vcr_cassette "profile/cancel/success"
      subject { paypal.cancel }

      it { should be_success }
      it { should be_valid }
    end

    context "when failure" do
      use_vcr_cassette "profile/cancel/failure"
      subject { paypal.cancel }

      it { should_not be_success }
      it { should_not be_valid }
      its(:errors) { should have(1).item }
    end
  end
end
