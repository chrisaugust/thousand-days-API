class JwtService
  SECRET_KEY = Rails.application.secret_key_base

  # encode a payload with an expiration date (7 days set by default)
  def self.encode(payload, exp = 7.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  # decode token and return payload as HashWithIndifferentAccess
  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError => e
    Rails.logger.error("JWT decode error: #{e.message}")
    Rails.logger.error(e.backtrace.join("\n"))
    nil
  end
end
