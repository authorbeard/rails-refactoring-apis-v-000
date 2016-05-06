class RepositoriesController < ApplicationController
  before_action :authenticate_user

  def index
  # byebug
    gh=GithubService.new({"access_token"=> session[:token]})
    @user = gh.get_username
    @repos_array = gh.get_repos

    # response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # @repos_array = JSON.parse(response.body)
  end

  def create
    gh=GithubService.new({"access_token"=>session[:token]})
    gh.create_repo(params[:name])

    # response = Faraday.post "https://api.github.com/user/repos", {name: params[:name]}.to_json, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    redirect_to '/'
  end
end
