json.data do
  json.items do
    json.array!(@books) do |book|
      json.id book.id
      json.user do
        json.name book.user.name
        json.profile_image_url url_for(book.user.profile_image) 
      end
      json.title book.title
      json.body book.body
      json.address book.address
      json.latitude book.latitude
      json.longitude book.longitude
    end  
  end
end
