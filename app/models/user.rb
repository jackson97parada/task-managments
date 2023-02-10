class User < ApplicationRecord
  has_secure_password
  has_one :enterprise

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  validates :email,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
              message: "Email is not in a valid format"
            }
  validates :password,
            presence: true,
            length: {
              minimum: 8
            },
            format: {
              with:
                /(?=^.{8,20}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/,
              message:
                "Enter a combination of at least six characters with numbers, letters and punctuation marks",
              multiline: true
            }

  accepts_nested_attributes_for :enterprise
end
