class TransferService
  def self.perfom(user, _company, amount_cents)
    ActiveRecord::Base.transaction do
      raise ActiveRecord::RecordInvalid unless amount_cents.is_a? Integer

      user.update!(balance_cents: user.balance_cents + amount_cents)
      company.update!(balance_cents: user.balance_cents - amount_cents)

      Transfer.transaction do
        Transfer.create!(balance_cents: amount_cents, user: user, company: company)
      end
    end
  rescue ActiveRecord::RecordInvalid
    puts 'Invalid value for amount_cents'
  end
end
