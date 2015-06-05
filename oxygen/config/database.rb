##
# A MySQL connection:
#   DataMapper.setup(:default, 'mysql://root:""@localhost/oxygen_development')
#
# # A Postgres connection:
# DataMapper.setup(:default, 'postgres://user:password@localhost/the_database_name')
#
# # A Sqlite3 connection
# DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "development.db"))
#
# # Setup DataMapper using config/database.yml
# DataMapper.setup(:default, YAML.load_file(Padrino.root('config/database.yml'))[RACK_ENV])
#
# config/database.yml file:
#
# ---
# development: &defaults
#   adapter: mysql
#   database: example_development
#   username: user
#   password: Pa55w0rd
#   host: 127.0.0.1
#
# test:
#   <<: *defaults
#   database: example_test
#
# production:
#   <<: *defaults
#   database: example_production
#

# DataMapper.logger = logger
# DataMapper::Property::String.length(255)

DB_DEFAULTS = {
    :adapter   => 'mysql2',
    :encoding  => 'utf8',
    :reconnect => true,
    :database  => "oxygen_development",
    :pool      => 25,
    :username  => "root",
    :password  => "",
    :host      => "localhost"
}

p "#{DB_DEFAULTS}"
# Setup our logger
ActiveRecord::Base.logger = logger

# Include Active Record class name as root for JSON serialized output.
ActiveRecord::Base.include_root_in_json = false

# Store the full class name (including module namespace) in STI type column.
ActiveRecord::Base.store_full_sti_class = true

# Use ISO 8601 format for JSON serialized times and dates.
ActiveSupport.use_standard_json_time_format = true

# Don't escape HTML entities in JSON, leave that for the #json_escape helper.
# if you're including raw json in an HTML page.
ActiveSupport.escape_html_entities_in_json = false

ActiveRecord::Base.configurations[Padrino.env].merge!(DB_DEFAULTS)
# Now we can establish connection with our db
ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations[RACK_ENV])

# case Padrino.env
#   when :development then DataMapper.setup(:default, "mysql://" + Padrino.root('db', "oxygen_development.db"))
#   when :production  then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "oxygen_production.db"))
#   when :test        then DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "oxygen_test.db"))
# end

