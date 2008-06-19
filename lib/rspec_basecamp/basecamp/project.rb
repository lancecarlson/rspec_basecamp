module RSpecBC
  class Project
    attr_reader :id, :account
    
    def initialize(id, account)
      @id = id
      @account = account
    end
    
    def self.list_url
      "/project/list"
    end
  end
end