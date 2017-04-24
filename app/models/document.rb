class Document < ApplicationRecord
  belongs_to :user
  mount_uploader :image, DocumentUploader
end
