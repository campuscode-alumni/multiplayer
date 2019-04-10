class EventsController < ApplicationController
  def new
    @event = Event.new
    @game_platforms = current_user.game_platforms
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.save
    EventParticipation.create(event: @event, user: current_user)
    flash[:notice] = 'Seu evento foi criado'
    redirect_to @event
  end

  def show
    @event = Event.find(params[:id])
  end

  def invite
    @event = Event.find(params[:id])
    @invited_user = User.find_by('nickname = :q OR email = :q', q: params[:q])

    @message = 'Não foi encontrado um usuário com este email'
    invite_user_procedure unless @invited_user.nil?

    flash[:notice] = @message
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(
      :title, :description, :game_platform_id,
      :event_date, :user_limit, :event_type, :event_location
    )
  end

  def invite_user_procedure
    if invite_exists?
      @message = 'Este usuário já foi convidado anteriormente'
    else
      create_event_invite
      @message = invited_user_message
    end
  end

  def invited_user_message
    "Convite enviado para o usuário #{@invited_user.nickname}"
  end

  def invite_exists?
    @event_invite = EventInvite.find_by(
      event: @event, user: current_user, invitee: @invited_user
    )
    !@event_invite.nil?
  end

  def create_event_invite
    EventInvite.create(
      event: @event,
      user: current_user,
      invitee: @invited_user
    )
  end
end
