class EconomyVagon < Vagon
  validates :top_seats, :bottom_seats, :side_bottom_seats, :side_top_seats, presence: true, numericality: { only_integer: true }

  def type_name
    'Плацкартный'
  end
end