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

  before_validation :set_number

  protected

  def set_number
    if self.train.vagons
      last_num = self.train.vagons.last.number
    else
      last_num = 0
    end
    self.number = last_num + 1
  end
end
