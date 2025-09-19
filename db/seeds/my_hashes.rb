256.times do |i|
  MyHash.create!(table: "tags", column: "value", key: sprintf("%02x", i))
end