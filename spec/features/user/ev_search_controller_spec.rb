require 'rails_helper'

RSpec.describe "Ev search and map", :type => :request do
    it 'takes parameters and runs controller', :vcr do
      user = User.create(first_name: 'john', last_name: 'smith', email: 'js@gmail.com', token: 'aa', refresh_token: 'aa')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      stub = {"coordinates"=>"39.99894 -105.08899", "popup_html"=>"<p><b>WOW! Children's Museum</b></p><b>Address:</b> 110 N Harrison Ave Lafayette, CO 80026<p></p><p><a href=\"#\" onclick=\"return chooseLocal(event);\" data-coords=\"39.99894 -105.08899\">Choose this Location</a><a href=\"https://www.yelp.com/biz/wow-childrens-museum-lafayette?adjust_creative=SEoAIVVZvnCK2igoKK1XLQ&amp;utm_campaign=yelp_api_v3&amp;utm_medium=api_v3_business_search&amp;utm_source=SEoAIVVZvnCK2igoKK1XLQ\">View on Yelp</a></p>", "controller"=>"ev_search", "action"=>"create", "ev_search"=>{"coordinates"=>"39.99894 -105.08899", "popup_html"=>"<p><b>WOW! Children's Museum</b></p><b>Address:</b> 110 N Harrison Ave Lafayette, CO 80026<p></p><p><a href=\"#\" onclick=\"return chooseLocal(event);\" data-coords=\"39.99894 -105.08899\">Choose this Location</a><a href=\"https://www.yelp.com/biz/wow-childrens-museum-lafayette?adjust_creative=SEoAIVVZvnCK2igoKK1XLQ&amp;utm_campaign=yelp_api_v3&amp;utm_medium=api_v3_business_search&amp;utm_source=SEoAIVVZvnCK2igoKK1XLQ\">View on Yelp</a></p>"}}.to_json

      expect(post "/ev_search", :params => stub).to eq(302)
    end
    it 'runs map ev_map_show action' do
      user = User.create(first_name: 'john', last_name: 'smith', email: 'js@gmail.com', token: 'aa', refresh_token: 'aa')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      stub = {"coordinates"=>"39.99894 -105.08899", "popup_html"=>"<p><b>WOW! Children's Museum</b></p><b>Address:</b> 110 N Harrison Ave Lafayette, CO 80026<p></p><p><a href=\"#\" onclick=\"return chooseLocal(event);\" data-coords=\"39.99894 -105.08899\">Choose this Location</a><a href=\"https://www.yelp.com/biz/wow-childrens-museum-lafayette?adjust_creative=SEoAIVVZvnCK2igoKK1XLQ&amp;utm_campaign=yelp_api_v3&amp;utm_medium=api_v3_business_search&amp;utm_source=SEoAIVVZvnCK2igoKK1XLQ\">View on Yelp</a></p>", "controller"=>"ev_search", "action"=>"create", "ev_search"=>{"coordinates"=>"39.99894 -105.08899", "popup_html"=>"<p><b>WOW! Children's Museum</b></p><b>Address:</b> 110 N Harrison Ave Lafayette, CO 80026<p></p><p><a href=\"#\" onclick=\"return chooseLocal(event);\" data-coords=\"39.99894 -105.08899\">Choose this Location</a><a href=\"https://www.yelp.com/biz/wow-childrens-museum-lafayette?adjust_creative=SEoAIVVZvnCK2igoKK1XLQ&amp;utm_campaign=yelp_api_v3&amp;utm_medium=api_v3_business_search&amp;utm_source=SEoAIVVZvnCK2igoKK1XLQ\">View on Yelp</a></p>"}}.to_json

      post "/ev_search", :params => stub
      expect(get '/ev_map').to eq(200)
    end
end
