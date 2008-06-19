module RSpecBC
  # Borrowed
  class Connection
    def initialize(host, options = {})
      @host = host
      @port = options[:port]
      @ssl = options[:ssl]
      @username = options[:username]
      @password = options[:password]
    end
    
    def http
      http             = Net::HTTP.new(@host, @port)
      http.use_ssl     = @ssl
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE if http.use_ssl
      http
    end
    
    def request(method, path, *arguments)
      result = http.send(method, path, *arguments)
    end
    
    def post(path, body = '', headers = {})
      request(:post, path, body.to_s, build_request_headers(headers))
    end
    
    def build_request_headers(headers)
      authorization_header.update(default_header).update(headers)
    end
    
    def default_header
      @default_header ||= { "Accept" => "application/xml", "Content-Type" => "application/xml" }
    end
    
    def authorization_header
      (@username || @password ? { 'Authorization' => 'Basic ' + ["#{@username}:#{ @password}"].pack('m').delete("\r\n") } : {})
    end
  end
end