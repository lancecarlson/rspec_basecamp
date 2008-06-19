module RSpecBC
  class TodoItem
    attr_reader :todo_list
    attr_accessor :content
    
    def initialize(todo_list, content)
      @todo_list = todo_list
      @content = content
    end
    
    def account
      todo_list.account
    end
    
    def create
      response, body = account.post(create_url, self.to_xml)
      puts response.inspect
      puts body.inspect
    end
    
    def create_url
      "/todos/create_item/#{todo_list.id}"
    end
    
    def to_xml
      builder = Builder::XmlMarkup.new
      xml = builder.content content
    end
  end
end