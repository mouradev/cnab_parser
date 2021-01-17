require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require './app/helpers/main.rb'

use Rack::MethodOverride
run ApplicationController
use TransactionsController
