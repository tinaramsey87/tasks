require('rspec')
require('pg')
require('spec_helper')


describe(Task) do
  describe('#description') do
    it('lets you write a description of the task') do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1})
      expect(task1.description()).to(eq("Learn SQL"))
    end
  end

  describe('.all') do
    it('it empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a task to the array of saved tasks') do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1})
      task1.save()
      expect(Task.all()).to(eq([task1]))
    end
  end

  describe('#clear') do
    it('empties out all of the saved tasks') do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1})
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#list_id') do
    it('lets you read out the list ID') do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1})
      expect(task1.list_id()).to(eq(1))
    end
  end

  describe('#==') do
    it('is the same task if it has the same description') do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1})
      task2 = Task.new({:description => "Learn SQL", :list_id => 1})
      expect(task1).to(eq(task2))
    end
  end
end

# DB = PG.connect({:dbname => 'to_do_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM tasks *;")
#   end
# end
