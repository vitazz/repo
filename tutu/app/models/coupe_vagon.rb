class CoupeVagon < Vagon
  validates :top_seats, :bottom_seats, presence: true, numericality: { only_integer: true }
  def type_name
    'Купе'
  end
end