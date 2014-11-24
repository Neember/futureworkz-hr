class Staff < User

  scope :to_options, -> { all.collect { |staff| [ staff.english_name, staff.id ] } }
  scope :leaders, -> { where(is_leader: :true) }

  has_many :leaves
  has_many :lates
  has_many :feedbacks
  has_many :leave_days, through: :leaves

  validate :leader_or_not

  def remaining_leave_days(year)
    self.leaves.in_year(year).annual.approved.sum(:total)
  end

  def leader_or_not
    if self.is_leader && !self.leader.nil?
      self.is_leader = false
      errors.add(:leader, ' can not add leader.')
    end
  end
end
