class Coach < User
  validates :email, format: {
        with: /.edu\z/,
        message: "Must use your current .edu school email address."
      }
  
end
