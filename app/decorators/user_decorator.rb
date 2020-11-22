module UserDecorator
    def display_name
        profile&.nickname || self.email.split('@').first
    end

    def avatar_image
        if profile&.avatar_image_1&.attached?
          profile.avatar_image_1
        else
          'Ellipse.svg'
        end
    end
end
