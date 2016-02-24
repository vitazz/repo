class SvVagon < Vagon
  validates :bottom_seats, presence: true, numericality: { only_integer: true }
  def type_name
    'СВ'
  end
end