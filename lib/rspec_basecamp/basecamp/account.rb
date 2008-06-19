module RSpecBC
  # @account = Account.new "myproject.projectpath.com", "testlogin", "testing", :ssl => true
  class Account
    attr_accessor :domain, :login, :password
    
    def initialize(domain, login, password, options={})
      @domain = domain
      @login = login
      @password = password
      @ssl = options[:ssl] || false
    end
    
    def post(request, data)
      http = Connection.new(domain, :port => 443, :ssl => true, :username => @login, :password => @password)
      http.post(request, post_request(data))
    end
    
    def post_request(data)
      data = "<request>#{data}</request>"
    end
    
    def ssl?
      @ssl
    end
    
    def protocol
      ssl? ? "https" : "http"
    end

    def url
      "#{protocol}://#{domain}"
    end

  end
end