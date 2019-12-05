require_relative 'config/environment.rb'
ActiveRecord::Base.logger = nil

Menu.new.main_menu