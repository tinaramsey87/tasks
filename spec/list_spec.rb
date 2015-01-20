require('rspec')
require('pg')
require('list')
require('spec_helper')

describe(List) do

  describe('.all') do
    it('starts off with no lists') do
    expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('gives you a name') do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it('sets its ID when you save it') do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('lets you save lists into a database') do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it('is the same list if it has the same name') do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('.find') do
    it('returns a list by its ID number') do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list1.save()
      list2 = List.new({:name => "Home stuff", :id => nil})
      list2.save()
      expect(List.find(list2.id())).to(eq(list2))
    end
  end

  describe('#tasks') do
    it ('returns an array of tasks for that list') do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_task = Task.new({:description => "Learn SQL", :list_id => test_list.id(), :due_date => "2015-01-05"})
      test_task.save()
      test_task1 = Task.new({:description => "Learn Ruby", :list_id => test_list.id(), :due_date => "2015-01-05"})
      test_task1.save()
      expect(test_list.tasks()).to(eq([test_task, test_task1]))
    end
  end

end
