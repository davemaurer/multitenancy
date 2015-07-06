require_relative '../test_helper'

class ViewMerchantTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_can_view_merchant_store_page
    merchant = Merchant.create(name: "CoolererRUs")
    visit merchant_path(merchant)
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?(merchant.name), "page should have an Items heading"
    end
  end

  def test_it_views_a_merchants_itmes
    merchant = Merchant.create(name: "CoolererRUs")
    item = Item.create(name: "water_cooler", description: "water", merchant_id: merchant.id)
    visit merchant_path(merchant)

    within("li") do
      assert page.has_content?(item.name)
      assert page.has_content?(item.description)
      assert page.has_content?(item.merchant_id)
    end
  end
end
