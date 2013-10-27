json.array!(@transaktions) do |transaktion|
  json.extract! transaktion, :amount, :action, :created_at, :transaktionable
end
