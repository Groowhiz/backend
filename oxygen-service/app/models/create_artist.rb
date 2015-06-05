require_relative "errors"

class CreateArtist < ActiveRecord::Base

  def self.create request
    p "Request Yo: #{request}"
    first_name = request["first_name"]
    last_name = request["last_name"]
    email = request["email"]
    crypted_password = request["crypted_password"]
    role = request["role"]
    location = request["location"]
    display_image = request["display_image"]
    sex = request["sex"]
    sql_query = "Insert into accounts (first_name, last_name, email, crypted_password, role, location, display_image, sex)
                  values ('#{first_name}', '#{last_name}', '#{email}', '#{crypted_password}', '#{role}', '#{location}', '#{display_image}',
                  '#{sex}')"
    select_query = "select * from accounts where email = '#{email}'"
    response = {}
    begin
      ActiveRecord::Base.transaction do
        ActiveRecord::Base.connection.execute(sql_query)
        response = ActiveRecord::Base.connection.select_all(select_query).to_hash
      end
    rescue Exception => ex
      raise Errors.new({:code=> :INVALID_DATA_PASSED, :message=> ex.message}, 400)
    end

    p "Response #{response}"
    response

  end

end