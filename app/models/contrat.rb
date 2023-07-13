class Contrat < ApplicationRecord
  belongs_to :information
  belongs_to :user

  enum name_contrat: {
    remplacement: "Remplacement",
    collaboration: "Collaborateur",
    assistanat: "Assistanat"
  }

  validates :name_contrat, presence: true
  validates :gender, presence: true
  validates :name, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
  validates :place_birth, presence: true
  validates :registered_ordre, presence: true
  validates :n_ordinal, presence: true
  validates :address_pro, presence: true
  validates :email, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :retro, presence: true
  validates :payment_limit, presence: true
  validates :rayon_install, presence: true
  validates :conflict_order, presence: true
  validates :made_on, presence: true
  validates :to, presence: true
  validates :status, presence: true
  validates :nb_refus, presence: true, if: -> { name_contrat.in?(["collaboration", "assistanat"]) }
  validates :n_urssaf, presence: true, if: -> { name_contrat.in?(["collaboration", "assistanat"]) }
  validates :blackout_period, presence: true, if: -> { name_contrat.in?(["collaboration", "assistanat"]) }

end
