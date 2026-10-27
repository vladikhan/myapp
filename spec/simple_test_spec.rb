# spec/simple_test_spec.rb - создайте этот файл
require 'rails_helper'

RSpec.describe "Simple Application Test", type: :feature do
  it "shows what we have" do
    puts "\n=== RAILS APPLICATION INFO ==="
    puts "Rails version: #{Rails.version}"
    puts "Ruby version: #{RUBY_VERSION}"
    puts "Environment: #{Rails.env}"
    
    puts "\n=== AVAILABLE ROUTES ==="
    routes = Rails.application.routes.routes.map do |route|
      {
        path: route.path.spec.to_s,
        verb: route.verb,
        controller: route.defaults[:controller],
        action: route.defaults[:action],
        name: route.name
      }
    end.reject { |route| route[:path].include?('rails/') }
    
    routes.first(10).each do |route|
      puts "#{route[:verb]} #{route[:path]} -> #{route[:controller]}##{route[:action]} (#{route[:name]})"
    end
    
    puts "\n=== MODELS IN DATABASE ==="
    begin
      if defined?(ActiveRecord)
        ActiveRecord::Base.connection.tables.each do |table|
          puts "Table: #{table}"
        end
      end
    rescue => e
      puts "Database error: #{e.message}"
    end
    
    puts "\n=== TESTING BASIC FUNCTIONALITY ==="
    
    # Тест 1: Можем ли мы посетить root?
    begin
      visit root_path
      puts "✓ Root path accessible: #{current_path}"
    rescue => e
      puts "✗ Root path error: #{e.message}"
    end
    
    # Тест 2: Есть ли страница staff/customers?
    begin
      visit '/staff/customers'
      puts "✓ Staff customers accessible: #{current_path}"
    rescue => e
      puts "✗ Staff customers error: #{e.message}"
    end
    
    # Тест 3: Можем ли мы создать модель Customer?
    begin
      if defined?(Customer)
        customer = Customer.new
        puts "✓ Customer model exists"
        puts "  Attributes: #{customer.attributes.keys.join(', ')}"
      else
        puts "✗ Customer model not found"
      end
    rescue => e
      puts "✗ Customer model error: #{e.message}"
    end
    
    expect(true).to eq(true) # Тест всегда проходит
  end
end