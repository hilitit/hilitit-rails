FactoryGirl.define do
  factory :highlight do
    #user FactoryGirl.build(:user)
    selector " BODY. div "
    text 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'
    hostname "localhost.localdomain"
    port 80
    pathname "/index.html"
    search "?a=1&b=2"
    pathname_hash "#hashy"
    protocol "http:"
    start_offset 10
    end_offset 200
    tag_name 'P'
  end
end
