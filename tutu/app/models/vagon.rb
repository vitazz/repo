class Vagon < ActiveRecord::Base
  belongs_to :train

  validates :top_places, numericality: { only_integer: true }
  validates :bottom_places, numericality: { only_integer: true }
  validates :vagon_type, inclusion: { in: 1..2,
                                message: "%{value} не верное значение. Допустимые значения 1 - Плацкарт, 2 - Купе" }

  scope :common_place, -> { where(vagon_type: 1) }
  scope :coupe, -> { where(vagon_type: 2) }
end
