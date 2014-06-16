admin = Admin.new
admin.create_user({ email: "dipesh@admin.com", password: "cybage@123", password_confirmation: "cybage@123"})
admin.save