class Profile < ApplicationRecord
    belongs_to :user
    has_one_attached :avatar
    attr_accessor :avatar

    def parse_base64(avatar)

        binding.pry

        if avatar.present? || rex_image(avatar) == ''
          content_type = create_extension(avatar)
          contents = avatar.sub %r/data:((avatar|application)\/.{3,}),/, ''
          decoded_data = Base64.decode64(contents)
          filename = Time.zone.now.to_s + '.' + content_type
          File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
            f.write(decoded_data)
        end
        attach_image(filename)
      end
    
      private
      def create_extension(avatar)
        content_type = rex_image(avatar)
        content_type[%r/\b(?!.*\/).*/]
      end
    
      def rex_image(avatar)
        current_user.profile.avatar[%r/(image\/[a-z]{3,4})|(application\/[a-z]{3,4})/]
      end
    
      def attach_image(filename)
        current_user.avatar.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
        FileUtils.rm("#{Rails.root}/tmp/#{filename}")
      end
    end
end
