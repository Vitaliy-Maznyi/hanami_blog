class User < Hanami::Entity
  def full_name
    "#{first_name} #{last_name}"
  end
end
