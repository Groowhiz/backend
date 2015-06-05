class Errors < StandardError

  attr_reader :http_error_code
  @@default_options = {:code=> :UNKNOWN_ERROR, :type => "ERROR" , :params=>{}}

  def initialize(options=nil, http_error_code=400)
    if options
      case options
        when Array
          init_messages_from_options(options)
        when Hash
          init_messages_from_options([options])
      end
    else
      init_messages_from_self()
    end
    @http_error_code = http_error_code
  end

  def to_json
    { :messages => @messages}.to_json
  end

  def message
    { :messages => @messages}.to_s
  end

  def to_s
    { :messages => @messages}.to_s
  end

  private
  #{:code=> :SC_UNKNOWN_ERROR, :type => "ERROR" , :http_code => 400, :params=>{param hash} , :message=>"Error message"}
  def init_messages_from_options(messages)
    @messages = messages.collect do |message|
      @@default_options.merge(message)
    end
  end

  def init_messages_from_self()
    class_name = self.class.to_s.split("::")[-1]
    code = class_name.underscore.upcase.sub(/_ERROR$/, '')
    params = {}
    self.instance_variables.each do |v|
      key = v.to_s[1..-1] # Ignore the @
      params[key] = self.instance_variable_get(v)
    end

    message = nil
    if self.respond_to?(:message)
      message = self.message
    end

    init_messages_from_options([{:code => code, :type => "ERROR", :params => params, :message => message}])
  end
end
