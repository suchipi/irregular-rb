require "irregular"

RSpec.describe Irregular do
  class IrregularTestClass
    include Irregular

    def test1
      "result1"
    end

    def test2
      "result2"
    end
  end

  it "version is defined" do
    expect(Irregular::VERSION).to_not be_nil
  end

  describe "#compile_regexp" do
    let(:instance) { IrregularTestClass.new }
    let(:input_regexp) { /bla `test1` `test2` `test1`/i }
    let(:input_string) { "bla `test1` `test2` `test1`" }
    let(:input_options) { Regexp::MULTILINE }

    shared_examples_for "regexp compilation" do
      it "returns a Regexp" do
        expect(@result).to be_a(Regexp)
      end

      it "compiles the source of the input regexp" do
        expect(@result.source).to eq("bla result1 result2 result1")
      end
    end

    context "regexp passed" do
      before do
        @result = instance.compile_regexp(input_regexp)
      end

      include_examples "regexp compilation"

      it "resultant Regexp has the same options as the input regexp" do
        expect(@result.options).to eq(input_regexp.options)
      end
    end

    context "regexp and options passed" do
      before do
        @result = instance.compile_regexp(input_regexp, input_options)
      end

      include_examples "regexp compilation"

      it "resultant Regexp's options are a combination of the provided options and the input regexp's options" do
        expect(@result.options & input_options).to be input_options
        expect(@result.options & input_regexp.options).to be input_regexp.options
      end
    end

    context "string passed" do
      before do
        @result = instance.compile_regexp(input_string)
      end

      include_examples "regexp compilation"

      it "resultant Regexp has no set options" do
        expect(@result.options).to eq(0)
      end
    end

    context "string and options passed" do
      before do
        @result = instance.compile_regexp(input_string, input_options)
      end

      include_examples "regexp compilation"

      it "resultant Regexp's options are the passed options" do
        expect(@result.options).to eq(input_options)
      end
    end

    it "trying to compile a non-existent method does nothing" do
      expect(instance).to_not respond_to(:foo)
      regexp = instance.compile_regexp(/`foo`/)
      expect(regexp.source).to eq("`foo`")
    end
  end
end
