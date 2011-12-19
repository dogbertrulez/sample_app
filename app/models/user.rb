class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible(:name, :email, :password, :password_confirmation)

  
  private
  
    #NOTE: class EmailFormatValidator is invoked when the validates method is called
    include ActiveModel::Validations
    class EmailFormatValidator < ActiveModel::EachValidator
      #noinspection RubyClassVariableUsageInspection
      @@email_regex =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      def validate_each(record, attribute, value)
        record.errors[attribute] << (options[:message] || "is not an email") unless
          (value =~ @@email_regex && $1.length + $2.length < 256 && $1.length < 65)
      end
    end
    
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
    
    

  public
    
    validates(:name, :presence => true, 
                     :length => {:maximum => 50});
    validates(:email, :presence => true,
                      :email_format => true,
                      :uniqueness => {:case_sensitive => false});
    validates(:password, :presence => true, 
                         :confirmation => true,
                         :length => {:within => 8..40});
                          
    before_save :encrypt_password
   
   
    # Return true if the user's password matches the submitted password.
    def has_password?(submitted_password)
      # Compare encrypted_password with the encrypted version of # submitted_password.
      encrypt(submitted_password) == encrypted_password
    end
    
    def User.authenticate(submitted_email, submitted_password)
      submitted_user = User.find_by_email(submitted_email)
      return nil if submitted_user.nil?
      return nil if not submitted_user.has_password?(submitted_password)
      return submitted_user
    end

end

