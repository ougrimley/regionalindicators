class Source < ActiveRecord::Base
  attr_accessible :author, :comment, :date, :title, :url
  
  has_and_belongs_to_many :explanations

  validates :title,  presence: true, length: { maximum: 200, minimum: 8 }
  validates :author, presence: true, length: { maximum: 140, minimum: 8 }
  validates_datetime :date, allow_blank: true

  def indicators
    self.explanations.keep_if {|e| e.explainable_type == "Indicator" }
  end
  
  def subjects
    self.explanations.keep_if {|e| e.explainable_type == "Subject" }
  end

  rails_admin do
    list do
      field :id
      field :title
      field :author
      field :date do
        pretty_value do
          value.strftime("%-d %b %Y")
        end
      end
      field :url do
        label "URL"
      end
    end
  end
  
end
