require File.join(File.dirname(__FILE__), "..", "..", "spec_helper")

describe RSpecBC::TodoList do
  before(:each) do
    @project_id = 1
    @todo_list = RSpecBC::TodoList.new(@project_id, 
      :private => false,
      :tracked => true,
      :name => "Testing",
      :description => "Test Todo List"
    )
  end
  
  it "should have a proper XML format to send to basecamp" do
    @todo_list.to_xml.should == "<private>false</private>" +
    "<tracked>true</tracked>" +
    "<name>Testing</name>" +
    "<description>Test Todo List</description>"
  end
end