require_relative '../test_helper'

class UseMerchantTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_can_view_merchant_store_page
    merchant = Merchant.create(name: "CoolererRUs")
    visit "/merchants/#{merchant.id}"
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?(merchant.name), "page should have an Items heading"
    end
  end

end
