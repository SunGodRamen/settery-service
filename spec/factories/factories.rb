FactoryBot.define do
  factory :appointment do
    appointment_date { Date.today }
    appointment_time { Time.now }
    location { 'My location' }
  end
end
