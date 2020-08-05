class PermitSubmission < ApplicationRecord
  include PgSearch::Model

  enum status: %i[accepted filed denied]
  belongs_to :user
  belongs_to :permit_type

  alias_attribute :creator, :user
  has_many :permit_documents, dependent: :destroy
  delegate :name, to: :user, prefix: true

  attribute :name, :string
  attribute :status, :string
  attribute :user_id, :uuid
  attribute :deadline, :datetime
  attribute :agency, :string

  # The following three attributes have been added to the model. However, I have not seen attributes coded into the model like this 
  # before and therefore I am not sure if it just for viewing/readability or if it has some other purpose. For this reason, they are 
  # commented out
  # attribute :equipment, :string
  # attribute :permittee, :string
  # attribute :location, :string

  pg_search_scope :search_permits,
                  against: %i[name agency],
                  associated_against: {
                    permit_type: :name
                  },
                  using: { tsearch: { dictionary: 'english' } }
end
