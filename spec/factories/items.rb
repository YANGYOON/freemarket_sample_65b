FactoryBot.define do
  factory :item do
    name           {"something"}
    state          {"something"}
    price          {1000}
    condition      {"新品、未使用"}
    category_id    {1}
    shipping
  end
end
