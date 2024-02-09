require 'swagger_helper'

RSpec.describe 'v1/todos', type: :request do

  path '/todos' do
    
    get('list all todos and todo items') do
      tags 'Todos'
      security [Bearer: []]

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end

    post('create a new todo') do
      tags 'Todos'
      consumes 'application/json'

      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        },
        required: [ 'title']
      }
      
      security [Bearer: []]

      response(201, 'created') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end
  end

  path '/todos/{id}' do

    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('get a todo') do
      tags 'Todos'
      security [Bearer: []]

      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end
    end

    put('update a todo') do
      tags 'Todos'
      security [Bearer: []]
      consumes 'application/json'
      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        },
        required: [ 'title']
      }

      response(204, 'successful with no content') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end
    end

    delete('delete a todo and its items') do
      tags 'Todos'
      security [Bearer: []]

      response(204, 'successful with no content') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end
    end
  end
end
