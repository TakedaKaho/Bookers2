json.data do
  json.items do
    json.array!(@books) do |book|
      json.id book.id
      json.user do
        json.name book.user.name
      end
      json.title book.title
      json.caption book.body
      json.address book.address
      json.latitude book.latitude
      json.longitude book.longitude
    end  
  end
end