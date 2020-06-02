require 'swagger_helper'

describe 'broadcasts' do

  path '/broadcasts' do

    post 'Creates a broadcast' do
      tags 'broadcasts'
      consumes 'application/json'
      request_body_json schema: {
        type: :object,
        properties: {
          title: { type: :string },
          broadcast_date: { type: :date },
        },
        required: [ 'title', 'broadcast_date' ]
      }

      response '201', 'broadcast created' do
        let(:params) { broadcast: { title: 'foo', broadcast_date: '12/08/2020' } }
        run_test! do |t|
          require 'pry'; binding.pry
        end
      end

      response '422', 'invalid request' do
        let(:broadcast) { { title: 'foo', broadcast_date: nil } }
        run_test!
      end
    end
  end

  # path '/broadcasts/{id}' do
  #
  #   get 'Retrieves a broadcast' do
  #     tags 'broadcasts'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :id, :in => :path, :type => :string
  #
  #     response '200', 'broadcast found' do
  #       schema type: :object,
  #         properties: {
  #           id: { type: :integer },
  #           title: { type: :string },
  #           content: { type: :string }
  #         },
  #         required: [ 'id', 'title', 'content' ]
  #
  #       let(:id) { broadcast.create(title: 'foo', content: 'bar').id }
  #       run_test!
  #     end
  #
  #     response '404', 'broadcast not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end
  #
  #     response '406', 'unsupported accept header' do
  #       let(:'Accept') { 'application/foo' }
  #       run_test!
  #     end
  #   end
  # end
end
