class User
end

class Group
  def initialize(name)
  @name = name
end
end

class Membership
  def initialize(user:, group:, admin: false)
    @user = user
    @group = group
    @admin = admin
  end

  def promote_to_admin
    @admin = true
  end
end

describe "#promote_to_admin" do
  it "makes a regular membership an admin membership" do
    membership_to_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_to_promote).to be_admin
  end

  it "doesn't change other memberships" do
    membership_to_promote = build_non_admin_membership
    membership_to_not_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_to_not_promote).not_to be_admin
  end

  def build_non_admin_membership
    user = User.new
    group = Group.new("A group")

    Membership.new(user: user, group: group, admin: false)
  end


  def build_admin_membership
    user = User.new
    group = Group.new("A group")

    Membership.new(user: user, group: group, admin: true)
  end
end
