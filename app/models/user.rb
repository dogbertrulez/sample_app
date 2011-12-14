
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible(:name, :email, :password, :password_confirmation)

#NOTE: class EmailFormatValidator is invoked when the validates method is called
  include ActiveModel::Validations
  class EmailFormatValidator < ActiveModel::EachValidator
    @@email_regex =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    def validate_each(record, attribute, value)
      record.errors[attribute] << (options[:message] || "is not an email") unless
        (value =~ @@email_regex && $1.length + $2.length < 256 && $1.length < 65)
    end
  end
  
  
  validates(:name, :presence => true, 
                   :length => {:maximum => 50});
  validates(:email, :presence => true,
                    :email_format => true,
                    :uniqueness => {:case_sensitive => false});
  validates (:password, :presence => true, 
                        :confirmation => true,
                        :length => {:within => 8..40});
end
