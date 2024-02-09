require 'swagger_helper'

RSpec.describe 'v1/items', type: :request do

  path '/todos/{todo_id}/items' do
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'

    get('get all todo items') do
      tags 'Todo Items'
      security [Bearer: []]

      response(200, 'successful') do
        let(:todo_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end

    post('create a new todo item') do
      tags 'Todo Items'
      security [Bearer: []]
      consumes 'application/json'

      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean, default: false }
        },
        required: [ 'title', 'done']
      }

      response(201, 'created') do
        let(:todo_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end
  end

  path '/todos/{todo_id}/items/{id}' do
    parameter name: 'todo_id', in: :path, type: :string, description: 'todo_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('get a todo item') do
      tags 'Todo Items'
      security [Bearer: []]

      response(200, 'successful') do
        let(:todo_id) { '123' }
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

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end

    put('update a todo item') do
      tags 'Todo Items'
      security [Bearer: []]
      consumes 'application/json'

      parameter name: :todo, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          done: { type: :boolean }
        },
        required: [ 'title', 'done']
      }

      response(204, 'successful with no content') do
        let(:todo_id) { '123' }
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

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end

    delete('delete a todo item') do
      tags 'Todo Items'
      security [Bearer: []]

      response(204, 'successful with no content') do
        let(:todo_id) { '123' }
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

      response(404, 'not found') do
        let(:id) {'invalid_id '}
        run_test!
      end

      response(422, 'invalid request') do
        let(:'Authorization') { 'invalid_token' } # Set an invalid token for the example
        run_test!
      end
    end
  end
end
