FactoryGirl.define do
  factory :highlight do
    #user FactoryGirl.build(:user)
    selector " BODY. div "
    text 'impossible to continue a peace process with Kurdish fighters'
    host "www.aljazeera.com"
    port 80
    path "/news/2015/07/turkey-erdogan-warns-kurdish-fighters-150728130110904.html"
    is_https true
    start_offset 10
    end_offset 200
  end
end
