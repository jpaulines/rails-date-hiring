class EventsController < ApplicationController
skip_before_action :authenticate_user!, only: :index

def index
  @events = policy_scope(Event)
end

end
