shared_examples_for 'UnAuthenticatedUser' do

  it 'returns error status' do
    request
    expect(response.status).to eq 401
  end

  it 'returns empty response' do
    request
    expect(response.body).to be_empty
  end
end