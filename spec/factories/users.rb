  FactoryBot.define do
    factory :user do
      nickname              {'test'}
      email                 {Faker::Internet.unique.email}
      password              {'test123'}
      password_confirmation {'test123'}
      family_name           {'田中'}
      first_name            {'太郎'}
      family_name_kana      {'タナカ'}
      first_name_kana       {'タロウ'}
      birthday              { Date.new(2000,1,1) }
    end
  end