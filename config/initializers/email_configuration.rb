ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  domain: ENV["SMTP_DOMAIN"] || "shiriculapo.com",
  user_name: ENV["SMTP_USER"],
  password: ENV["SMTP_PASSWORD"],
  authentication: "plain"
}
