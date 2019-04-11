class UsersController < ApplicationController
  def edit
    @user = current_user
    @states = State.all
    @cities = City.all
  end

  def update
    @user = current_user
    if @user.update(params_user)
      flash[:notice] = 'Perfil atualizado com sucesso!'
      redirect_to user_path(current_user)
    else
      @states = State.all
      @cities = City.all
      render :edit
    end
  end

  def show
    @user = current_user
  end

  def invite
    @user = User.find(params[:id])
    @event = Event.find(params[:event_id])
    EventInvite.create(event: @event, user: current_user, invitee: @user)
    flash[:notice] = "Convite enviado para o usuário #{@user.nickname}"
    redirect_to @user
  end

  def received_invites
    @received_invites = EventInvite.where(
      invitee: current_user, invite_respond: nil
    )
  end

  def accept_invite
    @invite = EventInvite.find(params[:id])
    @invite.approved!
    EventParticipation.create(event: @invite.event, user: current_user)
    flash[:notice] = 'Convite aceito com sucesso!'
    redirect_to received_invites_user_path(current_user)
  end

  def decline_invite
    @invite = EventInvite.find(params[:id])
    @invite.declined!
    flash[:notice] = 'Convite recusado com sucesso!'
    redirect_to received_invites_user_path(current_user)
  end

  def search
    search_param = params[:search]
    return if search_param.blank?
    @users = User.where('email like ?', "%#{search_param[:q]}%")
  end

  private

  def params_user
    params.require(:user).permit(:name, :state_id, :city_id, :nickname, :avatar)
  end
end
