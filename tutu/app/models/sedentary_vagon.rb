class SedentaryVagon < Vagon
  validates :sedentary_seats, presence: true, numericality: { only_integer: true }
  def type_name
    'Сидячий'
  end
end