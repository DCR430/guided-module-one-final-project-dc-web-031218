require 'bundler'
require 'readline'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ßActiveRecord::Base.logger = nil
require_all 'lib'
require_all 'app'
