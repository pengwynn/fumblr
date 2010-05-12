require 'rake/testtask'

Rake::TestTask.new(:test) do |test|
  test.pattern = '**/*_test.rb'
  test.verbose = true
end
