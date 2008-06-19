module RSpecBC
  # RSpecBC::TodoList.new(project,
  #   :private => false,
  #   :tracked => true,
  #   :name => "Test",
  #   :description => "Test Todo List"
  # )
  class TodoList    
    attr_accessor :milestone_id, :private, :tracked, :name, :description, :project, :todo_items
    
    def initialize(project, attrs = {})
      @project = project
      @private = attrs[:private]
      @tracked = attrs[:tracked]
      @name = attrs[:name]
      @description = attrs[:description]
    end
    
    def account
      project.account
    end
    
    def create
      response, body = account.post(create_url, self.to_xml)
      puts response.inspect
      puts body.inspect
    end
    
    def to_xml
      builder = Builder::XmlMarkup.new
      xml = builder.milestone_id milestone_id if milestone_id
      xml = builder.private @private
      xml = builder.tracked tracked if tracked
      xml = builder.name name if name
      xml = builder.description description if description
      xml
    end
    
    private
    
      def create_url
        "/projects/#{project.id}/todos/create_list"
      end
  end
end