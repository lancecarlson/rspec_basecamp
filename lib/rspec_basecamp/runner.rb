module RSpecBC
  class Runner
    def self.start(config_file)
      @file = config_file
      first_account = load_config.keys.first # Get the first account and that's it
      @configs = @config_hash[first_account]
      @account = Account.new(@configs["domain"], @configs["login"], @configs["password"], :ssl => @configs["ssl"])
      find_project
      create_todo_lists
    end
    
    def self.load_config
      @config_hash = YAML.load_file(@file)
    end
    
    def self.find_project
      @project = Project.new @configs["project_id"], @account
    end
    
    def self.create_todo_lists
      todo_list = RSpecBC::TodoList.new(@project,
        :private => false,
        :tracked => true,
        :name => "Test",
        :description => "Test Todo List"
      )
      todo_list.create
      todo_item = RSpecBC::TodoItem.new(todo_list, "Need to do this!").create
    end
  end
end