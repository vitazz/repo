class Vagon < ActiveRecord::Base
  belongs_to :train

  # validates :vagon_type, inclusion: { in: 1..2,
  #                               message: "%{value} не верное значение. Допустимые значения 1 - Плацкарт, 2 - Купе" }

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe, -> { where(type: 'CoupeVagon') }
  scope :sv, -> { where(type: 'SvVagon') }
  scope :sedentary, -> { where(type: 'SedentaryVagon') }
  scope :ordered, -> { order(:number) }
  scope :number, -> { :number }

  after_create :set_number

  protected

  def set_number
    self.number = self.train.vagons.maximum(:number)
  end

end
