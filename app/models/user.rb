class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      parent.table[:first_name], parent.table[:last_name])
  end

  def full_name
    "#{first_name}  #{last_name}"
  end
end
