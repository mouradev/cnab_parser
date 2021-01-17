require 'money'

def mask_hour(raw_hour)
  return raw_hour.scan(/.{2}|.+/).join(":")
end

def mask_cpf(raw_cpf)
  return raw_cpf.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
end

def mask_money(raw_money)
  money = Money.new(raw_money*100, "BRL")
  return money.format(:symbol_before_without_space => false, :thousands_separator => '.', :decimal_mark => ",")
end