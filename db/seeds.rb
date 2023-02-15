for i in 1..10 do
    Task.create(title: "Title - #{i}", description: "lorem - #{i}", start_date: "date - #{i}", end_date: "date - #{i}", status: "status - #{i}", tag_id: 1)
end

p "Create roles"
Role.create!(name: "Admin", enable: true)
Role.create!(name: "Enterprise", enable: true)
Role.create!(name: "Employee", enable: true)
UserRole.create(user_id: 9, role_id: 1)
PermissionRole.create(role_id: 1, permission: "view_task")
p "End roles"

p "Create a new role for employee"
PermissionRole.create(role_id: 1, permission: "view_employee")
p "End creating"

p "Create a new role for enterprise"
PermissionRole.create(role_id: 2, permission: "view_enterprise")
p "End creating"

p "Create a new role for tag"
PermissionRole.create(role_id: 3, permission: "view_tag")
p "End creating"
