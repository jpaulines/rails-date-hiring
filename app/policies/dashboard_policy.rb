class DashboardPolicy < Struct.new(:user, :dashboard)

  def profile?
    user
  end
end
