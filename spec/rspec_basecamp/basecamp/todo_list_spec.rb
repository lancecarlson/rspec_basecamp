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
  
  
  it "should grab the id when it is saved" do
    @todo_list.update_from_response(response)
    @todo_list.id.should == 4117328
  end
  
  def response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<todo-list>\n  <completed-count type=\"integer\">0</completed-count>\n  <description>Test Todo List</description>\n  <id type=\"integer\">4117328</id>\n  <milestone-id type=\"integer\" nil=\"true\"></milestone-id>\n  <name>Test</name>\n  <position type=\"integer\">1</position>\n  <private type=\"boolean\">false</private>\n  <project-id type=\"integer\">2170939</project-id>\n  <tracked type=\"boolean\">true</tracked>\n  <uncompleted-count type=\"integer\">0</uncompleted-count>\n  <complete>false</complete>\n</todo-list>\n"
  end
end