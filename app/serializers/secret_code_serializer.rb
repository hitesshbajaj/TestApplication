class SecretCodeSerializer < ActiveModel::Serializer
  attributes :id, :code, :is_used ,:user
 
  def user
  	if object.user.present?
	    user = Hash.new
	    user['first_name'] = object.user.first_name
	    user['last_name'] = object.user.last_name
	    user['email'] = object.user.email
	    return user
  	end
  end
end
