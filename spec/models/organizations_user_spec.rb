# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  organization_id :integer
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  last_user_id    :integer
#  status          :string
#  role_type       :string
#  role_id         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe OrganizationsUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
