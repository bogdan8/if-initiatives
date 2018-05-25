# frozen_string_literal: true

module RoleHelper
  # helper of links for roles
  def roles_links(roles, user)
    links = []
    roles.each do |role|
      text = t("views.pages.global.role.#{role.name}") # localization text
      role_patch = role_administration_user_path(user, role: role.name) # administration roule path
      links << link_to_if(user.roles.first.name != role.name, text, role_patch, class: 'mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent font-size-10')
    end
    safe_join(links)
  end
end
