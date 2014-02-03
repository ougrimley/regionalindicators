require 'spec_helper'

describe Source do

  let(:explanation) { Explanation.create(narrative: 'Sample narrative') }

  before do
    @source = explanation.sources.build(title:   'A New Way of Measuring Debt',
                                        author:  'Boston Architectural College',
                                        date:     Time.now,
                                        url:     'http://the-bac.edu',
                                        comment: 'This is good data.')
  end

  it { should respond_to :comment }
  it { should respond_to :title }
  it { should respond_to :author }
  it { should respond_to :date }
  it { should respond_to :url }

  it { should respond_to :explanation }

  describe "accessible attributes" do
    it "should not allow access to explanation_id" do
      expect do
        Source.new(explanation_id: explanation.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when title is blank" do
    before { @source.title = " " }
    it { should_not be_valid }
  end

  describe "when title is too short" do
    before { @source.title = "a" * 6 }
    it { should_not be_valid }
  end 

  describe "when title is too long" do
    before { @source.title = "a" * 201 }
    it { should_not be_valid }
  end

  describe "when author is blank" do
    before { @source.author = " " }
    it { should_not be_valid }
  end

  describe "when author is too short" do
    before { @source.author = "a" * 6 }
    it { should_not be_valid }
  end 

  describe "when author is too long" do
    before { @source.author = "a" * 141 } 
    it { should_not be_valid }
  end

  # describe "when date is blank" do
  #   before { @source.date = DateTime.now }
  #   it { should_not be_valid }
  # end

  # describe "when date is in an incorrect format" do
  #   before { @source.date = "two weeks ago" }
  #   it { should_not be_valid }
  # end



end
