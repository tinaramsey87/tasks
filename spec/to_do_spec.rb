require('rspec')
require('pg')
require('to_do')
require('pry')
require('spec_helper')

describe(Task) do

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      expect(test_task.description()).to(eq("Learn SQL"))
    end
  end

  describe("#due_date") do
    it('returns the due date for the task') do
      test_task = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      expect(test_task.due_date()).to(eq("2015-01-20"))
    end
  end

  describe(".all") do
    it("is empty at first") do
    expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved tasks") do
      test_task = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
    Task.clear()
    expect(Task.all()).to(eq([]))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID out') do
      test_task = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      task2 = Task.new({:description => "Learn SQL", :list_id => 1, :due_date => '2015-01-20'})
      expect(task1).to(eq(task2))
    end
  end
end
