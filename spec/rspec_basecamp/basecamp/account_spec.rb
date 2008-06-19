require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe RSpecBC::Account do
  before(:each) do
    @account = RSpecBC::Account.new "myproject.projectpath.com", "testlogin", "testing", :ssl => true
    @account_without_ssl = RSpecBC::Account.new "unprotected.projectpath.com", "lancelot", "isahomewrecker", :ssl => false
    @real = RSpecBC::Account.new "rubyskills.projectpath.com", "lance", "411576", :ssl => true
  end
  
  it "should generate a url to login to using ssl" do
    @account.url.should == "https://testlogin:testing@myproject.projectpath.com"
  end
  
  it "should generate a url to login without ssl" do
    @account_without_ssl.url.should == "http://lancelot:isahomewrecker@unprotected.projectpath.com"
  end
  
  it "should generate a request that is postable to the basecamp API" do
    @account.post_request("test").should == "Accept: application/xml\nContent-Type: application/xml\n<request>test</request>"
  end
end