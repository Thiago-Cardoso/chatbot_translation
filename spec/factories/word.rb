FactoryBot.define do    
    factory :word do       
        description { FFaker::Lorem.sentence }
        language { "en" }
    end
end