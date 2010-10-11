require "spec_helper"

describe ComentarioMailer do
  describe "notifica" do
    let(:mail) { ComentarioMailer.notifica }

    it "renders the headers" do
      mail.subject.should eq("Notifica")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
