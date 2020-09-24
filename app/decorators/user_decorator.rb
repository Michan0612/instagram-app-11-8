module UserDecorator
    def display_name
        profile&.nickname || self.email.split('@').first
    end
    
    def avatar_image
        if profile&.avatar_image&.attached?
          profile.avatar_image
        else
          'Ellipse.svg'
        end
    end
end
