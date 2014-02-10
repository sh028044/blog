class Oauth2Controller < ApplicationController
    def index
      if params[:login_url]
        @@token_url=params[:token_url]
        @@client = OAuth2::Client.new('283272595156318', 'e7ef9daaebec7fe3f9234886bada5fca', :site => params[:login_url], :authorize_url => "/oauth/authorize", :token_url => "/oauth/access_token")
        redirect_to @@client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/oauth2')                
      end
      if params[:access_token]
        render text: params[:access_token]
      end
      if params[:code]
         @token=@@client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/oauth2')
         redirect_to access_token(@@token_url,@token.to_s)
      end
    end
private
     def access_token(reuqest_url,token_code,token_params='?')
         return reuqest_url+token_params+token_code
     end 
end