FactoryGirl.define do
  factory :highlight do
    #user FactoryGirl.build(:user)
    selector " BODY. div "
    text 'impossible to continue a peace process with Kurdish fighters'
    hostname "www.aljazeera.com"
    port 80
    pathname "/news/2015/07/turkey-erdogan-warns-kurdish-fighters-150728130110904.html"
    search "?a=1&b=2"
    pathname_hash "#hashy"
    protocol "http:"
    start_offset 10
    end_offset 200
    tag_name "P"
  end
end
