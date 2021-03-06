class Subject < ActiveRecord::Base
  attr_accessible :title,
                  :indicator_ids,
                  :topic_area_id,
                  :explanation_attributes

  belongs_to :topic_area

  has_many :indicators
  has_one :explanation, as: :explainable

  accepts_nested_attributes_for :explanation

  validates :title, presence: true, length: { maximum: 100, minimum: 8 }

  default_scope { order(:id) }

  include SlugExtension
  
  rails_admin do
    list do
      field :id
      field :title
      field :topic_area
    end
  end

  def has_indicators?
    !indicators.empty?
  end

end
