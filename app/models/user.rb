# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles

  has_one :profile, dependent: :destroy
  has_many :experiences, dependent: :destroy
  accepts_nested_attributes_for :profile, :experiences, allow_destroy: true

  has_many :topics, as: :topicable, dependent: :destroy
  has_many :posts, as: :postable,  dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :organizations_users, dependent: :destroy
  has_many :organizations, through: :organizations_users

  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users


  validates :email, presence: true, uniqueness: true


  alias avatar! avatar
  def avatar
    self.avatar! || self.create_avatar
  end

end
