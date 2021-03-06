class Version < PaperTrail::Version
  belongs_to :user, foreign_key: 'whodunnit'

  default_scope -> { order(created_at: :desc) }

  delegate :english_name, to: :user, prefix: true, allow_nil: true

  def creator_name
    user_english_name || 'System'
  end
end
