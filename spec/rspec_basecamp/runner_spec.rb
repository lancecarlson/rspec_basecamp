require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe RSpecBC::Runner do  
  it "should create todo lists and todo items" do
    config_path = File.join(File.dirname(__FILE__), "..", "fixtures", "rspec_basecamp.yml")
    RSpecBC::Runner.start(config_path)
  end
  
  #it "should load the configs from a yaml file" do
  #  RSpecBC::Runner.load_config.should == {
  #    "project1"=> { 
  #      "ssl" => true, 
  #      "project_id" => 5, 
  #      "domain" => "crazy.projectpath.com", 
  #      "password" => "pword", 
  #      "login" => "testing123"
  #    }
  #  }
  #end
  
end