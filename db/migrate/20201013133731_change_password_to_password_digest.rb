class ChangePasswordToPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    change_column(:users, :password, :password_digest)
  end
end
