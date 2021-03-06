class User < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :businesses

  has_secure_password

  validates :name,
  presence: true

  validates :email,
  presence: true,
  uniqueness: true

end
