require "spec_helper"
RSpec.describe Mergesort, "Node class" do
    context "Initialization" do
        it "keeps a procedure object" do
            test = Proc.new {|a,b| a < b}
            t = Mergesort.new test
            expect(t.proc).to eql(test)
        end

        it "returns nil when asked for a procedure that isn't initialized" do
            t = Mergesort.new
            expect(t.proc).to eql(nil)
        end

        it "can be initailized with a procedure" do
            t = Mergesort.new Proc.new {|a,b| a == b}
            expect(t.proc).not_to eql(nil)
        end
    end

    context "setting and getting procedures" do
        it "returns the same proc as it was assigned after not initializing with a procedure" do
            t = Mergesort.new
            test = Proc.new {|a,b| a < b}
            t.proc = test
            expect(t.proc).to eql(test)
        end

        it "returns the the new procedure" do
            t = Mergesort.new
            test = Proc.new {|a,b| a < b}
            t.proc = test
            newProc = Proc.new {|a| a > 0}
            t.proc = newProc

            expect(t.proc).to eql(newProc)
            expect(t.proc).not_to eql(test)
        end
    end

    context "Using procedures" do
        it "uses a procedure to tell if two numbers are equal" do
            test = Proc.new {|a,b| a == b}
            answer = test.call(1,2)
            expect(answer).to eql(false)
        end
    end

    context "sorting" do
        it "sorts numbers correctly" do
            t = Mergesort.new Proc.new {|a,b| a < b}
            list = [5,1,3,0,2]
            answer = t.sort list
            expect(answer).to eql([0,1,2,3,5])
        end

        it "sorts arrays with one value" do
            t = Mergesort.new Proc.new {|a,b| a < b}
            list = [1]
            answer = t.sort list
            expect(answer).to eql([1])
        end
    end

    context "testing merge  procedure" do
        it "correctly merges with given procedure" do
            test = Proc.new {|a,b| a < b}
            list1 = [1,3,5]
            list2 = [0,2,4]

            result = []
            until list1.empty? || list2.empty? do
                if test.call(list1.first, list2.first)then
                    value = list1.delete_at 0
                    result << value
                else
                    value = list2.delete_at 0
                    result << value
                end
            end

            

            if !list1.empty? then
                result << list1.delete_at(0) until list1.empty?
            else
                result << list2.delete_at(0) until list2.empty?
            end

            expect(result).to eql([0,1,2,3,4,5])
        end
    end
end
