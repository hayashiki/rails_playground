require 'rails_helper'

RSpec.describe 'omniauth routes', type: :routing do
  it 'GET /auth/google/callback is routable' do
    expect(get: '/auth/google_oauth2/callback').to route_to(controller: 'authentication', action: 'callback')
  end
end
