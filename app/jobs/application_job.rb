class ApplicationJob < ActiveJob::Base

def self.test (test)
  @@test = test
end

def self.show_test
  puts @@test
end

def self.plus_test
  @@test += 10
end

def test (test)
  @test = test
end

def plus_test
  @test += @@test
end

def show_test
  puts @test
  puts @@test
end

end
