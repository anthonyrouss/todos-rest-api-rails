require 'swagger_helper'

RSpec.describe 'v1/authentication', type: :request do

    path '/auth/login' do

        post('login') do
            tags 'Authentication'
            description 'Login to generate a token'
            consumes 'application/json'

            parameter name: :todo, in: :body, schema: {
                type: :object,
                properties: {
                email: { type: :string },
                password: { type: :string }
                },
                required: [ 'email', 'password']
            }

            response(200, 'successful') do
                after do |example|
                    example.metadata[:response][:content] = {
                    'application/json' => {
                        example: JSON.parse(response.body, symbolize_names: true)
                    }
                    }
                end
                run_test!
            end

            response(401, 'unauthorized') do
                run_test!
            end

        end

    end

    path '/signup' do

        post('signup') do
            tags 'Authentication'
            description 'Signup to generate a token'
            consumes 'application/json'

            parameter name: :todo, in: :body, schema: {
                type: :object,
                properties: {
                name: { type: :string },
                email: { type: :string },
                password: { type: :string }
                },
                required: [ 'name', 'email', 'password']
            }

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
end
