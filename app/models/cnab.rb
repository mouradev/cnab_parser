class CNAB

  def initialize(filepath)
    @transactions = []

    File.open(filepath, "r:UTF-8") do |file|
      file.each_line do |line|
        @transactions.push(line)
      end
    end

    return @transactions
  end

  def self.type(type_number)
    types = [
      {
        "number" => 1,
        "description" => "Débito",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 2,
        "description" => "Boleto",
        "operation" => "out",
        "signal" => "-"
      },
      {
        "number" => 3,
        "description" => "Financiamento",
        "operation" => "out",
        "signal" => "-"
      },
      {
        "number" => 4,
        "description" => "Crédito",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 5,
        "description" => "Recebimento Empréstimo",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 6,
        "description" => "Vendas",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 7,
        "description" => "Recebimento TED",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 8,
        "description" => "Recebimento DOC",
        "operation" => "in",
        "signal" => "+"
      },
      {
        "number" => 9,
        "description" => "Aluguel",
        "operation" => "out",
        "signal" => "-"
      }
    ]

    types.each do |type|
      if type["number"] == type_number
        return type
      end
    end
  end

  def get_all
    parsed_transactions = []
    @transactions.each do |line|
      parsed_transactions.push(parse_line(line))
    end

    return parsed_transactions
  end

  def parse_line(line)
    return {
      "type" => parse_type(line),
      "date" => parse_date(line),
      "value" => parse_value(line),
      "cpf" => parse_cpf(line),
      "credit_card" => parse_credit_card(line),
      "hour" => parse_hour(line),
      "store_owner" => parse_store_owner(line),
      "store" => parse_store(line)
    }
  end

  def parse_type(line)
    return line[0...1].to_i
  end

  def parse_date(line)
    return line[1...9]
  end

  def parse_value(line)
    return line[9...19].to_i / 100
  end

  def parse_cpf(line)
    return line[19...30]
  end

  def parse_credit_card(line)
    return line[30...42]
  end

  def parse_hour(line)
    return line[42...48]
  end

  def parse_store_owner(line)
    return line[48...62]
  end

  def parse_store(line)
    return line[62...80]
  end
end