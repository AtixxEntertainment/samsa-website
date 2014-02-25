ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "shiriculapo.com",
  user_name: ENV["SMTP_USER"],
  password: ENV["SMTP_PASSWORD"],
  authentication: "plain"
}
