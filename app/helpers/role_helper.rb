# frozen_string_literal: true

module RoleHelper
  def roles_links(roles, user)
    links = []
    classes = 'btn btn-success btn-sm'
    roles.each do |role|
      text = t(".role.#{role.name}")
      role_patch = role_administration_user_path(user, role: role.name)
      links << link_to_if(user.roles.first.name != role.name, text, role_patch, class: classes)
    end
    safe_join(links)
  end
end
