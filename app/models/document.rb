class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :image, DocumentUploader

  validates :title, presence: true
end
