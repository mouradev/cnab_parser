class CNAB
  def self.read(filepath)
    transactions = []

    File.open(filepath, "r") do |file|
      file.each_line do |line|
        parsed_line = parse_line(line)
        transactions.push(parsed_line)
      end
    end

    return transactions
  end

  def self.type(type_number)
    return type
  end

  def parse_line(line)
    type = parse_type(line)
    date = parse_date(line)
    value = parse_value(line)
    cpf = parse_cpf(line)
    credit_card = parse_credit_card(line)
    hour = parse_hour(line)
    store_owner = parse_store_owner(line)
    store = parse_name(store)

    return ["type" => type]
  end

  def parse_type(line)
    return [0...1]
  end
end