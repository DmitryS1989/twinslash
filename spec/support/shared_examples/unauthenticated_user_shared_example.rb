# frozen_string_literal: true

RSpec.shared_examples 'unauthenticated user redirected' do
  it 'response have status 302' do
    expect(response.status).to eq(302)
  end
end
RSpec.shared_examples 'unauthenticated user status ok' do
  it 'response have status 200' do
    expect(response.status).to eq(200)
  end
end
