class Vagon < ActiveRecord::Base
  belongs_to :train

  validates :top_places, numericality: { only_integer: true }
  validates :bottom_places, numericality: { only_integer: true }

  scope :platskart, -> { where(vagon_type: 1) }
  scope :kupe, -> { where(vagon_type: 2) }
end
