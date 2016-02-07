class Vagon < ActiveRecord::Base
  belongs_to :train

  validates :top_places, numericality: { only_integer: true }
  validates :bottom_places, numericality: { only_integer: true }

  scope :types, -> { where(wagon_type: 1..2) }
  
  def type_description
    vagon_type == 1 ? 'Плацкарт' : 'Купе'
  end
end
