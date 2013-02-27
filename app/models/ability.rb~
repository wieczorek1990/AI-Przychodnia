class Ability
  include CanCan::Ability

  # Nie działa z własnymi akcjami
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is_a?(Admin)
      can :manage, :all
    elsif user.is_a?(Patient)
      # Może zmieniać swoje dane osobowe
      can :manage, Patient, :id => user.id
      # Może tworzyć, potwierdzać, szukać pierwszych wizyt
      can [:create, :confirm, :first_clinic, :first_clinic_create, :first_doctor, :first_doctor_create], Appointment
      # Może czytać swoje wizyty
      can :read, Appointment, :patient_id => user.id
      can :destroy, Appointment, :patient_id => user.id, :confirmed_at => nil
      # Może czytać plany pracy
      can :read, WorkPlan
    elsif user.is_a?(Doctor)
      # Może zmieniać swoje dane osobowe
      can :manage, Doctor, :id => user.id
      # Może tworzyć, przeglądać plany pracy i zarządzać swoim planem pracy
      can [:create, :read], WorkPlan
      can :manage, WorkPlan do |work_plan|
        ClinicDoctor.where(:doctor_id => user.id).pluck(:id).include?(work_plan.clinic_doctor_id)
      end
      # Może czytać wizyty, które go dotyczą
      can :read, Appointment do |appointment|
        ClinicDoctor.where(:doctor_id => user.id).pluck(:id).include?(appointment.clinic_doctor_id)
      end
    else # Gość
      cannot :manage, :all
    end
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
end
